/* PartyMember_3 Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $399d */
/* Size: 60 bytes */

#ifndef DQ3_PARTYMEMBER_3_H
#define DQ3_PARTYMEMBER_3_H

#include <stdint.h>

#define PARTYMEMBER_3_BASE_ADDR 0x399d
#define PARTYMEMBER_3_SIZE 60

typedef struct {
	uint8_t 3_Level; /* Party member #3 - Level\nTop 7 bits are level, bottom bit unknown */
	uint32_t 3_XP; /* Party member #3 - XP */
	uint16_t 3_HP_Max; /* Party member #3 - Max HP */
	uint16_t 3_HP; /* Party member #3 - Current HP */
	uint16_t 3_MP_Max; /* Party member #3 - Max MP */
	uint16_t 3_MP; /* Party member #3 - Current HP */
	uint8_t 3_Strength; /* Party member #3 - Strength stat */
	uint8_t 3_Agility; /* Party member #3 - Agility stat */
	uint8_t 3_Stamina; /* Party member #3 - Stamina stat */
	uint8_t 3_Wisdom; /* Party member #3 - Wisdom stat */
	uint8_t 3_Luck; /* Party member #3 - Luck stat, excluding equipment */
	char 3_Name[5]; /* Party member #3 - Name, 4 characters max, ends in AC */
	uint8_t 3_Bag_Number_Equiped; /* Party member #3 - Number of items equipped */
	uint8_t 3_Bag_Number_Carried; /* Party member #3 - Number of items in bag */
	uint8_t 3_Bag_Items; /* Party member #3 - Each byte is which item is in the bag slot */
} PartyMember_3_t;

#endif /* DQ3_PARTYMEMBER_3_H */
