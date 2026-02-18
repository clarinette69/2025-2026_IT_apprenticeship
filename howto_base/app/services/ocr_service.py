from pathlib import Path
import pytesseract
from PIL import Image
from ..config import ENABLE_OCR


def extract_ocr_text(path: Path) -> str:
    if not ENABLE_OCR:
        return ""
    try:
        return pytesseract.image_to_string(Image.open(path))
    except Exception:
        return ""
