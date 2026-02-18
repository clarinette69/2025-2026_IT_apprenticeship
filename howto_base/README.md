# HowTo Base (MVP)

HowTo Base is a local app to store and find IT procedures quickly.
It is designed for offline use with SQLite and local files.

## Why this stack

- **Python + FastAPI**: fast to build and easy to maintain.
- **SQLite + FTS5**: a single file database with full-text search.
- **Bootstrap + minimal JavaScript**: quick and simple interface.
- **PyInstaller-ready**: packaging to Windows `.exe` can be added in next sprint.

## Features in this MVP

1. **Search**
   - FTS5 on procedure fields.
   - Query normalization (lowercase, remove accents and punctuation).
   - FR/EN synonym expansion from `synonyms.yaml`.
   - Fuzzy reranking with RapidFuzz.
   - Suggestions when no direct result.

2. **Fast capture and editing**
   - Markdown procedure field.
   - Keyboard shortcuts:
     - `Ctrl+K` focus search
     - `Ctrl+N` new entry
     - `Ctrl+S` save entry
     - `Esc` blur active field
   - Quick capture parser (extract commands, contacts, paths, links)
   - Entity autocomplete

3. **OCR hook (feature flag)**
   - If `ENABLE_OCR=1`, image upload runs OCR via Tesseract (`pytesseract`).
   - OCR text is stored and indexed.
   - If disabled, upload still works without OCR.

4. **DOCX import hook**
   - Endpoint to parse `.docx`.
   - New entry detected when a run is **red + bold**.
   - Preview mode + apply import mode.
   - Architecture ready for better image extraction in phase 2.

5. **Search logging for phase 2**
   - `search_logs` table records query, result count, click id, session id.
   - Ready for future failed-query analytics dashboard.

6. **Backup/export**
   - Markdown export (one file per entry)
   - JSON export
   - ZIP backup (`db + attachments + synonyms.yaml`)

## Project structure

```text
howto_base/
  app/
    main.py
    db.py
    config.py
    routers/
    services/
    templates/
    static/
    utils/
  attachments/
  tests/
  data/
  synonyms.yaml
  run.py
```

## Install

```bash
cd howto_base
python -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

## Run

```bash
cd howto_base
python run.py
```

Open: `http://127.0.0.1:8000`

## OCR setup (optional)

1. Install Tesseract OCR locally.
2. Make sure `tesseract` command is in your PATH.
3. Start app with:

```bash
ENABLE_OCR=1 python run.py
```

(Windows PowerShell: `$env:ENABLE_OCR="1"; python run.py`)

## DOCX import usage

- API endpoint: `POST /api/import/docx`
- Parameters:
  - `file`: `.docx`
  - `apply_import`: `false` (preview) or `true` (insert entries)

## Backup and export usage

- `POST /api/export/markdown`
- `POST /api/export/json`
- `POST /api/backup`

## Tests

```bash
cd howto_base
pytest
```
