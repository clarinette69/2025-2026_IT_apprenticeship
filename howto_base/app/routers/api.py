from pathlib import Path
from fastapi import APIRouter, UploadFile, File
from ..services.docx_import_service import parse_docx_to_entries
from ..services.entry_service import create_entry
from ..services.export_service import create_backup_zip, export_json, export_markdown

router = APIRouter(prefix="/api")


@router.post("/import/docx")
async def import_docx(file: UploadFile = File(...), apply_import: bool = False):
    target = Path("/tmp") / file.filename
    target.write_bytes(await file.read())
    entries = parse_docx_to_entries(target)
    if apply_import:
        ids = [create_entry(e) for e in entries]
        return {"imported": len(ids), "ids": ids}
    return {"detected_entries": len(entries), "preview": entries[:3]}


@router.post("/export/markdown")
def export_md():
    out = Path("exports/markdown")
    c = export_markdown(out)
    return {"exported": c, "path": str(out)}


@router.post("/export/json")
def export_to_json():
    out = Path("exports/howto_export.json")
    out.parent.mkdir(exist_ok=True)
    c = export_json(out)
    return {"exported": c, "path": str(out)}


@router.post("/backup")
def backup_zip():
    out = Path("exports/howto_backup.zip")
    out.parent.mkdir(exist_ok=True)
    p = create_backup_zip(out)
    return {"path": str(p)}
