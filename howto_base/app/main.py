from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from .db import init_db
from .routers.web import router as web_router
from .routers.api import router as api_router
from .services.entry_service import create_entry, list_entries

app = FastAPI(title="HowTo Base")
app.mount("/static", StaticFiles(directory="app/static"), name="static")
app.include_router(web_router)
app.include_router(api_router)


def seed_data_if_empty() -> None:
    if list_entries(limit=1):
        return
    samples = [
        {
            "entity": "Printer",
            "title": "HP printer offline fix",
            "tags": ["printer", "offline", "windows"],
            "category": "printer",
            "procedure_markdown": "1. Restart spooler\n2. Reconnect network printer\n3. Test page",
            "commands": ["net stop spooler", "net start spooler"],
            "contacts": ["helpdesk@company.local"],
            "paths": ["C:\\Windows\\System32\\spool"],
            "links": ["https://intranet/printers"],
            "attachments": [],
            "environment": "Windows 11",
            "ocr_text": "",
        },
        {
            "entity": "VPN",
            "title": "VPN reconnect after password reset",
            "tags": ["vpn", "password", "network"],
            "category": "network",
            "procedure_markdown": "Open VPN client and delete old profile, then reconnect.",
            "commands": ["ipconfig /flushdns"],
            "contacts": ["security@company.local"],
            "paths": [],
            "links": ["https://intranet/vpn"],
            "attachments": [],
            "environment": "Remote users",
            "ocr_text": "",
        },
        {
            "entity": "Outlook",
            "title": "Outlook search index rebuild",
            "tags": ["mail", "outlook", "search"],
            "category": "software",
            "procedure_markdown": "Control Panel > Indexing Options > Rebuild.",
            "commands": [],
            "contacts": [],
            "paths": ["C:\\ProgramData\\Microsoft\\Search"],
            "links": [],
            "attachments": [],
            "environment": "Office 365",
            "ocr_text": "",
        },
        {
            "entity": "AD Account",
            "title": "Unlock locked account",
            "tags": ["account", "active-directory"],
            "category": "account",
            "procedure_markdown": "Use ADUC and clear lockout checkbox.",
            "commands": ["Unlock-ADAccount -Identity username"],
            "contacts": ["iam@company.local"],
            "paths": [],
            "links": [],
            "attachments": [],
            "environment": "Domain",
            "ocr_text": "",
        },
        {
            "entity": "WiFi",
            "title": "Guest WiFi access issue",
            "tags": ["wifi", "guest", "network"],
            "category": "network",
            "procedure_markdown": "Renew DHCP lease and forget network profile.",
            "commands": ["ipconfig /release", "ipconfig /renew"],
            "contacts": ["network@company.local"],
            "paths": [],
            "links": [],
            "attachments": [],
            "environment": "Office",
            "ocr_text": "",
        },
    ]
    for s in samples:
        create_entry(s)


@app.on_event("startup")
def startup_event():
    init_db()
    seed_data_if_empty()
