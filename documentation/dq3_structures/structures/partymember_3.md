# PartyMember_3 Data Structure

Character data structure for PartyMember_3

**Base Address:** `$399D`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `3_Level`

**Offset:** `+00` (`$399D`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $399D


### `3_XP`

**Offset:** `+01` (`$399E`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #3 - XP

**Notes:** Raw offset: $399E


### `3_HP_Max`

**Offset:** `+04` (`$39A1`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #3 - Max HP

**Notes:** Raw offset: $39A1


### `3_HP`

**Offset:** `+06` (`$39A3`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #3 - Current HP

**Notes:** Raw offset: $39A3


### `3_MP_Max`

**Offset:** `+08` (`$39A5`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #3 - Max MP

**Notes:** Raw offset: $39A5


### `3_MP`

**Offset:** `+0A` (`$39A7`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #3 - Current HP

**Notes:** Raw offset: $39A7


### `3_Strength`

**Offset:** `+0C` (`$39A9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Strength stat

**Notes:** Raw offset: $39A9


### `3_Agility`

**Offset:** `+0D` (`$39AA`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Agility stat

**Notes:** Raw offset: $39AA


### `3_Stamina`

**Offset:** `+0E` (`$39AB`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Stamina stat

**Notes:** Raw offset: $39AB


### `3_Wisdom`

**Offset:** `+0F` (`$39AC`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Wisdom stat

**Notes:** Raw offset: $39AC


### `3_Luck`

**Offset:** `+10` (`$39AD`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Luck stat, excluding equipment

**Notes:** Raw offset: $39AD


### `3_Name`

**Offset:** `+16` (`$39B3`)
**Size:** 5 bytes
**Type:** `string`

Party member #3 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $39B3


### `3_Bag_Number_Equiped`

**Offset:** `+2E` (`$39CB`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Number of items equipped

**Notes:** Raw offset: $39CB


### `3_Bag_Number_Carried`

**Offset:** `+2F` (`$39CC`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Number of items in bag

**Notes:** Raw offset: $39CC


### `3_Bag_Items`

**Offset:** `+30` (`$39CD`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #3 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $39CD

