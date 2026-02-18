import re
import unicodedata
from pathlib import Path
import yaml
from ..config import SYNONYMS_PATH


def normalize_text(text: str) -> str:
    t = text.lower().strip()
    t = unicodedata.normalize("NFD", t)
    t = "".join(c for c in t if unicodedata.category(c) != "Mn")
    t = re.sub(r"[^a-z0-9\s]", " ", t)
    t = re.sub(r"\s+", " ", t).strip()
    return t


def load_synonyms(path: Path | None = None) -> dict[str, list[str]]:
    target = path or SYNONYMS_PATH
    if not target.exists():
        return {}
    with open(target, "r", encoding="utf-8") as f:
        data = yaml.safe_load(f) or {}
    normalized = {}
    for k, vals in data.items():
        normalized[normalize_text(str(k))] = [normalize_text(str(v)) for v in vals]
    return normalized


def expand_query(query: str, synonyms: dict[str, list[str]]) -> list[str]:
    norm = normalize_text(query)
    tokens = norm.split()
    expanded = set(tokens)

    reverse: dict[str, set[str]] = {}
    for root, vals in synonyms.items():
        for v in vals:
            reverse.setdefault(v, set()).add(root)

    for token in tokens:
        if token in synonyms:
            expanded.update(synonyms[token])
        if token in reverse:
            expanded.update(reverse[token])
    if norm in synonyms:
        expanded.update(synonyms[norm])
    if norm in reverse:
        expanded.update(reverse[norm])
    return [x for x in expanded if x]
