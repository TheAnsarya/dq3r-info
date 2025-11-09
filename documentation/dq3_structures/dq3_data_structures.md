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
| `+0E` | 1 | `uint8` | `Hero_Stamina` | Hero - Stamina stat |
| `+0F` | 1 | `uint8` | `Hero_Wisdom` | Hero - Wisdom stat |
| `+10` | 1 | `uint8` | `Hero_Luck` | Hero - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `Hero_Name` | Hero - Name, 4 characters max, ends in AC |
| `+24` | 10 | `spell_flags` | `Hero_Spells` | Hero spells flags |
| `+2E` | 1 | `uint8` | `Bag_Number_Equiped` | Hero - Number of items equipped |
| `+2F` | 1 | `uint8` | `Bag_Number_Carried` | Hero - Number of items in bag |
| `+30` | 12 | `item_id` | `Bag_Items` | Hero - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+23` (9 bytes)

---

## Inventory

**Base Address:** `$3725`  
**Total Size:** 512 bytes  
**Type:** Item  
**Coverage:** 100.0% documented  
**Status:** partial  

Inventory and item management data

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 256 | `item_id` | `Bag_Items` | Each byte is which item is in bag slot, 0 means empty, game uses values $01-$e4 |
| `+100` | 256 | `uint16` | `Items_Amounts` | Each byte is amount of the item in the bag slot, game allows up to 99 ($63) |

---

## PartyMember_10

**Base Address:** `$3B41`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented  
**Status:** documented  

Character data structure for PartyMember_10

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `10_Level` | Party member #10 - Level\nTop 7 bits are level, bottom bit unknown |
| `+01` | 3 | `uint24` | `10_XP` | Party member #10 - XP |
| `+04` | 2 | `uint16` | `10_HP_Max` | Party member #10 - Max HP |
| `+06` | 2 | `uint16` | `10_HP` | Party member #10 - Current HP |
| `+08` | 2 | `uint16` | `10_MP_Max` | Party member #10 - Max MP |
| `+0A` | 2 | `uint16` | `10_MP` | Party member #10 - Current HP |
| `+0C` | 1 | `uint8` | `10_Strength` | Party member #10 - Strength stat |
| `+0D` | 1 | `uint8` | `10_Agility` | Party member #10 - Agility stat |
| `+0E` | 1 | `uint8` | `10_Stamina` | Party member #10 - Stamina stat |
| `+0F` | 1 | `uint8` | `10_Wisdom` | Party member #10 - Wisdom stat |
| `+10` | 1 | `uint8` | `10_Luck` | Party member #10 - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `10_Name` | Party member #10 - Name, 4 characters max, ends in AC |
| `+2E` | 1 | `uint8` | `10_Bag_Number_Equiped` | Party member #10 - Number of items equipped |
| `+2F` | 1 | `uint8` | `10_Bag_Number_Carried` | Party member #10 - Number of items in bag |
| `+30` | 12 | `item_id` | `10_Bag_Items` | Party member #10 - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+2D` (19 bytes)

---

## PartyMember_11

**Base Address:** `$3B7D`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented  
**Status:** documented  

Character data structure for PartyMember_11

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `11_Level` | Party member #11 - Level\nTop 7 bits are level, bottom bit unknown |
| `+01` | 3 | `uint24` | `11_XP` | Party member #11 - XP |
| `+04` | 2 | `uint16` | `11_HP_Max` | Party member #11 - Max HP |
| `+06` | 2 | `uint16` | `11_HP` | Party member #11 - Current HP |
| `+08` | 2 | `uint16` | `11_MP_Max` | Party member #11 - Max MP |
| `+0A` | 2 | `uint16` | `11_MP` | Party member #11 - Current HP |
| `+0C` | 1 | `uint8` | `11_Strength` | Party member #11 - Strength stat |
| `+0D` | 1 | `uint8` | `11_Agility` | Party member #11 - Agility stat |
| `+0E` | 1 | `uint8` | `11_Stamina` | Party member #11 - Stamina stat |
| `+0F` | 1 | `uint8` | `11_Wisdom` | Party member #11 - Wisdom stat |
| `+10` | 1 | `uint8` | `11_Luck` | Party member #11 - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `11_Name` | Party member #11 - Name, 4 characters max, ends in AC |
| `+2E` | 1 | `uint8` | `11_Bag_Number_Equiped` | Party member #11 - Number of items equipped |
| `+2F` | 1 | `uint8` | `11_Bag_Number_Carried` | Party member #11 - Number of items in bag |
| `+30` | 12 | `item_id` | `11_Bag_Items` | Party member #11 - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+2D` (19 bytes)

---

## PartyMember_12

**Base Address:** `$3BB9`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented  
**Status:** documented  

Character data structure for PartyMember_12

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `12_Level` | Party member #12 - Level\nTop 7 bits are level, bottom bit unknown |
| `+01` | 3 | `uint24` | `12_XP` | Party member #12 - XP |
| `+04` | 2 | `uint16` | `12_HP_Max` | Party member #12 - Max HP |
| `+06` | 2 | `uint16` | `12_HP` | Party member #12 - Current HP |
| `+08` | 2 | `uint16` | `12_MP_Max` | Party member #12 - Max MP |
| `+0A` | 2 | `uint16` | `12_MP` | Party member #12 - Current HP |
| `+0C` | 1 | `uint8` | `12_Strength` | Party member #12 - Strength stat |
| `+0D` | 1 | `uint8` | `12_Agility` | Party member #12 - Agility stat |
| `+0E` | 1 | `uint8` | `12_Stamina` | Party member #12 - Stamina stat |
| `+0F` | 1 | `uint8` | `12_Wisdom` | Party member #12 - Wisdom stat |
| `+10` | 1 | `uint8` | `12_Luck` | Party member #12 - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `12_Name` | Party member #12 - Name, 4 characters max, ends in AC |
| `+2E` | 1 | `uint8` | `12_Bag_Number_Equiped` | Party member #12 - Number of items equipped |
| `+2F` | 1 | `uint8` | `12_Bag_Number_Carried` | Party member #12 - Number of items in bag |
| `+30` | 12 | `item_id` | `12_Bag_Items` | Party member #12 - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+2D` (19 bytes)

---

## PartyMember_2

**Base Address:** `$3961`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented  
**Status:** documented  

Character data structure for PartyMember_2

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `2_Level` | Party member #2 - Level\nTop 7 bits are level, bottom bit unknown |
| `+01` | 3 | `uint24` | `2_XP` | Party member #2 - XP |
| `+04` | 2 | `uint16` | `2_HP_Max` | Party member #2 - Max HP |
| `+06` | 2 | `uint16` | `2_HP` | Party member #2 - Current HP |
| `+08` | 2 | `uint16` | `2_MP_Max` | Party member #2 - Max MP |
| `+0A` | 2 | `uint16` | `2_MP` | Party member #2 - Current HP |
| `+0C` | 1 | `uint8` | `2_Strength` | Party member #2 - Strength stat |
| `+0D` | 1 | `uint8` | `2_Agility` | Party member #2 - Agility stat |
| `+0E` | 1 | `uint8` | `2_Stamina` | Party member #2 - Stamina stat |
| `+0F` | 1 | `uint8` | `2_Wisdom` | Party member #2 - Wisdom stat |
| `+10` | 1 | `uint8` | `2_Luck` | Party member #2 - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `2_Name` | Party member #2 - Name, 4 characters max, ends in AC |
| `+2E` | 1 | `uint8` | `2_Bag_Number_Equiped` | Party member #2 - Number of items equipped |
| `+2F` | 1 | `uint8` | `2_Bag_Number_Carried` | Party member #2 - Number of items in bag |
| `+30` | 12 | `item_id` | `2_Bag_Items` | Party member #2 - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+2D` (19 bytes)

---

## PartyMember_3

**Base Address:** `$399D`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented  
**Status:** documented  

Character data structure for PartyMember_3

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `3_Level` | Party member #3 - Level\nTop 7 bits are level, bottom bit unknown |
| `+01` | 3 | `uint24` | `3_XP` | Party member #3 - XP |
| `+04` | 2 | `uint16` | `3_HP_Max` | Party member #3 - Max HP |
| `+06` | 2 | `uint16` | `3_HP` | Party member #3 - Current HP |
| `+08` | 2 | `uint16` | `3_MP_Max` | Party member #3 - Max MP |
| `+0A` | 2 | `uint16` | `3_MP` | Party member #3 - Current HP |
| `+0C` | 1 | `uint8` | `3_Strength` | Party member #3 - Strength stat |
| `+0D` | 1 | `uint8` | `3_Agility` | Party member #3 - Agility stat |
| `+0E` | 1 | `uint8` | `3_Stamina` | Party member #3 - Stamina stat |
| `+0F` | 1 | `uint8` | `3_Wisdom` | Party member #3 - Wisdom stat |
| `+10` | 1 | `uint8` | `3_Luck` | Party member #3 - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `3_Name` | Party member #3 - Name, 4 characters max, ends in AC |
| `+2E` | 1 | `uint8` | `3_Bag_Number_Equiped` | Party member #3 - Number of items equipped |
| `+2F` | 1 | `uint8` | `3_Bag_Number_Carried` | Party member #3 - Number of items in bag |
| `+30` | 12 | `item_id` | `3_Bag_Items` | Party member #3 - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+2D` (19 bytes)

---

## PartyMember_4

**Base Address:** `$39D9`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented  
**Status:** documented  

Character data structure for PartyMember_4

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `4_Level` | Party member #4 - Level\nTop 7 bits are level, bottom bit unknown |
| `+01` | 3 | `uint24` | `4_XP` | Party member #4 - XP |
| `+04` | 2 | `uint16` | `4_HP_Max` | Party member #4 - Max HP |
| `+06` | 2 | `uint16` | `4_HP` | Party member #4 - Current HP |
| `+08` | 2 | `uint16` | `4_MP_Max` | Party member #4 - Max MP |
| `+0A` | 2 | `uint16` | `4_MP` | Party member #4 - Current HP |
| `+0C` | 1 | `uint8` | `4_Strength` | Party member #4 - Strength stat |
| `+0D` | 1 | `uint8` | `4_Agility` | Party member #4 - Agility stat |
| `+0E` | 1 | `uint8` | `4_Stamina` | Party member #4 - Stamina stat |
| `+0F` | 1 | `uint8` | `4_Wisdom` | Party member #4 - Wisdom stat |
| `+10` | 1 | `uint8` | `4_Luck` | Party member #4 - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `4_Name` | Party member #4 - Name, 4 characters max, ends in AC |
| `+2E` | 1 | `uint8` | `4_Bag_Number_Equiped` | Party member #4 - Number of items equipped |
| `+2F` | 1 | `uint8` | `4_Bag_Number_Carried` | Party member #4 - Number of items in bag |
| `+30` | 12 | `item_id` | `4_Bag_Items` | Party member #4 - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+2D` (19 bytes)

---

## PartyMember_5

**Base Address:** `$3A15`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 76.7% documented  
**Status:** documented  

Character data structure for PartyMember_5

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `5_Level` | Party member #5 - Level\nTop 7 bits are level, bottom bit unknown |
| `+01` | 3 | `uint24` | `5_XP` | Party Member #5 - XP |
| `+04` | 2 | `uint16` | `5_HP_Max` | Party member #5 - Max HP |
| `+06` | 2 | `uint16` | `5_HP` | Party member #5 - Current HP |
| `+08` | 2 | `uint16` | `5_MP_Max` | Party member #5 - Max MP |
| `+0A` | 2 | `uint16` | `5_MP` | Party member #5 - Current HP |
| `+0C` | 1 | `uint8` | `5_Strength` | Party member #5 - Strength stat |
| `+0D` | 1 | `uint8` | `5_Agility` | Party member #5 - Agility stat |
| `+0E` | 1 | `uint8` | `5_Stamina` | Party member #5 - Stamina stat |
| `+0F` | 1 | `uint8` | `5_Wisdom` | Party member #5 - Wisdom stat |
| `+10` | 1 | `uint8` | `5_Luck` | Party member #5 - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `5_Name` | Party member #5 - Name, 4 characters max, ends in AC |
| `+24` | 10 | `spell_flags` | `5_Spells` | Party member #5 spell flags |
| `+2E` | 1 | `uint8` | `5_Bag_Number_Equiped` | Party member #5 - Number of items equipped |
| `+2F` | 1 | `uint8` | `5_Bag_Number_Carried` | Party member #5 - Number of items in bag |
| `+30` | 12 | `item_id` | `5_Bag_Items` | Party member #5 - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+23` (9 bytes)

---

## PartyMember_6

**Base Address:** `$3A51`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented  
**Status:** documented  

Character data structure for PartyMember_6

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `6_Level` | Party member #6 - Level\nTop 7 bits are level, bottom bit unknown |
| `+01` | 3 | `uint24` | `6_XP` | Party member #6 - XP |
| `+04` | 2 | `uint16` | `6_HP_Max` | Party member #6 - Max HP |
| `+06` | 2 | `uint16` | `6_HP` | Party member #6 - Current HP |
| `+08` | 2 | `uint16` | `6_MP_Max` | Party member #6 - Max MP |
| `+0A` | 2 | `uint16` | `6_MP` | Party member #6 - Current HP |
| `+0C` | 1 | `uint8` | `6_Strength` | Party member #6 - Strength stat |
| `+0D` | 1 | `uint8` | `6_Agility` | Party member #6 - Agility stat |
| `+0E` | 1 | `uint8` | `6_Stamina` | Party member #6 - Stamina stat |
| `+0F` | 1 | `uint8` | `6_Wisdom` | Party member #6 - Wisdom stat |
| `+10` | 1 | `uint8` | `6_Luck` | Party member #6 - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `6_Name` | Party member #6 - Name, 4 characters max, ends in AC |
| `+2E` | 1 | `uint8` | `6_Bag_Number_Equiped` | Party member #6 - Number of items equipped |
| `+2F` | 1 | `uint8` | `6_Bag_Number_Carried` | Party member #6 - Number of items in bag |
| `+30` | 12 | `item_id` | `6_Bag_Items` | Party member #6 - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+2D` (19 bytes)

---

## PartyMember_7

**Base Address:** `$3A8D`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented  
**Status:** documented  

Character data structure for PartyMember_7

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `7_Level` | Party member #7 - Level\nTop 7 bits are level, bottom bit unknown |
| `+01` | 3 | `uint24` | `7_XP` | Party member #7 - XP |
| `+04` | 2 | `uint16` | `7_HP_Max` | Party member #7 - Max HP |
| `+06` | 2 | `uint16` | `7_HP` | Party member #7 - Current HP |
| `+08` | 2 | `uint16` | `7_MP_Max` | Party member #7 - Max MP |
| `+0A` | 2 | `uint16` | `7_MP` | Party member #7 - Current HP |
| `+0C` | 1 | `uint8` | `7_Strength` | Party member #7 - Strength stat |
| `+0D` | 1 | `uint8` | `7_Agility` | Party member #7 - Agility stat |
| `+0E` | 1 | `uint8` | `7_Stamina` | Party member #7 - Stamina stat |
| `+0F` | 1 | `uint8` | `7_Wisdom` | Party member #7 - Wisdom stat |
| `+10` | 1 | `uint8` | `7_Luck` | Party member #7 - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `7_Name` | Party member #7 - Name, 4 characters max, ends in AC |
| `+2E` | 1 | `uint8` | `7_Bag_Number_Equiped` | Party member #7 - Number of items equipped |
| `+2F` | 1 | `uint8` | `7_Bag_Number_Carried` | Party member #7 - Number of items in bag |
| `+30` | 12 | `item_id` | `7_Bag_Items` | Party member #7 - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+2D` (19 bytes)

---

## PartyMember_8

**Base Address:** `$3AC9`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented  
**Status:** documented  

Character data structure for PartyMember_8

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `8_Level` | Party member #8 - Level\nTop 7 bits are level, bottom bit unknown |
| `+01` | 3 | `uint24` | `8_XP` | Party member #8 - XP |
| `+04` | 2 | `uint16` | `8_HP_Max` | Party member #8 - Max HP |
| `+06` | 2 | `uint16` | `8_HP` | Party member #8 - Current HP |
| `+08` | 2 | `uint16` | `8_MP_Max` | Party member #8 - Max MP |
| `+0A` | 2 | `uint16` | `8_MP` | Party member #8 - Current HP |
| `+0C` | 1 | `uint8` | `8_Strength` | Party member #8 - Strength stat |
| `+0D` | 1 | `uint8` | `8_Agility` | Party member #8 - Agility stat |
| `+0E` | 1 | `uint8` | `8_Stamina` | Party member #8 - Stamina stat |
| `+0F` | 1 | `uint8` | `8_Wisdom` | Party member #8 - Wisdom stat |
| `+10` | 1 | `uint8` | `8_Luck` | Party member #8 - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `8_Name` | Party member #8 - Name, 4 characters max, ends in AC |
| `+2E` | 1 | `uint8` | `8_Bag_Number_Equiped` | Party member #8 - Number of items equipped |
| `+2F` | 1 | `uint8` | `8_Bag_Number_Carried` | Party member #8 - Number of items in bag |
| `+30` | 12 | `item_id` | `8_Bag_Items` | Party member #8 - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+2D` (19 bytes)

---

## PartyMember_9

**Base Address:** `$3B05`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented  
**Status:** documented  

Character data structure for PartyMember_9

### Memory Layout

| Offset | Size | Type | Field | Description |
|--------|------|------|--------|-------------|
| `+00` | 1 | `uint8` | `9_Level` | Party member #9 - Level\nTop 7 bits are level, bottom bit unknown |
| `+01` | 3 | `uint24` | `9_XP` | Party member #9 - XP |
| `+04` | 2 | `uint16` | `9_HP_Max` | Party member #9 - Max HP |
| `+06` | 2 | `uint16` | `9_HP` | Party member #9 - Current HP |
| `+08` | 2 | `uint16` | `9_MP_Max` | Party member #9 - Max MP |
| `+0A` | 2 | `uint16` | `9_MP` | Party member #9 - Current HP |
| `+0C` | 1 | `uint8` | `9_Strength` | Party member #9 - Strength stat |
| `+0D` | 1 | `uint8` | `9_Agility` | Party member #9 - Agility stat |
| `+0E` | 1 | `uint8` | `9_Stamina` | Party member #9 - Stamina stat |
| `+0F` | 1 | `uint8` | `9_Wisdom` | Party member #9 - Wisdom stat |
| `+10` | 1 | `uint8` | `9_Luck` | Party member #9 - Luck stat, excluding equipment |
| `+16` | 5 | `string` | `9_Name` | Party member #9 - Name, 4 characters max, ends in AC |
| `+2E` | 1 | `uint8` | `9_Bag_Number_Equiped` | Party member #9 - Number of items equipped |
| `+2F` | 1 | `uint8` | `9_Bag_Number_Carried` | Party member #9 - Number of items in bag |
| `+30` | 12 | `item_id` | `9_Bag_Items` | Party member #9 - Each byte is which item is in the bag slot |

### Undocumented Gaps

- `+11` to `+15` (5 bytes)
- `+1B` to `+2D` (19 bytes)

---
