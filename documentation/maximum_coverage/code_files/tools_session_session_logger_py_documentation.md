# Code Documentation: tools\session\session_logger.py

**File Type:** .py
**File Size:** 12,275 bytes
**Lines of Code:** 318
**Generated:** 2025-11-09 10:29:38.305766

## File Analysis Summary

- **Cyclomatic Complexity:** 91
- **Maintainability Index:** 82.0
- **Comment Ratio:** 5.3%

## Functions

### __init__
- **Line:** 19
- **Arguments:** `self, project_root: Optional[str] = None`
- **Complexity:** 2
- **Description:** Initialize session logger

### log_current_prompt
- **Line:** 274
- **Arguments:** ``
- **Complexity:** 13
- **Description:** Function to be called every prompt to update logs

## Classes

### SessionLogger
- **Line:** 16
- **Description:** Manages session logging and chat progress tracking
#### Methods
- **__init__** (line 19) [private]
- **log_current_prompt** (line 274)

## Imports

- Line 7: `import os`
- Line 8: `import sys`
- Line 9: `import json`
- Line 10: `import datetime`
- Line 11: `from pathlib import Path`
- Line 12: `from typing import Dict, List, Any, Optional`
- Line 13: `import subprocess`

