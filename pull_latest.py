#!/usr/bin/env python3
"""Helper script to pull the latest changes from the main branch.

This script wraps ``git pull origin main`` so that you can quickly update the
local copy of the repository from any device that has Python and Git
installed.
"""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path


def ensure_git_repo(path: Path) -> None:
    """Confirm that ``path`` is inside a Git repository.

    Raises:
        SystemExit: If ``path`` is not part of a Git repository.
    """

    git_dir = path / ".git"
    if not git_dir.exists():
        sys.stderr.write(
            "This script must be executed from the root of a Git repository.\n"
        )
        raise SystemExit(1)


def pull_latest() -> int:
    """Run ``git pull origin main`` and return the Git command's exit code."""

    try:
        result = subprocess.run(
            ["git", "pull", "origin", "main"],
            check=False,
        )
    except FileNotFoundError:
        sys.stderr.write(
            "Git does not appear to be installed. Please install Git and try again.\n"
        )
        return 1

    return result.returncode


def main() -> None:
    repo_root = Path.cwd()
    ensure_git_repo(repo_root)

    exit_code = pull_latest()

    if exit_code == 0:
        print("Repository successfully updated from origin/main.")
    else:
        print("Git pull exited with a non-zero status.")
        raise SystemExit(exit_code)


if __name__ == "__main__":
    main()
