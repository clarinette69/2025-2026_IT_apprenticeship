import re
from ..utils.text_utils import normalize_text

COMMAND_PAT = re.compile(r"^(?:sudo\s+)?[a-zA-Z0-9_\-\.]+(?:\s+[-/\w\.]+)*$")
PATH_PAT = re.compile(r"([A-Za-z]:\\[^\s]+|/(?:[\w\-.]+/)*[\w\-.]+)")
MAIL_PAT = re.compile(r"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}")
URL_PAT = re.compile(r"https?://[^\s]+")


def structure_raw_text(raw: str) -> dict:
    lines = [x.strip() for x in raw.splitlines() if x.strip()]
    commands = [ln for ln in lines if COMMAND_PAT.match(ln) and " " in ln]
    paths = PATH_PAT.findall(raw)
    contacts = MAIL_PAT.findall(raw)
    links = URL_PAT.findall(raw)

    tokens = normalize_text(raw).split()
    tags = sorted({t for t in tokens if len(t) > 4})[:8]

    entity = "General"
    if "printer" in tokens:
        entity = "Printer"
    elif "outlook" in tokens or "mail" in tokens:
        entity = "Email"
    elif "vpn" in tokens:
        entity = "VPN"

    return {
        "commands": commands[:10],
        "paths": paths[:10],
        "contacts": contacts[:10],
        "links": links[:10],
        "tags": tags,
        "entity": entity,
    }
