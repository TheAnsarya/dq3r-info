/* PartyMember_9 Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $3B05 */
/* Size: 60 bytes */

#ifndef DQ3_PARTYMEMBER_9_H
#define DQ3_PARTYMEMBER_9_H

#include <stdint.h>

#define PARTYMEMBER_9_BASE_ADDR 0x3B05
#define PARTYMEMBER_9_SIZE 60

typedef struct {
	uint8_t 9_Level; /* Party member #9 - Level\nTop 7 bits are level, bottom bit unknown */
	uint32_t 9_XP; /* Party member #9 - XP */
	uint16_t 9_HP_Max; /* Party member #9 - Max HP */
	uint16_t 9_HP; /* Party member #9 - Current HP */
	uint16_t 9_MP_Max; /* Party member #9 - Max MP */
	uint16_t 9_MP; /* Party member #9 - Current HP */
	uint8_t 9_Strength; /* Party member #9 - Strength stat */
	uint8_t 9_Agility; /* Party member #9 - Agility stat */
	uint8_t 9_Stamina; /* Party member #9 - Stamina stat */
	uint8_t 9_Wisdom; /* Party member #9 - Wisdom stat */
	uint8_t 9_Luck; /* Party member #9 - Luck stat, excluding equipment */
	char 9_Name[5]; /* Party member #9 - Name, 4 characters max, ends in AC */
	uint8_t 9_Bag_Number_Equiped; /* Party member #9 - Number of items equipped */
	uint8_t 9_Bag_Number_Carried; /* Party member #9 - Number of items in bag */
	uint8_t 9_Bag_Items; /* Party member #9 - Each byte is which item is in the bag slot */
} PartyMember_9_t;

#endif /* DQ3_PARTYMEMBER_9_H */
