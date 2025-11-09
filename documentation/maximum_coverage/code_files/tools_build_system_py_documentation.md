# Code Documentation: tools\build_system.py

**File Type:** .py
**File Size:** 16,393 bytes
**Lines of Code:** 439
**Generated:** 2025-11-09 10:29:38.281276

## File Analysis Summary

- **Cyclomatic Complexity:** 121
- **Maintainability Index:** 82.0
- **Comment Ratio:** 7.1%

## Functions

### __init__
- **Line:** 43
- **Arguments:** `self, project_root: Path = None`
- **Complexity:** 2
- **Description:** Initialize build system

### log_build_action
- **Line:** 69
- **Arguments:** `self, message: str, level: str = "INFO"`
- **Complexity:** 1
- **Description:** Log build system actions

### _save_build_report
- **Line:** 344
- **Arguments:** `self, build_results: Dict[str, Any]`
- **Complexity:** 2
- **Description:** Save detailed build report

### continuous_development_mode
- **Line:** 357
- **Arguments:** `self`
- **Complexity:** 5
- **Description:** Run in continuous development mode with token maximization

### main
- **Line:** 385
- **Arguments:** ``
- **Complexity:** 11
- **Description:** Main entry point for build system

## Classes

### DQ3RBuildSystem
- **Line:** 40
- **Description:** Comprehensive build system for DQ3R project
#### Methods
- **__init__** (line 43) [private]
- **log_build_action** (line 69)
- **_save_build_report** (line 344) [private]
- **continuous_development_mode** (line 357)
- **main** (line 385)

## Imports

- Line 7: `from pathlib import Path`
- Line 8: `import subprocess`
- Line 9: `import sys`
- Line 10: `import json`
- Line 11: `import time`
- Line 12: `from typing import Dict, Any, List`
- Line 13: `import argparse`
- Line 18: `from session.session_logger import SessionLogger`
- Line 19: `from formatting.auto_formatter import CodeFormatter, run_automated_formatting`
- Line 20: `from compression.compression_engine import get_compression_engine`
- Line 21: `from asset_pipeline.snes_extractor import create_asset_pipeline`
- Line 29: `from session.session_logger import SessionLogger`
- Line 30: `from formatting.auto_formatter import CodeFormatter, run_automated_formatting`
- Line 31: `from compression.compression_engine import get_compression_engine`
- Line 32: `from asset_pipeline.snes_extractor import create_asset_pipeline`

