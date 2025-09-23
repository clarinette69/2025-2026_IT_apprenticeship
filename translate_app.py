"""Small Tkinter app that runs the resource translator with one click.

The window shows a button labelled "translate for better communication". Press
it to call :func:`parse_pdfs.convert_all` and show the status lines in the
scrolling box. This script can be turned into a Windows ``.exe`` file with the
following steps::

    pip install pyinstaller
    pyinstaller --onefile --noconsole translate_app.py

After running these commands the ``dist`` folder created by PyInstaller will
contain ``translate_app.exe``. You can share that file with classmates so they
can run the converter without touching Python directly.
"""

from __future__ import annotations

import tkinter as tk
from tkinter import messagebox
from tkinter.scrolledtext import ScrolledText

from parse_pdfs import convert_all


def main() -> None:
    """Launch the Tkinter window."""

    root = tk.Tk()
    root.title("Resource translator")
    root.resizable(width=False, height=False)

    intro = tk.Label(
        root,
        text=(
            "This helper looks for PDF, DOCX, PPTX, and XLSX files inside the\n"
            "year_1 folders. When it finds a file without a matching .txt copy\n"
            "it creates the missing text file."
        ),
        justify="left",
        padx=10,
        pady=10,
    )
    intro.pack(fill="x")

    status_box = ScrolledText(root, width=70, height=20, state="disabled")
    status_box.pack(padx=10, pady=(0, 10))

    def on_translate() -> None:
        """Run the conversion and show the log."""

        translate_button.config(state="disabled")
        status_box.config(state="normal")
        status_box.delete("1.0", tk.END)
        try:
            messages = convert_all(echo=False)
        except SystemExit:
            messagebox.showerror(
                "Missing folder",
                (
                    "I could not find the year_1 directory. Make sure this file\n"
                    "sits in the main project folder and try again."
                ),
            )
            messages = []
        if messages:
            status_box.insert(tk.END, "\n".join(messages))
        else:
            status_box.insert(
                tk.END,
                "Nothing to report. If you expected new files, please check the"
                " folder structure.",
            )
        status_box.config(state="disabled")
        translate_button.config(state="normal")
        if messages:
            messagebox.showinfo("Finished", "Conversion complete. Check the log above.")

    translate_button = tk.Button(
        root,
        text="translate for better communication",
        command=on_translate,
        padx=10,
        pady=5,
    )
    translate_button.pack(pady=(0, 10))

    root.mainloop()


if __name__ == "__main__":
    main()
