# Code Documentation: tools\session\session_manager.py

**File Type:** .py
**File Size:** 18,658 bytes
**Lines of Code:** 557
**Generated:** 2025-11-09 10:29:38.308622

## File Analysis Summary

- **Cyclomatic Complexity:** 135
- **Maintainability Index:** 85.0
- **Comment Ratio:** 9.9%

## Functions

### __init__
- **Line:** 50
- **Arguments:** `self, repo_path: str`
- **Complexity:** 1

### log_action
- **Line:** 69
- **Arguments:** `self, action: str, description: str, files_changed: List[str] = None`
- **Complexity:** 4
- **Description:** Log a session action

### create_disassembly_issues
- **Line:** 98
- **Arguments:** `self`
- **Complexity:** 22
- **Description:** Create comprehensive GitHub issues for disassembly work

### format_all_files
- **Line:** 368
- **Arguments:** `self`
- **Complexity:** 10
- **Description:** Run formatting on all Python files

### commit_and_push
- **Line:** 435
- **Arguments:** `self, message: str, files: List[str] = None`
- **Complexity:** 9
- **Description:** Commit changes and push to repository

### merge_and_cleanup_branch
- **Line:** 471
- **Arguments:** `self, branch_name: str, issue_title: str`
- **Complexity:** 6
- **Description:** Merge branch back to main and clean up

### save_issue_to_file
- **Line:** 495
- **Arguments:** `self, issue: GitHubIssue`
- **Complexity:** 2
- **Description:** Save issue details to file for tracking

### _save_session
- **Line:** 504
- **Arguments:** `self`
- **Complexity:** 3
- **Description:** Save current session to file

### main
- **Line:** 538
- **Arguments:** ``
- **Complexity:** 3
- **Description:** Test the session manager

## Classes

### GitHubIssue
- **Line:** 21
- **Description:** Represents a GitHub issue for tracking work
### SessionEntry
- **Line:** 35
- **Description:** Single session log entry
### DQ3SessionManager
- **Line:** 47
- **Description:** Manages session logging, GitHub issues, and workflow automation
#### Methods
- **__init__** (line 50) [private]
- **log_action** (line 69)
- **create_disassembly_issues** (line 98)
- **format_all_files** (line 368)
- **commit_and_push** (line 435)
- **merge_and_cleanup_branch** (line 471)
- **save_issue_to_file** (line 495)
- **_save_session** (line 504) [private]
- **main** (line 538)

## Imports

- Line 10: `import json`
- Line 11: `import os`
- Line 12: `import time`
- Line 13: `import subprocess`
- Line 14: `from datetime import datetime`
- Line 15: `from pathlib import Path`
- Line 16: `from typing import Dict, List, Any, Optional`
- Line 17: `from dataclasses import dataclass, asdict`

