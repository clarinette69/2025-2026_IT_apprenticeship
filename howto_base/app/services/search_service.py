from typing import Any
from rapidfuzz import fuzz
from ..db import get_connection
from ..utils.text_utils import expand_query, load_synonyms, normalize_text


def _fts_query(tokens: list[str]) -> str:
    if not tokens:
        return "*"
    return " OR ".join([f'"{t}"*' for t in tokens if t])


def search_entries(query: str, category: str | None = None, limit: int = 30) -> dict[str, Any]:
    synonyms = load_synonyms()
    expanded = expand_query(query, synonyms)
    fts_q = _fts_query(expanded)
    conn = get_connection()
    cur = conn.cursor()

    sql = """
    SELECT e.id, e.entity, e.title, e.category, e.updated_at,
           snippet(entries_fts, 2, '<mark>', '</mark>', '…', 12) AS snippet,
           bm25(entries_fts) AS fts_rank
    FROM entries_fts
    JOIN entries e ON e.id = entries_fts.rowid
    WHERE entries_fts MATCH ?
    """
    params: list[Any] = [fts_q]
    if category and category != "all":
        sql += " AND e.category = ?"
        params.append(category)
    sql += " ORDER BY fts_rank LIMIT ?"
    params.append(limit)

    rows = cur.execute(sql, params).fetchall()
    query_norm = normalize_text(query)
    ranked: list[dict[str, Any]] = []
    for row in rows:
        item = dict(row)
        fuzz_score = max(
            fuzz.partial_ratio(query_norm, normalize_text(item["title"])),
            fuzz.partial_ratio(query_norm, normalize_text(item["entity"])),
        )
        item["score"] = float((100 - item["fts_rank"] * 10) + fuzz_score)
        ranked.append(item)

    ranked = sorted(ranked, key=lambda x: x["score"], reverse=True)

    suggestions: list[str] = []
    if not ranked:
        pool = cur.execute("SELECT title, entity FROM entries LIMIT 200").fetchall()
        cand = []
        for p in pool:
            for field in [p[0], p[1]]:
                s = fuzz.partial_ratio(query_norm, normalize_text(field))
                cand.append((s, field))
        cand.sort(reverse=True, key=lambda x: x[0])
        suggestions = [x[1] for x in cand[:5] if x[0] >= 45]

    conn.close()
    return {
        "query": query,
        "expanded_terms": expanded,
        "results": ranked,
        "suggestions": suggestions,
    }


def log_search(query_text: str, result_count: int, clicked_result_id: int | None = None, session_id: str | None = None) -> None:
    conn = get_connection()
    conn.execute(
        "INSERT INTO search_logs(query_text, result_count, clicked_result_id, session_id) VALUES (?, ?, ?, ?)",
        (query_text, result_count, clicked_result_id, session_id),
    )
    conn.commit()
    conn.close()
