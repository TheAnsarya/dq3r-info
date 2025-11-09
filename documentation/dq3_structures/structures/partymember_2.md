# PartyMember_2 Data Structure

Character data structure for PartyMember_2

**Base Address:** `$3961`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `2_Level`

**Offset:** `+00` (`$3961`)
**Size:** 1 byte
**Type:** `uint8`

Party member #2 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3961


### `2_XP`

**Offset:** `+01` (`$3962`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #2 - XP

**Notes:** Raw offset: $3962


### `2_HP_Max`

**Offset:** `+04` (`$3965`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #2 - Max HP

**Notes:** Raw offset: $3965


### `2_HP`

**Offset:** `+06` (`$3967`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #2 - Current HP

**Notes:** Raw offset: $3967


### `2_MP_Max`

**Offset:** `+08` (`$3969`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #2 - Max MP

**Notes:** Raw offset: $3969


### `2_MP`

**Offset:** `+0A` (`$396B`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #2 - Current HP

**Notes:** Raw offset: $396B


### `2_Strength`

**Offset:** `+0C` (`$396D`)
**Size:** 1 byte
**Type:** `uint8`

Party member #2 - Strength stat

**Notes:** Raw offset: $396D


### `2_Agility`

**Offset:** `+0D` (`$396E`)
**Size:** 1 byte
**Type:** `uint8`

Party member #2 - Agility stat

**Notes:** Raw offset: $396E


### `2_Stamina`

**Offset:** `+0E` (`$396F`)
**Size:** 1 byte
**Type:** `uint8`

Party member #2 - Stamina stat

**Notes:** Raw offset: $396F


### `2_Wisdom`

**Offset:** `+0F` (`$3970`)
**Size:** 1 byte
**Type:** `uint8`

Party member #2 - Wisdom stat

**Notes:** Raw offset: $3970


### `2_Luck`

**Offset:** `+10` (`$3971`)
**Size:** 1 byte
**Type:** `uint8`

Party member #2 - Luck stat, excluding equipment

**Notes:** Raw offset: $3971


### `2_Name`

**Offset:** `+16` (`$3977`)
**Size:** 5 bytes
**Type:** `string`

Party member #2 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3977


### `2_Bag_Number_Equiped`

**Offset:** `+2E` (`$398F`)
**Size:** 1 byte
**Type:** `uint8`

Party member #2 - Number of items equipped

**Notes:** Raw offset: $398F


### `2_Bag_Number_Carried`

**Offset:** `+2F` (`$3990`)
**Size:** 1 byte
**Type:** `uint8`

Party member #2 - Number of items in bag

**Notes:** Raw offset: $3990


### `2_Bag_Items`

**Offset:** `+30` (`$3991`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #2 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3991

