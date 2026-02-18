from pathlib import Path
from app.db import init_db
from app.services.capture_service import structure_raw_text
from app.services.entry_service import create_entry
from app.services.search_service import log_search, search_entries
from app.config import DB_PATH


def setup_module():
    if DB_PATH.exists():
        DB_PATH.unlink()
    init_db()


def test_search_synonym_and_fuzzy():
    create_entry(
        {
            "entity": "Printer",
            "title": "Canon printer error code 5200",
            "category": "printer",
            "procedure_markdown": "Restart the device and clear queue",
            "tags": ["printer"],
            "commands": [],
            "contacts": [],
            "paths": [],
            "links": [],
            "attachments": [],
            "environment": "",
            "ocr_text": "",
        }
    )
    out = search_entries("imprimante")
    assert len(out["results"]) >= 1
    out2 = search_entries("prnter")
    assert len(out2["results"]) >= 1 or len(out2["suggestions"]) >= 1


def test_quick_capture():
    raw = """
    ipconfig /renew
    Contact: helpdesk@school.local
    Path: C:\\Temp\\logs
    https://intranet/it
    """
    data = structure_raw_text(raw)
    assert "helpdesk@school.local" in data["contacts"]
    assert any("ipconfig" in cmd for cmd in data["commands"])


def test_search_logging():
    log_search("vpn reset", 0, None, "session-1")
    # lightweight check by running a search and ensuring no crash
    result = search_entries("vpn")
    assert "results" in result
