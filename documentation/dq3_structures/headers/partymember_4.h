/* PartyMember_4 Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $39d9 */
/* Size: 60 bytes */

#ifndef DQ3_PARTYMEMBER_4_H
#define DQ3_PARTYMEMBER_4_H

#include <stdint.h>

#define PARTYMEMBER_4_BASE_ADDR 0x39d9
#define PARTYMEMBER_4_SIZE 60

typedef struct {
	uint8_t 4_Level; /* Party member #4 - Level\nTop 7 bits are level, bottom bit unknown */
	uint32_t 4_XP; /* Party member #4 - XP */
	uint16_t 4_HP_Max; /* Party member #4 - Max HP */
	uint16_t 4_HP; /* Party member #4 - Current HP */
	uint16_t 4_MP_Max; /* Party member #4 - Max MP */
	uint16_t 4_MP; /* Party member #4 - Current HP */
	uint8_t 4_Strength; /* Party member #4 - Strength stat */
	uint8_t 4_Agility; /* Party member #4 - Agility stat */
	uint8_t 4_Stamina; /* Party member #4 - Stamina stat */
	uint8_t 4_Wisdom; /* Party member #4 - Wisdom stat */
	uint8_t 4_Luck; /* Party member #4 - Luck stat, excluding equipment */
	char 4_Name[5]; /* Party member #4 - Name, 4 characters max, ends in AC */
	uint8_t 4_Bag_Number_Equiped; /* Party member #4 - Number of items equipped */
	uint8_t 4_Bag_Number_Carried; /* Party member #4 - Number of items in bag */
	uint8_t 4_Bag_Items; /* Party member #4 - Each byte is which item is in the bag slot */
} PartyMember_4_t;

#endif /* DQ3_PARTYMEMBER_4_H */
