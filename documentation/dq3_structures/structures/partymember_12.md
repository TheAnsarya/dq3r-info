# PartyMember_12 Data Structure

Character data structure for PartyMember_12

**Base Address:** `$3bb9`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `12_Level`

**Offset:** `+00` (`$3bb9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #12 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3bb9


### `12_XP`

**Offset:** `+01` (`$3bba`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #12 - XP

**Notes:** Raw offset: $3bba


### `12_HP_Max`

**Offset:** `+04` (`$3bbd`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #12 - Max HP

**Notes:** Raw offset: $3bbd


### `12_HP`

**Offset:** `+06` (`$3bbf`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #12 - Current HP

**Notes:** Raw offset: $3bbf


### `12_MP_Max`

**Offset:** `+08` (`$3bc1`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #12 - Max MP

**Notes:** Raw offset: $3bc1


### `12_MP`

**Offset:** `+0A` (`$3bc3`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #12 - Current HP

**Notes:** Raw offset: $3bc3


### `12_Strength`

**Offset:** `+0C` (`$3bc5`)
**Size:** 1 byte
**Type:** `uint8`

Party member #12 - Strength stat

**Notes:** Raw offset: $3bc5


### `12_Agility`

**Offset:** `+0D` (`$3bc6`)
**Size:** 1 byte
**Type:** `uint8`

Party member #12 - Agility stat

**Notes:** Raw offset: $3bc6


### `12_Stamina`

**Offset:** `+0E` (`$3bc7`)
**Size:** 1 byte
**Type:** `uint8`

Party member #12 - Stamina stat

**Notes:** Raw offset: $3bc7


### `12_Wisdom`

**Offset:** `+0F` (`$3bc8`)
**Size:** 1 byte
**Type:** `uint8`

Party member #12 - Wisdom stat

**Notes:** Raw offset: $3bc8


### `12_Luck`

**Offset:** `+10` (`$3bc9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #12 - Luck stat, excluding equipment

**Notes:** Raw offset: $3bc9


### `12_Name`

**Offset:** `+16` (`$3bcf`)
**Size:** 5 bytes
**Type:** `string`

Party member #12 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3bcf


### `12_Bag_Number_Equiped`

**Offset:** `+2E` (`$3be7`)
**Size:** 1 byte
**Type:** `uint8`

Party member #12 - Number of items equipped

**Notes:** Raw offset: $3be7


### `12_Bag_Number_Carried`

**Offset:** `+2F` (`$3be8`)
**Size:** 1 byte
**Type:** `uint8`

Party member #12 - Number of items in bag

**Notes:** Raw offset: $3be8


### `12_Bag_Items`

**Offset:** `+30` (`$3be9`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #12 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3be9

