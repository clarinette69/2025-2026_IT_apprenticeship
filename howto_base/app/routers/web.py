import json
from pathlib import Path
from fastapi import APIRouter, Form, Request, UploadFile, File
from fastapi.responses import RedirectResponse
from fastapi.templating import Jinja2Templates
from ..config import ATTACHMENTS_DIR, CATEGORIES
from ..services.capture_service import structure_raw_text
from ..services.entry_service import create_entry, get_entry, list_entities, update_entry
from ..services.search_service import log_search, search_entries
from ..services.ocr_service import extract_ocr_text

router = APIRouter()
templates = Jinja2Templates(directory=str(Path(__file__).resolve().parent.parent / "templates"))


def _split_csv(text: str) -> list[str]:
    return [x.strip() for x in text.split(",") if x.strip()]


@router.get("/")
def home(request: Request, q: str = "", category: str = "all"):
    data = {"results": [], "suggestions": [], "expanded_terms": []}
    if q.strip():
        data = search_entries(q, category=category)
        log_search(q, len(data["results"]))
    return templates.TemplateResponse(
        request,
        "index.html",
        {
            "q": q,
            "category": category,
            "categories": ["all", *CATEGORIES],
            **data,
        },
    )


@router.get("/entries/new")
def new_entry(request: Request):
    return templates.TemplateResponse(
        request,
        "edit.html",
        {
            "entry": None,
            "categories": CATEGORIES,
        },
    )


@router.get("/entries/{entry_id}")
def edit_entry(request: Request, entry_id: int):
    entry = get_entry(entry_id)
    return templates.TemplateResponse(
        request,
        "edit.html",
        {
            "entry": entry,
            "categories": CATEGORIES,
        },
    )


@router.post("/entries/save")
async def save_entry(
    entity: str = Form(...),
    title: str = Form(...),
    category: str = Form("other"),
    environment: str = Form(""),
    procedure_markdown: str = Form(""),
    tags: str = Form(""),
    commands: str = Form(""),
    contacts: str = Form(""),
    paths: str = Form(""),
    links: str = Form(""),
    entry_id: int = Form(0),
    screenshot: UploadFile | None = File(default=None),
):
    attachments = []
    ocr_text = ""
    if screenshot and screenshot.filename:
        dest = ATTACHMENTS_DIR / screenshot.filename
        content = await screenshot.read()
        dest.write_bytes(content)
        attachments.append(screenshot.filename)
        ocr_text = extract_ocr_text(dest)

    payload = {
        "entity": entity,
        "title": title,
        "category": category,
        "environment": environment,
        "procedure_markdown": procedure_markdown,
        "tags": _split_csv(tags),
        "commands": _split_csv(commands),
        "contacts": _split_csv(contacts),
        "paths": _split_csv(paths),
        "links": _split_csv(links),
        "attachments": attachments,
        "ocr_text": ocr_text,
    }

    if entry_id:
        update_entry(entry_id, payload)
        rid = entry_id
    else:
        rid = create_entry(payload)

    return RedirectResponse(url=f"/entries/{rid}", status_code=303)


@router.post("/capture")
def quick_capture(raw_text: str = Form(...)):
    data = structure_raw_text(raw_text)
    return data


@router.get("/entities")
def entities(prefix: str = ""):
    return {"entities": list_entities(prefix)}
