# PartyMember_5 Data Structure

Character data structure for PartyMember_5

**Base Address:** `$3A15`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 76.7% documented

## Field Definitions

### `5_Level`

**Offset:** `+00` (`$3A15`)
**Size:** 1 byte
**Type:** `uint8`

Party member #5 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3A15


### `5_XP`

**Offset:** `+01` (`$3A16`)
**Size:** 3 bytes
**Type:** `uint24`

Party Member #5 - XP

**Notes:** Raw offset: $3A16


### `5_HP_Max`

**Offset:** `+04` (`$3A19`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #5 - Max HP

**Notes:** Raw offset: $3A19


### `5_HP`

**Offset:** `+06` (`$3A1B`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #5 - Current HP

**Notes:** Raw offset: $3A1B


### `5_MP_Max`

**Offset:** `+08` (`$3A1D`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #5 - Max MP

**Notes:** Raw offset: $3A1D


### `5_MP`

**Offset:** `+0A` (`$3A1F`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #5 - Current HP

**Notes:** Raw offset: $3A1F


### `5_Strength`

**Offset:** `+0C` (`$3A21`)
**Size:** 1 byte
**Type:** `uint8`

Party member #5 - Strength stat

**Notes:** Raw offset: $3A21


### `5_Agility`

**Offset:** `+0D` (`$3A22`)
**Size:** 1 byte
**Type:** `uint8`

Party member #5 - Agility stat

**Notes:** Raw offset: $3A22


### `5_Stamina`

**Offset:** `+0E` (`$3A23`)
**Size:** 1 byte
**Type:** `uint8`

Party member #5 - Stamina stat

**Notes:** Raw offset: $3A23


### `5_Wisdom`

**Offset:** `+0F` (`$3A24`)
**Size:** 1 byte
**Type:** `uint8`

Party member #5 - Wisdom stat

**Notes:** Raw offset: $3A24


### `5_Luck`

**Offset:** `+10` (`$3A25`)
**Size:** 1 byte
**Type:** `uint8`

Party member #5 - Luck stat, excluding equipment

**Notes:** Raw offset: $3A25


### `5_Name`

**Offset:** `+16` (`$3A2B`)
**Size:** 5 bytes
**Type:** `string`

Party member #5 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3A2B


### `5_Spells`

**Offset:** `+24` (`$3A39`)
**Size:** 10 bytes
**Type:** `spell_flags`

Party member #5 spell flags

**Notes:** Raw offset: $3A39


### `5_Bag_Number_Equiped`

**Offset:** `+2E` (`$3A43`)
**Size:** 1 byte
**Type:** `uint8`

Party member #5 - Number of items equipped

**Notes:** Raw offset: $3A43


### `5_Bag_Number_Carried`

**Offset:** `+2F` (`$3A44`)
**Size:** 1 byte
**Type:** `uint8`

Party member #5 - Number of items in bag

**Notes:** Raw offset: $3A44


### `5_Bag_Items`

**Offset:** `+30` (`$3A45`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #5 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3A45

