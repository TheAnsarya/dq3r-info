# compression_engine.py
**Project**: Dragon Quest III ROM Analysis
**Type**: Python Source Code
**Size**: 18,624 bytes
**Last Modified**: 2025-11-09 02:52:42
**Git Status**: 🔄 M tools/compression/compression_engine.py

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

Contains 2 documented functions/procedures:

- 1 Python Class functions

- 1 Python Function functions

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 18,624 bytes
- **Line Count**: 566
- **Character Encoding**: UTF-8 (auto-detected)
- **Functions Defined**: 2
- **Dependencies**: dataclasses, struct, sys, json, collections, os, pathlib, time, typing
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 0/10

## Functions and Procedures

### CompressionStats
**File**: `compression_engine.py:20`
**Type**: Python Class
**Complexity**: 5/10

#### Description
Implements compressionstats functionality with specialized logic.

#### Parameters
No parameters

#### Returns
Returns processed result or status code

#### Usage Example
```python
// Usage example for CompressionStats
// [Implementation specific]
```

#### Cross References
Referenced in: [Analysis pending]

### __post_init__
**File**: `compression_engine.py:29`
**Type**: Python Function
**Complexity**: 4/10

#### Description
Initializes and sets up   post init   functionality.

#### Parameters
- `self`: Parameter for function operation

#### Returns
Returns processed result or status code

#### Usage Example
```python
result = __post_init__(input_data)
if result:
    print('Operation successful')
```

#### Cross References
Referenced in: [Analysis pending]

## Code Metrics
- **Complexity Score**: 0/10
- **Documentation Coverage**: 0.0%
- **Function Count**: 2
- **Comment Lines**: 0

## Source Code Preview

```python
#!/usr/bin/env python3
"""
Compression Algorithm Integration Module
Ports compression algorithms from logsmall repository for DQ3R project
Integrates BasicRing400, SimpleTailWindowCompression, and Huffman text compression
"""

import struct
import os
import sys
import time
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple, Union
from dataclasses import dataclass
from collections import deque
import json


@dataclass
class CompressionStats:
    """Statistics for compression operations"""

    original_size: int
    compressed_size: int
    compression_ratio: float
    algorithm: str
    time_taken: float = 0.0

    def __post_init__(self):
        if self.original_size > 0:
            self.compression_ratio = self.compressed_size / self.original_size
        else:
            self.compression_ratio = 0.0


class BasicRing400:
    """
    BasicRing400 compression algorithm from logsmall
    Uses 0x400 (1024) byte ring buffer with optimal path finding
    Format: 10-bit address field + 6-bit copy size field
    """

    RING_SIZE = 0x400  # 1024 bytes
    MAX_COPY_SIZE = 63  # 6-bit field max value
    MIN_COPY_SIZE = 3  # Minimum bytes to make compression worthwhile

    def __init__(self):
        self.ring_buffer = bytearray(self.RING_SIZE)
        self.ring_pos = 0

...
```

**Lines shown**: 50 of 566 total

