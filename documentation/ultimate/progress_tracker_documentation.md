# progress_tracker.py
**Project**: Dragon Quest III ROM Analysis
**Type**: Python Source Code
**Size**: 23,738 bytes
**Last Modified**: 2025-11-09 02:52:42
**Git Status**: 🔄 M tools/visualization/progress_tracker.py

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

Contains 5 documented functions/procedures:

- 3 Python Class functions

- 2 Python Function functions

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 23,738 bytes
- **Line Count**: 618
- **Character Encoding**: UTF-8 (auto-detected)
- **Functions Defined**: 5
- **Dependencies**: dataclasses, re, struct, sys, json, pathlib, enum, typing
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 0/10

## Functions and Procedures

### AssetType
**File**: `progress_tracker.py:17`
**Type**: Python Class
**Complexity**: 3/10

#### Description
Stores and manages data for assettype operations.

#### Parameters
- `Enum`: Parameter for function operation

#### Returns
Returns processed result or status code

#### Usage Example
```python
// Usage example for AssetType
// [Implementation specific]
```

#### Cross References
Referenced in: [Analysis pending]

### AssetInfo
**File**: `progress_tracker.py:35`
**Type**: Python Class
**Complexity**: 3/10

#### Description
Stores and manages data for assetinfo operations.

#### Parameters
No parameters

#### Returns
Returns processed result or status code

#### Usage Example
```python
// Usage example for AssetInfo
// [Implementation specific]
```

#### Cross References
Referenced in: [Analysis pending]

### ProgressVisualization
**File**: `progress_tracker.py:49`
**Type**: Python Class
**Complexity**: 7/10

#### Description
Implements progressvisualization functionality with specialized logic.

#### Parameters
No parameters

#### Returns
Returns boolean indicating success/validity

#### Usage Example
```python
// Usage example for ProgressVisualization
// [Implementation specific]
```

#### Cross References
Referenced in: [Analysis pending]

### __post_init__
**File**: `progress_tracker.py:60`
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

### update_status_bar
**File**: `progress_tracker.py:65`
**Type**: Python Function
**Complexity**: 5/10

#### Description
Implements update status bar functionality with specialized logic.

#### Parameters
- `self`: Parameter for function operation

#### Returns
Returns processed result or status code

#### Usage Example
```python
result = update_status_bar(input_data)
if result:
    print('Operation successful')
```

#### Cross References
Referenced in: [Analysis pending]

## Code Metrics
- **Complexity Score**: 0/10
- **Documentation Coverage**: 0.0%
- **Function Count**: 5
- **Comment Lines**: 0

## Source Code Preview

```python
#!/usr/bin/env python3
"""
Dragon Quest III Progress Visualization & Asset Extraction
Creates comprehensive progress tables and extracts game assets
"""

import json
import sys
from pathlib import Path
from typing import Dict, List, Any, Optional, Tuple
import struct
from dataclasses import dataclass, asdict
from enum import Enum
import re


class AssetType(Enum):
    """Types of assets that can be extracted"""

    GRAPHICS_TILES = "graphics_tiles"
    GRAPHICS_SPRITES = "graphics_sprites"
    GRAPHICS_BACKGROUNDS = "graphics_backgrounds"
    AUDIO_INSTRUMENTS = "audio_instruments"
    AUDIO_MUSIC = "audio_music"
    AUDIO_SFX = "audio_sfx"
    TEXT_DIALOG = "text_dialog"
    TEXT_MENUS = "text_menus"
    DATA_ITEMS = "data_items"
    DATA_MONSTERS = "data_monsters"
    DATA_SPELLS = "data_spells"
    DATA_MAPS = "data_maps"


@dataclass
class AssetInfo:
    """Information about an extracted asset"""

    asset_type: AssetType
    name: str
    address: int
    size: int
    bank: int
    format_info: str = ""
    extracted: bool = False
    extraction_notes: str = ""


@dataclass
class ProgressVisualization:
    """Progress tracking with visual elements"""
...
```

**Lines shown**: 50 of 618 total

