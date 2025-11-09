# TECHNICAL_RESEARCH.md
**Project**: Dragon Quest III ROM Analysis
**Type**: Markdown Documentation
**Size**: 8,099 bytes
**Last Modified**: 2025-11-09 04:23:21
**Git Status**: 🔄 M docs/research/TECHNICAL_RESEARCH.md

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

🔧 Medium complexity file with moderate control flow.

## Technical Details
- **File Size**: 8,099 bytes
- **Line Count**: 219
- **Character Encoding**: UTF-8 (auto-detected)
- **Comment Lines**: 37
- **Documentation Coverage**: 20.6%
- **Estimated Complexity**: 10/10

## Code Metrics
- **Complexity Score**: 28/10
- **Documentation Coverage**: 20.6%
- **Function Count**: 0
- **Comment Lines**: 37

## Source Code Preview

```text
# Dragon Quest III Technical Research Documentation

# # Overview
This document compiles comprehensive technical research about Dragon Quest III: Soshite Densetsu e... for the Super Nintendo Entertainment System. The information is gathered from multiple authoritative sources including DataCrystal, the GameInfo repository, and community reverse engineering efforts.

# # ROM Information

# ## Basic ROM Details
- **Title**: Dragon Quest III: Soshite Densetsu e...
- **System**: Super Nintendo Entertainment System (SNES)
- **Developer**: Heartbeat
- **Publisher**: Enix
- **Release Date**: December 6, 1996 (Japan)
- **ROM Size**: 4 MiB (4,194,304 bytes)
- **SRAM**: 8 KiB battery-backed save RAM
- **Memory Layout**: HiROM mapping
- **Speed**: FastROM (120ns)
- **Region**: Japan (NTSC)

# ## Known ROM Dumps
- **Primary CRC32**: `13836bd2` (verified good dump)
- **Internal Title**: `DRAGONQUEST3`
- **Revision**: 1.0
- **Header**: No copier header (512-byte header not present)

# # Memory Structure

# ## ROM Layout (HiROM Mapping)
The ROM uses HiROM memory mapping starting at `$c00000` in the SNES address space.

# ### Key ROM Sections
- **Character Classes**: `$c4179e - $c424a8` (3,339 bytes)
  - 9 character classes, 371 bytes each
  - Includes stat progressions, spells, equipment restrictions
- **Monster Data**: `$3ed964 - $3ee0db` (1,896 bytes)
  - 155 monsters with complete stat and behavior data
- **Dialog Font**: `$c151aa - $c152a3` (250 bytes)
  - 50 font structures, 5 bytes each
  - Includes width, height, and graphics pointers

# ## RAM Structure ($7e Bank)

# ### Party Member Data
Starting at `$7e3925`, each party member uses `$3c` (60) bytes:
- **Hero**: `$7e3925 - $7e3960`
- **Party Member 2**: `$7e3961 - $7e399c`
- **Party Member 3**: `$7e399d - $7e39d8`
- **Party Member 4**: `$7e39d9 - $7e3a14`
- Additional slots continue up to 18 total party members

...
```

**Lines shown**: 50 of 219 total

