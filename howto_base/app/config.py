from pathlib import Path
import os

BASE_DIR = Path(__file__).resolve().parent.parent
DATA_DIR = BASE_DIR / "data"
DATA_DIR.mkdir(exist_ok=True)
ATTACHMENTS_DIR = BASE_DIR / "attachments"
ATTACHMENTS_DIR.mkdir(exist_ok=True)
DB_PATH = DATA_DIR / "howto_base.db"
SYNONYMS_PATH = BASE_DIR / "synonyms.yaml"
ENABLE_OCR = os.getenv("ENABLE_OCR", "0") == "1"

CATEGORIES = [
    "network",
    "hardware",
    "software",
    "account",
    "security",
    "printer",
    "other",
]
