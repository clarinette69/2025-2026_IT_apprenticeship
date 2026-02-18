import json
import shutil
from pathlib import Path
from zipfile import ZipFile
from .entry_service import get_entry, list_entries
from ..config import ATTACHMENTS_DIR, BASE_DIR, DB_PATH, SYNONYMS_PATH


def export_markdown(target_dir: Path) -> int:
    target_dir.mkdir(parents=True, exist_ok=True)
    count = 0
    for row in list_entries(limit=2000):
        entry = get_entry(row["id"])
        if not entry:
            continue
        filename = f"{entry['id']}_{entry['title'].replace(' ', '_')[:40]}.md"
        content = f"# {entry['title']}\n\n- Entity: {entry['entity']}\n- Category: {entry['category']}\n\n{entry['procedure_markdown']}\n"
        (target_dir / filename).write_text(content, encoding="utf-8")
        count += 1
    return count


def export_json(target_file: Path) -> int:
    all_entries = [get_entry(x["id"]) for x in list_entries(limit=2000)]
    data = [x for x in all_entries if x]
    target_file.write_text(json.dumps(data, ensure_ascii=False, indent=2), encoding="utf-8")
    return len(data)


def import_json(source_file: Path) -> list[dict]:
    return json.loads(source_file.read_text(encoding="utf-8"))


def create_backup_zip(target_zip: Path) -> Path:
    temp_root = BASE_DIR / "tmp_backup"
    if temp_root.exists():
        shutil.rmtree(temp_root)
    temp_root.mkdir()

    shutil.copy2(DB_PATH, temp_root / DB_PATH.name)
    if ATTACHMENTS_DIR.exists():
        shutil.copytree(ATTACHMENTS_DIR, temp_root / "attachments", dirs_exist_ok=True)
    if SYNONYMS_PATH.exists():
        shutil.copy2(SYNONYMS_PATH, temp_root / "synonyms.yaml")

    with ZipFile(target_zip, "w") as zf:
        for p in temp_root.rglob("*"):
            if p.is_file():
                zf.write(p, p.relative_to(temp_root))

    shutil.rmtree(temp_root)
    return target_zip
