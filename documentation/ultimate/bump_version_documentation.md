# bump_version.py
**Project**: Dragon Quest III ROM Analysis
**Type**: Python Source Code
**Size**: 1,748 bytes
**Last Modified**: 2025-11-09 00:57:02
**Git Status**: ✅ Tracked and clean

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

Contains 2 documented functions/procedures:

- 2 Python Function functions

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 1,748 bytes
- **Line Count**: 65
- **Character Encoding**: UTF-8 (auto-detected)
- **Functions Defined**: 2
- **Dependencies**: argparse, sys, re, typing
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 0/10

## Functions and Procedures

### parse_version
**File**: `bump_version.py:12`
**Type**: Python Function
**Complexity**: 4/10

#### Description
Analyzes and processes data for parse version operations.

#### Parameters
- `version_str`: Parameter for function operation

#### Returns
Returns processed result or status code

#### Usage Example
```python
result = parse_version(input_data)
if result:
    print('Operation successful')
```

#### Cross References
Referenced in: [Analysis pending]

### bump_version
**File**: `bump_version.py:24`
**Type**: Python Function
**Complexity**: 4/10

#### Description
Implements bump version functionality with specialized logic.

#### Parameters
- `version_str`: Parameter for function operation
- `bump_type`: Parameter for function operation

#### Returns
Returns processed result or status code

#### Usage Example
```python
result = bump_version(input_data)
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
Version bumping utility for DQ3R project releases.
"""

import argparse
import re
import sys
from typing import Tuple


def parse_version(version_str: str) -> Tuple[int, int, int]:
    """Parse a version string into major, minor, patch components."""
    # Remove 'v' prefix if present
    clean_version = version_str.lstrip("v")

    match = re.match(r"^(\d+)\.(\d+)\.(\d+)", clean_version)
    if not match:
        raise ValueError(f"Invalid version format: {version_str}")

    return int(match.group(1)), int(match.group(2)), int(match.group(3))


def bump_version(version_str: str, bump_type: str) -> str:
    """Bump a version string based on bump type."""
    major, minor, patch = parse_version(version_str)

    if bump_type == "major":
        major += 1
        minor = 0
        patch = 0
    elif bump_type == "minor":
        minor += 1
        patch = 0
    elif bump_type == "patch":
        patch += 1
    else:
        raise ValueError(f"Invalid bump type: {bump_type}")

    return f"v{major}.{minor}.{patch}"


def main():
    parser = argparse.ArgumentParser(description="Bump version for DQ3R project")
    parser.add_argument("--last-version", required=True, help="Last version tag")
    parser.add_argument(
        "--bump",
        choices=["major", "minor", "patch"],
        default="patch",
        help="Type of version bump",
...
```

**Lines shown**: 50 of 65 total

