/* PartyMember_5 Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $3A15 */
/* Size: 60 bytes */

#ifndef DQ3_PARTYMEMBER_5_H
#define DQ3_PARTYMEMBER_5_H

#include <stdint.h>

#define PARTYMEMBER_5_BASE_ADDR 0x3A15
#define PARTYMEMBER_5_SIZE 60

typedef struct {
	uint8_t 5_Level; /* Party member #5 - Level\nTop 7 bits are level, bottom bit unknown */
	uint32_t 5_XP; /* Party Member #5 - XP */
	uint16_t 5_HP_Max; /* Party member #5 - Max HP */
	uint16_t 5_HP; /* Party member #5 - Current HP */
	uint16_t 5_MP_Max; /* Party member #5 - Max MP */
	uint16_t 5_MP; /* Party member #5 - Current HP */
	uint8_t 5_Strength; /* Party member #5 - Strength stat */
	uint8_t 5_Agility; /* Party member #5 - Agility stat */
	uint8_t 5_Stamina; /* Party member #5 - Stamina stat */
	uint8_t 5_Wisdom; /* Party member #5 - Wisdom stat */
	uint8_t 5_Luck; /* Party member #5 - Luck stat, excluding equipment */
	char 5_Name[5]; /* Party member #5 - Name, 4 characters max, ends in AC */
	uint8_t 5_Spells; /* Party member #5 spell flags */
	uint8_t 5_Bag_Number_Equiped; /* Party member #5 - Number of items equipped */
	uint8_t 5_Bag_Number_Carried; /* Party member #5 - Number of items in bag */
	uint8_t 5_Bag_Items; /* Party member #5 - Each byte is which item is in the bag slot */
} PartyMember_5_t;

#endif /* DQ3_PARTYMEMBER_5_H */
