# asset_extractor.py
**Project**: Dragon Quest III ROM Analysis
**Type**: Python Source Code
**Size**: 28,471 bytes
**Last Modified**: 2025-11-09 02:52:42
**Git Status**: 🔄 M tools/extraction/asset_extractor.py

## Overview
This file implements data extraction capabilities from ROM files.

Contains 4 documented functions/procedures:

- 2 Python Class functions

- 2 Python Function functions

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 28,471 bytes
- **Line Count**: 699
- **Character Encoding**: UTF-8 (auto-detected)
- **Functions Defined**: 4
- **Dependencies**: dataclasses, struct, json, sys, hashlib, pathlib, enum, typing
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 0/10

## Functions and Procedures

### AssetFormat
**File**: `asset_extractor.py:17`
**Type**: Python Class
**Complexity**: 3/10

#### Description
Formats and transforms data using assetformat algorithms.

#### Parameters
- `Enum`: Parameter for function operation

#### Returns
Returns processed result or status code

#### Usage Example
```python
// Usage example for AssetFormat
// [Implementation specific]
```

#### Cross References
Referenced in: [Analysis pending]

### ExtractedAsset
**File**: `asset_extractor.py:45`
**Type**: Python Class
**Complexity**: 4/10

#### Description
Stores and manages data for extractedasset operations.

#### Parameters
No parameters

#### Returns
Returns processed result or status code

#### Usage Example
```python
// Usage example for ExtractedAsset
// [Implementation specific]
```

#### Cross References
Referenced in: [Analysis pending]

### __post_init__
**File**: `asset_extractor.py:59`
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

### save_to_file
**File**: `asset_extractor.py:63`
**Type**: Python Function
**Complexity**: 4/10

#### Description
Stores and manages data for save to file operations.

#### Parameters
- `self`: Parameter for function operation
- `output_path`: Parameter for function operation
- `format_override`: Parameter for function operation

#### Returns
Returns processed result or status code

#### Usage Example
```python
result = save_to_file(input_data)
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
Dragon Quest III Asset Extraction Framework
Comprehensive asset extraction system for graphics, audio, text, and data
"""

import struct
import sys
import json
from pathlib import Path
from typing import Dict, List, Any, Optional, Tuple, Set
from dataclasses import dataclass, asdict, field
from enum import Enum
import hashlib


class AssetFormat(Enum):
    """Supported asset formats for extraction"""

    # Graphics formats
    SNES_4BPP = "snes_4bpp"
    SNES_2BPP = "snes_2bpp"
    SNES_8BPP = "snes_8bpp"
    SPRITE_16X16 = "sprite_16x16"
    SPRITE_8X8 = "sprite_8x8"

    # Audio formats
    SPC_MUSIC = "spc_music"
    BRR_SAMPLE = "brr_sample"
    SEQUENCE_DATA = "sequence_data"

    # Text formats
    SHIFT_JIS = "shift_jis"
    ASCII = "ascii"
    COMPRESSED_TEXT = "compressed_text"

    # Data formats
    ITEM_TABLE = "item_table"
    MONSTER_TABLE = "monster_table"
    SPELL_TABLE = "spell_table"
    MAP_DATA = "map_data"


@dataclass
class ExtractedAsset:
    """Represents an extracted game asset"""

    name: str
    asset_format: AssetFormat
    source_address: int
...
```

**Lines shown**: 50 of 699 total

