# Code Documentation: tools\compression\compression_engine.py

**File Type:** .py
**File Size:** 18,624 bytes
**Lines of Code:** 566
**Generated:** 2025-11-09 10:29:38.282875

## File Analysis Summary

- **Cyclomatic Complexity:** 128
- **Maintainability Index:** 85.0
- **Comment Ratio:** 9.0%

## Functions

### __post_init__
- **Line:** 29
- **Arguments:** `self`
- **Complexity:** 2

### __init__
- **Line:** 47
- **Arguments:** `self`
- **Complexity:** 1

### _add_to_ring
- **Line:** 165
- **Arguments:** `self, byte: int`
- **Complexity:** 1
- **Description:** Add byte to ring buffer at current position

### __init__
- **Line:** 178
- **Arguments:** `self, window_size: int = 0x1000`
- **Complexity:** 1

### __init__
- **Line:** 284
- **Arguments:** `self`
- **Complexity:** 1

### generate_codes
- **Line:** 318
- **Arguments:** `node, code=""`
- **Complexity:** 4

### __init__
- **Line:** 413
- **Arguments:** `self`
- **Complexity:** 1

### _log_stats
- **Line:** 509
- **Arguments:** `self, stats: CompressionStats`
- **Complexity:** 4
- **Description:** Log compression statistics

## Classes

### CompressionStats
- **Line:** 20
- **Description:** Statistics for compression operations
#### Methods
- **__post_init__** (line 29) [private]

### BasicRing400
- **Line:** 36
- **Description:** BasicRing400 compression algorithm from logsmall
Uses 0x400 (1024) byte ring buffer with optimal path finding
Format: 10-bit address field + 6-bit copy size field
#### Methods
- **__init__** (line 47) [private]
- **_add_to_ring** (line 165) [private]

### SimpleTailWindowCompression
- **Line:** 171
- **Description:** SimpleTailWindowCompression algorithm from logsmall
Used by Final Fantasy Mystic Quest and Dragon Quest III
Command + data format with word-based offset addressing
#### Methods
- **__init__** (line 178) [private]

### HuffmanDialogCompression
- **Line:** 278
- **Description:** Huffman text compression for game dialog
Optimized for common text patterns in RPG dialog
#### Methods
- **__init__** (line 284) [private]
- **generate_codes** (line 318)

### CompressionEngine
- **Line:** 410
- **Description:** Main compression engine integrating all algorithms
#### Methods
- **__init__** (line 413) [private]
- **_log_stats** (line 509) [private]

## Imports

- Line 8: `import struct`
- Line 9: `import os`
- Line 10: `import sys`
- Line 11: `import time`
- Line 12: `from pathlib import Path`
- Line 13: `from typing import List, Dict, Any, Optional, Tuple, Union`
- Line 14: `from dataclasses import dataclass`
- Line 15: `from collections import deque`
- Line 16: `import json`
- Line 298: `import heapq`
- Line 425: `import time`

