# Dragon Quest III Function Analysis

## Major Functions

### $C90572 - Engine
**Purpose**: Core Engine Function - Main game engine processing

**Usage**: Called 75 times

**Files**: src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Boot_Function_076, Boot_Function_022, Boot_Function_030, Boot_Function_048, Boot_Function_04F, Boot_Function_071, Engine_Function_00E, Boot_Function_043, Boot_Function_02B, Boot_Function_0AC, Boot_Function_029, Engine_Function_008, Engine_Function_01C, Boot_Function_0AE, Boot_Function_01A, Engine_Function_017, Engine_Function_01E, Boot_Function_092, Engine_Function_015, Engine_Function_010, Boot_Function_0A4, Boot_Function_024, Boot_Function_01C, Boot_Function_097, Boot_Function_04A, Boot_Function_08D, Boot_Function_042, Boot_Function_033, Boot_Function_06E, Boot_Function_081, Engine_Function_006, Boot_Function_078, Boot_Function_052, Boot_Function_07E, Engine_Function_000, Boot_Function_040, Boot_Function_0A6, Boot_Function_051

---

### $000000 - Utility
**Purpose**: Unknown

**Usage**: Called 72 times

**Files**: src/banks\bank_45.asm, src/banks\bank_36.asm, src/banks\bank_37.asm, src/banks\bank_47.asm, src/graphics_06.asm, src/banks\bank_0A.asm, src/field_04.asm

**Calling Functions**: Graphics_Function_006, Bank_37_Function_0A, Graphics_Function_004, Graphics_Function_001, Graphics_Function_007, Graphics_Function_00B, Bank_45_Function_15, Graphics_Function_008, Graphics_Function_002, Field_Function_046, Graphics_Function_000, Graphics_Function_003, Field_Function_004, Bank_36_Function_00, Bank_37_Function_02, Bank_47_Function_01, Field_Function_00E, Graphics_Function_005, Bank_45_Function_01, Bank_45_Function_0F, Bank_0A_Function_00, Bank_45_Function_18

---

### $C903EE - Engine
**Purpose**: Engine Subsystem - Specific engine functionality

**Usage**: Called 52 times

**Files**: src/audio_05.asm, src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Boot_Function_051, Engine_Function_024, Boot_Function_02A, Audio_Function_029, Engine_Function_030, Audio_Function_027, Engine_Function_016, Engine_Function_01D, Boot_Function_01B, Engine_Function_008, Engine_Function_027, Boot_Function_070, Boot_Function_024, Boot_Function_032, Boot_Function_04A, Boot_Function_042, Boot_Function_078, Engine_Function_026, Engine_Function_00F, Engine_Function_000, Boot_Function_0A6, Boot_Function_080

---

### $C1A867 - Utility
**Purpose**: Unknown

**Usage**: Called 49 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_036, Audio_Function_01E, Audio_Function_006, Audio_Function_01B, Audio_Function_02B, Audio_Function_00C, Audio_Function_007, Audio_Function_024, Audio_Function_00B, Audio_Function_037, Audio_Function_005, Audio_Function_038

---

### $C3554B - Utility
**Purpose**: Unknown

**Usage**: Called 29 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_002, Text_Function_02E, Text_Function_01B, Text_Function_01C, Text_Function_031, Text_Function_014, Text_Function_02A, Text_Function_020, Text_Function_032, Text_Function_004, Text_Function_02D, Text_Function_003, Text_Function_035, Text_Function_001, Text_Function_037, Text_Function_011, Text_Function_029, Text_Function_019, Text_Function_006, Text_Function_01E, Text_Function_00F, Text_Function_022, Text_Function_01D, Text_Function_01A

---

### $C32B61 - Utility
**Purpose**: Unknown

**Usage**: Called 29 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014, Text_Function_03A, Text_Function_02E, Text_Function_01B, Text_Function_020, Text_Function_011, Text_Function_01F, Text_Function_019, Text_Function_01D, Text_Function_03D, Text_Function_01A

---

### $C32EB0 - Utility
**Purpose**: Unknown

**Usage**: Called 28 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02E, Text_Function_01B, Text_Function_01C, Text_Function_013, Text_Function_02A, Text_Function_02C, Text_Function_020, Text_Function_032, Text_Function_004, Text_Function_01F, Text_Function_027, Text_Function_02D, Text_Function_035, Text_Function_001, Text_Function_037, Text_Function_024, Text_Function_011, Text_Function_029, Text_Function_034, Text_Function_01E, Text_Function_033, Text_Function_00F, Text_Function_022, Text_Function_012, Text_Function_01D, Text_Function_03D

---

### $C35500 - Utility
**Purpose**: Unknown

**Usage**: Called 28 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014, Text_Function_02E, Text_Function_01C, Text_Function_020, Text_Function_013, Text_Function_01F, Text_Function_01D, Text_Function_01A, Text_Function_01E

---

### $C32B21 - Utility
**Purpose**: Unknown

**Usage**: Called 25 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01B, Text_Function_01C, Text_Function_00F, Text_Function_020, Text_Function_004, Text_Function_01F, Text_Function_01D, Text_Function_003, Text_Function_01A

---

### $C01098 - Memory Management
**Purpose**: Pointer/Address Calculation - Computes memory addresses from bank/offset parameters

**Usage**: Called 24 times

**Files**: src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Boot_Function_039, Engine_Function_00E, Boot_Function_07F, Boot_Function_077, Boot_Function_023, Boot_Function_029, Engine_Function_01C, Boot_Function_014, Boot_Function_01A, Boot_Function_0A5, Boot_Function_006, Boot_Function_066, Engine_Function_015, Boot_Function_06F, Boot_Function_05F, Engine_Function_007, Boot_Function_050, Boot_Function_0AD, Boot_Function_041, Boot_Function_031, Boot_Function_049, Boot_Function_087, Boot_Function_00D, Boot_Function_058

---

### $C35509 - Utility
**Purpose**: Unknown

**Usage**: Called 22 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02A, Text_Function_035, Text_Function_03A, Text_Function_03C, Text_Function_03B, Text_Function_00F, Text_Function_01F, Text_Function_02D, Text_Function_01D, Text_Function_03D

---

### $C32BC2 - Utility
**Purpose**: Unknown

**Usage**: Called 18 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02A, Text_Function_03C, Text_Function_001, Text_Function_021, Text_Function_01C, Text_Function_03B, Text_Function_01F, Text_Function_036, Text_Function_023, Text_Function_028, Text_Function_01D, Text_Function_02D, Text_Function_025, Text_Function_01A, Text_Function_01E

---

### $C32BD2 - Utility
**Purpose**: Unknown

**Usage**: Called 18 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02A, Text_Function_03C, Text_Function_001, Text_Function_021, Text_Function_01C, Text_Function_03B, Text_Function_01F, Text_Function_036, Text_Function_023, Text_Function_028, Text_Function_01D, Text_Function_02D, Text_Function_025, Text_Function_01A, Text_Function_01E

---

### $C32C0F - Utility
**Purpose**: Unknown

**Usage**: Called 18 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02A, Text_Function_03C, Text_Function_001, Text_Function_021, Text_Function_01C, Text_Function_03B, Text_Function_01F, Text_Function_036, Text_Function_023, Text_Function_028, Text_Function_01D, Text_Function_02D, Text_Function_025, Text_Function_01A, Text_Function_01E

---

### $C902E9 - Utility
**Purpose**: Unknown

**Usage**: Called 16 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017, Audio_Function_01C, Audio_Function_036, Audio_Function_043, Audio_Function_037, Audio_Function_02A, Audio_Function_018, Audio_Function_038

---

### $C32FB0 - Utility
**Purpose**: Unknown

**Usage**: Called 15 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014, Text_Function_02A, Text_Function_035, Text_Function_01C, Text_Function_013, Text_Function_011, Text_Function_01F, Text_Function_02D, Text_Function_01D, Text_Function_01A, Text_Function_01E

---

### $C09052 - System
**Purpose**: Error/Exception Handler - Handles error conditions and cleanup

**Usage**: Called 13 times

**Files**: src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Boot_Function_001, Boot_Function_04B, Boot_Function_0A8, Engine_Function_00A, Boot_Function_053, Boot_Function_068, Boot_Function_05A, Boot_Function_061, Boot_Function_00F, Engine_Function_002, Boot_Function_044, Boot_Function_016, Boot_Function_008

---

### $C012D1 - Utility
**Purpose**: Unknown

**Usage**: Called 13 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01E, Audio_Function_043, Audio_Function_01B, Audio_Function_00C, Audio_Function_007, Audio_Function_024, Audio_Function_00B, Audio_Function_005, Audio_Function_019, Audio_Function_038

---

### $C08FD7 - Data Processing
**Purpose**: Data Decompression/Loading - Loads and potentially decompresses game data

**Usage**: Called 12 times

**Files**: src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Boot_Function_007, Boot_Function_015, Boot_Function_059, Boot_Function_0A6, Boot_Function_060, Engine_Function_008, Boot_Function_042, Boot_Function_0AE, Boot_Function_067, Boot_Function_04A, Boot_Function_051, Boot_Function_00E

---

### $C1A87A - Utility
**Purpose**: Unknown

**Usage**: Called 12 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_008, Audio_Function_017, Audio_Function_036, Audio_Function_01E, Audio_Function_043, Audio_Function_02B, Audio_Function_00C, Audio_Function_007, Audio_Function_00B, Audio_Function_024, Audio_Function_000, Audio_Function_018

---

### $C2BE8A - Utility
**Purpose**: Unknown

**Usage**: Called 12 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_042, Audio_Function_01C, Audio_Function_01E, Audio_Function_043, Audio_Function_02B, Audio_Function_00B, Audio_Function_02D, Audio_Function_02A, Audio_Function_01B, Audio_Function_018

---

### $C35522 - Utility
**Purpose**: Unknown

**Usage**: Called 12 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014, Text_Function_03A, Text_Function_001, Text_Function_02E, Text_Function_01C, Text_Function_020, Text_Function_00F, Text_Function_011, Text_Function_01F, Text_Function_01E

---

### $C32B8D - Utility
**Purpose**: Unknown

**Usage**: Called 12 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014, Text_Function_035, Text_Function_013, Text_Function_018, Text_Function_005, Text_Function_004, Text_Function_01F, Text_Function_015, Text_Function_017, Text_Function_016, Text_Function_003

---

### $C04A5B - Utility
**Purpose**: Unknown

**Usage**: Called 10 times

**Files**: src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Boot_Function_02B, Engine_Function_010, Boot_Function_024, Boot_Function_081, Boot_Function_078, Boot_Function_01C, Boot_Function_071, Engine_Function_01E, Engine_Function_017, Boot_Function_033

---

### $7FFDA2 - Utility
**Purpose**: Unknown

**Usage**: Called 10 times

**Files**: src/menu_03.asm

**Calling Functions**: Menu_Function_02E

---

### $C9029E - Utility
**Purpose**: Unknown

**Usage**: Called 10 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017, Audio_Function_01C, Audio_Function_036, Audio_Function_01E, Audio_Function_023, Audio_Function_01B, Audio_Function_018, Audio_Function_038

---

### $000020 - Utility
**Purpose**: Unknown

**Usage**: Called 9 times

**Files**: src/banks\bank_45.asm, src/banks\bank_0A.asm, src/banks\bank_37.asm, src/banks\bank_36.asm

**Calling Functions**: Bank_0A_Function_17, Bank_36_Function_0A, Bank_37_Function_0A, Bank_45_Function_01, Bank_37_Function_02, Bank_0A_Function_0F, Bank_45_Function_0F

---

### $C2CAE0 - Utility
**Purpose**: Unknown

**Usage**: Called 8 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01C, Audio_Function_01E, Audio_Function_013, Audio_Function_02B, Audio_Function_018

---

### $C2CAD9 - Utility
**Purpose**: Unknown

**Usage**: Called 8 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_042, Audio_Function_01E, Audio_Function_043, Audio_Function_024, Audio_Function_031, Audio_Function_038

---

### $C33D5C - Utility
**Purpose**: Unknown

**Usage**: Called 8 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_00F, Text_Function_01F, Text_Function_01D, Text_Function_030, Text_Function_01A

---

### $000010 - Utility
**Purpose**: Unknown

**Usage**: Called 7 times

**Files**: src/banks\bank_0A.asm, src/banks\bank_6A.asm, src/field_04.asm

**Calling Functions**: Field_Function_00B, Bank_6A_Function_03, Bank_0A_Function_17, Bank_6A_Function_00

---

### $000810 - Utility
**Purpose**: Unknown

**Usage**: Called 7 times

**Files**: src/banks\bank_6A.asm, src/field_04.asm

**Calling Functions**: Bank_6A_Function_05, Bank_6A_Function_03, Bank_6A_Function_00, Field_Function_00E

---

### $C2CC47 - Utility
**Purpose**: Unknown

**Usage**: Called 7 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01E, Audio_Function_02C, Audio_Function_023, Audio_Function_01B, Audio_Function_02F, Audio_Function_018, Audio_Function_019

---

### $C35481 - Utility
**Purpose**: Unknown

**Usage**: Called 7 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_010, Text_Function_011

---

### $22C355 - Utility
**Purpose**: Unknown

**Usage**: Called 7 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02E, Text_Function_01B, Text_Function_032, Text_Function_019, Text_Function_01D, Text_Function_03D, Text_Function_01A

---

### $C010D6 - Utility
**Purpose**: Unknown

**Usage**: Called 6 times

**Files**: src/audio_05.asm, src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Engine_Function_021, Boot_Function_03D, Boot_Function_099, Boot_Function_033, Audio_Function_038

---

### $C06AE7 - Utility
**Purpose**: Unknown

**Usage**: Called 6 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_04B, Boot_Function_053, Boot_Function_068, Boot_Function_05A, Boot_Function_061, Boot_Function_044

---

### $008847 - Utility
**Purpose**: Unknown

**Usage**: Called 6 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_028

---

### $C1E32E - Utility
**Purpose**: Unknown

**Usage**: Called 6 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01C, Audio_Function_036, Audio_Function_043, Audio_Function_006, Audio_Function_00B

---

### $002020 - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 6 times

**Files**: src/banks\bank_45.asm, src/banks\bank_37.asm, src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_05, Bank_37_Function_0A, Bank_45_Function_0C, Bank_37_Function_11, Bank_45_Function_1A

---

### $000410 - Utility
**Purpose**: Unknown

**Usage**: Called 6 times

**Files**: src/banks\bank_6B.asm

**Calling Functions**: Bank_6B_Function_0B

---

### $C05A71 - Utility
**Purpose**: Unknown

**Usage**: Called 5 times

**Files**: src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Boot_Function_03D, Engine_Function_021, Boot_Function_03C, Boot_Function_069

---

### $C0675C - Utility
**Purpose**: Unknown

**Usage**: Called 5 times

**Files**: src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Engine_Function_010, Boot_Function_071, Boot_Function_0A6, Boot_Function_043, Boot_Function_08D

---

### $C067FD - Utility
**Purpose**: Unknown

**Usage**: Called 5 times

**Files**: src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Boot_Function_092, Boot_Function_078, Engine_Function_000, Engine_Function_017, Boot_Function_04A

---

### $C0689E - Utility
**Purpose**: Unknown

**Usage**: Called 5 times

**Files**: src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Boot_Function_081, Engine_Function_008, Boot_Function_097, Boot_Function_052, Engine_Function_01E

---

### $008B66 - Utility
**Purpose**: Unknown

**Usage**: Called 5 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_030

---

### $C028B4 - Utility
**Purpose**: Unknown

**Usage**: Called 5 times

**Files**: src/audio_05.asm, src/engine_01.asm

**Calling Functions**: Engine_Function_030, Audio_Function_006

---

### $000002 - Utility
**Purpose**: Unknown

**Usage**: Called 5 times

**Files**: src/banks\bank_6B.asm, src/audio_05.asm, src/banks\bank_5D.asm

**Calling Functions**: Bank_6B_Function_07, Bank_5D_Function_0A, Audio_Function_013, Audio_Function_02D, Audio_Function_030

---

### $C2B977 - Utility
**Purpose**: Unknown

**Usage**: Called 5 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_024, Audio_Function_02B, Audio_Function_036

---

### $C32B70 - Utility
**Purpose**: Unknown

**Usage**: Called 5 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01C, Text_Function_001, Text_Function_011, Text_Function_00F

---

### $C35FD5 - Utility
**Purpose**: Unknown

**Usage**: Called 5 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01B, Text_Function_01C, Text_Function_01A, Text_Function_01D

---

### $C35D5F - Utility
**Purpose**: Unknown

**Usage**: Called 5 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_024, Text_Function_03A, Text_Function_03D, Text_Function_01F

---

### $C0601F - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_001, Boot_Function_053, Boot_Function_068, Boot_Function_016

---

### $00754E - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_029, Boot_Function_022, Boot_Function_038, Boot_Function_01A

---

### $007563 - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_02B, Boot_Function_01C, Boot_Function_03A, Boot_Function_024

---

### $007DAB - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_06E, Boot_Function_076, Boot_Function_07E, Boot_Function_086

---

### $007DDA - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_078, Boot_Function_088, Boot_Function_071, Boot_Function_081

---

### $001000 - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/banks\bank_45.asm, src/banks\bank_37.asm, src/field_04.asm

**Calling Functions**: Field_Function_02E, Bank_37_Function_20, Bank_45_Function_01, Field_Function_021

---

### $C0133E - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_006, Audio_Function_038, Audio_Function_023

---

### $C2CB32 - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_02A, Audio_Function_017, Audio_Function_01E

---

### $C29200 - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038, Audio_Function_02F, Audio_Function_02C, Audio_Function_032

---

### $C351CC - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01E, Text_Function_001, Text_Function_011, Text_Function_00F

---

### $C35512 - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_003, Text_Function_004

---

### $C35534 - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_010, Text_Function_011

---

### $C34921 - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_024, Text_Function_020, Text_Function_025, Text_Function_021

---

### $C348FB - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_022, Text_Function_027, Text_Function_028, Text_Function_023

---

### $00C0C0 - Utility
**Purpose**: Unknown

**Usage**: Called 4 times

**Files**: src/banks\bank_45.asm, src/banks\bank_37.asm, src/banks\bank_36.asm, src/banks\bank_47.asm

**Calling Functions**: Bank_45_Function_1A, Bank_36_Function_06, Bank_47_Function_01, Bank_37_Function_24

---

### $004000 - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 4 times

**Files**: src/banks\bank_45.asm, src/banks\bank_37.asm

**Calling Functions**: Bank_45_Function_00, Bank_37_Function_11, Bank_37_Function_20, Bank_37_Function_26

---

### $C05F21 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_05A, Boot_Function_008, Boot_Function_044

---

### $C05FA0 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_00F, Boot_Function_04B, Boot_Function_061

---

### $C04923 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Engine_Function_021, Boot_Function_03C, Boot_Function_069

---

### $008409 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_00E, Engine_Function_015, Engine_Function_01C

---

### $00C4AD - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_00E, Engine_Function_015, Engine_Function_01C

---

### $008438 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_010, Engine_Function_01E, Engine_Function_017

---

### $008840 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_028

---

### $C02892 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_02F, Engine_Function_02D

---

### $008F77 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_03E, Engine_Function_043, Engine_Function_038

---

### $00E100 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/battle_02.asm, src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_17, Battle_Function_018, Bank_6A_Function_0F

---

### $008040 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/banks\bank_37.asm, src/field_04.asm

**Calling Functions**: Bank_37_Function_20, Field_Function_008, Field_Function_00E

---

### $000040 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/banks\bank_45.asm, src/field_04.asm

**Calling Functions**: Field_Function_020, Field_Function_009, Bank_45_Function_01

---

### $001010 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_018, Field_Function_020, Field_Function_01F

---

### $C270E1 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_006, Audio_Function_004, Audio_Function_00B

---

### $C2CB79 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_007

---

### $C2CC25 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_02B, Audio_Function_017, Audio_Function_018

---

### $0000FF - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/audio_05.asm, src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_08, Audio_Function_01F, Audio_Function_01E

---

### $C2A406 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_02B

---

### $C2CA5B - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_043, Audio_Function_038

---

### $C347A8 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_002, Text_Function_003, Text_Function_00F

---

### $C34EFC - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_010, Text_Function_014, Text_Function_003

---

### $C34F43 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_010, Text_Function_014, Text_Function_003

---

### $C34F06 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_010, Text_Function_014, Text_Function_004

---

### $C34F4D - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_010, Text_Function_014, Text_Function_004

---

### $C35317 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01E, Text_Function_01D

---

### $C35FE7 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020, Text_Function_031

---

### $002028 - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 3 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_00, Bank_36_Function_0E

---

### $0000FC - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/banks\bank_45.asm, src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_0B, Bank_45_Function_0F, Bank_36_Function_0A

---

### $006060 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/banks\bank_45.asm, src/banks\bank_47.asm

**Calling Functions**: Bank_47_Function_18, Bank_45_Function_00, Bank_45_Function_01

---

### $001420 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0C, Bank_45_Function_0F, Bank_45_Function_1A

---

### $00F810 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/banks\bank_6B.asm, src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_00, Bank_6B_Function_0E

---

### $00D900 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F, Bank_6A_Function_14

---

### $00E810 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F, Bank_6A_Function_13

---

### $00DB18 - Utility
**Purpose**: Unknown

**Usage**: Called 3 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_17, Bank_6A_Function_18, Bank_6A_Function_15

---

### $0096AD - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_029, Boot_Function_01A

---

### $C05CE1 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_01C, Boot_Function_033

---

### $C04C15 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_03A, Boot_Function_088

---

### $0074D0 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_03D, Boot_Function_03C

---

### $C04A44 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_03D, Boot_Function_069

---

### $0079EE - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_069

---

### $50ADE4 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/boot_00.asm, src/engine_01.asm

**Calling Functions**: Boot_Function_06A, Engine_Function_021

---

### $007E47 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_09F, Boot_Function_09C

---

### $008AD2 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_02F, Engine_Function_02D

---

### $C0CBF9 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_030

---

### $000147 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_012, Battle_Function_001

---

### $008E04 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/menu_03.asm

**Calling Functions**: Menu_Function_02A, Menu_Function_02C

---

### $009351 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/menu_03.asm

**Calling Functions**: Menu_Function_02E, Menu_Function_02C

---

### $00A80A - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/menu_03.asm

**Calling Functions**: Menu_Function_02E

---

### $000021 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_45.asm, src/field_04.asm

**Calling Functions**: Bank_45_Function_15, Field_Function_00C

---

### $004020 - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 2 times

**Files**: src/banks\bank_36.asm, src/field_04.asm

**Calling Functions**: Bank_36_Function_00, Field_Function_021

---

### $0040F0 - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 2 times

**Files**: src/banks\bank_37.asm, src/field_04.asm

**Calling Functions**: Field_Function_033, Bank_37_Function_1E

---

### $007B52 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_006, Audio_Function_004

---

### $007B93 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_006, Audio_Function_004

---

### $C2C739 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_031, Audio_Function_008

---

### $C2C766 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_009, Audio_Function_032

---

### $C2C7C6 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_00A

---

### $C1AE9F - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_00C

---

### $0083D2 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_00F

---

### $C2B6D9 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_018, Audio_Function_01E

---

### $C2CB2B - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_02D, Audio_Function_02B

---

### $C2AB00 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $008E70 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $0000B0 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_36.asm, src/graphics_06.asm

**Calling Functions**: Graphics_Function_000, Bank_36_Function_16

---

### $A9C355 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_003, Text_Function_004

---

### $C349B3 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_035, Text_Function_004

---

### $C349D5 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_036, Text_Function_005

---

### $C347BA - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014, Text_Function_01E

---

### $C35055 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01D

---

### $C32C9E - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020, Text_Function_01F

---

### $C3604F - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020, Text_Function_02E

---

### $C35CFA - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C3496E - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_029, Text_Function_02C

---

### $C34947 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02A, Text_Function_02D

---

### $000100 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_2D.asm, src/banks\bank_45.asm

**Calling Functions**: Bank_2D_Function_08, Bank_45_Function_0F

---

### $001071 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_00, Bank_36_Function_12

---

### $00406B - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 2 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_0B, Bank_36_Function_0E

---

### $00203C - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 2 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_14, Bank_36_Function_0E

---

### $004068 - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 2 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_14

---

### $002070 - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 2 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_1B

---

### $8B4D9D - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_1B, Bank_36_Function_1E

---

### $002000 - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 2 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_11

---

### $0020E0 - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 2 times

**Files**: src/banks\bank_45.asm, src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_1E, Bank_45_Function_01

---

### $002030 - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 2 times

**Files**: src/banks\bank_37.asm, src/banks\bank_47.asm

**Calling Functions**: Bank_37_Function_1E, Bank_47_Function_01

---

### $006000 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_26

---

### $080814 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_04, Bank_5D_Function_01

---

### $E8F010 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_00

---

### $FF0002 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_09

---

### $00E018 - Memory
**Purpose**: RAM Work Area - Temporary data storage and processing

**Usage**: Called 2 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F, Bank_6A_Function_13

---

### $00F010 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_6B.asm, src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F, Bank_6B_Function_0E

---

### $00D110 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_13, Bank_6A_Function_15

---

### $000AD3 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_17, Bank_6A_Function_15

---

### $00D318 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_17, Bank_6A_Function_15

---

### $00DB10 - Utility
**Purpose**: Unknown

**Usage**: Called 2 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_17, Bank_6A_Function_15

---

### $0074A9 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_000

---

### $C05DA1 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_024

---

### $C05E61 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_02B

---

### $00A9E4 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_03C

---

### $0079CF - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/boot_00.asm

**Calling Functions**: Boot_Function_059

---

### $0084A4 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_021

---

### $0087DC - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_027

---

### $C014F2 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_027

---

### $008951 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_02D

---

### $0081BF - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_02D

---

### $00C120 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_02D

---

### $008A51 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_02E

---

### $C08DA0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_02F

---

### $C08E1B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_02F

---

### $C08D3C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_030

---

### $C08B9C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_030

---

### $C02627 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_030

---

### $C08D06 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_030

---

### $008CA4 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_030

---

### $C0CBA0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_030

---

### $C05668 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_030

---

### $C0533E - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_030

---

### $008F41 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_03E

---

### $009103 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/engine_01.asm

**Calling Functions**: Engine_Function_04C

---

### $08F7D2 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_001

---

### $000116 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_001

---

### $00644C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_003

---

### $0E14F8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_004

---

### $570133 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_004

---

### $50014C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_005

---

### $015750 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_007

---

### $570137 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_007

---

### $000115 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_00E

---

### $DE012B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_00E

---

### $005701 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_00E

---

### $001B46 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_00E

---

### $002918 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_011

---

### $000139 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_012

---

### $980119 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_012

---

### $000149 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_012

---

### $1115F9 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_012

---

### $110FF9 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_012

---

### $00014D - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_012

---

### $00C1B7 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_015

---

### $000380 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_019

---

### $4A3DF5 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_019

---

### $00A505 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_01C

---

### $112014 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/battle_02.asm

**Calling Functions**: Battle_Function_01D

---

### $002587 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/menu_03.asm

**Calling Functions**: Menu_Function_018

---

### $000180 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_007

---

### $000028 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_00C

---

### $001850 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_010

---

### $009840 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_013

---

### $000663 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_015

---

### $003200 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_01A

---

### $000029 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_01C

---

### $008FC0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_01D

---

### $00BD83 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_01E

---

### $0089C0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_01E

---

### $008240 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_01E

---

### $00B503 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_01E

---

### $00002B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_01E

---

### $200020 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_01F

---

### $001030 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_028

---

### $00C803 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_028

---

### $005D10 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_02C

---

### $001190 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_02D

---

### $00C321 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_02D

---

### $00790C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_02D

---

### $040201 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_02D

---

### $001004 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_02F

---

### $001050 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_030

---

### $000200 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_033

---

### $006611 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_033

---

### $0095C0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_033

---

### $0018A0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_034

---

### $000202 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_036

---

### $0003D4 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_037

---

### $001090 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_03A

---

### $006AA0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_03B

---

### $0002F1 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_03D

---

### $004442 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_03D

---

### $6E02DF - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_042

---

### $2A0410 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_042

---

### $005E20 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_045

---

### $D02111 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_047

---

### $005BC7 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/field_04.asm

**Calling Functions**: Field_Function_049

---

### $008008 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_000

---

### $C1E59C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_006

---

### $0082C5 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_00C

---

### $C2B9A6 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_00F

---

### $C2AF66 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_00F

---

### $0084DE - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017

---

### $008467 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017

---

### $0084BB - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017

---

### $00848A - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017

---

### $008475 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017

---

### $00857E - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017

---

### $0085C5 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017

---

### $008690 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017

---

### $0084F2 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017

---

### $C2CED4 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017

---

### $007C03 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_017

---

### $008525 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_018

---

### $00854B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_018

---

### $000004 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_019

---

### $2428AD - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01A

---

### $003490 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01B

---

### $867B20 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01C

---

### $008605 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01C

---

### $C48D49 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01E

---

### $0086EC - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01E

---

### $00873E - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01E

---

### $00875F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01E

---

### $0086DB - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01E

---

### $C2C240 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_01E

---

### $008833 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_024

---

### $C2B054 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_024

---

### $C2CF00 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_02A

---

### $C2CA46 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_02A

---

### $C2B5D8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_02B

---

### $C2B561 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_02B

---

### $23FAAD - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_02C

---

### $C01407 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_032

---

### $8CA38C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_035

---

### $C1D13B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_036

---

### $008B71 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_036

---

### $008BA6 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_036

---

### $C2D0C2 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_036

---

### $C4297C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_037

---

### $C43115 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_037

---

### $ED2224 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $C2B8D7 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $008DB0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $C2CA62 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $008E0E - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $008DEB - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $008E4A - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $C90AF7 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $C28E92 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $C28EFB - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_038

---

### $008F4B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $008F82 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $009015 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $00903E - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $008F90 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $00913E - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $009179 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $00919B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $0091A8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $0091DF - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $001800 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $00A3EB - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $009004 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_041

---

### $007422 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_042

---

### $0090A7 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_042

---

### $0090D1 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_042

---

### $009067 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_042

---

### $0090E9 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_042

---

### $00F400 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_043

---

### $C014A3 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_043

---

### $A82DB0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_043

---

### $C2BBD5 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_043

---

### $C0121C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/audio_05.asm

**Calling Functions**: Audio_Function_044

---

### $C05304 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_004

---

### $003D00 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_007

---

### $004F00 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_007

---

### $E10000 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_00B

---

### $00BB00 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_00B

---

### $5C6641 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_00B

---

### $005E2B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_00B

---

### $44331A - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_00C

---

### $00490F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_00C

---

### $49590C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_00C

---

### $001403 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_00D

---

### $00C929 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_00E

---

### $000216 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/graphics_06.asm

**Calling Functions**: Graphics_Function_010

---

### $C34B44 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_000

---

### $C35292 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_004

---

### $C357E5 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_006

---

### $C348CC - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_006

---

### $C3553D - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_00F

---

### $C3566E - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_011

---

### $C35614 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_011

---

### $C3573C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_011

---

### $C35542 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_011

---

### $C3529C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_012

---

### $C357F2 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_012

---

### $C35028 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_013

---

### $C352A1 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_013

---

### $C35804 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_013

---

### $C34B73 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_013

---

### $C35039 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014

---

### $C35816 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014

---

### $C34A2C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014

---

### $C34C16 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014

---

### $C356C9 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014

---

### $C34F61 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014

---

### $C34F7F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014

---

### $C34A5A - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_014

---

### $C34A7B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_015

---

### $C34A9C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_016

---

### $C34ABD - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_017

---

### $C34ADE - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_018

---

### $C34BBA - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01A

---

### $C352ED - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01C

---

### $C3504A - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01D

---

### $C358C3 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01E

---

### $C35ADE - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01F

---

### $C36086 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01F

---

### $C351C9 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01F

---

### $C353D0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_01F

---

### $C35079 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C3507F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C35097 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C34C42 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C358D7 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C35C00 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C34C54 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C35925 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C35BB3 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C35FEE - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C35D0F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C35D23 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C3531B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_020

---

### $C35345 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_022

---

### $C35351 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_024

---

### $C35366 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_029

---

### $C35381 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02A

---

### $C35390 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02C

---

### $C353A1 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02D

---

### $C35DA9 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02E

---

### $C357DD - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02E

---

### $C35DB9 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02E

---

### $C36018 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02E

---

### $C35E12 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02E

---

### $C35AD8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02E

---

### $C35C6C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_02E

---

### $C34E23 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_030

---

### $C34C63 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_031

---

### $C35D31 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_032

---

### $C351D6 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_032

---

### $C3521B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_033

---

### $C35FA9 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_034

---

### $C35212 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_034

---

### $C35844 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_035

---

### $C353C8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_035

---

### $C353CC - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_037

---

### $C349DB - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_037

---

### $C34D5A - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03A

---

### $C34C75 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03A

---

### $C34D68 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03A

---

### $C35D6C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03A

---

### $C3510A - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03A

---

### $C34CA3 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03A

---

### $C34CE5 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03B

---

### $C34D27 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03C

---

### $C350F6 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03D

---

### $C350EC - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03D

---

### $C350BA - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03D

---

### $C350A4 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03D

---

### $C350D8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03D

---

### $C350C4 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03D

---

### $C350CE - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03D

---

### $C350E2 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03D

---

### $C35100 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03D

---

### $C350AE - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/text_07.asm

**Calling Functions**: Text_Function_03D

---

### $02ED7F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_02

---

### $0F0D2F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_08

---

### $030C0B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_08

---

### $000620 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_08

---

### $000B04 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_08

---

### $08090A - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_0F

---

### $080909 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_0F

---

### $000299 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_0F

---

### $000A80 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_13

---

### $0054A8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_13

---

### $006254 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_13

---

### $000D1D - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_16

---

### $00E881 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_17

---

### $000809 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0A.asm

**Calling Functions**: Bank_0A_Function_19

---

### $00F1C7 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0E.asm

**Calling Functions**: Bank_0E_Function_01

---

### $0010C7 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0E.asm

**Calling Functions**: Bank_0E_Function_01

---

### $000400 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0E.asm

**Calling Functions**: Bank_0E_Function_0C

---

### $040101 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0E.asm

**Calling Functions**: Bank_0E_Function_0F

---

### $02FFFF - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0E.asm

**Calling Functions**: Bank_0E_Function_0F

---

### $00FFFF - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_0E.asm

**Calling Functions**: Bank_0E_Function_0F

---

### $000EF1 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_2D.asm

**Calling Functions**: Bank_2D_Function_00

---

### $001FE0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_2D.asm

**Calling Functions**: Bank_2D_Function_00

---

### $007800 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_2D.asm

**Calling Functions**: Bank_2D_Function_0A

---

### $00F8FF - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_2D.asm

**Calling Functions**: Bank_2D_Function_0C

---

### $0000D0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_2D.asm

**Calling Functions**: Bank_2D_Function_0D

---

### $000054 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_2D.asm

**Calling Functions**: Bank_2D_Function_0D

---

### $00708F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_2D.asm

**Calling Functions**: Bank_2D_Function_15

---

### $00005E - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_2D.asm

**Calling Functions**: Bank_2D_Function_19

---

### $00803F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_2D.asm

**Calling Functions**: Bank_2D_Function_1C

---

### $00D026 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_05

---

### $0001DD - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_05

---

### $00F296 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_06

---

### $004076 - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_07

---

### $004056 - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_07

---

### $0000DC - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_07

---

### $004053 - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_08

---

### $F472FA - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_0A

---

### $001015 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_0A

---

### $00909C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_0A

---

### $00407C - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_0B

---

### $00007F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_0E

---

### $00C8FE - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_0E

---

### $00105F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_0E

---

### $00E0E0 - Memory
**Purpose**: RAM Work Area - Temporary data storage and processing

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_0E

---

### $004069 - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_0E

---

### $002060 - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_12

---

### $000117 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_12

---

### $3E107D - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_13

---

### $00205F - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_13

---

### $00C098 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_14

---

### $002037 - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_14

---

### $0080D0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_16

---

### $7B257D - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_16

---

### $0018D8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_16

---

### $00487D - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_18

---

### $E700FF - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_18

---

### $000270 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_1B

---

### $00C080 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_36.asm

**Calling Functions**: Bank_36_Function_1B

---

### $0051A2 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_00

---

### $00C0A0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_0A

---

### $0000A0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_0A

---

### $0080A0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_11

---

### $000036 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_11

---

### $006070 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_11

---

### $001C1F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_1E

---

### $007070 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_1E

---

### $00901C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_1E

---

### $0031F1 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_1E

---

### $001078 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_20

---

### $00471F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_20

---

### $006068 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_20

---

### $00E040 - Memory
**Purpose**: RAM Work Area - Temporary data storage and processing

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_20

---

### $00013E - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_20

---

### $006078 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_23

---

### $00C000 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_24

---

### $470067 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_24

---

### $000078 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_26

---

### $00003B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_26

---

### $004030 - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 1 times

**Files**: src/banks\bank_37.asm

**Calling Functions**: Bank_37_Function_28

---

### $000C0C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_00

---

### $000420 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_01

---

### $002200 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_01

---

### $002220 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_01

---

### $005028 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_01

---

### $0080C8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_07

---

### $1C1436 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_07

---

### $C18036 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_07

---

### $361436 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_07

---

### $009098 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_08

---

### $004327 - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_08

---

### $003020 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_08

---

### $0017D8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0A

---

### $008F10 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0A

---

### $008080 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0B

---

### $00100F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0B

---

### $003220 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0C

---

### $003634 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0C

---

### $000122 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0C

---

### $053C1B - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0F

---

### $0000E0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0F

---

### $003000 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0F

---

### $0004C0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0F

---

### $00F0F8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0F

---

### $00F700 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0F

---

### $0040E0 - Hardware
**Purpose**: Hardware Register Access - System hardware control

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_0F

---

### $B3DDFD - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_15

---

### $002050 - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_18

---

### $002120 - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_18

---

### $DFC5BF - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_18

---

### $0020A0 - Graphics
**Purpose**: PPU Register Access - Graphics/video processing

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_18

---

### $0030C0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_1A

---

### $000064 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_1A

---

### $00C620 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_1A

---

### $000023 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_1A

---

### $1EE2E1 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_1D

---

### $00B020 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_1D

---

### $E00000 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_1D

---

### $003CDC - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_1D

---

### $001F03 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_1D

---

### $A64246 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_1D

---

### $0014E0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_45.asm

**Calling Functions**: Bank_45_Function_1D

---

### $0000F8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_47.asm

**Calling Functions**: Bank_47_Function_00

---

### $0225DA - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_47.asm

**Calling Functions**: Bank_47_Function_01

---

### $003867 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_47.asm

**Calling Functions**: Bank_47_Function_01

---

### $0000A9 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_47.asm

**Calling Functions**: Bank_47_Function_0B

---

### $00189F - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_47.asm

**Calling Functions**: Bank_47_Function_0C

---

### $001C3A - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_47.asm

**Calling Functions**: Bank_47_Function_0E

---

### $327C3E - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_47.asm

**Calling Functions**: Bank_47_Function_0E

---

### $222222 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_47.asm

**Calling Functions**: Bank_47_Function_18

---

### $0023FF - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_47.asm

**Calling Functions**: Bank_47_Function_18

---

### $000414 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_01

---

### $00550C - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_06

---

### $006101 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_06

---

### $006DF8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_06

---

### $000697 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_0A

---

### $1A0699 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_0A

---

### $009610 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_0A

---

### $069711 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_0A

---

### $000695 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_0A

---

### $DD0696 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_0A

---

### $000CF8 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_0A

---

### $00FAFF - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_5D.asm

**Calling Functions**: Bank_5D_Function_0E

---

### $FE0102 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_09

---

### $FA0102 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_09

---

### $FC0104 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0A

---

### $FB0104 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0A

---

### $FA0104 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0A

---

### $F90104 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0A

---

### $00D600 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F

---

### $00D010 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F

---

### $00E708 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F

---

### $00DC10 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F

---

### $001400 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F

---

### $00F100 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F

---

### $00F108 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F

---

### $00F1F0 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F

---

### $00F008 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_0F

---

### $00D500 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_13

---

### $00D700 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_13

---

### $000CD5 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_15

---

### $00E400 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_15

---

### $00D400 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_15

---

### $00E910 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_15

---

### $000CD6 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_15

---

### $00E300 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_15

---

### $00D300 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_15

---

### $00EA10 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_15

---

### $00E200 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_15

---

### $00F310 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_17

---

### $00EB10 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_17

---

### $00F410 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_17

---

### $000AD2 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6A.asm

**Calling Functions**: Bank_6A_Function_18

---

### $000800 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6B.asm

**Calling Functions**: Bank_6B_Function_00

---

### $00F800 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6B.asm

**Calling Functions**: Bank_6B_Function_01

---

### $00F7AA - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6B.asm

**Calling Functions**: Bank_6B_Function_07

---

### $00EF10 - Utility
**Purpose**: Unknown

**Usage**: Called 1 times

**Files**: src/banks\bank_6B.asm

**Calling Functions**: Bank_6B_Function_0E

---

## Memory Map

### $E09E - UNK_$E09E
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 16 times - {'STA': 3, 'LDA': 7, 'STY': 3, 'ORA': 3}

**Files**: src/boot_00.asm

---

### $E0A0 - UNK_$E0A0
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 16 times - {'STA': 10, 'LDA': 6}

**Files**: src/boot_00.asm

---

### $E08A - TEMP_RESULT
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 15 times - {'STA': 8, 'LDA': 7}

**Files**: src/boot_00.asm

---

### $E09C - UNK_$E09C
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 14 times - {'ORA': 3, 'LDA': 7, 'STA': 1, 'STX': 3}

**Files**: src/boot_00.asm

---

### $E0B8 - DMA_STATUS
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 11 times - {'STA': 7, 'LDA': 4}

**Files**: src/boot_00.asm, src/engine_01.asm

---

### $E088 - TEMP_Y_LO
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 10 times - {'STY': 3, 'ORA': 3, 'LDA': 4}

**Files**: src/boot_00.asm

---

### $E09A - UNK_$E09A
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 10 times - {'LDA': 7, 'STA': 2, 'STX': 1}

**Files**: src/boot_00.asm

---

### $E0B6 - DMA_CONTROL
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 10 times - {'STA': 6, 'LDA': 4}

**Files**: src/boot_00.asm, src/engine_01.asm

---

### $E096 - UNK_$E096
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 9 times - {'STA': 3, 'LDA': 6}

**Files**: src/boot_00.asm

---

### $E0B0 - UNK_$E0B0
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 9 times - {'STA': 3, 'LDA': 5, 'STX': 1}

**Files**: src/boot_00.asm

---

### $E0AC - UNK_$E0AC
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 8 times - {'LDA': 6, 'STA': 2}

**Files**: src/boot_00.asm

---

### $E086 - TEMP_X_LO
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 7 times - {'STX': 3, 'LDA': 4}

**Files**: src/boot_00.asm

---

### $E0B2 - DMA_SRC_BANK
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 7 times - {'ORA': 3, 'LDA': 4}

**Files**: src/boot_00.asm, src/engine_01.asm

---

### $E0C8 - UNK_$E0C8
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 5 times - {'LDA': 4, 'ORA': 1}

**Files**: src/field_04.asm, src/engine_01.asm

---

### $E0B4 - DMA_DST_BANK
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 4 times - {'LDA': 4}

**Files**: src/boot_00.asm, src/engine_01.asm

---

### $E090 - UNK_$E090
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 3 times - {'LDA': 2, 'STA': 1}

**Files**: src/boot_00.asm

---

### $E08C - UNK_$E08C
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 3 times - {'LDA': 2, 'STA': 1}

**Files**: src/boot_00.asm

---

### $4202 - MULTIPLY_A
**Purpose**: DMA/NMI/IRQ Hardware Control

**Category**: System

**Usage**: 3 times - {'STA': 3}

**Files**: src/boot_00.asm, src/menu_03.asm

---

### $4203 - MULTIPLY_B
**Purpose**: DMA/NMI/IRQ Hardware Control

**Category**: System

**Usage**: 3 times - {'STA': 3}

**Files**: src/boot_00.asm, src/menu_03.asm

---

### $4054 - UNK_$4054
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 3 times - {'STA': 2, 'LDA': 1}

**Files**: src/audio_05.asm

---

### $4056 - UNK_$4056
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 3 times - {'STA': 2, 'LDA': 1}

**Files**: src/audio_05.asm

---

### $4200 - NMI_ENABLE
**Purpose**: DMA/NMI/IRQ Hardware Control

**Category**: System

**Usage**: 3 times - {'STY': 2, 'STA': 1}

**Files**: src/graphics_06.asm

---

### $2050 - UNK_$2050
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 2 times - {'LDA': 2}

**Files**: src/audio_05.asm

---

### $2051 - UNK_$2051
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 2 times - {'LDA': 2}

**Files**: src/audio_05.asm

---

### $4100 - UNK_$4100
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 2 times - {'STY': 1, 'ORA': 1}

**Files**: src/banks\bank_2D.asm, src/graphics_06.asm

---

### $E060 - UNK_$E060
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 2 times - {'ORA': 2}

**Files**: src/banks\bank_6A.asm

---

### $E0A6 - UNK_$E0A6
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 1 times - {'LDA': 1}

**Files**: src/boot_00.asm

---

### $E0A2 - UNK_$E0A2
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 1 times - {'LDA': 1}

**Files**: src/boot_00.asm

---

### $4216 - UNK_$4216
**Purpose**: DMA/NMI/IRQ Hardware Control

**Category**: System

**Usage**: 1 times - {'LDA': 1}

**Files**: src/boot_00.asm

---

### $E0C4 - UNK_$E0C4
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 1 times - {'LDA': 1}

**Files**: src/engine_01.asm

---

### $E0BE - UNK_$E0BE
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 1 times - {'LDA': 1}

**Files**: src/engine_01.asm

---

### $E0BA - UNK_$E0BA
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 1 times - {'LDA': 1}

**Files**: src/engine_01.asm

---

### $7FE5C6 - UNK_$7FE5C6
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'LDA': 1}

**Files**: src/engine_01.asm

---

### $4101 - UNK_$4101
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'ORA': 1}

**Files**: src/battle_02.asm

---

### $7F0115 - UNK_$7F0115
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'ORA': 1}

**Files**: src/battle_02.asm

---

### $420E - UNK_$420E
**Purpose**: DMA/NMI/IRQ Hardware Control

**Category**: System

**Usage**: 1 times - {'ORA': 1}

**Files**: src/battle_02.asm

---

### $4190 - UNK_$4190
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'LDY': 1}

**Files**: src/field_04.asm

---

### $E012 - UNK_$E012
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 1 times - {'LDA': 1}

**Files**: src/field_04.asm

---

### $21A0 - UNK_$21A0
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'AND': 1}

**Files**: src/field_04.asm

---

### $2104 - UNK_$2104
**Purpose**: PPU Background/Sprite Configuration

**Category**: Graphics

**Usage**: 1 times - {'ORA': 1}

**Files**: src/field_04.asm

---

### $214F - UNK_$214F
**Purpose**: Audio Processing Unit (APU) Interface

**Category**: Audio

**Usage**: 1 times - {'LDY': 1}

**Files**: src/field_04.asm

---

### $2001 - UNK_$2001
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'LDX': 1}

**Files**: src/field_04.asm

---

### $2101 - PPU_OAM_SIZE
**Purpose**: PPU Background/Sprite Configuration

**Category**: Graphics

**Usage**: 1 times - {'CMP': 1}

**Files**: src/field_04.asm

---

### $40F1 - UNK_$40F1
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'LDY': 1}

**Files**: src/field_04.asm

---

### $40A9 - UNK_$40A9
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'ORA': 1}

**Files**: src/audio_05.asm

---

### $4058 - UNK_$4058
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'STA': 1}

**Files**: src/audio_05.asm

---

### $405A - UNK_$405A
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'STA': 1}

**Files**: src/audio_05.asm

---

### $2049 - UNK_$2049
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'LDA': 1}

**Files**: src/audio_05.asm

---

### $4300 - UNK_$4300
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'STA': 1}

**Files**: src/graphics_06.asm

---

### $42C9 - UNK_$42C9
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'ORA': 1}

**Files**: src/graphics_06.asm

---

### $43C9 - UNK_$43C9
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'AND': 1}

**Files**: src/graphics_06.asm

---

### $4068 - UNK_$4068
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'ORA': 1}

**Files**: src/banks\bank_0A.asm

---

### $7F01F0 - UNK_$7F01F0
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'ORA': 1}

**Files**: src/banks\bank_2D.asm

---

### $7FDF7F - UNK_$7FDF7F
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'CMP': 1}

**Files**: src/banks\bank_2D.asm

---

### $7F7F0F - UNK_$7F7F0F
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'ORA': 1}

**Files**: src/banks\bank_2D.asm

---

### $2132 - UNK_$2132
**Purpose**: PPU Background/Sprite Configuration

**Category**: Graphics

**Usage**: 1 times - {'ORA': 1}

**Files**: src/banks\bank_36.asm

---

### $43D3 - UNK_$43D3
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'ORA': 1}

**Files**: src/banks\bank_36.asm

---

### $4180 - UNK_$4180
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'LDA': 1}

**Files**: src/banks\bank_36.asm

---

### $2019 - UNK_$2019
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'ORA': 1}

**Files**: src/banks\bank_37.asm

---

### $7F1224 - UNK_$7F1224
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'ORA': 1}

**Files**: src/banks\bank_37.asm

---

### $4052 - UNK_$4052
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'LDA': 1}

**Files**: src/banks\bank_45.asm

---

### $E0E6 - UNK_$E0E6
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 1 times - {'CMP': 1}

**Files**: src/banks\bank_45.asm

---

### $406A - UNK_$406A
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'STX': 1}

**Files**: src/banks\bank_45.asm

---

### $E000 - UNK_$E000
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 1 times - {'ORA': 1}

**Files**: src/banks\bank_45.asm

---

### $40FC - UNK_$40FC
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'AND': 1}

**Files**: src/banks\bank_45.asm

---

### $E0FF - UNK_$E0FF
**Purpose**: Game Logic Work RAM

**Category**: Game Data

**Usage**: 1 times - {'ORA': 1}

**Files**: src/banks\bank_6A.asm

---

### $2004 - UNK_$2004
**Purpose**: General Purpose

**Category**: Utility

**Usage**: 1 times - {'CMP': 1}

**Files**: src/banks\bank_6A.asm

---

