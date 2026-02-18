from pathlib import Path
from docx import Document


def parse_docx_to_entries(docx_path: Path) -> list[dict]:
    """
    MVP parser:
    - starts a new entry when a run is bold and red.
    - stores following paragraphs in markdown body.
    """
    doc = Document(str(docx_path))
    entries: list[dict] = []
    current = None

    for para in doc.paragraphs:
        text = para.text.strip()
        if not text:
            continue

        is_red_bold = False
        for run in para.runs:
            color = run.font.color
            rgb = color.rgb if color else None
            if run.bold and rgb and str(rgb).upper().startswith("FF0000"):
                is_red_bold = True
                break

        if is_red_bold:
            if current:
                entries.append(current)
            current = {
                "entity": "Imported",
                "title": text,
                "category": "other",
                "procedure_markdown": "",
                "tags": ["imported", "docx"],
                "commands": [],
                "contacts": [],
                "paths": [],
                "links": [],
                "attachments": [],
            }
        else:
            if current is None:
                current = {
                    "entity": "Imported",
                    "title": "Untitled import",
                    "category": "other",
                    "procedure_markdown": "",
                    "tags": ["imported", "docx"],
                    "commands": [],
                    "contacts": [],
                    "paths": [],
                    "links": [],
                    "attachments": [],
                }
            current["procedure_markdown"] += f"\n{text}"

    if current:
        entries.append(current)

    return entries
