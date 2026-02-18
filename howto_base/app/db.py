import sqlite3
from pathlib import Path
from .config import DB_PATH


def get_connection(db_path: Path | None = None) -> sqlite3.Connection:
    path = str(db_path or DB_PATH)
    conn = sqlite3.connect(path)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys = ON;")
    return conn


def init_db() -> None:
    conn = get_connection()
    cur = conn.cursor()

    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS entries (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            entity TEXT NOT NULL,
            title TEXT NOT NULL,
            tags TEXT DEFAULT '[]',
            category TEXT DEFAULT 'other',
            environment TEXT,
            procedure_markdown TEXT DEFAULT '',
            commands TEXT DEFAULT '[]',
            contacts TEXT DEFAULT '[]',
            paths TEXT DEFAULT '[]',
            links TEXT DEFAULT '[]',
            attachments TEXT DEFAULT '[]',
            ocr_text TEXT DEFAULT '',
            created_at TEXT DEFAULT CURRENT_TIMESTAMP,
            updated_at TEXT DEFAULT CURRENT_TIMESTAMP
        )
        """
    )

    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS revisions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            entry_id INTEGER NOT NULL,
            snapshot_json TEXT NOT NULL,
            created_at TEXT DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY(entry_id) REFERENCES entries(id) ON DELETE CASCADE
        )
        """
    )

    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS search_logs (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            query_text TEXT NOT NULL,
            timestamp TEXT DEFAULT CURRENT_TIMESTAMP,
            result_count INTEGER DEFAULT 0,
            clicked_result_id INTEGER,
            session_id TEXT
        )
        """
    )

    cur.execute(
        """
        CREATE VIRTUAL TABLE IF NOT EXISTS entries_fts USING fts5(
            entity,
            title,
            procedure_markdown,
            commands,
            tags,
            category,
            contacts,
            paths,
            links,
            ocr_text,
            content='entries',
            content_rowid='id'
        )
        """
    )

    cur.executescript(
        """
        CREATE TRIGGER IF NOT EXISTS entries_ai AFTER INSERT ON entries BEGIN
            INSERT INTO entries_fts(rowid, entity, title, procedure_markdown, commands, tags, category, contacts, paths, links, ocr_text)
            VALUES (
                new.id, new.entity, new.title, new.procedure_markdown, new.commands, new.tags,
                new.category, new.contacts, new.paths, new.links, new.ocr_text
            );
        END;

        CREATE TRIGGER IF NOT EXISTS entries_ad AFTER DELETE ON entries BEGIN
            INSERT INTO entries_fts(entries_fts, rowid, entity, title, procedure_markdown, commands, tags, category, contacts, paths, links, ocr_text)
            VALUES('delete', old.id, old.entity, old.title, old.procedure_markdown, old.commands, old.tags,
                old.category, old.contacts, old.paths, old.links, old.ocr_text);
        END;

        CREATE TRIGGER IF NOT EXISTS entries_au AFTER UPDATE ON entries BEGIN
            INSERT INTO entries_fts(entries_fts, rowid, entity, title, procedure_markdown, commands, tags, category, contacts, paths, links, ocr_text)
            VALUES('delete', old.id, old.entity, old.title, old.procedure_markdown, old.commands, old.tags,
                old.category, old.contacts, old.paths, old.links, old.ocr_text);
            INSERT INTO entries_fts(rowid, entity, title, procedure_markdown, commands, tags, category, contacts, paths, links, ocr_text)
            VALUES (
                new.id, new.entity, new.title, new.procedure_markdown, new.commands, new.tags,
                new.category, new.contacts, new.paths, new.links, new.ocr_text
            );
        END;
        """
    )

    conn.commit()
    conn.close()
