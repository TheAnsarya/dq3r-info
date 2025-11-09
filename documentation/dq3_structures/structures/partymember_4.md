# PartyMember_4 Data Structure

Character data structure for PartyMember_4

**Base Address:** `$39d9`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `4_Level`

**Offset:** `+00` (`$39d9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $39d9


### `4_XP`

**Offset:** `+01` (`$39da`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #4 - XP

**Notes:** Raw offset: $39da


### `4_HP_Max`

**Offset:** `+04` (`$39dd`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #4 - Max HP

**Notes:** Raw offset: $39dd


### `4_HP`

**Offset:** `+06` (`$39df`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #4 - Current HP

**Notes:** Raw offset: $39df


### `4_MP_Max`

**Offset:** `+08` (`$39e1`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #4 - Max MP

**Notes:** Raw offset: $39e1


### `4_MP`

**Offset:** `+0A` (`$39e3`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #4 - Current HP

**Notes:** Raw offset: $39e3


### `4_Strength`

**Offset:** `+0C` (`$39e5`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Strength stat

**Notes:** Raw offset: $39e5


### `4_Agility`

**Offset:** `+0D` (`$39e6`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Agility stat

**Notes:** Raw offset: $39e6


### `4_Stamina`

**Offset:** `+0E` (`$39e7`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Stamina stat

**Notes:** Raw offset: $39e7


### `4_Wisdom`

**Offset:** `+0F` (`$39e8`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Wisdom stat

**Notes:** Raw offset: $39e8


### `4_Luck`

**Offset:** `+10` (`$39e9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Luck stat, excluding equipment

**Notes:** Raw offset: $39e9


### `4_Name`

**Offset:** `+16` (`$39ef`)
**Size:** 5 bytes
**Type:** `string`

Party member #4 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $39ef


### `4_Bag_Number_Equiped`

**Offset:** `+2E` (`$3a07`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Number of items equipped

**Notes:** Raw offset: $3a07


### `4_Bag_Number_Carried`

**Offset:** `+2F` (`$3a08`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Number of items in bag

**Notes:** Raw offset: $3a08


### `4_Bag_Items`

**Offset:** `+30` (`$3a09`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #4 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3a09

