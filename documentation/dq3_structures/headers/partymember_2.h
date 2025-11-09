/* PartyMember_2 Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $3961 */
/* Size: 60 bytes */

#ifndef DQ3_PARTYMEMBER_2_H
#define DQ3_PARTYMEMBER_2_H

#include <stdint.h>

#define PARTYMEMBER_2_BASE_ADDR 0x3961
#define PARTYMEMBER_2_SIZE 60

typedef struct {
	uint8_t 2_Level; /* Party member #2 - Level\nTop 7 bits are level, bottom bit unknown */
	uint32_t 2_XP; /* Party member #2 - XP */
	uint16_t 2_HP_Max; /* Party member #2 - Max HP */
	uint16_t 2_HP; /* Party member #2 - Current HP */
	uint16_t 2_MP_Max; /* Party member #2 - Max MP */
	uint16_t 2_MP; /* Party member #2 - Current HP */
	uint8_t 2_Strength; /* Party member #2 - Strength stat */
	uint8_t 2_Agility; /* Party member #2 - Agility stat */
	uint8_t 2_Stamina; /* Party member #2 - Stamina stat */
	uint8_t 2_Wisdom; /* Party member #2 - Wisdom stat */
	uint8_t 2_Luck; /* Party member #2 - Luck stat, excluding equipment */
	char 2_Name[5]; /* Party member #2 - Name, 4 characters max, ends in AC */
	uint8_t 2_Bag_Number_Equiped; /* Party member #2 - Number of items equipped */
	uint8_t 2_Bag_Number_Carried; /* Party member #2 - Number of items in bag */
	uint8_t 2_Bag_Items; /* Party member #2 - Each byte is which item is in the bag slot */
} PartyMember_2_t;

#endif /* DQ3_PARTYMEMBER_2_H */
