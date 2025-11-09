# Code Documentation: tools\analysis\comprehensive_disassembler.py

**File Type:** .py
**File Size:** 41,937 bytes
**Lines of Code:** 817
**Generated:** 2025-11-09 10:29:38.241454

## File Analysis Summary

- **Cyclomatic Complexity:** 268
- **Maintainability Index:** 80.0
- **Comment Ratio:** 8.3%

## Functions

### __init__
- **Line:** 51
- **Arguments:** `self, rom_path: str`
- **Complexity:** 1

### run_comprehensive_analysis
- **Line:** 680
- **Arguments:** `self, max_functions: int = 200`
- **Complexity:** 5
- **Description:** Run complete comprehensive analysis

### _build_cross_references
- **Line:** 724
- **Arguments:** `self`
- **Complexity:** 4
- **Description:** Build cross-reference information between functions

### _generate_comprehensive_documentation
- **Line:** 732
- **Arguments:** `self`
- **Complexity:** 8
- **Description:** Generate comprehensive documentation files

### main
- **Line:** 786
- **Arguments:** ``
- **Complexity:** 6
- **Description:** Main entry point

## Classes

### AnalyzedFunction
- **Line:** 21
- **Description:** Represents a complete analyzed function
### CodeSection
- **Line:** 36
- **Description:** Represents a major code section
### ComprehensiveDisassembler
- **Line:** 46
- **Description:** Ultra-comprehensive SNES disassembler with advanced analysis
#### Methods
- **__init__** (line 51) [private]
- **run_comprehensive_analysis** (line 680)
- **_build_cross_references** (line 724) [private]
- **_generate_comprehensive_documentation** (line 732) [private]
- **main** (line 786)

## Imports

- Line 10: `import struct`
- Line 11: `import os`
- Line 12: `import json`
- Line 13: `from pathlib import Path`
- Line 14: `from typing import Dict, List, Tuple, Any, Optional, Set`
- Line 15: `from dataclasses import dataclass, field`
- Line 16: `from collections import defaultdict, Counter`
- Line 17: `import time`
- Line 18: `import hashlib`

