# Code Documentation: tools\analysis\project_documentation_generator.py

**File Type:** .py
**File Size:** 25,496 bytes
**Lines of Code:** 534
**Generated:** 2025-11-09 10:29:38.267941

## File Analysis Summary

- **Cyclomatic Complexity:** 126
- **Maintainability Index:** 85.0
- **Comment Ratio:** 5.6%

## Functions

### __init__
- **Line:** 22
- **Arguments:** `self`
- **Complexity:** 1

### collect_project_statistics
- **Line:** 34
- **Arguments:** `self`
- **Complexity:** 3
- **Description:** Collect comprehensive project statistics

### _collect_analysis_data
- **Line:** 57
- **Arguments:** `self`
- **Complexity:** 4
- **Description:** Collect data from all analysis tools

### generate_final_documentation
- **Line:** 209
- **Arguments:** `self`
- **Complexity:** 1
- **Description:** Generate comprehensive final documentation

### _generate_project_report
- **Line:** 231
- **Arguments:** `self, output_dir: Path`
- **Complexity:** 8
- **Description:** Generate main project report

### _generate_analysis_summary
- **Line:** 296
- **Arguments:** `self, output_dir: Path`
- **Complexity:** 9
- **Description:** Generate detailed analysis summary

### _generate_technical_details
- **Line:** 357
- **Arguments:** `self, output_dir: Path`
- **Complexity:** 7
- **Description:** Generate technical implementation details

### _generate_achievement_summary
- **Line:** 411
- **Arguments:** `self, output_dir: Path`
- **Complexity:** 22
- **Description:** Generate summary of achievements and findings

### run_final_documentation_generation
- **Line:** 489
- **Arguments:** `self`
- **Complexity:** 3
- **Description:** Run complete final documentation generation

### main
- **Line:** 525
- **Arguments:** ``
- **Complexity:** 3
- **Description:** Main documentation generation

## Classes

### ProjectDocumentationGenerator
- **Line:** 17
- **Description:** Generates final comprehensive project documentation
#### Methods
- **__init__** (line 22) [private]
- **collect_project_statistics** (line 34)
- **_collect_analysis_data** (line 57) [private]
- **generate_final_documentation** (line 209)
- **_generate_project_report** (line 231) [private]
- **_generate_analysis_summary** (line 296) [private]
- **_generate_technical_details** (line 357) [private]
- **_generate_achievement_summary** (line 411) [private]
- **run_final_documentation_generation** (line 489)
- **main** (line 525)

## Imports

- Line 10: `import os`
- Line 11: `import json`
- Line 12: `import time`
- Line 13: `from pathlib import Path`
- Line 14: `from collections import Counter, defaultdict`
- Line 15: `import csv`
- Line 92: `import re`

