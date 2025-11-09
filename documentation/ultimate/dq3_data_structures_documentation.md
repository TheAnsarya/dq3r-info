# dq3_data_structures.md
**Project**: Dragon Quest III ROM Analysis
**Type**: Markdown Documentation
**Size**: 20,763 bytes
**Last Modified**: 2025-11-09 02:54:08
**Git Status**: 🔄 M documentation/dq3_structures/dq3_data_structures.md

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

🔧 Medium complexity file with moderate control flow.

## Technical Details
- **File Size**: 20,763 bytes
- **Line Count**: 492
- **Character Encoding**: UTF-8 (auto-detected)
- **Comment Lines**: 219
- **Documentation Coverage**: 57.0%
- **Estimated Complexity**: 10/10

## Code Metrics
- **Complexity Score**: 25/10
- **Documentation Coverage**: 57.0%
- **Function Count**: 0
- **Comment Lines**: 219

## Source Code Preview

```text
# 🐉 Dragon Quest III - Data Structure Documentation

Complete documentation of game data structures extracted from manual analysis.

**Generated from:** 184 memory entries
**Structures identified:** 13
**Generation date:** 2025-11-09T01:22:12.235797

---

## 📋 Table of Contents

- [Hero](#hero) - Character data structure for Hero
- [Inventory](#inventory) - Inventory and item management data
- [PartyMember_10](#partymember-10) - Character data structure for PartyMember_10
- [PartyMember_11](#partymember-11) - Character data structure for PartyMember_11
- [PartyMember_12](#partymember-12) - Character data structure for PartyMember_12
- [PartyMember_2](#partymember-2) - Character data structure for PartyMember_2
- [PartyMember_3](#partymember-3) - Character data structure for PartyMember_3
- [PartyMember_4](#partymember-4) - Character data structure for PartyMember_4
- [PartyMember_5](#partymember-5) - Character data structure for PartyMember_5
- [PartyMember_6](#partymember-6) - Character data structure for PartyMember_6
- [PartyMember_7](#partymember-7) - Character data structure for PartyMember_7
- [PartyMember_8](#partymember-8) - Character data structure for PartyMember_8
- [PartyMember_9](#partymember-9) - Character data structure for PartyMember_9

---

## Hero

**Base Address:** `$3925`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 76.7% documented  
**Status:** documented  

Character data structure for Hero

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `Hero_Level` | Hero - Level\nTop 7 bits are Hero's level, bottom bit unknown |
| `+01` | 3 | `uint24` | `Hero_XP` | Hero - XP |
| `+04` | 2 | `uint16` | `HP_Max` | Hero - Max HP |
| `+06` | 2 | `uint16` | `Hero_HP` | Hero - Current HP |
| `+08` | 2 | `uint16` | `MP_Max` | Hero - Max MP |
| `+0A` | 2 | `uint16` | `Hero_MP` | Hero - Current MP |
| `+0C` | 1 | `uint8` | `Hero_Strength` | Hero - Strength stat |
| `+0D` | 1 | `uint8` | `Hero_Agility` | Hero - Agility stat |
...
```

**Lines shown**: 50 of 492 total

