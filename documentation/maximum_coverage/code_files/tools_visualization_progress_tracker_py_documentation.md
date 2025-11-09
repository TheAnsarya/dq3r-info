# Code Documentation: tools\visualization\progress_tracker.py

**File Type:** .py
**File Size:** 23,632 bytes
**Lines of Code:** 618
**Generated:** 2025-11-09 10:29:38.313743

## File Analysis Summary

- **Cyclomatic Complexity:** 130
- **Maintainability Index:** 87.0
- **Comment Ratio:** 5.3%

## Functions

### __post_init__
- **Line:** 60
- **Arguments:** `self`
- **Complexity:** 2

### update_status_bar
- **Line:** 65
- **Arguments:** `self`
- **Complexity:** 5
- **Description:** Create ASCII progress bar

### __init__
- **Line:** 87
- **Arguments:** `self, analysis_dir: str`
- **Complexity:** 1

### _initialize_progress_tracking
- **Line:** 121
- **Arguments:** `self`
- **Complexity:** 5
- **Description:** Initialize progress tracking categories

### _initialize_asset_inventory
- **Line:** 199
- **Arguments:** `self`
- **Complexity:** 2
- **Description:** Initialize asset tracking inventory

### export_progress_reports
- **Line:** 554
- **Arguments:** `self, output_dir: str`
- **Complexity:** 2
- **Description:** Export all progress reports

### main
- **Line:** 594
- **Arguments:** ``
- **Complexity:** 6
- **Description:** Main entry point for progress tracking

## Classes

### AssetType
- **Line:** 17
- **Base Classes:** `Enum`
- **Description:** Types of assets that can be extracted
### AssetInfo
- **Line:** 35
- **Description:** Information about an extracted asset
### ProgressVisualization
- **Line:** 49
- **Description:** Progress tracking with visual elements
#### Methods
- **__post_init__** (line 60) [private]
- **update_status_bar** (line 65)

### DQ3ProgressTracker
- **Line:** 84
- **Description:** Comprehensive progress tracking and visualization for Dragon Quest III
#### Methods
- **__init__** (line 87) [private]
- **_initialize_progress_tracking** (line 121) [private]
- **_initialize_asset_inventory** (line 199) [private]
- **export_progress_reports** (line 554)
- **main** (line 594)

## Imports

- Line 7: `import json`
- Line 8: `import sys`
- Line 9: `from pathlib import Path`
- Line 10: `from typing import Dict, List, Any, Optional, Tuple`
- Line 11: `import struct`
- Line 12: `from dataclasses import dataclass, asdict`
- Line 13: `from enum import Enum`
- Line 14: `import re`
- Line 596: `import argparse`

