/* Hero Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $3925 */
/* Size: 60 bytes */

#ifndef DQ3_HERO_H
#define DQ3_HERO_H

#include <stdint.h>

#define HERO_BASE_ADDR 0x3925
#define HERO_SIZE 60

typedef struct {
	uint8_t Hero_Level; /* Hero - Level\nTop 7 bits are Hero's level, bottom bit unknown */
	uint32_t Hero_XP; /* Hero - XP */
	uint16_t HP_Max; /* Hero - Max HP */
	uint16_t Hero_HP; /* Hero - Current HP */
	uint16_t MP_Max; /* Hero - Max MP */
	uint16_t Hero_MP; /* Hero - Current MP */
	uint8_t Hero_Strength; /* Hero - Strength stat */
	uint8_t Hero_Agility; /* Hero - Agility stat */
	uint8_t Hero_Stamina; /* Hero - Stamina stat */
	uint8_t Hero_Wisdom; /* Hero - Wisdom stat */
	uint8_t Hero_Luck; /* Hero - Luck stat, excluding equipment */
	char Hero_Name[5]; /* Hero - Name, 4 characters max, ends in AC */
	uint8_t Hero_Spells; /* Hero spells flags */
	uint8_t Bag_Number_Equiped; /* Hero - Number of items equipped */
	uint8_t Bag_Number_Carried; /* Hero - Number of items in bag */
	uint8_t Bag_Items; /* Hero - Each byte is which item is in the bag slot */
} Hero_t;

#endif /* DQ3_HERO_H */
