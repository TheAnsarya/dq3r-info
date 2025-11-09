# structure_parser.py
**Project**: Dragon Quest III ROM Analysis
**Type**: Python Source Code
**Size**: 23,142 bytes
**Last Modified**: 2025-11-09 01:40:32
**Git Status**: ✅ Tracked and clean

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

Contains 4 documented functions/procedures:

- 2 Python Class functions

- 2 Python Function functions

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 23,142 bytes
- **Line Count**: 628
- **Character Encoding**: UTF-8 (auto-detected)
- **Functions Defined**: 4
- **Dependencies**: dataclasses, re, sys, json, pathlib, stdint.h, enum, typing
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 0/10

## Functions and Procedures

### DataStructureType
**File**: `structure_parser.py:16`
**Type**: Python Class
**Complexity**: 5/10

#### Description
Implements datastructuretype functionality with specialized logic.

#### Parameters
- `Enum`: Parameter for function operation

#### Returns
Returns processed result or status code

#### Usage Example
```python
// Usage example for DataStructureType
// [Implementation specific]
```

#### Cross References
Referenced in: [Analysis pending]

### MemoryField
**File**: `structure_parser.py:32`
**Type**: Python Class
**Complexity**: 3/10

#### Description
Implements memoryfield functionality with specialized logic.

#### Parameters
No parameters

#### Returns
Returns processed result or status code

#### Usage Example
```python
// Usage example for MemoryField
// [Implementation specific]
```

#### Cross References
Referenced in: [Analysis pending]

### end_offset
**File**: `structure_parser.py:44`
**Type**: Python Function
**Complexity**: 3/10

#### Description
Stores and manages data for end offset operations.

#### Parameters
- `self`: Parameter for function operation

#### Returns
Returns processed result or status code

#### Usage Example
```python
result = end_offset(input_data)
if result:
    print('Operation successful')
```

#### Cross References
Referenced in: [Analysis pending]

### address_range
**File**: `structure_parser.py:48`
**Type**: Python Function
**Complexity**: 4/10

#### Description
Implements address range functionality with specialized logic.

#### Parameters
- `self`: Parameter for function operation

#### Returns
Returns processed result or status code

#### Usage Example
```python
result = address_range(input_data)
if result:
    print('Operation successful')
```

#### Cross References
Referenced in: [Analysis pending]

## Code Metrics
- **Complexity Score**: 0/10
- **Documentation Coverage**: 0.0%
- **Function Count**: 4
- **Comment Lines**: 0

## Source Code Preview

```python
#!/usr/bin/env python3
"""
Dragon Quest III Data Structure Parser & Documentation System
Parses existing manual analysis and creates comprehensive documentation
"""

import re
import json
import sys
from pathlib import Path
from typing import Dict, List, Any, Optional, Tuple
from dataclasses import dataclass, asdict, field
from enum import Enum


class DataStructureType(Enum):
    """Types of game data structures"""

    CHARACTER = "character"
    PARTY = "party"
    ITEM = "item"
    SPELL = "spell"
    MONSTER = "monster"
    MAP = "map"
    SYSTEM = "system"
    GRAPHICS = "graphics"
    AUDIO = "audio"
    UI = "ui"


@dataclass
class MemoryField:
    """Individual field within a data structure"""

    name: str
    offset: int
    size: int
    data_type: str
    description: str
    valid_range: Optional[str] = None
    notes: str = ""

    @property
    def end_offset(self) -> int:
        return self.offset + self.size - 1

    @property
    def address_range(self) -> str:
        if self.size == 1:
            return f"${self.offset:04X}"
...
```

**Lines shown**: 50 of 628 total

