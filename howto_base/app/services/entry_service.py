import json
from typing import Any
from ..db import get_connection


def _json(value: Any) -> str:
    return json.dumps(value or [], ensure_ascii=False)


def list_entities(prefix: str = "") -> list[str]:
    conn = get_connection()
    cur = conn.cursor()
    if prefix:
        rows = cur.execute(
            "SELECT DISTINCT entity FROM entries WHERE entity LIKE ? ORDER BY entity LIMIT 10",
            (f"{prefix}%",),
        ).fetchall()
    else:
        rows = cur.execute("SELECT DISTINCT entity FROM entries ORDER BY entity LIMIT 50").fetchall()
    conn.close()
    return [r[0] for r in rows]


def create_entry(payload: dict[str, Any]) -> int:
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        """
        INSERT INTO entries(entity, title, tags, category, environment, procedure_markdown, commands, contacts, paths, links, attachments, ocr_text)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """,
        (
            payload["entity"],
            payload["title"],
            _json(payload.get("tags")),
            payload.get("category", "other"),
            payload.get("environment", ""),
            payload.get("procedure_markdown", ""),
            _json(payload.get("commands")),
            _json(payload.get("contacts")),
            _json(payload.get("paths")),
            _json(payload.get("links")),
            _json(payload.get("attachments")),
            payload.get("ocr_text", ""),
        ),
    )
    entry_id = cur.lastrowid
    conn.commit()
    conn.close()
    return int(entry_id)


def get_entry(entry_id: int) -> dict[str, Any] | None:
    conn = get_connection()
    row = conn.execute("SELECT * FROM entries WHERE id = ?", (entry_id,)).fetchone()
    conn.close()
    if not row:
        return None
    item = dict(row)
    for key in ["tags", "commands", "contacts", "paths", "links", "attachments"]:
        item[key] = json.loads(item[key] or "[]")
    return item


def update_entry(entry_id: int, payload: dict[str, Any]) -> bool:
    existing = get_entry(entry_id)
    if not existing:
        return False
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        "INSERT INTO revisions(entry_id, snapshot_json) VALUES (?, ?)",
        (entry_id, json.dumps(existing, ensure_ascii=False)),
    )
    cur.execute(
        """
        UPDATE entries
        SET entity=?, title=?, tags=?, category=?, environment=?, procedure_markdown=?, commands=?, contacts=?, paths=?, links=?, attachments=?, ocr_text=?, updated_at=CURRENT_TIMESTAMP
        WHERE id=?
        """,
        (
            payload["entity"],
            payload["title"],
            _json(payload.get("tags")),
            payload.get("category", "other"),
            payload.get("environment", ""),
            payload.get("procedure_markdown", ""),
            _json(payload.get("commands")),
            _json(payload.get("contacts")),
            _json(payload.get("paths")),
            _json(payload.get("links")),
            _json(payload.get("attachments")),
            payload.get("ocr_text", ""),
            entry_id,
        ),
    )
    cur.execute(
        "DELETE FROM revisions WHERE id IN (SELECT id FROM revisions WHERE entry_id = ? ORDER BY created_at DESC LIMIT -1 OFFSET 5)",
        (entry_id,),
    )
    conn.commit()
    conn.close()
    return True


def list_entries(limit: int = 100) -> list[dict[str, Any]]:
    conn = get_connection()
    rows = conn.execute("SELECT * FROM entries ORDER BY updated_at DESC LIMIT ?", (limit,)).fetchall()
    conn.close()
    return [dict(r) for r in rows]
