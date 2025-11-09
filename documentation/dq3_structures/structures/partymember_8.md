# PartyMember_8 Data Structure

Character data structure for PartyMember_8

**Base Address:** `$3ac9`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `8_Level`

**Offset:** `+00` (`$3ac9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3ac9


### `8_XP`

**Offset:** `+01` (`$3aca`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #8 - XP

**Notes:** Raw offset: $3aca


### `8_HP_Max`

**Offset:** `+04` (`$3acd`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #8 - Max HP

**Notes:** Raw offset: $3acd


### `8_HP`

**Offset:** `+06` (`$3acf`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #8 - Current HP

**Notes:** Raw offset: $3acf


### `8_MP_Max`

**Offset:** `+08` (`$3ad1`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #8 - Max MP

**Notes:** Raw offset: $3ad1


### `8_MP`

**Offset:** `+0A` (`$3ad3`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #8 - Current HP

**Notes:** Raw offset: $3ad3


### `8_Strength`

**Offset:** `+0C` (`$3ad5`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Strength stat

**Notes:** Raw offset: $3ad5


### `8_Agility`

**Offset:** `+0D` (`$3ad6`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Agility stat

**Notes:** Raw offset: $3ad6


### `8_Stamina`

**Offset:** `+0E` (`$3ad7`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Stamina stat

**Notes:** Raw offset: $3ad7


### `8_Wisdom`

**Offset:** `+0F` (`$3ad8`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Wisdom stat

**Notes:** Raw offset: $3ad8


### `8_Luck`

**Offset:** `+10` (`$3ad9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Luck stat, excluding equipment

**Notes:** Raw offset: $3ad9


### `8_Name`

**Offset:** `+16` (`$3adf`)
**Size:** 5 bytes
**Type:** `string`

Party member #8 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3adf


### `8_Bag_Number_Equiped`

**Offset:** `+2E` (`$3af7`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Number of items equipped

**Notes:** Raw offset: $3af7


### `8_Bag_Number_Carried`

**Offset:** `+2F` (`$3af8`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Number of items in bag

**Notes:** Raw offset: $3af8


### `8_Bag_Items`

**Offset:** `+30` (`$3af9`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #8 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3af9

