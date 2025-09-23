"""Utility to convert PDF files in the resources directory into text files.

By default the script looks for every ``.pdf`` file underneath the ``resources``
folder that sits next to this script. For each PDF it extracts the text and
writes it into a sibling ``.txt`` file using UTF-8 encoding.

You may provide an alternative directory as the first command-line argument.

The script depends on the ``pypdf`` (or ``PyPDF2``) package. Install it with::

    pip install pypdf

"""

from __future__ import annotations

import sys
from pathlib import Path
from typing import Iterable

try:
    try:
        from pypdf import PdfReader  # type: ignore
    except ImportError:  # pragma: no cover - optional dependency
        from PyPDF2 import PdfReader  # type: ignore
except ImportError as import_error:  # pragma: no cover - optional dependency
    print(
        "Missing dependency: install the 'pypdf' package to extract PDF text.",
        file=sys.stderr,
    )
    raise SystemExit(1) from import_error


def extract_text(reader: "PdfReader") -> str:
    """Collect text from all pages of ``reader`` and return it as a single string."""

    text_parts: list[str] = []
    for index, page in enumerate(reader.pages, start=1):
        page_text = page.extract_text() or ""
        if not page_text.strip():
            print(f"Warning: page {index} appears to be empty.")
        text_parts.append(page_text)
    return "\n".join(text_parts)


def convert_pdf(pdf_path: Path) -> Path:
    """Convert ``pdf_path`` into a ``.txt`` file and return the output path."""

    print(f"Converting {pdf_path}...")
    try:
        reader = PdfReader(str(pdf_path))
    except Exception as error:  # pragma: no cover - safety net
        print(f"  Skipped: could not read PDF ({error}).", file=sys.stderr)
        raise

    if getattr(reader, "is_encrypted", False):
        try:
            reader.decrypt("")  # type: ignore[call-arg]
        except Exception as error:  # pragma: no cover - encryption fallback
            raise RuntimeError("PDF is encrypted and cannot be processed") from error

    text_content = extract_text(reader)
    output_path = pdf_path.with_suffix(".txt")
    output_path.write_text(text_content, encoding="utf-8")
    return output_path


def iter_pdfs(resources_dir: Path) -> Iterable[Path]:
    """Yield every PDF located under ``resources_dir`` recursively."""

    return resources_dir.rglob("*.pdf")


def main() -> None:
    """Entry point for the script."""

    if len(sys.argv) > 1:
        resources_dir = Path(sys.argv[1]).expanduser().resolve()
    else:
        resources_dir = Path(__file__).resolve().parent / "resources"

    if not resources_dir.exists():
        print(f"Resources directory not found: {resources_dir}", file=sys.stderr)
        raise SystemExit(1)

    pdf_files = list(iter_pdfs(resources_dir))

    if not pdf_files:
        print(f"No PDF files found in {resources_dir}")
        return

    for pdf_file in pdf_files:
        try:
            output_path = convert_pdf(pdf_file)
        except Exception as error:  # pragma: no cover - continue on failure
            print(f"  Error while converting {pdf_file.name}: {error}", file=sys.stderr)
            continue
        else:
            print(f"  Saved text to {output_path}")


if __name__ == "__main__":
    main()
