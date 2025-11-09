# PartyMember_4 Data Structure

Character data structure for PartyMember_4

**Base Address:** `$39D9`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `4_Level`

**Offset:** `+00` (`$39D9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $39D9


### `4_XP`

**Offset:** `+01` (`$39DA`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #4 - XP

**Notes:** Raw offset: $39DA


### `4_HP_Max`

**Offset:** `+04` (`$39DD`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #4 - Max HP

**Notes:** Raw offset: $39DD


### `4_HP`

**Offset:** `+06` (`$39DF`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #4 - Current HP

**Notes:** Raw offset: $39DF


### `4_MP_Max`

**Offset:** `+08` (`$39E1`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #4 - Max MP

**Notes:** Raw offset: $39E1


### `4_MP`

**Offset:** `+0A` (`$39E3`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #4 - Current HP

**Notes:** Raw offset: $39E3


### `4_Strength`

**Offset:** `+0C` (`$39E5`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Strength stat

**Notes:** Raw offset: $39E5


### `4_Agility`

**Offset:** `+0D` (`$39E6`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Agility stat

**Notes:** Raw offset: $39E6


### `4_Stamina`

**Offset:** `+0E` (`$39E7`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Stamina stat

**Notes:** Raw offset: $39E7


### `4_Wisdom`

**Offset:** `+0F` (`$39E8`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Wisdom stat

**Notes:** Raw offset: $39E8


### `4_Luck`

**Offset:** `+10` (`$39E9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Luck stat, excluding equipment

**Notes:** Raw offset: $39E9


### `4_Name`

**Offset:** `+16` (`$39EF`)
**Size:** 5 bytes
**Type:** `string`

Party member #4 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $39EF


### `4_Bag_Number_Equiped`

**Offset:** `+2E` (`$3A07`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Number of items equipped

**Notes:** Raw offset: $3A07


### `4_Bag_Number_Carried`

**Offset:** `+2F` (`$3A08`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Number of items in bag

**Notes:** Raw offset: $3A08


### `4_Bag_Items`

**Offset:** `+30` (`$3A09`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #4 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3A09

