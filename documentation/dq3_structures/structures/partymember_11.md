# PartyMember_11 Data Structure

Character data structure for PartyMember_11

**Base Address:** `$3B7D`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `11_Level`

**Offset:** `+00` (`$3B7D`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3B7D


### `11_XP`

**Offset:** `+01` (`$3B7E`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #11 - XP

**Notes:** Raw offset: $3B7E


### `11_HP_Max`

**Offset:** `+04` (`$3B81`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #11 - Max HP

**Notes:** Raw offset: $3B81


### `11_HP`

**Offset:** `+06` (`$3B83`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #11 - Current HP

**Notes:** Raw offset: $3B83


### `11_MP_Max`

**Offset:** `+08` (`$3B85`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #11 - Max MP

**Notes:** Raw offset: $3B85


### `11_MP`

**Offset:** `+0A` (`$3B87`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #11 - Current HP

**Notes:** Raw offset: $3B87


### `11_Strength`

**Offset:** `+0C` (`$3B89`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Strength stat

**Notes:** Raw offset: $3B89


### `11_Agility`

**Offset:** `+0D` (`$3B8A`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Agility stat

**Notes:** Raw offset: $3B8A


### `11_Stamina`

**Offset:** `+0E` (`$3B8B`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Stamina stat

**Notes:** Raw offset: $3B8B


### `11_Wisdom`

**Offset:** `+0F` (`$3B8C`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Wisdom stat

**Notes:** Raw offset: $3B8C


### `11_Luck`

**Offset:** `+10` (`$3B8D`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Luck stat, excluding equipment

**Notes:** Raw offset: $3B8D


### `11_Name`

**Offset:** `+16` (`$3B93`)
**Size:** 5 bytes
**Type:** `string`

Party member #11 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3B93


### `11_Bag_Number_Equiped`

**Offset:** `+2E` (`$3BAB`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Number of items equipped

**Notes:** Raw offset: $3BAB


### `11_Bag_Number_Carried`

**Offset:** `+2F` (`$3BAC`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Number of items in bag

**Notes:** Raw offset: $3BAC


### `11_Bag_Items`

**Offset:** `+30` (`$3BAD`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #11 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3BAD

