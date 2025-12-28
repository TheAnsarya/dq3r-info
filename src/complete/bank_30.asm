;==============================================================================
; Dragon Quest III - Bank $30
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $D80000-$D87FFF
; Instructions: 10359
; Bytes: 32769
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_30"

;------------------------------------------------------------------------------
; Bank30_DmaFunction_001
; Address: $D88004
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_001:
    JSL $C77843          ; 22 43 78 C7 | Jump to subroutine long
    CPY $6D22            ; CC 22 6D | Compare Y register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    LDX #$CD             ; A2 CD | Load immediate value into X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_004
; Address: $D8801C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_004:
    LDA $3440            ; AD 40 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $0043            ; 4C 43 00 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3440            ; 8D 40 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C1B3            ; 8D B3 C1 | Store accumulator to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $C1B1            ; 8D B1 C1 | Store accumulator to absolute address
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_005
; Address: $D8803C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_005:
    JSL $C7315E          ; 22 5E 31 C7 | Jump to subroutine long
    JMP $008E            ; 4C 8E 00 | Jump to address
    LDA $3440            ; AD 40 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $006A            ; 4C 6A 00 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3440            ; 8D 40 34 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $C1B3            ; 8D B3 C1 | Store accumulator to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $C1B1            ; 8D B1 C1 | Store accumulator to absolute address
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_006
; Address: $D88063
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_006:
    JSL $C7315E          ; 22 5E 31 C7 | Jump to subroutine long
    JMP $008E            ; 4C 8E 00 | Jump to address
    LDA $3440            ; AD 40 34 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $008E            ; 4C 8E 00 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3440            ; 8D 40 34 | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $C1B3            ; 8D B3 C1 | Store accumulator to absolute address
    LDA #$DE             ; A9 DE | Load immediate value into accumulator
    STA $C1B1            ; 8D B1 C1 | Store accumulator to absolute address
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_00C
; Address: $D880A6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_00C:
    JSL $CCD7EF          ; 22 EF D7 CC | Jump to subroutine long
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    BEQ $22              ; F0 22 | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    SEC                  ; 38 | Set carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $00BB            ; 4C BB 00 | Jump to address
    JMP $00AB            ; 4C AB 00 | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_010
; Address: $D880D1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_010:
    LDA $3618            ; AD 18 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $00DF            ; 4C DF 00 | Jump to address
    JMP $0105            ; 4C 05 01 | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_012
; Address: $D880E6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_012:
    JSL $C74ADF          ; 22 DF 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0101            ; 4C 01 01 | Jump to address
    LDA $3618            ; AD 18 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $00FE            ; 4C FE 00 | Jump to address
    JMP $0105            ; 4C 05 01 | Jump to address
    JMP $00E6            ; 4C E6 00 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_014
; Address: $D88106
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_014:
    LDA $3618            ; AD 18 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0114            ; 4C 14 01 | Jump to address
    JMP $0137            ; 4C 37 01 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDA $C74A            ; AD 4A C7 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_015
; Address: $D8811B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_015:
    JSL $C74ADF          ; 22 DF 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0136            ; 4C 36 01 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_016
; Address: $D88125
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_016:
    LDA $3618            ; AD 18 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0133            ; 4C 33 01 | Jump to address
    JMP $0137            ; 4C 37 01 | Jump to address
    JMP $011B            ; 4C 1B 01 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_017
; Address: $D88138
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_017:
    LDA $3618            ; AD 18 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0146            ; 4C 46 01 | Jump to address
    JMP $016D            ; 4C 6D 01 | Jump to address
    LDA #$60             ; A9 60 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_019
; Address: $D8814D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_019:
    JSL $C74ABA          ; 22 BA 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0168            ; 4C 68 01 | Jump to address
    LDA $3618            ; AD 18 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0165            ; 4C 65 01 | Jump to address
    JMP $016D            ; 4C 6D 01 | Jump to address
    JMP $014D            ; 4C 4D 01 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_01B
; Address: $D8816E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_01B:
    LDA $3618            ; AD 18 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $017C            ; 4C 7C 01 | Jump to address
    JMP $019F            ; 4C 9F 01 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDA $C74A            ; AD 4A C7 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_01C
; Address: $D88183
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_01C:
    JSL $C74ABA          ; 22 BA 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $019E            ; 4C 9E 01 | Jump to address
    LDA $3618            ; AD 18 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $019B            ; 4C 9B 01 | Jump to address
    JMP $019F            ; 4C 9F 01 | Jump to address
    JMP $0183            ; 4C 83 01 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_02B
; Address: $D881DE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_02B:
    JSL $CC0138          ; 22 38 01 CC | Jump to subroutine long
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $C1B3            ; 8D B3 C1 | Store accumulator to absolute address
    LDA #$E0             ; A9 E0 | Game work RAM access
    STA $C1B1            ; 8D B1 C1 | Store accumulator to absolute address
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_031
; Address: $D8820A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_031:
    JSL $CDADE6          ; 22 E6 AD CD | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$75             ; A9 75 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_03A
; Address: $D8823A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_03A:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $F422            ; CC 22 F4 | Compare Y register (absolute)
    LDA $A9CD            ; AD CD A9 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_042
; Address: $D8826A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_042:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $18A2            ; CC A2 18 | Compare Y register (absolute)
    LDA #$74             ; A9 74 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_058
; Address: $D882DF
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_058:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $FB22            ; CC 22 FB | Compare Y register (absolute)
    LDA $22CD            ; AD CD 22 | Load from absolute address into accumulator
    AND ($AF),Y          ; 31 AF | Logical AND with accumulator ((zero page),Y)
    CMP $5722            ; CD 22 57 | Compare accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $6122            ; CC 22 61 | Compare Y register (absolute)
    LDA $71A9CD          ; AF CD A9 71 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_068
; Address: $D8833D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_068:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    ADC $2201,Y          ; 79 01 22 | Add with carry (absolute,Y)
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $0922            ; CC 22 09 | Compare Y register (absolute)
    LDX $22CD            ; AE CD 22 | Load from absolute address into X register
    AND ($AF),Y          ; 31 AF | Logical AND with accumulator ((zero page),Y)
    CMP $6922            ; CD 22 69 | Compare accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $4122            ; CC 22 41 | Compare Y register (absolute)
    LDA $18A9CD          ; AF CD A9 18 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_081
; Address: $D883D2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_081:
    JSL $CC0138          ; 22 38 01 CC | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $C1B3            ; 8D B3 C1 | Store accumulator to absolute address
    LDA #$E2             ; A9 E2 | Load immediate value into accumulator
    STA $C1B1            ; 8D B1 C1 | Store accumulator to absolute address
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_086
; Address: $D883F8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_086:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $E622            ; CC 22 E6 | Compare Y register (absolute)
    LDA $6BCD            ; AD CD 6B | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_08A
; Address: $D88414
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_08A:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $ED22            ; CC 22 ED | Compare Y register (absolute)
    LDA $22CD            ; AD CD 22 | Load from absolute address into accumulator
    CMP $22CC,Y          ; D9 CC 22 | Compare accumulator (absolute,Y)
    PEA #$CDAD           ; F4 AD CD | Push effective address to stack
    LDA #$41             ; A9 41 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_0A3
; Address: $D88498
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_0A3:
    JSL $CDAEF1          ; 22 F1 AE CD | Jump to subroutine long
    LDX #$26             ; A2 26 | Load immediate value into X register
    LDA #$41             ; A9 41 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_0BB
; Address: $D8850A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_0BB:
    JSL $CDAEF1          ; 22 F1 AE CD | Jump to subroutine long
    LDX #$24             ; A2 24 | Load immediate value into X register
    LDA #$41             ; A9 41 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_0C3
; Address: $D88532
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_0C3:
    JSL $CDAEF1          ; 22 F1 AE CD | Jump to subroutine long
    LDX #$26             ; A2 26 | Load immediate value into X register
    LDA #$41             ; A9 41 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_0DA
; Address: $D885AA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_0DA:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $3CA9            ; CC A9 3C | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_0E8
; Address: $D885F7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_0E8:
    JSL $CCD346          ; 22 46 D3 CC | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_0F0
; Address: $D88621
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_0F0:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$27             ; A9 27 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_0F5
; Address: $D8863F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_0F5:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$F4             ; A9 F4 | Load immediate value into accumulator
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_0FE
; Address: $D88675
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_0FE:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$18             ; A2 18 | Load immediate value into X register
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_107
; Address: $D886A5
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_107:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ADC $2201,X          ; 7D 01 22 | Add with carry (absolute,X)
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $0222            ; CC 22 02 | Compare Y register (absolute)
    LDX $22CD            ; AE CD 22 | Load from absolute address into X register
    EOR ($AF,X)          ; 41 AF | Exclusive OR with accumulator ((zero page,X))
    CMP $5822            ; CD 22 58 | Compare accumulator (absolute)
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_10F
; Address: $D886DD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_10F:
    JSL $CDAF71          ; 22 71 AF CD | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$27             ; A9 27 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_118
; Address: $D88713
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_118:
    JSL $CCD878          ; 22 78 D8 CC | Jump to subroutine long
    LDA #$44             ; A9 44 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$A8             ; C9 A8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $072C            ; 4C 2C 07 | Jump to address
    JMP $071D            ; 4C 1D 07 | Jump to address
    LDA #$24             ; A9 24 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_11B
; Address: $D88737
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_11B:
    JSL $CDAE33          ; 22 33 AE CD | Jump to subroutine long
    LDX #$28             ; A2 28 | Load immediate value into X register
    LDA #$08             ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_11F
; Address: $D8874E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_11F:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$20             ; A2 20 | Load immediate value into X register
    LDA #$27             ; A9 27 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_121
; Address: $D8875D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_121:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$F4             ; C9 F4 | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    JMP $0770            ; 4C 70 07 | Jump to address
    JMP $0761            ; 4C 61 07 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_124
; Address: $D88778
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_124:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$25             ; A9 25 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_126
; Address: $D88786
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_126:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDX #$1A             ; A2 1A | Load immediate value into X register
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_130
; Address: $D887B7
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_130:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ROR $2201,X          ; 7E 01 22 | Rotate right (absolute,X)
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $8A22            ; CC 22 8A | Compare Y register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $CF22            ; CC 22 CF | Compare Y register (absolute)
    CPY $6F22            ; CC 22 6F | Compare Y register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $CF22            ; CC 22 CF | Compare Y register (absolute)
    CPY $0922            ; CC 22 09 | Compare Y register (absolute)
    LDX $22CD            ; AE CD 22 | Load from absolute address into X register
    EOR ($AF,X)          ; 41 AF | Exclusive OR with accumulator ((zero page,X))
    CMP $5822            ; CD 22 58 | Compare accumulator (absolute)
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_137
; Address: $D887F8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_137:
    JSL $CDAE2C          ; 22 2C AE CD | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$27             ; A9 27 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_13C
; Address: $D88815
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_13C:
    JSL $CCD8D3          ; 22 D3 D8 CC | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$44             ; C9 44 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0828            ; 4C 28 08 | Jump to address
    JMP $0819            ; 4C 19 08 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_13D
; Address: $D88828
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_13D:
    JSL $CCD878          ; 22 78 D8 CC | Jump to subroutine long
    LDA #$A8             ; A9 A8 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    LDX #$28             ; A2 28 | Load immediate value into X register
    LDA #$08             ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_141
; Address: $D88845
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_141:
    LDA #$83             ; A9 83 | Load immediate value into accumulator
    LDX #$C8             ; A2 C8 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$C3             ; A0 C3 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_144
; Address: $D8885C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_144:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_14F
; Address: $D88896
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_14F:
    STA $C1B3            ; 8D B3 C1 | Store accumulator to absolute address
    LDA #$E4             ; A9 E4 | Load immediate value into accumulator
    STA $C1B1            ; 8D B1 C1 | Store accumulator to absolute address
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_154
; Address: $D888B7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_154:
    JSL $CCD767          ; 22 67 D7 CC | Jump to subroutine long
    LDX #$22             ; A2 22 | Load immediate value into X register
    LDA #$1C             ; A9 1C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_168
; Address: $D88925
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_168:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ASL $CDAE,X          ; 1E AE CD | Arithmetic shift left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_182
; Address: $D889AD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_182:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$54             ; A2 54 | Load immediate value into X register
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_183
; Address: $D889BB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_183:
    JSL $CCD57B          ; 22 7B D5 CC | Jump to subroutine long
    LDX #$4E             ; A2 4E | Load immediate value into X register
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_186
; Address: $D889CD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_186:
    JSL $CDADFB          ; 22 FB AD CD | Jump to subroutine long
    LDA #$3C             ; A9 3C | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $54              ; 46 54 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_187
; Address: $D889D8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_187:
    JSL $CCD56A          ; 22 6A D5 CC | Jump to subroutine long
    LDX #$34             ; A2 34 | Load immediate value into X register
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    LDA ($01,X)          ; A1 01 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_189
; Address: $D889E6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_189:
    JSL $CCD57B          ; 22 7B D5 CC | Jump to subroutine long
    LDA #$91             ; A9 91 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_193
; Address: $D88A1B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_193:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$38             ; A2 38 | Load immediate value into X register
    LDA #$29             ; A9 29 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_196
; Address: $D88A2D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_196:
    JSL $CDADFB          ; 22 FB AD CD | Jump to subroutine long
    LDX #$30             ; A2 30 | Load immediate value into X register
    LDA #$25             ; A9 25 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_19E
; Address: $D88A59
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_19E:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1A1
; Address: $D88A6E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1A1:
    JSL $CCD346          ; 22 46 D3 CC | Jump to subroutine long
    LDX #$39             ; A2 39 | Load immediate value into X register
    LDA #$1B             ; A9 1B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1A3
; Address: $D88A7D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1A3:
    JSL $CCD57B          ; 22 7B D5 CC | Jump to subroutine long
    LDX #$3A             ; A2 3A | Load immediate value into X register
    LDA #$17             ; A9 17 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1AE
; Address: $D88AB5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1AE:
    JSL $CDE09B          ; 22 9B E0 CD | Jump to subroutine long
    LDX #$39             ; A2 39 | Load immediate value into X register
    LDA #$1B             ; A9 1B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1B0
; Address: $D88AC4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1B0:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$44             ; A2 44 | Load immediate value into X register
    LDA #$17             ; A9 17 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1B3
; Address: $D88AD6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1B3:
    JSL $CDADFB          ; 22 FB AD CD | Jump to subroutine long
    LDX #$45             ; A2 45 | Load immediate value into X register
    LDA #$2D             ; A9 2D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1C7
; Address: $D88B3F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1C7:
    JSL $CDE09B          ; 22 9B E0 CD | Jump to subroutine long
    LDX #$4F             ; A2 4F | Load immediate value into X register
    LDA #$69             ; A9 69 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1C9
; Address: $D88B4E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1C9:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDX #$40             ; A2 40 | Load immediate value into X register
    LDA #$65             ; A9 65 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1CC
; Address: $D88B60
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1CC:
    JSL $CDADFB          ; 22 FB AD CD | Jump to subroutine long
    LDX #$3A             ; A2 3A | Load immediate value into X register
    LDA #$5F             ; A9 5F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1E0
; Address: $D88BC8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1E0:
    JSL $CDAED1          ; 22 D1 AE CD | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROL $C76D            ; 2E 6D C7 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1F2
; Address: $D88C26
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1F2:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA #$3A             ; A9 3A | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1F4
; Address: $D88C37
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1F4:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDX #$3C             ; A2 3C | Load immediate value into X register
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    CMP #$00             ; C9 00 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1FA
; Address: $D88C5A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1FA:
    JSL $C75FBF          ; 22 BF 5F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0C71            ; 4C 71 0C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1FC
; Address: $D88C6A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1FC:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $0C5A            ; 4C 5A 0C | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1FD
; Address: $D88C72
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1FD:
    JSL $C76013          ; 22 13 60 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0C89            ; 4C 89 0C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_1FF
; Address: $D88C82
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_1FF:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $0C72            ; 4C 72 0C | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_205
; Address: $D88CA2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_205:
    JSL $CC0138          ; 22 38 01 CC | Jump to subroutine long
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    STA $C1B3            ; 8D B3 C1 | Store accumulator to absolute address
    LDA #$EC             ; A9 EC | Load immediate value into accumulator
    STA $C1B1            ; 8D B1 C1 | Store accumulator to absolute address
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_212
; Address: $D88CED
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_212:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $FB22            ; CC 22 FB | Compare Y register (absolute)
    LDA $22CD            ; AD CD 22 | Load from absolute address into accumulator
    ORA ($AF),Y          ; 11 AF | Logical OR with accumulator ((zero page),Y)
    CMP $AA22            ; CD 22 AA | Compare accumulator (absolute)
    CPY $2E22            ; CC 22 2E | Compare Y register (absolute)
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    STA $01              ; 85 01 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank30_DmaFunction_217
; Address: $D88D1C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_217:
    JSL $CDAE09          ; 22 09 AE CD | Jump to subroutine long
    LDX #$28             ; A2 28 | Load immediate value into X register
    LDA #$4F             ; A9 4F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_227
; Address: $D88D6C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_227:
    JSL $CDAF21          ; 22 21 AF CD | Jump to subroutine long
    LDX #$28             ; A2 28 | Load immediate value into X register
    LDA #$69             ; A9 69 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_22D
; Address: $D88D8C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_22D:
    JSL $CDAF21          ; 22 21 AF CD | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$47             ; A9 47 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_22F
; Address: $D88D9A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_22F:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDX #$28             ; A2 28 | Load immediate value into X register
    LDA #$69             ; A9 69 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_260
; Address: $D88E8C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_260:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$32             ; A2 32 | Load immediate value into X register
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    CMP $2200            ; CD 00 22 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_264
; Address: $D88EA9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_264:
    JSL $CDADFB          ; 22 FB AD CD | Jump to subroutine long
    LDX #$2E             ; A2 2E | Load immediate value into X register
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_27C
; Address: $D88F28
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_27C:
    JSL $CDE09B          ; 22 9B E0 CD | Jump to subroutine long
    LDX #$36             ; A2 36 | Load immediate value into X register
    LDA #$66             ; A9 66 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_293
; Address: $D88FA4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_293:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$14             ; A2 14 | Load immediate value into X register
    LDA #$1E             ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2A0
; Address: $D88FE9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2A0:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDX #$F1             ; A2 F1 | Load immediate value into X register
    LDY #$02             ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2A2
; Address: $D88FFA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2A2:
    JSL $C77D1B          ; 22 1B 7D C7 | Jump to subroutine long
    LDX #$76             ; A2 76 | Load immediate value into X register
    LDA #$EB             ; A9 EB | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2AF
; Address: $D89044
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2AF:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDX #$F2             ; A2 F2 | Load immediate value into X register
    LDY #$02             ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2B1
; Address: $D89055
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2B1:
    JSL $C77D1B          ; 22 1B 7D C7 | Jump to subroutine long
    LDX #$98             ; A2 98 | Load immediate value into X register
    LDA #$0F             ; A9 0F | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2B2
; Address: $D89064
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2B2:
    JSL $CCD57B          ; 22 7B D5 CC | Jump to subroutine long
    LDX #$90             ; A2 90 | Load immediate value into X register
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2B3
; Address: $D89072
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2B3:
    JSL $CCD57B          ; 22 7B D5 CC | Jump to subroutine long
    LDX #$94             ; A2 94 | Load immediate value into X register
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2B4
; Address: $D89080
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2B4:
    JSL $CCD57B          ; 22 7B D5 CC | Jump to subroutine long
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR $C754,X          ; 5D 54 C7 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2BB
; Address: $D890AA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2BB:
    JSL $C72F90          ; 22 90 2F C7 | Jump to subroutine long
    LDA #$77             ; A9 77 | Load immediate value into accumulator
    LDX #$28             ; A2 28 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2BD
; Address: $D890B9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2BD:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2BE
; Address: $D890BF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2BE:
    JSL $C743C6          ; 22 C6 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2BF
; Address: $D890C9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2BF:
    JSL $C743C6          ; 22 C6 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2C0
; Address: $D890D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2C0:
    JSL $C743C6          ; 22 C6 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2C2
; Address: $D890E2
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2C2:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2C3
; Address: $D890E8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2C3:
    JSL $C743C6          ; 22 C6 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2C4
; Address: $D890F2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2C4:
    JSL $C743D3          ; 22 D3 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2C5
; Address: $D890FC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2C5:
    JSL $C743DC          ; 22 DC 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2C6
; Address: $D89106
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2C6:
    JSL $C743D3          ; 22 D3 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$02             ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2C7
; Address: $D89110
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2C7:
    JSL $C743DC          ; 22 DC 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2C8
; Address: $D8911A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2C8:
    JSL $C743D3          ; 22 D3 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2CA
; Address: $D89129
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2CA:
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$18             ; A2 18 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2CB
; Address: $D89132
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2CB:
    JSL $C02096          ; 22 96 20 C0 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA #$21             ; A9 21 | PPU graphics register access
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2CC
; Address: $D89143
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2CC:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1150            ; 4C 50 11 | Jump to address
    JMP $113D            ; 4C 3D 11 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2D0
; Address: $D89162
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2D0:
    JSL $CC00D1          ; 22 D1 00 CC | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1175            ; 4C 75 11 | Jump to address
    JMP $1166            ; 4C 66 11 | Jump to address
    LDX #$28             ; A2 28 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2D2
; Address: $D8917C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2D2:
    JSL $C73073          ; 22 73 30 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1189            ; 4C 89 11 | Jump to address
    JMP $117C            ; 4C 7C 11 | Jump to address
    LDA #$1B             ; A9 1B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2D3
; Address: $D8918C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2D3:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3416            ; 8D 16 34 | Store accumulator to absolute address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3418            ; 8D 18 34 | Store accumulator to absolute address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2D4
; Address: $D8919F
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2D4:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3406            ; 8D 06 34 | Store accumulator to absolute address
    LDA $3406            ; AD 06 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $11B8            ; 4C B8 11 | Jump to address
    JMP $11A9            ; 4C A9 11 | Jump to address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $11C7            ; 4C C7 11 | Jump to address
    JMP $11B8            ; 4C B8 11 | Jump to address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$01             ; 69 01 | Add with carry (immediate)
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $11DF            ; 4C DF 11 | Jump to address
    JMP $11EE            ; 4C EE 11 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    JMP $11A3            ; 4C A3 11 | Jump to address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2D5
; Address: $D891F1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2D5:
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $11FD            ; 4C FD 11 | Jump to address
    JMP $11EE            ; 4C EE 11 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2D7
; Address: $D89201
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2D7:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1211            ; 4C 11 12 | Jump to address
    JMP $1201            ; 4C 01 12 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2DA
; Address: $D89219
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2DA:
    JSL $C73023          ; 22 23 30 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1226            ; 4C 26 12 | Jump to address
    JMP $1219            ; 4C 19 12 | Jump to address
    LDA #$F5             ; A9 F5 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2DC
; Address: $D8922E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2DC:
    JSL $CCD346          ; 22 46 D3 CC | Jump to subroutine long
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    LDX #$63             ; A2 63 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2DD
; Address: $D89238
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2DD:
    JSL $C75305          ; 22 05 53 C7 | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $124C            ; 4C 4C 12 | Jump to address
    JMP $123D            ; 4C 3D 12 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2E2
; Address: $D8925E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2E2:
    JSL $C743E5          ; 22 E5 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ORA $9000,Y          ; 19 00 90 | Logical OR with accumulator (absolute,Y)
    JMP $127D            ; 4C 7D 12 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2E3
; Address: $D89271
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2E3:
    JSL $CDE15B          ; 22 5B E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2E4
; Address: $D8927D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2E4:
    JSL $CC10E2          ; 22 E2 10 CC | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1296            ; 4C 96 12 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2E7
; Address: $D8929D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2E7:
    JSL $CDE15B          ; 22 5B E1 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$98             ; C9 98 | Compare accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $12B0            ; 4C B0 12 | Jump to address
    JMP $12A1            ; 4C A1 12 | Jump to address
    LDX #$8E             ; A2 8E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2E9
; Address: $D892B7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2E9:
    JSL $CDE15B          ; 22 5B E1 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$60             ; C9 60 | Compare accumulator (immediate)
    ORA #$90             ; 09 90 | Logical OR with accumulator (immediate)
    JMP $12CA            ; 4C CA 12 | Jump to address
    JMP $12BB            ; 4C BB 12 | Jump to address
    LDX #$8F             ; A2 8F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2EB
; Address: $D892D1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2EB:
    JSL $CDE15B          ; 22 5B E1 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $12E4            ; 4C E4 12 | Jump to address
    JMP $12D5            ; 4C D5 12 | Jump to address
    LDX #$90             ; A2 90 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2ED
; Address: $D892EB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2ED:
    JSL $CDE15B          ; 22 5B E1 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $12FE            ; 4C FE 12 | Jump to address
    JMP $12EF            ; 4C EF 12 | Jump to address
    LDX #$91             ; A2 91 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2EF
; Address: $D89305
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2EF:
    JSL $CDE15B          ; 22 5B E1 CD | Jump to subroutine long
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $131D            ; 4C 1D 13 | Jump to address
    JMP $132F            ; 4C 2F 13 | Jump to address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $132C            ; 4C 2C 13 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2F0
; Address: $D89329
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2F0:
    JMP $131D            ; 4C 1D 13 | Jump to address
    JMP $1287            ; 4C 87 12 | Jump to address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $133E            ; 4C 3E 13 | Jump to address
    JMP $132F            ; 4C 2F 13 | Jump to address
    LDX #$92             ; A2 92 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2F2
; Address: $D89345
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2F2:
    JSL $CDE15B          ; 22 5B E1 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$38             ; C9 38 | Compare accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1358            ; 4C 58 13 | Jump to address
    JMP $1349            ; 4C 49 13 | Jump to address
    LDX #$93             ; A2 93 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2F4
; Address: $D8935F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2F4:
    JSL $CDE15B          ; 22 5B E1 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ORA $0390,Y          ; 19 90 03 | Logical OR with accumulator (absolute,Y)
    JMP $1372            ; 4C 72 13 | Jump to address
    JMP $1363            ; 4C 63 13 | Jump to address
    LDX #$94             ; A2 94 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2F6
; Address: $D89379
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2F6:
    JSL $CDE15B          ; 22 5B E1 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$58             ; C9 58 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $138C            ; 4C 8C 13 | Jump to address
    JMP $137D            ; 4C 7D 13 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2F7
; Address: $D89392
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2F7:
    JSL $C743C6          ; 22 C6 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2F8
; Address: $D8939C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2F8:
    JSL $C743C6          ; 22 C6 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2F9
; Address: $D893A6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2F9:
    JSL $C743C6          ; 22 C6 43 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2FA
; Address: $D893B0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2FA:
    JSL $C743C6          ; 22 C6 43 C7 | Jump to subroutine long
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2FB
; Address: $D893C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2FB:
    CLI                  ; 58 | Clear interrupt disable flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $13ED            ; 4C ED 13 | Jump to address
    LDX #$20             ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_2FE
; Address: $D893D7
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_2FE:
    JSL $C73033          ; 22 33 30 C7 | Jump to subroutine long
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 13 22 8C | Load from absolute long,X into accumulator
    CPX #$CB             ; E0 CB | Compare X register (immediate)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1424            ; 4C 24 14 | Jump to address
    LDX #$20             ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_301
; Address: $D8940E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_301:
    JSL $C73033          ; 22 33 30 C7 | Jump to subroutine long
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_302
; Address: $D89424
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_302:
    JSL $CDE34C          ; 22 4C E3 CD | Jump to subroutine long
    LDA #$B8             ; A9 B8 | Load immediate value into accumulator
    STA $3410            ; 8D 10 34 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1461            ; 4C 61 14 | Jump to address
    LDX #$20             ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_305
; Address: $D8944B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_305:
    JSL $C73033          ; 22 33 30 C7 | Jump to subroutine long
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_306
; Address: $D89456
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_306:
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_30A
; Address: $D89476
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_30A:
    LDA #$8D             ; A9 8D | Load immediate value into accumulator
    LDX #$18             ; A2 18 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_30D
; Address: $D8948C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_30D:
    JSL $C740B4          ; 22 B4 40 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_30E
; Address: $D89496
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_30E:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    LDA $3406            ; AD 06 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $14AD            ; 4C AD 14 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_310
; Address: $D894AD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_310:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_312
; Address: $D894C7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_312:
    JSL $CC1469          ; 22 69 14 CC | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_314
; Address: $D894DB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_314:
    JSL $CC1469          ; 22 69 14 CC | Jump to subroutine long
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_317
; Address: $D894F3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_317:
    LDA #$98             ; A9 98 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_318
; Address: $D894F9
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_318:
    JSL $C73F9F          ; 22 9F 3F C7 | Jump to subroutine long
    LDA $C125            ; AD 25 C1 | Load from absolute address into accumulator
    STA $3430            ; 8D 30 34 | Store accumulator to absolute address
    LDA $C127            ; AD 27 C1 | Load from absolute address into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    LDA $3430            ; AD 30 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$30             ; E9 30 | Subtract with carry (immediate)
    STA $3430            ; 8D 30 34 | Store accumulator to absolute address
    LDA $3432            ; AD 32 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$20             ; 69 20 | Add with carry (immediate)
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_319
; Address: $D89520
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_319:
    JSL $C740C7          ; 22 C7 40 C7 | Jump to subroutine long
    LDX $3430            ; AE 30 34 | Load from absolute address into X register
    LDY $3432            ; AC 32 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_31A
; Address: $D8952A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_31A:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_31C
; Address: $D89544
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_31C:
    JSL $CC1469          ; 22 69 14 CC | Jump to subroutine long
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3412            ; 8D 12 34 | Store accumulator to absolute address
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_31F
; Address: $D89562
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_31F:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_322
; Address: $D89574
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_322:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA #$DC             ; A9 DC | Load immediate value into accumulator
    ORA $8D              ; 05 8D | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_323
; Address: $D89584
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_323:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_326
; Address: $D89596
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_326:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_327
; Address: $D895A0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_327:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_32A
; Address: $D895B2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_32A:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3412            ; 8D 12 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_32B
; Address: $D895C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_32B:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_32E
; Address: $D895D4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_32E:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_32F
; Address: $D895DE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_32F:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_332
; Address: $D895F0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_332:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_333
; Address: $D895FA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_333:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_336
; Address: $D8960C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_336:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_337
; Address: $D89616
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_337:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_33A
; Address: $D89628
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_33A:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_33B
; Address: $D89632
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_33B:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_33F
; Address: $D8964A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_33F:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$0E             ; A9 0E | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3414            ; 8D 14 34 | Store accumulator to absolute address
    LDA #$0E             ; A9 0E | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_341
; Address: $D89664
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_341:
    JSL $CC1469          ; 22 69 14 CC | Jump to subroutine long
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_342
; Address: $D8966E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_342:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$0F             ; A9 0F | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_345
; Address: $D89680
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_345:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_348
; Address: $D8969B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_348:
    JSL $C740C7          ; 22 C7 40 C7 | Jump to subroutine long
    LDX #$18             ; A2 18 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_349
; Address: $D896A5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_349:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$11             ; A9 11 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $16C0            ; 4C C0 16 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LSR $028D            ; 4E 8D 02 | Logical shift right (absolute)
    LDA #$11             ; A9 11 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_34B
; Address: $D896CA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_34B:
    JSL $CC1469          ; 22 69 14 CC | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3406            ; 8D 06 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_34C
; Address: $D896DA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_34C:
    BEQ $03              ; F0 03 | Branch if equal
    JMP $16E2            ; 4C E2 16 | Jump to address
    JMP $16FD            ; 4C FD 16 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_34D
; Address: $D896E8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_34D:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_34F
; Address: $D896F6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_34F:
    JSL $CC74F6          ; 22 F6 74 CC | Jump to subroutine long
    JMP $14AD            ; 4C AD 14 | Jump to address
    LDA #$70             ; A9 70 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_351
; Address: $D89713
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_351:
    JSL $CC1469          ; 22 69 14 CC | Jump to subroutine long
    LDA #$38             ; A9 38 | Load immediate value into accumulator
    CLC                  ; 18 | Clear carry flag
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA #$13             ; A9 13 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_353
; Address: $D89727
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_353:
    JSL $CC1469          ; 22 69 14 CC | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA $048D,Y          ; 19 8D 04 | Logical OR with accumulator (absolute,Y)
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3412            ; 8D 12 34 | Store accumulator to absolute address
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3414            ; 8D 14 34 | Store accumulator to absolute address
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3416            ; 8D 16 34 | Store accumulator to absolute address
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3418            ; 8D 18 34 | Store accumulator to absolute address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $341A            ; 8D 1A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_354
; Address: $D89755
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_354:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_35D
; Address: $D89784
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_35D:
    JSL $C73E56          ; 22 56 3E C7 | Jump to subroutine long
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $90              ; 90 90 | Branch if carry clear
    JMP $179D            ; 4C 9D 17 | Jump to address
    JMP $178E            ; 4C 8E 17 | Jump to address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3410            ; 8D 10 34 | Store accumulator to absolute address
    LDA $3410            ; AD 10 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $17B2            ; 4C B2 17 | Jump to address
    JMP $17A3            ; 4C A3 17 | Jump to address
    LDA #$58             ; A9 58 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_35E
; Address: $D897B9
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_35E:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $17D0            ; 4C D0 17 | Jump to address
    JMP $17C1            ; 4C C1 17 | Jump to address
    JMP $19FB            ; 4C FB 19 | Jump to address
    JMP $1AC6            ; 4C C6 1A | Jump to address
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$4F             ; A9 4F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_35F
; Address: $D897DC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_35F:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1805            ; 4C 05 18 | Jump to address
    LDA #$0C             ; A9 0C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_361
; Address: $D897F9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_361:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SBC $17              ; E5 17 | Subtract with carry (zero page)
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_362
; Address: $D8980E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_362:
    BEQ $03              ; F0 03 | Branch if equal
    JMP $1821            ; 4C 21 18 | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_364
; Address: $D8981D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_364:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$2D             ; A9 2D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_366
; Address: $D8982E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_366:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$23             ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_36C
; Address: $D8985B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_36C:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_36E
; Address: $D8986F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_36E:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank30_DmaFunction_372
; Address: $D8988E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_372:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_376
; Address: $D898AD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_376:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    JMP $1AC6            ; 4C C6 1A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_37A
; Address: $D898CB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_37A:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$0A             ; A9 0A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_382
; Address: $D89906
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_382:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_38A
; Address: $D89941
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_38A:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$32             ; A9 32 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_38C
; Address: $D89955
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_38C:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$2C             ; A9 2C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_38F
; Address: $D89966
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_38F:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$4F             ; A9 4F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_39A
; Address: $D899B6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_39A:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $1AC6            ; 4C C6 1A | Jump to address
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA #$5E             ; A9 5E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_39B
; Address: $D899C3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_39B:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $19EC            ; 4C EC 19 | Jump to address
    LDA #$0A             ; A9 0A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_39D
; Address: $D899E0
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_39D:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    CPY $4C19            ; CC 19 4C | Compare Y register (absolute)
    DEC $1A              ; C6 1A | Decrement (zero page)
    JMP $1AC6            ; 4C C6 1A | Jump to address
    JMP $1AC6            ; 4C C6 1A | Jump to address
    JMP $1AC6            ; 4C C6 1A | Jump to address
    JMP $1AC6            ; 4C C6 1A | Jump to address
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_39E
; Address: $D89A03
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_39E:
    JMP $17D3            ; 4C D3 17 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $17D6            ; 4C D6 17 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $17D9            ; 4C D9 17 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1808            ; 4C 08 18 | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1824            ; 4C 24 18 | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1835            ; 4C 35 18 | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1862            ; 4C 62 18 | Jump to address
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1865            ; 4C 65 18 | Jump to address
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1876            ; 4C 76 18 | Jump to address
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1895            ; 4C 95 18 | Jump to address
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $18B4            ; 4C B4 18 | Jump to address
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $18B7            ; 4C B7 18 | Jump to address
    CMP #$0C             ; C9 0C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $18BA            ; 4C BA 18 | Jump to address
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $18D2            ; 4C D2 18 | Jump to address
    CMP #$0E             ; C9 0E | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $190D            ; 4C 0D 19 | Jump to address
    CMP #$0F             ; C9 0F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1948            ; 4C 48 19 | Jump to address
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $194B            ; 4C 4B 19 | Jump to address
    CMP #$11             ; C9 11 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_39F
; Address: $D89A89
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_39F:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $195C            ; 4C 5C 19 | Jump to address
    CMP #$12             ; C9 12 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $196D            ; 4C 6D 19 | Jump to address
    CMP #$13             ; C9 13 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $19BD            ; 4C BD 19 | Jump to address
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $19C0            ; 4C C0 19 | Jump to address
    CMP #$15             ; C9 15 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $19EF            ; 4C EF 19 | Jump to address
    CMP #$16             ; C9 16 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $19F2            ; 4C F2 19 | Jump to address
    CMP #$17             ; C9 17 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $19F5            ; 4C F5 19 | Jump to address
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $19F8            ; 4C F8 19 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    JMP $17C1            ; 4C C1 17 | Jump to address
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3A0
; Address: $D89AD1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3A0:
    LDA #$8E             ; A9 8E | Load immediate value into accumulator
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3A3
; Address: $D89AE7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3A3:
    JSL $C740B4          ; 22 B4 40 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3A4
; Address: $D89AF1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3A4:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1B08            ; 4C 08 1B | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3A5
; Address: $D89B01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3A5:
    JSL $CC74F6          ; 22 F6 74 CC | Jump to subroutine long
    JMP $1AF6            ; 4C F6 1A | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3A6
; Address: $D89B0B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3A6:
    JSL $C740C7          ; 22 C7 40 C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3AB
; Address: $D89B27
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3AB:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $1B3A            ; 4C 3A 1B | Jump to address
    JMP $1B2B            ; 4C 2B 1B | Jump to address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $1B4F            ; 4C 4F 1B | Jump to address
    LDA #$05             ; A9 05 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3AC
; Address: $D89B48
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3AC:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $1B56            ; 4C 56 1B | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3AD
; Address: $D89B52
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3AD:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $A236,Y          ; 19 36 A2 | Logical OR with accumulator (absolute,Y)
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    LDY #$C7             ; A0 C7 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3AE
; Address: $D89B62
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3AE:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3B2
; Address: $D89B78
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3B2:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3B6
; Address: $D89B8E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3B6:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3BE
; Address: $D89BC2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3BE:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3C3
; Address: $D89BE5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3C3:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$5C             ; A2 5C | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3C4
; Address: $D89BEF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3C4:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3C9
; Address: $D89C12
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3C9:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$17             ; A2 17 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3CA
; Address: $D89C1C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3CA:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3CF
; Address: $D89C3F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3CF:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$E0             ; A2 E0 | Game work RAM access
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3D0
; Address: $D89C49
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3D0:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3D5
; Address: $D89C66
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3D5:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$28             ; A2 28 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3D6
; Address: $D89C70
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3D6:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3DA
; Address: $D89C8C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3DA:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $1CA1            ; 4C A1 1C | Jump to address
    JMP $1CE7            ; 4C E7 1C | Jump to address
    JMP $1CE7            ; 4C E7 1C | Jump to address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1CB0            ; 4C B0 1C | Jump to address
    JMP $1CA1            ; 4C A1 1C | Jump to address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3DC
; Address: $D89CBA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3DC:
    JSL $C740C7          ; 22 C7 40 C7 | Jump to subroutine long
    LDX #$24             ; A2 24 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3DD
; Address: $D89CC4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3DD:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3E1
; Address: $D89CE0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3E1:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    JMP $1B2B            ; 4C 2B 1B | Jump to address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    LSR $0390            ; 4E 90 03 | Logical shift right (absolute)
    JMP $1CF6            ; 4C F6 1C | Jump to address
    JMP $1CE7            ; 4C E7 1C | Jump to address
    LDA #$82             ; A9 82 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3E2
; Address: $D89CF9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3E2:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$36             ; A2 36 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3E3
; Address: $D89D03
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3E3:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3E8
; Address: $D89D23
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3E8:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3ED
; Address: $D89D40
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3ED:
    JSL $C7400E          ; 22 0E 40 C7 | Jump to subroutine long
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3EF
; Address: $D89D4E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3EF:
    JSL $CC74F6          ; 22 F6 74 CC | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1D61            ; 4C 61 1D | Jump to address
    JMP $1D52            ; 4C 52 1D | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3F0
; Address: $D89D61
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3F0:
    JSL $C73E56          ; 22 56 3E C7 | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3F1
; Address: $D89D70
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3F1:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $1D87            ; 4C 87 1D | Jump to address
    JMP $1D78            ; 4C 78 1D | Jump to address
    JMP $1E14            ; 4C 14 1E | Jump to address
    JMP $1E87            ; 4C 87 1E | Jump to address
    LDA #$34             ; A9 34 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3F4
; Address: $D89D9B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3F4:
    JSL $CC2630          ; 22 30 26 CC | Jump to subroutine long
    JMP $1E87            ; 4C 87 1E | Jump to address
    JMP $1E87            ; 4C 87 1E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_3FD
; Address: $D89DD6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_3FD:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $1E87            ; 4C 87 1E | Jump to address
    JMP $1E87            ; 4C 87 1E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_400
; Address: $D89DEB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_400:
    JSL $CC2630          ; 22 30 26 CC | Jump to subroutine long
    JMP $1E87            ; 4C 87 1E | Jump to address
    LDA #$BD             ; A9 BD | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_402
; Address: $D89DF9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_402:
    JSL $CC2648          ; 22 48 26 CC | Jump to subroutine long
    JMP $1E87            ; 4C 87 1E | Jump to address
    JMP $1E87            ; 4C 87 1E | Jump to address
    JMP $1E87            ; 4C 87 1E | Jump to address
    LDA #$47             ; A9 47 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_404
; Address: $D89E0D
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_404:
    JSL $CC2648          ; 22 48 26 CC | Jump to subroutine long
    JMP $1E87            ; 4C 87 1E | Jump to address
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1D8A            ; 4C 8A 1D | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1D8D            ; 4C 8D 1D | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1DA2            ; 4C A2 1D | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1DA5            ; 4C A5 1D | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1DA8            ; 4C A8 1D | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_405
; Address: $D89E44
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_405:
    JMP $1DB6            ; 4C B6 1D | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1DBD            ; 4C BD 1D | Jump to address
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1DCF            ; 4C CF 1D | Jump to address
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1DDD            ; 4C DD 1D | Jump to address
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1DE0            ; 4C E0 1D | Jump to address
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1DF2            ; 4C F2 1D | Jump to address
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1E00            ; 4C 00 1E | Jump to address
    CMP #$0C             ; C9 0C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1E03            ; 4C 03 1E | Jump to address
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1E06            ; 4C 06 1E | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    JMP $1D78            ; 4C 78 1D | Jump to address
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_406
; Address: $D89E92
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_406:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $340E            ; 8D 0E 34 | Store accumulator to absolute address
    LDA $340E            ; AD 0E 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $1EA9            ; 4C A9 1E | Jump to address
    JMP $1E9A            ; 4C 9A 1E | Jump to address
    JMP $1EF7            ; 4C F7 1E | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_407
; Address: $D89ECD
; Size: 126 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_407:
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    JMP $1FC2            ; 4C C2 1F | Jump to address
    LDA $340E            ; AD 0E 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EAC            ; 4C AC 1E | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EAF            ; 4C AF 1E | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EB2            ; 4C B2 1E | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EB5            ; 4C B5 1E | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EB8            ; 4C B8 1E | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EBB            ; 4C BB 1E | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EBE            ; 4C BE 1E | Jump to address
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EC1            ; 4C C1 1E | Jump to address
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EC4            ; 4C C4 1E | Jump to address
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EC7            ; 4C C7 1E | Jump to address
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1ECA            ; 4C CA 1E | Jump to address
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_408
; Address: $D89F57
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_408:
    JMP $1ECD            ; 4C CD 1E | Jump to address
    CMP #$0C             ; C9 0C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1ED0            ; 4C D0 1E | Jump to address
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1ED3            ; 4C D3 1E | Jump to address
    CMP #$0E             ; C9 0E | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1ED6            ; 4C D6 1E | Jump to address
    CMP #$0F             ; C9 0F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1ED9            ; 4C D9 1E | Jump to address
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EDC            ; 4C DC 1E | Jump to address
    CMP #$11             ; C9 11 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EDF            ; 4C DF 1E | Jump to address
    CMP #$12             ; C9 12 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EE2            ; 4C E2 1E | Jump to address
    CMP #$13             ; C9 13 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EE5            ; 4C E5 1E | Jump to address
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EE8            ; 4C E8 1E | Jump to address
    CMP #$15             ; C9 15 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EEB            ; 4C EB 1E | Jump to address
    CMP #$16             ; C9 16 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EEE            ; 4C EE 1E | Jump to address
    CMP #$17             ; C9 17 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EF1            ; 4C F1 1E | Jump to address
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EF4            ; 4C F4 1E | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $340E            ; 8D 0E 34 | Store accumulator to absolute address
    JMP $1E9A            ; 4C 9A 1E | Jump to address
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_40B
; Address: $D89FD4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_40B:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_410
; Address: $D89FEE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_410:
    JSL $C740B4          ; 22 B4 40 C7 | Jump to subroutine long
    LDX #$88             ; A2 88 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_413
; Address: $D8A001
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_413:
    LDA #$8F             ; A9 8F | Load immediate value into accumulator
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_414
; Address: $D8A00A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_414:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $3412            ; AD 12 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2020            ; 4C 20 20 | Jump to address
    JMP $2011            ; 4C 11 20 | Jump to address
    JMP $20AB            ; 4C AB 20 | Jump to address
    LDA #$2B             ; A9 2B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_416
; Address: $D8A02A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_416:
    JSL $CC1FEB          ; 22 EB 1F CC | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_419
; Address: $D8A03C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_419:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    JMP $20CE            ; 4C CE 20 | Jump to address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_41B
; Address: $D8A04D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_41B:
    JSL $C740B4          ; 22 B4 40 C7 | Jump to subroutine long
    LDX #$60             ; A2 60 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    BEQ $0B              ; F0 0B | Branch if equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_41D
; Address: $D8A05B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_41D:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_420
; Address: $D8A06D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_420:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    JMP $20CE            ; 4C CE 20 | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_423
; Address: $D8A07E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_423:
    JSL $C740B4          ; 22 B4 40 C7 | Jump to subroutine long
    LDX #$70             ; A2 70 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_425
; Address: $D8A08C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_425:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_428
; Address: $D8A09E
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_428:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    JMP $20CE            ; 4C CE 20 | Jump to address
    JMP $20D7            ; 4C D7 20 | Jump to address
    JMP $20CE            ; 4C CE 20 | Jump to address
    LDA $3412            ; AD 12 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2023            ; 4C 23 20 | Jump to address
    CMP #$DC             ; C9 DC | Compare accumulator (immediate)
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    JMP $2043            ; 4C 43 20 | Jump to address
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2074            ; 4C 74 20 | Jump to address
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $20A5            ; 4C A5 20 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3412            ; 8D 12 34 | Store accumulator to absolute address
    JMP $2011            ; 4C 11 20 | Jump to address
    LDX #$40             ; A2 40 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_42B
; Address: $D8A0E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_42B:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$50             ; A2 50 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_42D
; Address: $D8A0F6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_42D:
    JSL $CC1FCD          ; 22 CD 1F CC | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2109            ; 4C 09 21 | PPU graphics register access
    JMP $20FA            ; 4C FA 20 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_42E
; Address: $D8A109
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_42E:
    JSL $C73E56          ; 22 56 3E C7 | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_42F
; Address: $D8A111
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_42F:
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_430
; Address: $D8A118
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_430:
    LDA #$8F             ; A9 8F | Load immediate value into accumulator
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_431
; Address: $D8A121
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_431:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $3412            ; AD 12 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2137            ; 4C 37 21 | PPU graphics register access
    JMP $2128            ; 4C 28 21 | PPU graphics register access
    JMP $2194            ; 4C 94 21 | PPU graphics register access
    LDA #$37             ; A9 37 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_433
; Address: $D8A141
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_433:
    JSL $CC1FEB          ; 22 EB 1F CC | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_436
; Address: $D8A153
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_436:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    JMP $21B7            ; 4C B7 21 | PPU graphics register access
    JMP $21B7            ; 4C B7 21 | PPU graphics register access
    LDA #$2C             ; A9 2C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_438
; Address: $D8A167
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_438:
    JSL $C740B4          ; 22 B4 40 C7 | Jump to subroutine long
    LDX #$74             ; A2 74 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_43A
; Address: $D8A175
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_43A:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_43D
; Address: $D8A187
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_43D:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    JMP $21B7            ; 4C B7 21 | PPU graphics register access
    JMP $21C0            ; 4C C0 21 | PPU graphics register access
    JMP $21B7            ; 4C B7 21 | PPU graphics register access
    LDA $3412            ; AD 12 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $213A            ; 4C 3A 21 | PPU graphics register access
    CMP #$DC             ; C9 DC | Compare accumulator (immediate)
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    JMP $215A            ; 4C 5A 21 | PPU graphics register access
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_43E
; Address: $D8A1AC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_43E:
    JMP $215D            ; 4C 5D 21 | PPU graphics register access
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $218E            ; 4C 8E 21 | PPU graphics register access
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3412            ; 8D 12 34 | Store accumulator to absolute address
    JMP $2128            ; 4C 28 21 | PPU graphics register access
    LDA #$0A             ; A9 0A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_43F
; Address: $D8A1C3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_43F:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$50             ; A2 50 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_442
; Address: $D8A1D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_442:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$30             ; A2 30 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_444
; Address: $D8A1E6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_444:
    JSL $CC1FCD          ; 22 CD 1F CC | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $21F9            ; 4C F9 21 | PPU graphics register access
    JMP $21EA            ; 4C EA 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank30_DmaFunction_445
; Address: $D8A1F9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_445:
    JSL $C73E56          ; 22 56 3E C7 | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_446
; Address: $D8A208
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_446:
    LDA #$8F             ; A9 8F | Load immediate value into accumulator
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_447
; Address: $D8A211
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_447:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $3412            ; AD 12 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2227            ; 4C 27 22 | Jump to address
    JMP $2218            ; 4C 18 22 | Jump to address
    JMP $2267            ; 4C 67 22 | Jump to address
    LDA #$43             ; A9 43 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_449
; Address: $D8A234
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_449:
    JSL $C740B4          ; 22 B4 40 C7 | Jump to subroutine long
    LDX #$80             ; A2 80 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_44C
; Address: $D8A242
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_44C:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_44F
; Address: $D8A254
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_44F:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    JMP $228A            ; 4C 8A 22 | Jump to address
    JMP $228A            ; 4C 8A 22 | Jump to address
    JMP $228A            ; 4C 8A 22 | Jump to address
    JMP $2293            ; 4C 93 22 | Jump to address
    JMP $228A            ; 4C 8A 22 | Jump to address
    LDA $3412            ; AD 12 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $222A            ; 4C 2A 22 | Jump to address
    CMP #$DC             ; C9 DC | Compare accumulator (immediate)
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    JMP $225B            ; 4C 5B 22 | Jump to address
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $225E            ; 4C 5E 22 | Jump to address
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2261            ; 4C 61 22 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3412            ; 8D 12 34 | Store accumulator to absolute address
    JMP $2218            ; 4C 18 22 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_450
; Address: $D8A296
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_450:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$38             ; A2 38 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_452
; Address: $D8A2A4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_452:
    JSL $CC1FCD          ; 22 CD 1F CC | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $22B7            ; 4C B7 22 | Jump to address
    JMP $22A8            ; 4C A8 22 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_453
; Address: $D8A2B7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_453:
    JSL $C73E56          ; 22 56 3E C7 | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_454
; Address: $D8A2C6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_454:
    LDA #$8F             ; A9 8F | Load immediate value into accumulator
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_455
; Address: $D8A2CF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_455:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $3414            ; AD 14 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $22E5            ; 4C E5 22 | Jump to address
    JMP $22D6            ; 4C D6 22 | Jump to address
    JMP $2326            ; 4C 26 23 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_457
; Address: $D8A2F2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_457:
    JSL $C740B4          ; 22 B4 40 C7 | Jump to subroutine long
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    LDY #$0B             ; A0 0B | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_459
; Address: $D8A300
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_459:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_45C
; Address: $D8A319
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_45C:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    JMP $2339            ; 4C 39 23 | Jump to address
    JMP $2342            ; 4C 42 23 | Jump to address
    JMP $2339            ; 4C 39 23 | Jump to address
    LDA $3414            ; AD 14 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $22E8            ; 4C E8 22 | Jump to address
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2320            ; 4C 20 23 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3414            ; 8D 14 34 | Store accumulator to absolute address
    JMP $22D6            ; 4C D6 22 | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_45D
; Address: $D8A345
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_45D:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$52             ; A2 52 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_45F
; Address: $D8A353
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_45F:
    JSL $CC1FCD          ; 22 CD 1F CC | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2366            ; 4C 66 23 | Jump to address
    JMP $2357            ; 4C 57 23 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_461
; Address: $D8A36A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_461:
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_462
; Address: $D8A375
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_462:
    LDA #$8F             ; A9 8F | Load immediate value into accumulator
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_463
; Address: $D8A37E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_463:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $3414            ; AD 14 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2394            ; 4C 94 23 | Jump to address
    JMP $2385            ; 4C 85 23 | Jump to address
    JMP $23D5            ; 4C D5 23 | Jump to address
    LDA #$29             ; A9 29 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_465
; Address: $D8A3A1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_465:
    JSL $C740B4          ; 22 B4 40 C7 | Jump to subroutine long
    LDX #$9C             ; A2 9C | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    BCC $0B              ; 90 0B | Branch if carry clear

;------------------------------------------------------------------------------
; Bank30_DmaFunction_467
; Address: $D8A3AF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_467:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_46A
; Address: $D8A3C8
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_46A:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    JMP $23E8            ; 4C E8 23 | Jump to address
    JMP $23F1            ; 4C F1 23 | Jump to address
    JMP $23E8            ; 4C E8 23 | Jump to address
    LDA $3414            ; AD 14 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2397            ; 4C 97 23 | Jump to address
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $23CF            ; 4C CF 23 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3414            ; 8D 14 34 | Store accumulator to absolute address
    JMP $2385            ; 4C 85 23 | Jump to address
    LDA #$28             ; A9 28 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_46B
; Address: $D8A3F4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_46B:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$48             ; A2 48 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_46E
; Address: $D8A402
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_46E:
    JSL $CC1FCD          ; 22 CD 1F CC | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2415            ; 4C 15 24 | Jump to address
    JMP $2406            ; 4C 06 24 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_46F
; Address: $D8A415
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_46F:
    JSL $C73E56          ; 22 56 3E C7 | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_470
; Address: $D8A424
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_470:
    LDA #$8F             ; A9 8F | Load immediate value into accumulator
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_471
; Address: $D8A42D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_471:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $3414            ; AD 14 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2443            ; 4C 43 24 | Jump to address
    JMP $2434            ; 4C 34 24 | Jump to address
    JMP $2484            ; 4C 84 24 | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_473
; Address: $D8A450
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_473:
    JSL $C740B4          ; 22 B4 40 C7 | Jump to subroutine long
    LDX #$60             ; A2 60 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    BCS $0B              ; B0 0B | Branch if carry set

;------------------------------------------------------------------------------
; Bank30_DmaFunction_475
; Address: $D8A45E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_475:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_478
; Address: $D8A477
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_478:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    JMP $2497            ; 4C 97 24 | Jump to address
    JMP $24A0            ; 4C A0 24 | Jump to address
    JMP $2497            ; 4C 97 24 | Jump to address
    LDA $3414            ; AD 14 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2446            ; 4C 46 24 | Jump to address
    CMP #$88             ; C9 88 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_479
; Address: $D8A492
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_479:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $247E            ; 4C 7E 24 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3414            ; 8D 14 34 | Store accumulator to absolute address
    JMP $2434            ; 4C 34 24 | Jump to address
    LDA #$32             ; A9 32 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_47A
; Address: $D8A4A3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_47A:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$40             ; A2 40 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_47C
; Address: $D8A4B1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_47C:
    JSL $CC1FCD          ; 22 CD 1F CC | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $24C4            ; 4C C4 24 | Jump to address
    JMP $24B5            ; 4C B5 24 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_47D
; Address: $D8A4C4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_47D:
    JSL $C73E56          ; 22 56 3E C7 | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_47E
; Address: $D8A4D3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_47E:
    LDA $3416            ; AD 16 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $24E2            ; 4C E2 24 | Jump to address
    JMP $2506            ; 4C 06 25 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_481
; Address: $D8A4F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_481:
    JSL $C74027          ; 22 27 40 C7 | Jump to subroutine long
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_485
; Address: $D8A507
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_485:
    LDA #$8F             ; A9 8F | Load immediate value into accumulator
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_486
; Address: $D8A510
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_486:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $3416            ; AD 16 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2526            ; 4C 26 25 | Jump to address
    JMP $2517            ; 4C 17 25 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_487
; Address: $D8A526
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_487:
    LDA $3416            ; AD 16 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2535            ; 4C 35 25 | Jump to address
    JMP $2526            ; 4C 26 25 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_488
; Address: $D8A536
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_488:
    LDA #$8F             ; A9 8F | Load immediate value into accumulator
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_489
; Address: $D8A53F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_489:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $3418            ; AD 18 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2555            ; 4C 55 25 | Jump to address
    JMP $2546            ; 4C 46 25 | Jump to address
    LDA $3418            ; AD 18 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $256A            ; 4C 6A 25 | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_48A
; Address: $D8A563
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_48A:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $2555            ; 4C 55 25 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_48C
; Address: $D8A572
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_48C:
    JSL $C743E5          ; 22 E5 43 C7 | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$58             ; C9 58 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $258D            ; 4C 8D 25 | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_48D
; Address: $D8A585
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_48D:
    JSL $C74414          ; 22 14 44 C7 | Jump to subroutine long
    JMP $2577            ; 4C 77 25 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_48E
; Address: $D8A58E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_48E:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$4A             ; A2 4A | Load immediate value into X register
    AND #$A0             ; 29 A0 | Logical AND with accumulator (immediate)
    INC $227F,X          ; FE 7F 22 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_493
; Address: $D8A5AD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_493:
    LDA $341A            ; AD 1A 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $25BC            ; 4C BC 25 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_496
; Address: $D8A5C2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_496:
    LDA $3410            ; AD 10 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $25D1            ; 4C D1 25 | Jump to address
    JMP $25C2            ; 4C C2 25 | Jump to address
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    LDX #$68             ; A2 68 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    CPX $08              ; E4 08 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_497
; Address: $D8A5DA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_497:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    PHB                  ; 8B | Push data bank register to stack
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3410            ; 8D 10 34 | Store accumulator to absolute address
    LDA $3410            ; AD 10 34 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $25F5            ; 4C F5 25 | Jump to address
    JMP $25E6            ; 4C E6 25 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_498
; Address: $D8A5F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_498:
    JSL $C740B4          ; 22 B4 40 C7 | Jump to subroutine long
    LDX #$66             ; A2 66 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_499
; Address: $D8A602
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_499:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_49B
; Address: $D8A610
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_49B:
    JSL $C73FB8          ; 22 B8 3F C7 | Jump to subroutine long
    LDA $C137            ; AD 37 C1 | Load from absolute address into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_49C
; Address: $D8A61D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_49C:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    LSR $F638,X          ; 5E 38 F6 | Logical shift right (absolute,X)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CPY $88A9            ; CC A9 88 | Compare Y register (absolute)
    STA $3410            ; 8D 10 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4A1
; Address: $D8A640
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4A1:
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4CB
; Address: $D8A716
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4CB:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $24A2            ; CC A2 24 | Compare Y register (absolute)
    LDA #$29             ; A9 29 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4D6
; Address: $D8A756
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4D6:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    PHB                  ; 8B | Push data bank register to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $1722            ; CC 22 17 | Compare Y register (absolute)
    LDX $6BCD            ; AE CD 6B | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4DA
; Address: $D8A772
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4DA:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $1022            ; CC 22 10 | Compare Y register (absolute)
    LDX $22CD            ; AE CD 22 | Load from absolute address into X register
    EOR ($AF,X)          ; 41 AF | Exclusive OR with accumulator ((zero page,X))
    CMP $2E22            ; CD 22 2E | Compare accumulator (absolute)
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    STY $2201            ; 8C 01 22 | Store Y register to absolute address
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $8122            ; CC 22 81 | Compare Y register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $2E22            ; CC 22 2E | Compare Y register (absolute)
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4DB
; Address: $D8A796
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4DB:
    STA $2201            ; 8D 01 22 | Store accumulator to absolute address
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $1E22            ; CC 22 1E | Compare Y register (absolute)
    LDX $6BCD            ; AE CD 6B | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4E9
; Address: $D8A7DB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4E9:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register
    CPY $F422            ; CC 22 F4 | Compare Y register (absolute)
    LDA $6BCD            ; AD CD 6B | Load from absolute address into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4ED
; Address: $D8A7EE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4ED:
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2803            ; 4C 03 28 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4EE
; Address: $D8A7F9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4EE:
    JSL $CC9C76          ; 22 76 9C CC | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LSR $35              ; 46 35 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4F8
; Address: $D8A832
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4F8:
    JSL $CDACD7          ; 22 D7 AC CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    JMP $37C1            ; 4C C1 37 | Jump to address
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4FA
; Address: $D8A84C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4FA:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $220C            ; 4C 0C 22 | Jump to address
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4FB
; Address: $D8A859
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4FB:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    EOR $220C            ; 4D 0C 22 | Exclusive OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4FC
; Address: $D8A866
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4FC:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LSR $220C            ; 4E 0C 22 | Logical shift right (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_4FF
; Address: $D8A880
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_4FF:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    BVC $0C              ; 50 0C | Branch if overflow clear
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_509
; Address: $D8A8CA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_509:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_511
; Address: $D8A907
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_511:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    EOR $4C0C,Y          ; 59 0C 4C | Exclusive OR with accumulator (absolute,Y)
    CPY $38              ; C4 38 | Compare Y register (zero page)
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_517
; Address: $D8A937
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_517:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $D7220C          ; 5C 0C 22 D7 | Jump to address long
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_518
; Address: $D8A944
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_518:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    EOR $4C0C,X          ; 5D 0C 4C | Exclusive OR with accumulator (absolute,X)
    CPY $38              ; C4 38 | Compare Y register (zero page)
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_51A
; Address: $D8A95A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_51A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LSR $220C,X          ; 5E 0C 22 | Logical shift right (absolute,X)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_523
; Address: $D8A99B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_523:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_52C
; Address: $D8A9D8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_52C:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_536
; Address: $D8AA22
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_536:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP ($220C)          ; 6C 0C 22 | Jump to address (absolute indirect)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_537
; Address: $D8AA2F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_537:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ADC $4C0C            ; 6D 0C 4C | Add with carry (absolute)
    CPY $38              ; C4 38 | Compare Y register (zero page)
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_539
; Address: $D8AA45
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_539:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ROR $220C            ; 6E 0C 22 | Rotate right (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_540
; Address: $D8AA79
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_540:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_54A
; Address: $D8AAC3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_54A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_54E
; Address: $D8AAE6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_54E:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ADC $220C,Y          ; 79 0C 22 | Add with carry (absolute,Y)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_555
; Address: $D8AB1A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_555:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ADC $4C0C,X          ; 7D 0C 4C | Add with carry (absolute,X)
    CPY $38              ; C4 38 | Compare Y register (zero page)
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_557
; Address: $D8AB30
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_557:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ROR $220C,X          ; 7E 0C 22 | Rotate right (absolute,X)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_560
; Address: $D8AB71
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_560:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$0E             ; A9 0E | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_571
; Address: $D8ABE2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_571:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    PHB                  ; 8B | Push data bank register to stack
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$19             ; A9 19 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_573
; Address: $D8ABF8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_573:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STY $220C            ; 8C 0C 22 | Store Y register to absolute address
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_574
; Address: $D8AC05
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_574:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STA $220C            ; 8D 0C 22 | Store accumulator to absolute address
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_575
; Address: $D8AC12
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_575:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STX $220C            ; 8E 0C 22 | Store X register to absolute address
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_576
; Address: $D8AC1F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_576:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STA $D7220C          ; 8F 0C 22 D7 | Store accumulator to absolute long address
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_577
; Address: $D8AC2C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_577:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    BCC $0C              ; 90 0C | Branch if carry clear
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$29             ; A9 29 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_588
; Address: $D8AC9D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_588:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_58A
; Address: $D8ACB3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_58A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STA $220C,Y          ; 99 0C 22 | Store accumulator to absolute,Y
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_58F
; Address: $D8ACDA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_58F:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STZ $220C            ; 9C 0C 22 | Store zero to absolute
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_590
; Address: $D8ACE7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_590:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STA $220C,X          ; 9D 0C 22 | Store accumulator to absolute,X
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_591
; Address: $D8ACF4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_591:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STZ $220C,X          ; 9E 0C 22 | Store zero to absolute,X
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_592
; Address: $D8AD01
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_592:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STA                  ; 9F 0C 4C C4 | Store accumulator to absolute long,X
    SEC                  ; 38 | Set carry flag
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5A0
; Address: $D8AD65
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5A0:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LDX $0C              ; A6 0C | Load from zero page into X register
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5AC
; Address: $D8ADBC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5AC:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LDY $220C            ; AC 0C 22 | Load from absolute address into Y register
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5AD
; Address: $D8ADC9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5AD:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LDA $220C            ; AD 0C 22 | Load from absolute address into accumulator
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5AE
; Address: $D8ADD6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5AE:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LDX $220C            ; AE 0C 22 | Load from absolute address into X register
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5B0
; Address: $D8ADEB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5B0:
    SEC                  ; 38 | Set carry flag
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5C4
; Address: $D8AE6E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5C4:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LDA $220C,Y          ; B9 0C 22 | Load from absolute,Y into accumulator
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5C9
; Address: $D8AE95
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5C9:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LDY $220C,X          ; BC 0C 22 | Load from absolute,X into Y register
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5CC
; Address: $D8AEAF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5CC:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LDX $220C,Y          ; BE 0C 22 | Load from absolute,Y into X register
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5CD
; Address: $D8AEBC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5CD:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LDA                  ; BF 0C 4C C4 | Load from absolute long,X into accumulator
    SEC                  ; 38 | Set carry flag
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5E8
; Address: $D8AF6E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5E8:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    CPY $220C            ; CC 0C 22 | Compare Y register (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5E9
; Address: $D8AF7B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5E9:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    CMP $220C            ; CD 0C 22 | Compare accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5EA
; Address: $D8AF88
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5EA:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    DEC $220C            ; CE 0C 22 | Decrement (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_5EB
; Address: $D8AF95
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_5EB:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_600
; Address: $D8B020
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_600:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    CMP $220C,Y          ; D9 0C 22 | Compare accumulator (absolute,Y)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_601
; Address: $D8B02D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_601:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    PHX                  ; DA | Push X register to stack
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$2A             ; A9 2A | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_607
; Address: $D8B05D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_607:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    CMP $220C,X          ; DD 0C 22 | Compare accumulator (absolute,X)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_608
; Address: $D8B06A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_608:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    DEC $220C,X          ; DE 0C 22 | Decrement (absolute,X)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_615
; Address: $D8B0C5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_615:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    SBC $0C              ; E5 0C | Subtract with carry (zero page)
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$25             ; A9 25 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_623
; Address: $D8B129
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_623:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    CPX $220C            ; EC 0C 22 | Compare X register (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_624
; Address: $D8B136
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_624:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    SBC $4C0C            ; ED 0C 4C | Subtract with carry (absolute)
    CPY $38              ; C4 38 | Compare Y register (zero page)
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_626
; Address: $D8B14C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_626:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    INC $220C            ; EE 0C 22 | Increment (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_631
; Address: $D8B19A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_631:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    PEA #$220C           ; F4 0C 22 | Push effective address to stack
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_638
; Address: $D8B1CE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_638:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_63A
; Address: $D8B1E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_63A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    SBC $220C,Y          ; F9 0C 22 | Subtract with carry (absolute,Y)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_641
; Address: $D8B218
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_641:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    SBC $220C,X          ; FD 0C 22 | Subtract with carry (absolute,X)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_642
; Address: $D8B225
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_642:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    INC $220C,X          ; FE 0C 22 | Increment (absolute,X)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_645
; Address: $D8B23F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_645:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_647
; Address: $D8B250
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_647:
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_649
; Address: $D8B262
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_649:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_64A
; Address: $D8B26F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_64A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_64B
; Address: $D8B27C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_64B:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_650
; Address: $D8B2A3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_650:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_651
; Address: $D8B2B0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_651:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_654
; Address: $D8B2CA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_654:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_655
; Address: $D8B2D7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_655:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_656
; Address: $D8B2E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_656:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_657
; Address: $D8B2F1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_657:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $4C0D            ; 0D 0D 4C | Logical OR with accumulator (absolute)
    CPY $38              ; C4 38 | Compare Y register (zero page)
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_65A
; Address: $D8B307
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_65A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ASL $220D            ; 0E 0D 22 | Arithmetic shift left (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_65B
; Address: $D8B314
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_65B:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_660
; Address: $D8B33B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_660:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_661
; Address: $D8B348
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_661:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_662
; Address: $D8B355
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_662:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_663
; Address: $D8B362
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_663:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $C44C            ; 0D 4C C4 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_665
; Address: $D8B378
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_665:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_666
; Address: $D8B385
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_666:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_667
; Address: $D8B392
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_667:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_668
; Address: $D8B39F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_668:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $220D,Y          ; 19 0D 22 | Logical OR with accumulator (absolute,Y)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_669
; Address: $D8B3AC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_669:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_66C
; Address: $D8B3C6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_66C:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_66D
; Address: $D8B3D3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_66D:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $220D,X          ; 1D 0D 22 | Logical OR with accumulator (absolute,X)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_66E
; Address: $D8B3E0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_66E:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ASL $4C0D,X          ; 1E 0D 4C | Arithmetic shift left (absolute,X)
    CPY $38              ; C4 38 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_66F
; Address: $D8B3E9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_66F:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3405            ; 4C 05 34 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_670
; Address: $D8B3FE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_670:
    JSL $C78B94          ; 22 94 8B C7 | Jump to subroutine long
    JMP $3415            ; 4C 15 34 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDA #$2E             ; A9 2E | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_672
; Address: $D8B418
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_672:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_677
; Address: $D8B43C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_677:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3451            ; 4C 51 34 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_67A
; Address: $D8B454
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_67A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_681
; Address: $D8B488
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_681:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_682
; Address: $D8B495
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_682:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_683
; Address: $D8B4A2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_683:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    AND #$0D             ; 29 0D | Logical AND with accumulator (immediate)
    JMP $38C4            ; 4C C4 38 | Jump to address
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_685
; Address: $D8B4B8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_685:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_686
; Address: $D8B4C5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_686:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_687
; Address: $D8B4D2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_687:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    BIT $220D            ; 2C 0D 22 | Test bits in accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_688
; Address: $D8B4DF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_688:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    AND $220D            ; 2D 0D 22 | Logical AND with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_689
; Address: $D8B4EC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_689:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ROL $220D            ; 2E 0D 22 | Rotate left (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_68A
; Address: $D8B4F9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_68A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_68F
; Address: $D8B520
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_68F:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_690
; Address: $D8B52D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_690:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_691
; Address: $D8B53A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_691:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_692
; Address: $D8B547
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_692:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_693
; Address: $D8B554
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_693:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_694
; Address: $D8B561
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_694:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_695
; Address: $D8B56E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_695:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_696
; Address: $D8B57B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_696:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    AND $220D,Y          ; 39 0D 22 | Logical AND with accumulator (absolute,Y)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_697
; Address: $D8B588
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_697:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_698
; Address: $D8B595
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_698:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_699
; Address: $D8B5A2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_699:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_69A
; Address: $D8B5AF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_69A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    AND $220D,X          ; 3D 0D 22 | Logical AND with accumulator (absolute,X)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_69B
; Address: $D8B5BC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_69B:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ROL $4C0D,X          ; 3E 0D 4C | Rotate left (absolute,X)
    CPY $38              ; C4 38 | Compare Y register (zero page)
    LDA #$2B             ; A9 2B | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_69D
; Address: $D8B5D2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_69D:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_69E
; Address: $D8B5DF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_69E:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6A4
; Address: $D8B606
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6A4:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6A5
; Address: $D8B613
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6A5:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6AA
; Address: $D8B63A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6AA:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6AB
; Address: $D8B647
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6AB:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6AE
; Address: $D8B661
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6AE:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6AF
; Address: $D8B66E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6AF:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $C44C            ; 0D 4C C4 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    LDA #$2D             ; A9 2D | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6B1
; Address: $D8B684
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6B1:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $220D            ; 4C 0D 22 | Jump to address
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6B2
; Address: $D8B691
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6B2:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    EOR $220D            ; 4D 0D 22 | Exclusive OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6B5
; Address: $D8B6AB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6B5:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6BA
; Address: $D8B6D2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6BA:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6BB
; Address: $D8B6DF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6BB:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6BC
; Address: $D8B6EC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6BC:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6BD
; Address: $D8B6F9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6BD:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6BE
; Address: $D8B706
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6BE:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6BF
; Address: $D8B713
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6BF:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6C0
; Address: $D8B720
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6C0:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $C44C            ; 0D 4C C4 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    LDA #$27             ; A9 27 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6C2
; Address: $D8B736
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6C2:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    EOR $220D,Y          ; 59 0D 22 | Exclusive OR with accumulator (absolute,Y)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6C3
; Address: $D8B743
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6C3:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    PHY                  ; 5A | Push Y register to stack
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6C4
; Address: $D8B750
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6C4:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6C7
; Address: $D8B76A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6C7:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    EOR $220D,X          ; 5D 0D 22 | Exclusive OR with accumulator (absolute,X)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6C8
; Address: $D8B777
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6C8:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LSR $220D,X          ; 5E 0D 22 | Logical shift right (absolute,X)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6C9
; Address: $D8B784
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6C9:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6CE
; Address: $D8B7AB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6CE:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $D722            ; 0D 22 D7 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6CF
; Address: $D8B7B8
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6CF:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA $C44C            ; 0D 4C C4 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    LDA $363A            ; AD 3A 36 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $283F            ; 4C 3F 28 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2889            ; 4C 89 28 | Jump to address
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $28D3            ; 4C D3 28 | Jump to address
    CMP #$0C             ; C9 0C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2910            ; 4C 10 29 | Jump to address
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $294D            ; 4C 4D 29 | Jump to address
    CMP #$0E             ; C9 0E | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $29A4            ; 4C A4 29 | Jump to address
    CMP #$0F             ; C9 0F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $29E1            ; 4C E1 29 | Jump to address
    CMP #$15             ; C9 15 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2A38            ; 4C 38 2A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6D0
; Address: $D8B804
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6D0:
    CMP #$16             ; C9 16 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2A82            ; 4C 82 2A | Jump to address
    CMP #$17             ; C9 17 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2ACC            ; 4C CC 2A | Jump to address
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2B23            ; 4C 23 2B | Jump to address
    CMP #$19             ; C9 19 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2B7A            ; 4C 7A 2B | Jump to address
    CMP #$1F             ; C9 1F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2BEB            ; 4C EB 2B | Jump to address
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2C35            ; 4C 35 2C | Jump to address
    CMP #$21             ; C9 21 | PPU graphics register access
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2CA6            ; 4C A6 2C | Jump to address
    CMP #$22             ; C9 22 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2D0A            ; 4C 0A 2D | Jump to address
    CMP #$29             ; C9 29 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2D6E            ; 4C 6E 2D | Jump to address
    CMP #$2A             ; C9 2A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2DEC            ; 4C EC 2D | Jump to address
    CMP #$2B             ; C9 2B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2EC5            ; 4C C5 2E | Jump to address
    CMP #$33             ; C9 33 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2F9E            ; 4C 9E 2F | Jump to address
    CMP #$34             ; C9 34 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3036            ; 4C 36 30 | Jump to address
    CMP #$35             ; C9 35 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $30CE            ; 4C CE 30 | Jump to address
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $313F            ; 4C 3F 31 | Jump to address
    CMP #$37             ; C9 37 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $31D7            ; 4C D7 31 | Jump to address
    CMP #$3D             ; C9 3D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6D1
; Address: $D8B889
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6D1:
    JMP $3255            ; 4C 55 32 | Jump to address
    CMP #$3E             ; C9 3E | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $32FA            ; 4C FA 32 | Jump to address
    CMP #$3F             ; C9 3F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $336B            ; 4C 6B 33 | Jump to address
    CMP #$47             ; C9 47 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $33E9            ; 4C E9 33 | Jump to address
    CMP #$48             ; C9 48 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $34AB            ; 4C AB 34 | Jump to address
    CMP #$49             ; C9 49 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $35C5            ; 4C C5 35 | Jump to address
    CMP #$4A             ; C9 4A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3677            ; 4C 77 36 | Jump to address
    CMP #$4B             ; C9 4B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3729            ; 4C 29 37 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6DA
; Address: $D8B8F3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6DA:
    JSL $CDC62C          ; 22 2C C6 CD | Jump to subroutine long
    LDA #$16             ; A9 16 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6DF
; Address: $D8B90D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6DF:
    JSL $CCD2A4          ; 22 A4 D2 CC | Jump to subroutine long
    LDA #$78             ; A9 78 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$90             ; A2 90 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$40             ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6E0
; Address: $D8B919
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6E0:
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3926            ; 4C 26 39 | Jump to address
    JMP $3929            ; 4C 29 39 | Jump to address
    JMP $390D            ; 4C 0D 39 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6E6
; Address: $D8B941
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6E6:
    JSL $CDE01C          ; 22 1C E0 CD | Jump to subroutine long
    JMP $3978            ; 4C 78 39 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6E7
; Address: $D8B94B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6E7:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $399B            ; 4C 9B 39 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6E8
; Address: $D8B957
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6E8:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $399B            ; 4C 9B 39 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6E9
; Address: $D8B963
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6E9:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $399B            ; 4C 9B 39 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6EA
; Address: $D8B96F
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6EA:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    CLI                  ; 58 | Clear interrupt disable flag
    JMP $399B            ; 4C 9B 39 | Jump to address
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    JMP $3948            ; 4C 48 39 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    JMP $3954            ; 4C 54 39 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    JMP $3960            ; 4C 60 39 | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    JMP $396C            ; 4C 6C 39 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6EB
; Address: $D8B99B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6EB:
    JSL $CDACD7          ; 22 D7 AC CD | Jump to subroutine long
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $39CA            ; 4C CA 39 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6EC
; Address: $D8B9AD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6EC:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    EOR $220B,Y          ; 59 0B 22 | Exclusive OR with accumulator (absolute,Y)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6EE
; Address: $D8B9C0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6EE:
    JSL $CDACD7          ; 22 D7 AC CD | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LSR $35              ; 46 35 | Logical shift right (zero page)
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6F0
; Address: $D8B9D3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6F0:
    JSL $CDAC83          ; 22 83 AC CD | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $3A01            ; 4C 01 3A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6F2
; Address: $D8B9E3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6F2:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $D7220B          ; 5C 0B 22 D7 | Jump to address long
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6F3
; Address: $D8B9F0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6F3:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    EOR $220B,X          ; 5D 0B 22 | Exclusive OR with accumulator (absolute,X)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6F6
; Address: $D8BA05
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6F6:
    JSL $C93117          ; 22 17 31 C9 | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    LDA $362E            ; AD 2E 36 | Load from absolute address into accumulator
    STA $3430            ; 8D 30 34 | Store accumulator to absolute address
    JMP $3A8D            ; 4C 8D 3A | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6F7
; Address: $D8BA54
; Size: 124 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6F7:
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3432            ; 8D 32 34 | Store accumulator to absolute address
    JMP $3AF8            ; 4C F8 3A | Jump to address
    LDA $3430            ; AD 30 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A18            ; 4C 18 3A | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A21            ; 4C 21 3A | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A2A            ; 4C 2A 3A | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A33            ; 4C 33 3A | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A3C            ; 4C 3C 3A | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A45            ; 4C 45 3A | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A4E            ; 4C 4E 3A | Jump to address
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A57            ; 4C 57 3A | Jump to address
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A60            ; 4C 60 3A | Jump to address
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A69            ; 4C 69 3A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6F8
; Address: $D8BAE0
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6F8:
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A72            ; 4C 72 3A | Jump to address
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A7B            ; 4C 7B 3A | Jump to address
    CMP #$0C             ; C9 0C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A84            ; 4C 84 3A | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($CD,X)          ; 01 CD | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $3B18            ; 4C 18 3B | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6F9
; Address: $D8BB0A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6F9:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SBC $A93A,X          ; FD 3A A9 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_6FA
; Address: $D8BB1B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_6FA:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STZ $0B              ; 64 0B | Store zero to zero page
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_701
; Address: $D8BB4B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_701:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_706
; Address: $D8BB70
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_706:
    JSL $CDAC83          ; 22 83 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3B80            ; 4C 80 3B | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_709
; Address: $D8BB84
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_709:
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $3B92            ; 4C 92 3B | Jump to address
    JMP $3B64            ; 4C 64 3B | Jump to address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    STA $3638            ; 8D 38 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_70B
; Address: $D8BB9C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_70B:
    JSL $CCDB33          ; 22 33 DB CC | Jump to subroutine long
    JMP $3CE3            ; 4C E3 3C | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_70E
; Address: $D8BBB3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_70E:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STZ $220B            ; 9C 0B 22 | Store zero to absolute
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CPY $FAA9            ; CC A9 FA | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_70F
; Address: $D8BBC4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_70F:
    JSL $C7315E          ; 22 5E 31 C7 | Jump to subroutine long
    JMP $3D26            ; 4C 26 3D | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_712
; Address: $D8BBDB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_712:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STZ $220B            ; 9C 0B 22 | Store zero to absolute
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CPY $FBA9            ; CC A9 FB | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_713
; Address: $D8BBEC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_713:
    JSL $C7315E          ; 22 5E 31 C7 | Jump to subroutine long
    JMP $3D26            ; 4C 26 3D | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_716
; Address: $D8BC03
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_716:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STZ $220B            ; 9C 0B 22 | Store zero to absolute
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CPY $FCA9            ; CC A9 FC | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_717
; Address: $D8BC14
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_717:
    JSL $C7315E          ; 22 5E 31 C7 | Jump to subroutine long
    JMP $3D26            ; 4C 26 3D | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_71A
; Address: $D8BC2B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_71A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STZ $220B            ; 9C 0B 22 | Store zero to absolute
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CPY $FDA9            ; CC A9 FD | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_71B
; Address: $D8BC3C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_71B:
    JSL $C7315E          ; 22 5E 31 C7 | Jump to subroutine long
    JMP $3D26            ; 4C 26 3D | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_71C
; Address: $D8BC46
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_71C:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STA $220B,Y          ; 99 0B 22 | Store accumulator to absolute,Y
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_720
; Address: $D8BC64
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_720:
    JSL $C7315E          ; 22 5E 31 C7 | Jump to subroutine long
    JMP $3D26            ; 4C 26 3D | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_723
; Address: $D8BC7B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_723:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STZ $220B            ; 9C 0B 22 | Store zero to absolute
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CPY $03A9            ; CC A9 03 | Compare Y register (absolute)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    JMP $3D26            ; 4C 26 3D | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_726
; Address: $D8BCA3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_726:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STZ $220B            ; 9C 0B 22 | Store zero to absolute
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CPY $04A9            ; CC A9 04 | Compare Y register (absolute)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    JMP $3D26            ; 4C 26 3D | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_72A
; Address: $D8BCCF
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_72A:
    STZ $220B            ; 9C 0B 22 | Store zero to absolute
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CPY $05A9            ; CC A9 05 | Compare Y register (absolute)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    JMP $3D26            ; 4C 26 3D | Jump to address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3BA3            ; 4C A3 3B | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3BCB            ; 4C CB 3B | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3BF3            ; 4C F3 3B | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3C1B            ; 4C 1B 3C | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3C43            ; 4C 43 3C | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3C6B            ; 4C 6B 3C | Jump to address
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3C93            ; 4C 93 3C | Jump to address
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3CBB            ; 4C BB 3C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_72D
; Address: $D8BD31
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_72D:
    JSL $C7315E          ; 22 5E 31 C7 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_72F
; Address: $D8BD3A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_72F:
    JSL $C73C23          ; 22 23 3C C7 | Jump to subroutine long
    JMP $3D9B            ; 4C 9B 3D | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3632            ; 8D 32 36 | Store accumulator to absolute address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_730
; Address: $D8BD4A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_730:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ADC #$0B             ; 69 0B | Add with carry (immediate)
    JMP $3DC6            ; 4C C6 3D | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3632            ; 8D 32 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_732
; Address: $D8BD5C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_732:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ROR                  ; 6A | Rotate right (accumulator)
    JMP $3DC6            ; 4C C6 3D | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3632            ; 8D 32 36 | Store accumulator to absolute address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_734
; Address: $D8BD74
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_734:
    JMP $3DC6            ; 4C C6 3D | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $3632            ; 8D 32 36 | Store accumulator to absolute address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_735
; Address: $D8BD80
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_735:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP ($4C0B)          ; 6C 0B 4C | Jump to address (absolute indirect)
    DEC $3D              ; C6 3D | Decrement (zero page)
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $3632            ; 8D 32 36 | Store accumulator to absolute address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_736
; Address: $D8BD92
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_736:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ADC $4C0B            ; 6D 0B 4C | Add with carry (absolute)
    DEC $3D              ; C6 3D | Decrement (zero page)
    LDA $C141            ; AD 41 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3D41            ; 4C 41 3D | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3D53            ; 4C 53 3D | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3D65            ; 4C 65 3D | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3D77            ; 4C 77 3D | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3D89            ; 4C 89 3D | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_738
; Address: $D8BDCA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_738:
    JSL $CC3D37          ; 22 37 3D CC | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_739
; Address: $D8BDD4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_739:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ROR $4C0B            ; 6E 0B 4C | Rotate right (absolute)
    JMP $A941            ; 4C 41 A9 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_73A
; Address: $D8BDE0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_73A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_73C
; Address: $D8BDF0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_73C:
    BVS $0B              ; 70 0B | Branch if overflow set
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_73D
; Address: $D8BDF8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_73D:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ADC ($0B),Y          ; 71 0B | Add with carry ((zero page),Y)
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_73E
; Address: $D8BE04
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_73E:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_73F
; Address: $D8BE10
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_73F:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_740
; Address: $D8BE1C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_740:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_741
; Address: $D8BE28
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_741:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_742
; Address: $D8BE34
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_742:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_743
; Address: $D8BE40
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_743:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_744
; Address: $D8BE4C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_744:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_745
; Address: $D8BE58
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_745:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ADC $4C0B,Y          ; 79 0B 4C | Add with carry (absolute,Y)
    JMP $A941            ; 4C 41 A9 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_746
; Address: $D8BE64
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_746:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_747
; Address: $D8BE70
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_747:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_748
; Address: $D8BE7C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_748:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_749
; Address: $D8BE88
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_749:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ADC $4C0B,X          ; 7D 0B 4C | Add with carry (absolute,X)
    JMP $A941            ; 4C 41 A9 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_74A
; Address: $D8BE94
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_74A:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    ROR $4C0B,X          ; 7E 0B 4C | Rotate right (absolute,X)
    JMP $A941            ; 4C 41 A9 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_74D
; Address: $D8BEAC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_74D:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    BRA $0B              ; 80 0B | Branch always
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_74E
; Address: $D8BEB8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_74E:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STA ($0B,X)          ; 81 0B | Store accumulator to (zero page,X)
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_74F
; Address: $D8BEC4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_74F:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_750
; Address: $D8BED0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_750:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_751
; Address: $D8BEDC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_751:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STY $0B              ; 84 0B | Store Y register to zero page
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_752
; Address: $D8BEE8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_752:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STA $0B              ; 85 0B | Store accumulator to zero page
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_753
; Address: $D8BEF4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_753:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STX $0B              ; 86 0B | Store X register to zero page
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_754
; Address: $D8BF00
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_754:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_755
; Address: $D8BF0C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_755:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_756
; Address: $D8BF18
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_756:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    BIT #$0B             ; 89 0B | Test bits in accumulator (immediate)
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_757
; Address: $D8BF24
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_757:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_758
; Address: $D8BF30
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_758:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    PHB                  ; 8B | Push data bank register to stack
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_759
; Address: $D8BF3C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_759:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STY $4C0B            ; 8C 0B 4C | Store Y register to absolute address
    JMP $A941            ; 4C 41 A9 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_75C
; Address: $D8BF54
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_75C:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STX $4C0B            ; 8E 0B 4C | Store X register to absolute address
    JMP $A941            ; 4C 41 A9 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_75D
; Address: $D8BF60
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_75D:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STA $4C4C0B          ; 8F 0B 4C 4C | Store accumulator to absolute long address
    EOR ($A9,X)          ; 41 A9 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_75E
; Address: $D8BF6C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_75E:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    BCC $0B              ; 90 0B | Branch if carry clear
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_75F
; Address: $D8BF78
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_75F:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    STA ($0B),Y          ; 91 0B | Store accumulator to (zero page),Y
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_760
; Address: $D8BF84
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_760:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_761
; Address: $D8BF90
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_761:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_762
; Address: $D8BF9C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_762:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_763
; Address: $D8BFA8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_763:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_764
; Address: $D8BFB4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_764:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_765
; Address: $D8BFC0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_765:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_766
; Address: $D8BFCC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_766:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    BRA $0B              ; 80 0B | Branch always
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_767
; Address: $D8BFD8
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_767:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP $414C            ; 4C 4C 41 | Jump to address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3DCA            ; 4C CA 3D | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3DD1            ; 4C D1 3D | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_768
; Address: $D8BFF9
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_768:
    JMP $3DDD            ; 4C DD 3D | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3DE9            ; 4C E9 3D | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3DF5            ; 4C F5 3D | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E01            ; 4C 01 3E | Jump to address
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E0D            ; 4C 0D 3E | Jump to address
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E19            ; 4C 19 3E | Jump to address
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E25            ; 4C 25 3E | Jump to address
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E31            ; 4C 31 3E | Jump to address
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E3D            ; 4C 3D 3E | Jump to address
    CMP #$0C             ; C9 0C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E49            ; 4C 49 3E | Jump to address
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E55            ; 4C 55 3E | Jump to address
    CMP #$0E             ; C9 0E | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E61            ; 4C 61 3E | Jump to address
    CMP #$0F             ; C9 0F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E6D            ; 4C 6D 3E | Jump to address
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E79            ; 4C 79 3E | Jump to address
    CMP #$11             ; C9 11 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E85            ; 4C 85 3E | Jump to address
    CMP #$12             ; C9 12 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E91            ; 4C 91 3E | Jump to address
    CMP #$13             ; C9 13 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E9D            ; 4C 9D 3E | Jump to address
    CMP #$14             ; C9 14 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_769
; Address: $D8C07F
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_769:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3EA9            ; 4C A9 3E | Jump to address
    CMP #$15             ; C9 15 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3EB5            ; 4C B5 3E | Jump to address
    CMP #$16             ; C9 16 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3EC1            ; 4C C1 3E | Jump to address
    CMP #$17             ; C9 17 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3ECD            ; 4C CD 3E | Jump to address
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3ED9            ; 4C D9 3E | Jump to address
    CMP #$19             ; C9 19 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3EE5            ; 4C E5 3E | Jump to address
    CMP #$1A             ; C9 1A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3EF1            ; 4C F1 3E | Jump to address
    CMP #$1B             ; C9 1B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3EFD            ; 4C FD 3E | Jump to address
    CMP #$1C             ; C9 1C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F09            ; 4C 09 3F | Jump to address
    CMP #$1D             ; C9 1D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F15            ; 4C 15 3F | Jump to address
    CMP #$1E             ; C9 1E | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F21            ; 4C 21 3F | Jump to address
    CMP #$1F             ; C9 1F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F2D            ; 4C 2D 3F | Jump to address
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F39            ; 4C 39 3F | Jump to address
    CMP #$21             ; C9 21 | PPU graphics register access
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F45            ; 4C 45 3F | Jump to address
    CMP #$22             ; C9 22 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F51            ; 4C 51 3F | Jump to address
    CMP #$23             ; C9 23 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F5D            ; 4C 5D 3F | Jump to address
    CMP #$24             ; C9 24 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F69            ; 4C 69 3F | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_76A
; Address: $D8C104
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_76A:
    CMP #$25             ; C9 25 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F75            ; 4C 75 3F | Jump to address
    CMP #$26             ; C9 26 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F81            ; 4C 81 3F | Jump to address
    CMP #$27             ; C9 27 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F8D            ; 4C 8D 3F | Jump to address
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F99            ; 4C 99 3F | Jump to address
    CMP #$29             ; C9 29 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3FA5            ; 4C A5 3F | Jump to address
    CMP #$2A             ; C9 2A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3FB1            ; 4C B1 3F | Jump to address
    CMP #$2B             ; C9 2B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3FBD            ; 4C BD 3F | Jump to address
    CMP #$2C             ; C9 2C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3FC9            ; 4C C9 3F | Jump to address
    CMP #$2D             ; C9 2D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3FD5            ; 4C D5 3F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_76B
; Address: $D8C14D
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_76B:
    JMP $417D            ; 4C 7D 41 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $41A8            ; 4C A8 41 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $41A8            ; 4C A8 41 | Jump to address
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $41A8            ; 4C A8 41 | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $41A8            ; 4C A8 41 | Jump to address
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $41A8            ; 4C A8 41 | Jump to address
    LDA $3632            ; AD 32 36 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4150            ; 4C 50 41 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_76C
; Address: $D8C18D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_76C:
    JMP $4159            ; 4C 59 41 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4162            ; 4C 62 41 | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $416B            ; 4C 6B 41 | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4174            ; 4C 74 41 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_76E
; Address: $D8C1AC
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_76E:
    JSL $CC414D          ; 22 4D 41 CC | Jump to subroutine long
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$0F             ; A9 0F | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$0E             ; A9 0E | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$0F             ; A9 0F | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$0E             ; A9 0E | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_76F
; Address: $D8C21F
; Size: 133 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_76F:
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$11             ; A9 11 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$15             ; A9 15 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$19             ; A9 19 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$19             ; A9 19 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_770
; Address: $D8C2B5
; Size: 133 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_770:
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$25             ; A9 25 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$27             ; A9 27 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$2D             ; A9 2D | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    JMP $44AA            ; 4C AA 44 | Jump to address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $41AC            ; 4C AC 41 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_771
; Address: $D8C34A
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_771:
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $41B3            ; 4C B3 41 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $41BC            ; 4C BC 41 | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $41C5            ; 4C C5 41 | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $41CE            ; 4C CE 41 | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $41D7            ; 4C D7 41 | Jump to address
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $41E0            ; 4C E0 41 | Jump to address
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $41E9            ; 4C E9 41 | Jump to address
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $41F2            ; 4C F2 41 | Jump to address
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $41FB            ; 4C FB 41 | Jump to address
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4204            ; 4C 04 42 | Hardware register operation
    CMP #$0C             ; C9 0C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $420D            ; 4C 0D 42 | Hardware register operation
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4216            ; 4C 16 42 | Hardware register operation
    CMP #$0E             ; C9 0E | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $421F            ; 4C 1F 42 | Hardware register operation
    CMP #$0F             ; C9 0F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4228            ; 4C 28 42 | Hardware register operation
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4231            ; 4C 31 42 | Hardware register operation
    CMP #$11             ; C9 11 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $423A            ; 4C 3A 42 | Hardware register operation
    CMP #$12             ; C9 12 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_772
; Address: $D8C3CF
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_772:
    JMP $4243            ; 4C 43 42 | Hardware register operation
    CMP #$13             ; C9 13 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $424C            ; 4C 4C 42 | Hardware register operation
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4255            ; 4C 55 42 | Hardware register operation
    CMP #$15             ; C9 15 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $425E            ; 4C 5E 42 | Hardware register operation
    CMP #$16             ; C9 16 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4267            ; 4C 67 42 | Hardware register operation
    CMP #$17             ; C9 17 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4270            ; 4C 70 42 | Hardware register operation
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4279            ; 4C 79 42 | Hardware register operation
    CMP #$19             ; C9 19 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4282            ; 4C 82 42 | Hardware register operation
    CMP #$1A             ; C9 1A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $428B            ; 4C 8B 42 | Hardware register operation
    CMP #$1B             ; C9 1B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4294            ; 4C 94 42 | Hardware register operation
    CMP #$1C             ; C9 1C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $429D            ; 4C 9D 42 | Hardware register operation
    CMP #$1D             ; C9 1D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42A6            ; 4C A6 42 | Hardware register operation
    CMP #$1E             ; C9 1E | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42AF            ; 4C AF 42 | Hardware register operation
    CMP #$1F             ; C9 1F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42B8            ; 4C B8 42 | Hardware register operation
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42C1            ; 4C C1 42 | Hardware register operation
    CMP #$21             ; C9 21 | PPU graphics register access
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42CA            ; 4C CA 42 | Hardware register operation
    CMP #$22             ; C9 22 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42D3            ; 4C D3 42 | Hardware register operation
    CMP #$23             ; C9 23 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_773
; Address: $D8C455
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_773:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42DC            ; 4C DC 42 | Hardware register operation
    CMP #$24             ; C9 24 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42E5            ; 4C E5 42 | Hardware register operation
    CMP #$25             ; C9 25 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42EE            ; 4C EE 42 | Hardware register operation
    CMP #$26             ; C9 26 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42F7            ; 4C F7 42 | Hardware register operation
    CMP #$27             ; C9 27 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4300            ; 4C 00 43 | Jump to address
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4309            ; 4C 09 43 | Jump to address
    CMP #$29             ; C9 29 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4312            ; 4C 12 43 | Jump to address
    CMP #$2A             ; C9 2A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $431B            ; 4C 1B 43 | Jump to address
    CMP #$2B             ; C9 2B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4324            ; 4C 24 43 | Jump to address
    CMP #$2C             ; C9 2C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $432D            ; 4C 2D 43 | Jump to address
    CMP #$2D             ; C9 2D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4336            ; 4C 36 43 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_774
; Address: $D8C4AB
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_774:
    JMP $44DB            ; 4C DB 44 | Jump to address
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4506            ; 4C 06 45 | Jump to address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4506            ; 4C 06 45 | Jump to address
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4506            ; 4C 06 45 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4506            ; 4C 06 45 | Jump to address
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4506            ; 4C 06 45 | Jump to address
    LDA $3632            ; AD 32 36 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_775
; Address: $D8C4DE
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_775:
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $44AE            ; 4C AE 44 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $44B7            ; 4C B7 44 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $44C0            ; 4C C0 44 | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $44C9            ; 4C C9 44 | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $44D2            ; 4C D2 44 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_777
; Address: $D8C50A
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_777:
    JSL $CC44AB          ; 22 AB 44 CC | Jump to subroutine long
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$11             ; A9 11 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_778
; Address: $D8C56E
; Size: 134 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_778:
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$13             ; A9 13 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$11             ; A9 11 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$21             ; A9 21 | PPU graphics register access
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$13             ; A9 13 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$16             ; A9 16 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$27             ; A9 27 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_779
; Address: $D8C604
; Size: 133 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_779:
    LDA #$21             ; A9 21 | PPU graphics register access
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$26             ; A9 26 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$29             ; A9 29 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$2A             ; A9 2A | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$26             ; A9 26 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$2A             ; A9 2A | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$2B             ; A9 2B | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$2D             ; A9 2D | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$21             ; A9 21 | PPU graphics register access
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_77A
; Address: $D8C69A
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_77A:
    JMP $4808            ; 4C 08 48 | Jump to address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $450A            ; 4C 0A 45 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4511            ; 4C 11 45 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $451A            ; 4C 1A 45 | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4523            ; 4C 23 45 | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $452C            ; 4C 2C 45 | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4535            ; 4C 35 45 | Jump to address
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $453E            ; 4C 3E 45 | Jump to address
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4547            ; 4C 47 45 | Jump to address
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4550            ; 4C 50 45 | Jump to address
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4559            ; 4C 59 45 | Jump to address
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4562            ; 4C 62 45 | Jump to address
    CMP #$0C             ; C9 0C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $456B            ; 4C 6B 45 | Jump to address
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4574            ; 4C 74 45 | Jump to address
    CMP #$0E             ; C9 0E | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $457D            ; 4C 7D 45 | Jump to address
    CMP #$0F             ; C9 0F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4586            ; 4C 86 45 | Jump to address
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $458F            ; 4C 8F 45 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_77B
; Address: $D8C720
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_77B:
    CMP #$11             ; C9 11 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4598            ; 4C 98 45 | Jump to address
    CMP #$12             ; C9 12 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45A1            ; 4C A1 45 | Jump to address
    CMP #$13             ; C9 13 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45AA            ; 4C AA 45 | Jump to address
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45B3            ; 4C B3 45 | Jump to address
    CMP #$15             ; C9 15 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45BC            ; 4C BC 45 | Jump to address
    CMP #$16             ; C9 16 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45C5            ; 4C C5 45 | Jump to address
    CMP #$17             ; C9 17 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45CE            ; 4C CE 45 | Jump to address
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45D7            ; 4C D7 45 | Jump to address
    CMP #$19             ; C9 19 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45E0            ; 4C E0 45 | Jump to address
    CMP #$1A             ; C9 1A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45E9            ; 4C E9 45 | Jump to address
    CMP #$1B             ; C9 1B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45F2            ; 4C F2 45 | Jump to address
    CMP #$1C             ; C9 1C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45FB            ; 4C FB 45 | Jump to address
    CMP #$1D             ; C9 1D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4604            ; 4C 04 46 | Jump to address
    CMP #$1E             ; C9 1E | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $460D            ; 4C 0D 46 | Jump to address
    CMP #$1F             ; C9 1F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4616            ; 4C 16 46 | Jump to address
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $461F            ; 4C 1F 46 | Jump to address
    CMP #$21             ; C9 21 | PPU graphics register access
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_77C
; Address: $D8C7A5
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_77C:
    JMP $4628            ; 4C 28 46 | Jump to address
    CMP #$22             ; C9 22 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4631            ; 4C 31 46 | Jump to address
    CMP #$23             ; C9 23 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $463A            ; 4C 3A 46 | Jump to address
    CMP #$24             ; C9 24 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4643            ; 4C 43 46 | Jump to address
    CMP #$25             ; C9 25 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $464C            ; 4C 4C 46 | Jump to address
    CMP #$26             ; C9 26 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4655            ; 4C 55 46 | Jump to address
    CMP #$27             ; C9 27 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $465E            ; 4C 5E 46 | Jump to address
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4667            ; 4C 67 46 | Jump to address
    CMP #$29             ; C9 29 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4670            ; 4C 70 46 | Jump to address
    CMP #$2A             ; C9 2A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4679            ; 4C 79 46 | Jump to address
    CMP #$2B             ; C9 2B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4682            ; 4C 82 46 | Jump to address
    CMP #$2C             ; C9 2C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $468B            ; 4C 8B 46 | Jump to address
    CMP #$2D             ; C9 2D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4694            ; 4C 94 46 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_77D
; Address: $D8C809
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_77D:
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_77F
; Address: $D8C82E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_77F:
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$2D             ; A9 2D | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_784
; Address: $D8C85A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_784:
    JSL $CDAED1          ; 22 D1 AE CD | Jump to subroutine long
    STA $220B,X          ; 9D 0B 22 | Store accumulator to absolute,X
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $1BAD            ; CC AD 1B | Compare Y register (absolute)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $487B            ; 4C 7B 48 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_785
; Address: $D8C874
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_785:
    JSL $CCD2A4          ; 22 A4 D2 CC | Jump to subroutine long
    JMP $4869            ; 4C 69 48 | Jump to address
    LDA $361B            ; AD 1B 36 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $490E            ; 4C 0E 49 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_787
; Address: $D8C88A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_787:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$16             ; C9 16 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $48B6            ; 4C B6 48 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_788
; Address: $D8C89B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_788:
    JSL $CDE073          ; 22 73 E0 CD | Jump to subroutine long
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    LDX #$13             ; A2 13 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_78A
; Address: $D8C8A9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_78A:
    JSL $CDE0D0          ; 22 D0 E0 CD | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    INC                  ; 1A | Increment accumulator
    JMP $48BD            ; 4C BD 48 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_78C
; Address: $D8C8BD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_78C:
    JSL $CDADFB          ; 22 FB AD CD | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$7C             ; C9 7C | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $48D0            ; 4C D0 48 | Jump to address
    JMP $48C1            ; 4C C1 48 | Jump to address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_78D
; Address: $D8C8D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_78D:
    STA $3422            ; 8D 22 34 | Store accumulator to absolute address
    LDA #$0F             ; A9 0F | Load immediate value into accumulator
    STA $3424            ; 8D 24 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_790
; Address: $D8C8E4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_790:
    JSL $CDA745          ; 22 45 A7 CD | Jump to subroutine long
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $48FF            ; 4C FF 48 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_793
; Address: $D8C8FB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_793:
    JSL $CDE0E5          ; 22 E5 E0 CD | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    INC                  ; 1A | Increment accumulator
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $361B            ; 8D 1B 36 | Store accumulator to absolute address
    JMP $4865            ; 4C 65 48 | Jump to address
    JMP $492B            ; 4C 2B 49 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_795
; Address: $D8C915
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_795:
    JSL $CDA745          ; 22 45 A7 CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $493E            ; 4C 3E 49 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $493E            ; 4C 3E 49 | Jump to address
    LDA $361B            ; AD 1B 36 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4911            ; 4C 11 49 | Jump to address
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4922            ; 4C 22 49 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_799
; Address: $D8C953
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_799:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $496D            ; 4C 6D 49 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_79A
; Address: $D8C95C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_79A:
    JSL $CDA73D          ; 22 3D A7 CD | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $361B            ; 8D 1B 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7A0
; Address: $D8C97A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7A0:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $498C            ; 4C 8C 49 | Jump to address
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $361B            ; 8D 1B 36 | Store accumulator to absolute address
    JMP $4990            ; 4C 90 49 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7A2
; Address: $D8C991
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7A2:
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $499F            ; 4C 9F 49 | Jump to address
    JMP $4A0D            ; 4C 0D 4A | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $49AD            ; 4C AD 49 | Jump to address
    JMP $4A0D            ; 4C 0D 4A | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $49BB            ; 4C BB 49 | Jump to address
    JMP $4A0D            ; 4C 0D 4A | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $49C9            ; 4C C9 49 | Jump to address
    JMP $4A0D            ; 4C 0D 4A | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $49D7            ; 4C D7 49 | Jump to address
    JMP $4A0D            ; 4C 0D 4A | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $49E5            ; 4C E5 49 | Jump to address
    JMP $4A0D            ; 4C 0D 4A | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $49F3            ; 4C F3 49 | Jump to address
    JMP $4A0D            ; 4C 0D 4A | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7A3
; Address: $D8C9FB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7A3:
    JMP $4A01            ; 4C 01 4A | Jump to address
    JMP $4A0D            ; 4C 0D 4A | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    INC                  ; 1A | Increment accumulator
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $361B            ; 8D 1B 36 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7A8
; Address: $D8CA21
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7A8:
    STZ $A90B,X          ; 9E 0B A9 | Store zero to absolute,X
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    STA ($49),Y          ; 91 49 | Store accumulator to (zero page),Y
    CPY $AD6B            ; CC 6B AD | Compare Y register (absolute)
    ORA $2936,Y          ; 19 36 29 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4A49            ; 4C 49 4A | Jump to address
    LDA ($0B),Y          ; B1 0B | Load from (zero page),Y into accumulator
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    STA ($49),Y          ; 91 49 | Store accumulator to (zero page),Y
    CPY $A04C            ; CC 4C A0 | Compare Y register (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7A9
; Address: $D8CA49
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7A9:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    LDA $66220B          ; AF 0B 22 66 | Load from absolute long address into accumulator
    LDY $B0CD            ; AC CD B0 | Load from absolute address into Y register
    JMP $4A8F            ; 4C 8F 4A | Jump to address
    BCS $0B              ; B0 0B | Branch if carry set

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7B2
; Address: $D8CA7F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7B2:
    JSL $C74BC2          ; 22 C2 4B C7 | Jump to subroutine long
    LDA ($0B),Y          ; B1 0B | Load from (zero page),Y into accumulator
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7B3
; Address: $D8CA92
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7B3:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    STA ($49),Y          ; 91 49 | Store accumulator to (zero page),Y
    CPY $226B            ; CC 6B 22 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7CD
; Address: $D8CB18
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7CD:
    LDX #$0B             ; A2 0B | Load immediate value into X register
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    STA ($49),Y          ; 91 49 | Store accumulator to (zero page),Y
    CPY $226B            ; CC 6B 22 | Compare Y register (absolute)
    STZ $CCD3            ; 9C D3 CC | Store zero to absolute
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7CE
; Address: $D8CB2B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7CE:
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4B3C            ; 4C 3C 4B | Jump to address
    LDY $4C0B            ; AC 0B 4C | Load from absolute address into Y register
    EOR #$4B             ; 49 4B | Exclusive OR with accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    STA ($49),Y          ; 91 49 | Store accumulator to (zero page),Y
    CPY $226B            ; CC 6B 22 | Compare Y register (absolute)
    SBC $CCD7,Y          ; F9 D7 CC | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7D3
; Address: $D8CB61
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7D3:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$7C             ; A9 7C | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7D8
; Address: $D8CB80
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7D8:
    JSL $CCD937          ; 22 37 D9 CC | Jump to subroutine long
    LDX #$1A             ; A2 1A | Load immediate value into X register
    LDA #$12             ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7E0
; Address: $D8CBAC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7E0:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$24             ; A9 24 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7E8
; Address: $D8CBD6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7E8:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4BE5            ; 4C E5 4B | Jump to address
    LDX $0B              ; A6 0B | Load from zero page into X register
    JMP $4BFB            ; 4C FB 4B | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7EE
; Address: $D8CC03
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7EE:
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    STA ($49),Y          ; 91 49 | Store accumulator to (zero page),Y
    CPY $AD6B            ; CC 6B AD | Compare Y register (absolute)
    INC                  ; 1A | Increment accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4C1B            ; 4C 1B 4C | Jump to address
    LDX $4C0B            ; AE 0B 4C | Load from absolute address into X register
    PLP                  ; 28 | Pull processor status from stack
    JMP $AD00            ; 4C 00 AD | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    STA ($49),Y          ; 91 49 | Store accumulator to (zero page),Y
    CPY $226B            ; CC 6B 22 | Compare Y register (absolute)
    SBC $CCD7,Y          ; F9 D7 CC | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7F4
; Address: $D8CC45
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7F4:
    JSL $CDD687          ; 22 87 D6 CD | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$12             ; C9 12 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $4C5D            ; 4C 5D 4C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7F5
; Address: $D8CC54
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7F5:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    LDY #$0B             ; A0 0B | Load immediate value into Y register
    JMP $4C63            ; 4C 63 4C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7FC
; Address: $D8CC7D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7FC:
    JSL $CDD687          ; 22 87 D6 CD | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$12             ; C9 12 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $4C95            ; 4C 95 4C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_7FD
; Address: $D8CC8C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_7FD:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    LDA ($0B,X)          ; A1 0B | Load from (zero page,X) into accumulator
    JMP $4C9B            ; 4C 9B 4C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_806
; Address: $D8CCBC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_806:
    STA                  ; 9F 0B A9 80 | Store accumulator to absolute long,X
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    STA ($49),Y          ; 91 49 | Store accumulator to (zero page),Y
    CPY $A96B            ; CC 6B A9 | Compare Y register (absolute)
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$11             ; A9 11 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_809
; Address: $D8CCF0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_809:
    JSL $CCD2DA          ; 22 DA D2 CC | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4D2B            ; 4C 2B 4D | Jump to address
    LDA #$58             ; A9 58 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$78             ; A2 78 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$98             ; A0 98 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_80A
; Address: $D8CD08
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_80A:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4D1A            ; 4C 1A 4D | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    EOR $1CAD            ; 4D AD 1C | Exclusive OR with accumulator (absolute)
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $4D28            ; 4C 28 4D | Jump to address
    JMP $4DB5            ; 4C B5 4D | Jump to address
    JMP $4D39            ; 4C 39 4D | Jump to address
    LDA $361C            ; AD 1C 36 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $4D39            ; 4C 39 4D | Jump to address
    JMP $4DB5            ; 4C B5 4D | Jump to address
    JMP $4CF0            ; 4C F0 4C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_80D
; Address: $D8CD44
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_80D:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $4D5D            ; 4C 5D 4D | Jump to address
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$01             ; 69 01 | Add with carry (immediate)
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $4D78            ; 4C 78 4D | Jump to address
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_80E
; Address: $D8CD6B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_80E:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LDA $220B,Y          ; B9 0B 22 | Load from absolute,Y into accumulator
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    STX $004D            ; 8E 4D 00 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_810
; Address: $D8CD84
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_810:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    CPY $F422            ; CC 22 F4 | Compare Y register (absolute)
    LDA $22CD            ; AD CD 22 | Load from absolute address into accumulator
    ORA ($AF,X)          ; 01 AF | Logical OR with accumulator ((zero page,X))
    CMP $8322            ; CD 22 83 | Compare accumulator (absolute)
    CPY $5E22            ; CC 22 5E | Compare Y register (absolute)
    CPY $D122            ; CC 22 D1 | Compare Y register (absolute)
    LDA $A9CD            ; AD CD A9 | Load from absolute address into accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    BEQ $4C              ; F0 4C | Branch if equal
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $4DC9            ; 4C C9 4D | Jump to address
    LDA #$0F             ; A9 0F | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $4E11            ; 4C 11 4E | Jump to address
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$13             ; C9 13 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4DDF            ; 4C DF 4D | Jump to address
    LDA #$0E             ; A9 0E | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $4E11            ; 4C 11 4E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_811
; Address: $D8CDDF
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_811:
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4DF5            ; 4C F5 4D | Jump to address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $4E11            ; 4C 11 4E | Jump to address
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4E0B            ; 4C 0B 4E | Jump to address
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $4E11            ; 4C 11 4E | Jump to address
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_815
; Address: $D8CE28
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_815:
    JSL $C7522F          ; 22 2F 52 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $4E35            ; 4C 35 4E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_818
; Address: $D8CE39
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_818:
    JSL $CDADAB          ; 22 AB AD CD | Jump to subroutine long
    JMP $4E24            ; 4C 24 4E | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_819
; Address: $D8CE41
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_819:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4E52            ; 4C 52 4E | Jump to address
    JMP $4E5B            ; 4C 5B 4E | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_81C
; Address: $D8CE67
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_81C:
    JSL $C752D0          ; 22 D0 52 C7 | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $4E9F            ; 4C 9F 4E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_81F
; Address: $D8CE7F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_81F:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4E9C            ; 4C 9C 4E | Jump to address
    LDA #$58             ; A9 58 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$78             ; A2 78 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_820
; Address: $D8CE8D
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_820:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4E9C            ; 4C 9C 4E | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    JMP ($224E)          ; 6C 4E 22 | Jump to address (absolute indirect)
    SBC ($AE),Y          ; F1 AE | Subtract with carry ((zero page),Y)
    CMP $1AAD            ; CD AD 1A | Compare accumulator (absolute)
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $4EC2            ; 4C C2 4E | Jump to address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$FF             ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_822
; Address: $D8CEB8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_822:
    JSL $CDADFB          ; 22 FB AD CD | Jump to subroutine long
    JMP $4ED7            ; 4C D7 4E | Jump to address
    JMP $4ED7            ; 4C D7 4E | Jump to address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    LDX #$0F             ; A2 0F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_825
; Address: $D8CED0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_825:
    JSL $CDADAB          ; 22 AB AD CD | Jump to subroutine long
    JMP $4E6C            ; 4C 6C 4E | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_827
; Address: $D8CEDB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_827:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4EED            ; 4C ED 4E | Jump to address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $361C            ; 8D 1C 36 | Store accumulator to absolute address
    JMP $4EF1            ; 4C F1 4E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_829
; Address: $D8CEF2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_829:
    JSL $C78FB9          ; 22 B9 8F C7 | Jump to subroutine long
    LDA #$4A             ; A9 4A | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$92             ; A9 92 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$4A             ; A9 4A | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$96             ; A9 96 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_82B
; Address: $D8CF14
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_82B:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$4B             ; A9 4B | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$4B             ; A9 4B | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$01             ; A2 01 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_82C
; Address: $D8CF36
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_82C:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$38             ; A9 38 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$47             ; A9 47 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$3A             ; A9 3A | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$47             ; A9 47 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$01             ; A2 01 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_82D
; Address: $D8CF58
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_82D:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$46             ; A9 46 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$52             ; A9 52 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$46             ; A9 46 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$01             ; A2 01 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_82E
; Address: $D8CF7A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_82E:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$4E             ; A9 4E | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$52             ; A9 52 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$4E             ; A9 4E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_82F
; Address: $D8CF9C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_82F:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$3A             ; A9 3A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_830
; Address: $D8CFA9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_830:
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$3E             ; A9 3E | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_831
; Address: $D8CFBE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_831:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$5A             ; A9 5A | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$0E             ; A9 0E | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$5A             ; A9 5A | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$0F             ; A9 0F | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_832
; Address: $D8CFE0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_832:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$58             ; A9 58 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$5A             ; A9 5A | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_836
; Address: $D8D00F
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_836:
    JSL $CCD2DA          ; 22 DA D2 CC | Jump to subroutine long
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5032            ; 4C 32 50 | Jump to address
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $502F            ; 4C 2F 50 | Jump to address
    JMP $5035            ; 4C 35 50 | Jump to address
    JMP $5032            ; 4C 32 50 | Jump to address
    JMP $506D            ; 4C 6D 50 | Jump to address
    JMP $500F            ; 4C 0F 50 | Jump to address
    LDX $220B,Y          ; BE 0B 22 | Load from absolute,Y into X register
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_837
; Address: $D8D048
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_837:
    LDA #$58             ; A9 58 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$5A             ; A9 5A | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_838
; Address: $D8D066
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_838:
    JSL $C736C8          ; 22 C8 36 C7 | Jump to subroutine long
    JMP $500F            ; 4C 0F 50 | Jump to address
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $5095            ; 4C 95 50 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_83B
; Address: $D8D080
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_83B:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_83D
; Address: $D8D08E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_83D:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    JMP $518A            ; 4C 8A 51 | Jump to address
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $50A9            ; 4C A9 50 | Jump to address
    LDA #$19             ; A9 19 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $518A            ; 4C 8A 51 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_83E
; Address: $D8D0A9
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_83E:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    JMP $512E            ; 4C 2E 51 | Jump to address
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDA #$15             ; A9 15 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5161            ; 4C 61 51 | Jump to address
    LDA #$E0             ; A9 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$48             ; A9 48 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDA #$16             ; A9 16 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5161            ; 4C 61 51 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_83F
; Address: $D8D0DA
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_83F:
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDA #$16             ; A9 16 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5161            ; 4C 61 51 | Jump to address
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDA #$16             ; A9 16 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5161            ; 4C 61 51 | Jump to address
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDA #$16             ; A9 16 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5161            ; 4C 61 51 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5161            ; 4C 61 51 | Jump to address
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$4C             ; C9 4C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $50B0            ; 4C B0 50 | Jump to address
    CMP #$B0             ; C9 B0 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $50C5            ; 4C C5 50 | Jump to address
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    JMP $50DA            ; 4C DA 50 | Jump to address
    CMP #$78             ; C9 78 | Compare accumulator (immediate)
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    JMP $50EF            ; 4C EF 50 | Jump to address
    CMP #$DC             ; C9 DC | Compare accumulator (immediate)
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    JMP $5104            ; 4C 04 51 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_840
; Address: $D8D159
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_840:
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    ASL $D0              ; 06 D0 | Arithmetic shift left (zero page)
    JMP $5119            ; 4C 19 51 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_841
; Address: $D8D161
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_841:
    JSL $CDA7D5          ; 22 D5 A7 CD | Jump to subroutine long
    LDX #$D3             ; A2 D3 | Load immediate value into X register
    ORA ($A0,X)          ; 01 A0 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_848
; Address: $D8D186
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_848:
    JSL $CDA745          ; 22 45 A7 CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_84C
; Address: $D8D19F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_84C:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $528B            ; 4C 8B 52 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$A0             ; A2 A0 | Load immediate value into X register
    LDY #$50             ; A0 50 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_84D
; Address: $D8D1B1
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_84D:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $51C3            ; 4C C3 51 | Jump to address
    LDA #$4C             ; A9 4C | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    JMP $5288            ; 4C 88 52 | Jump to address
    LDA #$E0             ; A9 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$48             ; A0 48 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_84E
; Address: $D8D1CC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_84E:
    JSL $C75365          ; 22 65 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $51DE            ; 4C DE 51 | Jump to address
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    JMP $5288            ; 4C 88 52 | Jump to address
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    BNE $09              ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_850
; Address: $D8D1E7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_850:
    JSL $C75365          ; 22 65 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $51F9            ; 4C F9 51 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    ORA $8D              ; 05 8D | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    JMP $5288            ; 4C 88 52 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX #$A0             ; A2 A0 | Load immediate value into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$30             ; A0 30 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_851
; Address: $D8D202
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_851:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5214            ; 4C 14 52 | Jump to address
    LDA #$78             ; A9 78 | Load immediate value into accumulator
    ORA $8D              ; 05 8D | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    JMP $5288            ; 4C 88 52 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX #$A0             ; A2 A0 | Load immediate value into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$70             ; A0 70 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_852
; Address: $D8D21D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_852:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $522F            ; 4C 2F 52 | Jump to address
    LDA #$DC             ; A9 DC | Load immediate value into accumulator
    ORA $8D              ; 05 8D | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    JMP $5288            ; 4C 88 52 | Jump to address
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    CPX #$09             ; E0 09 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_853
; Address: $D8D238
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_853:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $524A            ; 4C 4A 52 | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ASL $8D              ; 06 8D | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    JMP $5288            ; 4C 88 52 | Jump to address
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$68             ; A2 68 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_855
; Address: $D8D253
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_855:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5265            ; 4C 65 52 | Jump to address
    LDA #$B8             ; A9 B8 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    JMP $5288            ; 4C 88 52 | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $5288            ; 4C 88 52 | Jump to address
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX #$D0             ; A2 D0 | Load immediate value into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_856
; Address: $D8D279
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_856:
    JSL $C75365          ; 22 65 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5288            ; 4C 88 52 | Jump to address
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    JMP $528F            ; 4C 8F 52 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_85B
; Address: $D8D29D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_85B:
    JSL $CCDADF          ; 22 DF DA CC | Jump to subroutine long
    LDA #$4F             ; A9 4F | Load immediate value into accumulator
    LDX #$16             ; A2 16 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_85C
; Address: $D8D2A8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_85C:
    JSL $C75305          ; 22 05 53 C7 | Jump to subroutine long
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$15             ; A9 15 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$51             ; A9 51 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_85D
; Address: $D8D2CA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_85D:
    JSL $C736F7          ; 22 F7 36 C7 | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $52DD            ; 4C DD 52 | Jump to address
    JMP $52CE            ; 4C CE 52 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_85E
; Address: $D8D2DD
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_85E:
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$15             ; A9 15 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$51             ; A9 51 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_86E
; Address: $D8D34D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_86E:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5361            ; 4C 61 53 | Jump to address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    JMP $5368            ; 4C 68 53 | Jump to address
    LDA                  ; BF 0B 22 D2 | Load from absolute long,X into accumulator
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_873
; Address: $D8D37D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_873:
    JSL $C76BE3          ; 22 E3 6B C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $53C0            ; 4C C0 53 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_874
; Address: $D8D386
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_874:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $53C0            ; 4C C0 53 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_875
; Address: $D8D391
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_875:
    JSL $C7556C          ; 22 6C 55 C7 | Jump to subroutine long
    LDA $C12B            ; AD 2B C1 | Load from absolute address into accumulator
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $53AC            ; 4C AC 53 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    JMP $53C0            ; 4C C0 53 | Jump to address
    LDA $C12B            ; AD 2B C1 | Load from absolute address into accumulator
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $53C0            ; 4C C0 53 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    JMP $5379            ; 4C 79 53 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_876
; Address: $D8D3C4
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_876:
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_878
; Address: $D8D3E7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_878:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $53FD            ; 4C FD 53 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_879
; Address: $D8D3F6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_879:
    JSL $CCD2A4          ; 22 A4 D2 CC | Jump to subroutine long
    JMP $53EB            ; 4C EB 53 | Jump to address
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $5411            ; 4C 11 54 | Jump to address
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5415            ; 4C 15 54 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_87A
; Address: $D8D411
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_87A:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_87E
; Address: $D8D42A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_87E:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $543C            ; 4C 3C 54 | Jump to address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    JMP $5440            ; 4C 40 54 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_880
; Address: $D8D441
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_880:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5456            ; 4C 56 54 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_883
; Address: $D8D45D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_883:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5502            ; 4C 02 55 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_885
; Address: $D8D46A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_885:
    JSL $C7522F          ; 22 2F 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $547C            ; 4C 7C 54 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    JMP $5494            ; 4C 94 54 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_886
; Address: $D8D47C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_886:
    JSL $C75203          ; 22 03 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $548E            ; 4C 8E 54 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    JMP $5494            ; 4C 94 54 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_889
; Address: $D8D49C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_889:
    JSL $CCDB33          ; 22 33 DB CC | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $54C1            ; 4C C1 54 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_890
; Address: $D8D4CC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_890:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $54E2            ; 4C E2 54 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_896
; Address: $D8D4F5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_896:
    JSL $C74BC2          ; 22 C2 4B C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    ORA #$55             ; 09 55 | Logical OR with accumulator (immediate)
    CPY $0B              ; C4 0B | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_89B
; Address: $D8D515
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_89B:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5524            ; 4C 24 55 | Jump to address
    JMP $5527            ; 4C 27 55 | Jump to address
    INY                  ; C8 | Increment Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_89E
; Address: $D8D531
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_89E:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $559E            ; 4C 9E 55 | Jump to address
    BNE $0B              ; D0 0B | Branch if not equal
    LDA #$18             ; A9 18 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_89F
; Address: $D8D542
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_89F:
    JSL $C73814          ; 22 14 38 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $554F            ; 4C 4F 55 | Jump to address
    JMP $553F            ; 4C 3F 55 | Jump to address
    JMP $5576            ; 4C 76 55 | Jump to address
    CMP ($0B),Y          ; D1 0B | Compare accumulator ((zero page),Y)
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5591            ; 4C 91 55 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8A0
; Address: $D8D561
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8A0:
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5591            ; 4C 91 55 | Jump to address
    LDA #$21             ; A9 21 | PPU graphics register access
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5591            ; 4C 91 55 | Jump to address
    LDA $C13B            ; AD 3B C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5552            ; 4C 52 55 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $555E            ; 4C 5E 55 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $556A            ; 4C 6A 55 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8A1
; Address: $D8D591
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8A1:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    JMP $55F3            ; 4C F3 55 | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $55B3            ; 4C B3 55 | Jump to address
    CPY $220B            ; CC 0B 22 | Compare Y register (absolute)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8A3
; Address: $D8D5BA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8A3:
    JSL $C75219          ; 22 19 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $55CA            ; 4C CA 55 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8AB
; Address: $D8D5E5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8AB:
    JSL $C74BC2          ; 22 C2 4B C7 | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    CPY $006B            ; CC 6B 00 | Compare Y register (absolute)
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8AC
; Address: $D8D5F8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8AC:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5609            ; 4C 09 56 | Jump to address
    JMP $562A            ; 4C 2A 56 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8AD
; Address: $D8D609
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8AD:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5627            ; 4C 27 56 | Jump to address
    CMP $220B            ; CD 0B 22 | Compare accumulator (absolute)
    LDA $CDAC,X          ; BD AC CD | Load from absolute,X into accumulator
    DEC $A90B            ; CE 0B A9 | Decrement (absolute)
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    CMP $6B0B            ; CD 0B 6B | Compare accumulator (absolute)
    LDX #$3D             ; A2 3D | Load immediate value into X register
    LDA #$3F             ; A9 3F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8AF
; Address: $D8D635
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8AF:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$42             ; A2 42 | Hardware register operation
    LDA #$43             ; A9 43 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8B1
; Address: $D8D643
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8B1:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$46             ; A2 46 | Load immediate value into X register
    LDA #$46             ; A9 46 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8B3
; Address: $D8D651
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8B3:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$48             ; A2 48 | Load immediate value into X register
    LDA #$4C             ; A9 4C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8B5
; Address: $D8D65F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8B5:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$4F             ; A2 4F | Load immediate value into X register
    LDA #$4F             ; A9 4F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8CC
; Address: $D8D6D4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8CC:
    JSL $CDA724          ; 22 24 A7 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8D6
; Address: $D8D70C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8D6:
    LDA #$29             ; A9 29 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$29             ; A9 29 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$57             ; A9 57 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8D7
; Address: $D8D72A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8D7:
    JSL $C736BD          ; 22 BD 36 C7 | Jump to subroutine long
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $576F            ; 4C 6F 57 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8E2
; Address: $D8D768
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8E2:
    JSL $CCD784          ; 22 84 D7 CC | Jump to subroutine long
    JMP $578A            ; 4C 8A 57 | Jump to address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5786            ; 4C 86 57 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8E6
; Address: $D8D78B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8E6:
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$67             ; A9 67 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$5A             ; A9 5A | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$67             ; A9 67 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8E7
; Address: $D8D7A9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8E7:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$66             ; A9 66 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8E8
; Address: $D8D7CB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8E8:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$13             ; A9 13 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$5A             ; A9 5A | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8E9
; Address: $D8D7ED
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8E9:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$5A             ; A9 5A | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$15             ; A9 15 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$5A             ; A9 5A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8EA
; Address: $D8D800
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8EA:
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$66             ; A9 66 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8F1
; Address: $D8D82D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8F1:
    JSL $CDAF01          ; 22 01 AF CD | Jump to subroutine long
    CMP $220B,Y          ; D9 0B 22 | Compare accumulator (absolute,Y)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $5843            ; 4C 43 58 | Jump to address
    PHX                  ; DA | Push X register to stack
    JMP $5846            ; 4C 46 58 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8F3
; Address: $D8D84D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8F3:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8F5
; Address: $D8D85C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8F5:
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $586E            ; 4C 6E 58 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8F6
; Address: $D8D867
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8F6:
    JSL $CCD2A4          ; 22 A4 D2 CC | Jump to subroutine long
    JMP $585C            ; 4C 5C 58 | Jump to address
    LDA #$2B             ; A9 2B | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8FA
; Address: $D8D889
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8FA:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $589B            ; 4C 9B 58 | Jump to address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    JMP $589F            ; 4C 9F 58 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_8FD
; Address: $D8D8A3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_8FD:
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $58AE            ; 4C AE 58 | Jump to address
    JMP $58D5            ; 4C D5 58 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_906
; Address: $D8D8D7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_906:
    CMP $6B0B,X          ; DD 0B 6B | Compare accumulator (absolute,X)
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $58E8            ; 4C E8 58 | Jump to address
    JMP $5926            ; 4C 26 59 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_91B
; Address: $D8D948
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_91B:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank30_DmaFunction_925
; Address: $D8D97D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_925:
    JSL $CCD346          ; 22 46 D3 CC | Jump to subroutine long
    LDX #$1F             ; A2 1F | Load immediate value into X register
    LDA #$17             ; A9 17 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_92D
; Address: $D8D9A6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_92D:
    JSL $CDAFF1          ; 22 F1 AF CD | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$19             ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_92F
; Address: $D8D9B4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_92F:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$14             ; A2 14 | Load immediate value into X register
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank30_DmaFunction_93C
; Address: $D8D9F6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_93C:
    JSL $CC59D6          ; 22 D6 59 CC | Jump to subroutine long
    LDX #$19             ; A2 19 | Load immediate value into X register
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank30_DmaFunction_950
; Address: $D8DA57
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_950:
    JSL $CDB041          ; 22 41 B0 CD | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$FF             ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_955
; Address: $D8DA76
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_955:
    JSL $CDAEF1          ; 22 F1 AE CD | Jump to subroutine long
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$25             ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_95C
; Address: $D8DA9B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_95C:
    JSL $CDAE17          ; 22 17 AE CD | Jump to subroutine long
    LDX #$15             ; A2 15 | Load immediate value into X register
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank30_DmaFunction_95F
; Address: $D8DAAD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_95F:
    JSL $CDAE1E          ; 22 1E AE CD | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$19             ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_968
; Address: $D8DAD6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_968:
    JSL $CDE073          ; 22 73 E0 CD | Jump to subroutine long
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    LDX #$19             ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_97C
; Address: $D8DB38
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_97C:
    JSL $CCD346          ; 22 46 D3 CC | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_97F
; Address: $D8DB4A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_97F:
    JSL $CDAE72          ; 22 72 AE CD | Jump to subroutine long
    LDX #$14             ; A2 14 | Load immediate value into X register
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank30_DmaFunction_98A
; Address: $D8DB81
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_98A:
    JSL $CDAEF1          ; 22 F1 AE CD | Jump to subroutine long
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$25             ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_98D
; Address: $D8DB93
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_98D:
    JSL $CDAF41          ; 22 41 AF CD | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank30_DmaFunction_98F
; Address: $D8DBA1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_98F:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$20             ; A2 20 | Load immediate value into X register
    LDA #$1B             ; A9 1B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9A4
; Address: $D8DC05
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9A4:
    JSL $CDAFF1          ; 22 F1 AF CD | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$19             ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9A6
; Address: $D8DC13
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9A6:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9A8
; Address: $D8DC21
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9A8:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDX #$14             ; A2 14 | Load immediate value into X register
    LDA #$26             ; A9 26 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9AC
; Address: $D8DC38
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9AC:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5C62            ; 4C 62 5C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9B4
; Address: $D8DC67
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9B4:
    JSL $CCD2A4          ; 22 A4 D2 CC | Jump to subroutine long
    JMP $5C67            ; 4C 67 5C | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9B8
; Address: $D8DC7C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9B8:
    JSL $CDAF11          ; 22 11 AF CD | Jump to subroutine long
    LDX #$16             ; A2 16 | Load immediate value into X register
    LDA #$1B             ; A9 1B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9C4
; Address: $D8DCB7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9C4:
    JSL $CDAF61          ; 22 61 AF CD | Jump to subroutine long
    LDX #$18             ; A2 18 | Load immediate value into X register
    LDA #$17             ; A9 17 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9C7
; Address: $D8DCC9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9C7:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    SBC $220B            ; ED 0B 22 | Subtract with carry (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    BIT $CDAE            ; 2C AE CD | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9CF
; Address: $D8DCF5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9CF:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    SBC $220B,Y          ; F9 0B 22 | Subtract with carry (absolute,Y)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    LDX $6BCD            ; AE CD 6B | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9D1
; Address: $D8DD09
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9D1:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDX #$1D             ; A2 1D | Load immediate value into X register
    LDA #$1B             ; A9 1B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9FC
; Address: $D8DDDD
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9FC:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    CPX $220B            ; EC 0B 22 | Compare X register (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    AND $AE              ; 25 AE | Logical AND with accumulator (zero page)
    CMP $7122            ; CD 22 71 | Compare accumulator (absolute)
    LDA $8A22CD          ; AF CD 22 8A | Load from absolute long address into accumulator
    CLD                  ; D8 | Clear decimal mode flag
    CPY $2E22            ; CC 22 2E | Compare Y register (absolute)
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    INC $220B            ; EE 0B 22 | Increment (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    STA ($D8,X)          ; 81 D8 | Store accumulator to (zero page,X)
    CPY $524C            ; CC 4C 52 | Compare Y register (absolute)
    LSR $2E22,X          ; 5E 22 2E | Logical shift right (absolute,X)
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9FD
; Address: $D8DE0A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9FD:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5E19            ; 4C 19 5E | Jump to address
    JMP $5E7F            ; 4C 7F 5E | Jump to address
    JMP $5E1C            ; 4C 1C 5E | Jump to address
    JMP $5E1C            ; 4C 1C 5E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_9FF
; Address: $D8DE22
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_9FF:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5E46            ; 4C 46 5E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A01
; Address: $D8DE31
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A01:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5E40            ; 4C 40 5E | Jump to address
    JMP $5E92            ; 4C 92 5E | Jump to address
    JMP $5E43            ; 4C 43 5E | Jump to address
    JMP $5E49            ; 4C 49 5E | Jump to address
    JMP $5E49            ; 4C 49 5E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A03
; Address: $D8DE49
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A03:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    PEA #$4C0B           ; F4 0B 4C | Push effective address to stack
    LSR $2E22,X          ; 5E 22 2E | Logical shift right (absolute,X)
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A04
; Address: $D8DE58
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A04:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5E7C            ; 4C 7C 5E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A06
; Address: $D8DE67
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A06:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5E76            ; 4C 76 5E | Jump to address
    JMP $5E7F            ; 4C 7F 5E | Jump to address
    JMP $5E79            ; 4C 79 5E | Jump to address
    JMP $5E1C            ; 4C 1C 5E | Jump to address
    JMP $5E7F            ; 4C 7F 5E | Jump to address
    JMP $5E1C            ; 4C 1C 5E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A08
; Address: $D8DE85
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A08:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$29             ; A9 29 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5EDD            ; 4C DD 5E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A17
; Address: $D8DED0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A17:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$2A             ; A9 2A | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $5EDD            ; 4C DD 5E | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A1B
; Address: $D8DEF4
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A1B:
    JSL $CCD2A4          ; 22 A4 D2 CC | Jump to subroutine long
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5F10            ; 4C 10 5F | Jump to address
    JMP $5F58            ; 4C 58 5F | Jump to address
    JMP $5F55            ; 4C 55 5F | Jump to address
    LDA #$F8             ; A9 F8 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$18             ; A0 18 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5F28            ; 4C 28 5F | Jump to address
    JMP $5F58            ; 4C 58 5F | Jump to address
    JMP $5F55            ; 4C 55 5F | Jump to address
    LDA #$F8             ; A9 F8 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$88             ; A0 88 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5F40            ; 4C 40 5F | Jump to address
    JMP $5F58            ; 4C 58 5F | Jump to address
    JMP $5F55            ; 4C 55 5F | Jump to address
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A1C
; Address: $D8DF49
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A1C:
    JSL $C75365          ; 22 65 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5F55            ; 4C 55 5F | Jump to address
    JMP $5F58            ; 4C 58 5F | Jump to address
    JMP $5EF4            ; 4C F4 5E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A1E
; Address: $D8DF5C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A1E:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$45             ; C9 45 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A1F
; Address: $D8DF68
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A1F:
    JMP $5F71            ; 4C 71 5F | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    INC $AD              ; E6 AD | Increment (zero page)
    CMP $E122            ; CD 22 E1 | Compare accumulator (absolute)
    LDX $ADCD            ; AE CD AD | Load from absolute address into X register
    ORA $2936,Y          ; 19 36 29 | Logical OR with accumulator (absolute,Y)
    BPL $00              ; 10 00 | Branch if positive
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5F8D            ; 4C 8D 5F | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A22
; Address: $D8DF94
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A22:
    JSL $CDAF01          ; 22 01 AF CD | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5FDC            ; 4C DC 5F | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A26
; Address: $D8DFB5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A26:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    ORA $220C,Y          ; 19 0C 22 | Logical OR with accumulator (absolute,Y)
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A29
; Address: $D8DFCD
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A29:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    ORA $220C,X          ; 1D 0C 22 | Logical OR with accumulator (absolute,X)
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    ASL $4C0C,X          ; 1E 0C 4C | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA $000C,Y          ; 19 0C 00 | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    ORA $000C,X          ; 1D 0C 00 | Logical OR with accumulator (absolute,X)
    ASL $220C,X          ; 1E 0C 22 | Arithmetic shift left (absolute,X)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $01A9            ; CC A9 01 | Compare Y register (absolute)
    ORA $AD36,Y          ; 19 36 AD | Logical OR with accumulator (absolute,Y)
    ORA $2936,Y          ; 19 36 29 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A32
; Address: $D8E034
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A32:
    JSL $CDADED          ; 22 ED AD CD | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $6047            ; 4C 47 60 | Jump to address
    JMP $6038            ; 4C 38 60 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A33
; Address: $D8E047
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A33:
    JSL $C74C1D          ; 22 1D 4C C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6059            ; 4C 59 60 | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A34
; Address: $D8E059
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A34:
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA $0236,Y          ; 19 36 02 | Logical OR with accumulator (absolute,Y)
    JMP $6047            ; 4C 47 60 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A3B
; Address: $D8E07F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A3B:
    JSL $CDADFB          ; 22 FB AD CD | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $6092            ; 4C 92 60 | Jump to address
    JMP $6083            ; 4C 83 60 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A3C
; Address: $D8E092
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A3C:
    JSL $C74C1D          ; 22 1D 4C C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $60A4            ; 4C A4 60 | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    TAX                  ; AA | Transfer accumulator to X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A3D
; Address: $D8E0A4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A3D:
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA $0236,Y          ; 19 36 02 | Logical OR with accumulator (absolute,Y)
    JMP $6092            ; 4C 92 60 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A3E
; Address: $D8E0AF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A3E:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $60CE            ; 4C CE 60 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A3F
; Address: $D8E0C1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A3F:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A43
; Address: $D8E0DA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A43:
    JSL $66220C          ; 22 0C 22 66 | Jump to subroutine long
    LDY $B0CD            ; AC CD B0 | Load from absolute address into Y register
    JMP $615A            ; 4C 5A 61 | Jump to address
    BIT $0C              ; 24 0C | Test bits in accumulator (zero page)
    AND $0C              ; 25 0C | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A44
; Address: $D8E0EB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A44:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6109            ; 4C 09 61 | Jump to address
    ROL $0C              ; 26 0C | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A45
; Address: $D8E0F7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A45:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6109            ; 4C 09 61 | Jump to address
    LDA #$3D             ; A9 3D | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $6139            ; 4C 39 61 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A46
; Address: $D8E10C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A46:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $611E            ; 4C 1E 61 | Jump to address
    LDA #$3E             ; A9 3E | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $6139            ; 4C 39 61 | Jump to address
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A47
; Address: $D8E121
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A47:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6133            ; 4C 33 61 | Jump to address
    LDA #$3F             ; A9 3F | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $6139            ; 4C 39 61 | Jump to address
    AND #$0C             ; 29 0C | Logical AND with accumulator (immediate)
    JMP $60E8            ; 4C E8 60 | Jump to address
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A4A
; Address: $D8E147
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A4A:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A4B
; Address: $D8E152
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A4B:
    JSR $0C00            ; 20 00 0C | Jump to subroutine
    ROL                  ; 2A | Rotate left (accumulator)
    JMP $6165            ; 4C 65 61 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A4F
; Address: $D8E16A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A4F:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A51
; Address: $D8E178
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A51:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6185            ; 4C 85 61 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A53
; Address: $D8E186
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A53:
    LDA $362C            ; AD 2C 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6198            ; 4C 98 61 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A56
; Address: $D8E19D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A56:
    JSL $CCD2A4          ; 22 A4 D2 CC | Jump to subroutine long
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$A8             ; A2 A8 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$C8             ; A0 C8 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A57
; Address: $D8E1AA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A57:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $61B6            ; 4C B6 61 | Jump to address
    JMP $61B9            ; 4C B9 61 | Jump to address
    JMP $619D            ; 4C 9D 61 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A59
; Address: $D8E1BD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A59:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    BIT $220C            ; 2C 0C 22 | Test bits in accumulator (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPX #$CD             ; E0 CD | Compare X register (immediate)
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A5C
; Address: $D8E1D6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A5C:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    AND $220C            ; 2D 0C 22 | Logical AND with accumulator (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CMP $FA22            ; CD 22 FA | Compare accumulator (absolute)
    CPX #$CD             ; E0 CD | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A5E
; Address: $D8E1EC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A5E:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    BIT $2236            ; 2C 36 22 | Test bits in accumulator (absolute)
    LDY $D2              ; A4 D2 | Load from zero page into Y register
    CPY $F64C            ; CC 4C F6 | Compare Y register (absolute)
    ADC ($6B,X)          ; 61 6B | Add with carry ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A5F
; Address: $D8E1FF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A5F:
    LDA $362D            ; AD 2D 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A60
; Address: $D8E207
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A60:
    JMP $6210            ; 4C 10 62 | Jump to address
    JMP $621C            ; 4C 1C 62 | Jump to address
    ROL $000C            ; 2E 0C 00 | Rotate left (absolute)
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    AND $6B36            ; 2D 36 6B | Logical AND with accumulator (absolute)
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $622F            ; 4C 2F 62 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A61
; Address: $D8E228
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A61:
    JSL $CCD2A4          ; 22 A4 D2 CC | Jump to subroutine long
    JMP $621D            ; 4C 1D 62 | Jump to address
    JMP $6240            ; 4C 40 62 | Jump to address
    JMP $6253            ; 4C 53 62 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A63
; Address: $D8E239
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A63:
    JSL $CDA745          ; 22 45 A7 CD | Jump to subroutine long
    JMP $6253            ; 4C 53 62 | Jump to address
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6232            ; 4C 32 62 | Jump to address
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6235            ; 4C 35 62 | Jump to address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $626A            ; 4C 6A 62 | Jump to address
    LDA #$4B             ; A9 4B | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A66
; Address: $D8E276
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A66:
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$4E             ; A9 4E | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$4F             ; A9 4F | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A67
; Address: $D8E294
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A67:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$2A             ; A9 2A | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A68
; Address: $D8E2A4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A68:
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$2D             ; A9 2D | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A69
; Address: $D8E2B6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A69:
    JSL $C736DB          ; 22 DB 36 C7 | Jump to subroutine long
    LDA $362D            ; AD 2D 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $62D1            ; 4C D1 62 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A78
; Address: $D8E30B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A78:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    AND $2236            ; 2D 36 22 | Logical AND with accumulator (absolute)
    STZ $AE              ; 64 AE | Store zero to zero page
    CMP $1D22            ; CD 22 1D | Compare accumulator (absolute)
    CPY $A96B            ; CC 6B A9 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A79
; Address: $D8E31F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A79:
    JSR $2200            ; 20 00 22 | Jump to subroutine
    JMP $B0C7            ; 4C C7 B0 | Jump to address
    JMP $6333            ; 4C 33 63 | Jump to address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    JMP $6337            ; 4C 37 63 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A7C
; Address: $D8E33B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A7C:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6355            ; 4C 55 63 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A7D
; Address: $D8E344
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A7D:
    JSL $CDA73D          ; 22 3D A7 CD | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A81
; Address: $D8E35F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A81:
    LDA $362D            ; AD 2D 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $636D            ; 4C 6D 63 | Jump to address
    JMP $63DD            ; 4C DD 63 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A9A
; Address: $D8E3DE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A9A:
    LDA $362D            ; AD 2D 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6400            ; 4C 00 64 | Jump to address
    LDA $362D            ; AD 2D 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $63FA            ; 4C FA 63 | Jump to address
    JMP $63FD            ; 4C FD 63 | Jump to address
    AND $4C0C,Y          ; 39 0C 4C | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A9C
; Address: $D8E403
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A9C:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6418            ; 4C 18 64 | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    AND $4C36            ; 2D 36 4C | Logical AND with accumulator (absolute)
    ASL $0064,X          ; 1E 64 00 | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    AND $A90C,Y          ; 39 0C A9 | Logical AND with accumulator (absolute,Y)
    AND $6B36            ; 2D 36 6B | Logical AND with accumulator (absolute)
    LDA $362D            ; AD 2D 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $6434            ; 4C 34 64 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_A9F
; Address: $D8E438
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_A9F:
    JSL $CCD34E          ; 22 4E D3 CC | Jump to subroutine long
    LDX #$35             ; A2 35 | Load immediate value into X register
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AA1
; Address: $D8E447
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AA1:
    JSL $CCD5D8          ; 22 D8 D5 CC | Jump to subroutine long
    LDX #$2F             ; A2 2F | Load immediate value into X register
    LDA #$1D             ; A9 1D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AA3
; Address: $D8E455
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AA3:
    JSL $CCD5D8          ; 22 D8 D5 CC | Jump to subroutine long
    JMP $643D            ; 4C 3D 64 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AA4
; Address: $D8E45D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AA4:
    LDA $362D            ; AD 2D 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $646F            ; 4C 6F 64 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AA8
; Address: $D8E478
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AA8:
    LDA $362D            ; AD 2D 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6491            ; 4C 91 64 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AB0
; Address: $D8E4AE
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AB0:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $64F2            ; 4C F2 64 | Jump to address
    AND $220C,X          ; 3D 0C 22 | Logical AND with accumulator (absolute,X)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $64C5            ; 4C C5 64 | Jump to address
    JMP $652B            ; 4C 2B 65 | Jump to address
    JMP $64EF            ; 4C EF 64 | Jump to address
    ROL $220C,X          ; 3E 0C 22 | Rotate left (absolute,X)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $64D7            ; 4C D7 64 | Jump to address
    JMP $6534            ; 4C 34 65 | Jump to address
    JMP $64EF            ; 4C EF 64 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AB1
; Address: $D8E4DA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AB1:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $64E9            ; 4C E9 64 | Jump to address
    JMP $6540            ; 4C 40 65 | Jump to address
    JMP $64EF            ; 4C EF 64 | Jump to address
    RTI                  ; 40 | Return from interrupt
    JMP $64A7            ; 4C A7 64 | Jump to address
    JMP $652B            ; 4C 2B 65 | Jump to address
    EOR ($0C,X)          ; 41 0C | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AB2
; Address: $D8E4F5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AB2:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6528            ; 4C 28 65 | Jump to address
    WDM #$0C             ; 42 0C | Reserved instruction

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AB3
; Address: $D8E501
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AB3:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6510            ; 4C 10 65 | Jump to address
    JMP $6534            ; 4C 34 65 | Jump to address
    JMP $6525            ; 4C 25 65 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AB4
; Address: $D8E513
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AB4:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6522            ; 4C 22 65 | Jump to address
    JMP $64B3            ; 4C B3 64 | Jump to address
    JMP $6525            ; 4C 25 65 | Jump to address
    JMP $654C            ; 4C 4C 65 | Jump to address
    JMP $652B            ; 4C 2B 65 | Jump to address
    JMP $654C            ; 4C 4C 65 | Jump to address
    LDA #$47             ; A9 47 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $6558            ; 4C 58 65 | Jump to address
    LDA #$48             ; A9 48 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    LSR $0C              ; 46 0C | Logical shift right (zero page)
    JMP $6558            ; 4C 58 65 | Jump to address
    LDA #$49             ; A9 49 | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $6558            ; 4C 58 65 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AB5
; Address: $D8E54C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AB5:
    LDA #$4A             ; A9 4A | Load immediate value into accumulator
    STA $363A            ; 8D 3A 36 | Store accumulator to absolute address
    JMP $6558            ; 4C 58 65 | Jump to address
    EOR $0C              ; 45 0C | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AB6
; Address: $D8E55B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AB6:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    AND $A936            ; 2D 36 A9 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AE5
; Address: $D8E641
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AE5:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $9686            ; 8D 86 96 | Store accumulator to absolute address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    STA $9688            ; 8D 88 96 | Store accumulator to absolute address
    LDX #$03             ; A2 03 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AE7
; Address: $D8E658
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AE7:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $9686            ; 8D 86 96 | Store accumulator to absolute address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    STA $9688            ; 8D 88 96 | Store accumulator to absolute address
    LDX #$04             ; A2 04 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AE9
; Address: $D8E66F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AE9:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $9686            ; 8D 86 96 | Store accumulator to absolute address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    STA $9688            ; 8D 88 96 | Store accumulator to absolute address
    LDX #$05             ; A2 05 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AEB
; Address: $D8E686
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AEB:
    LDA #$E1             ; A9 E1 | Load immediate value into accumulator
    LDX #$31             ; A2 31 | Load immediate value into X register
    LDY #$0A             ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AEC
; Address: $D8E68F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AEC:
    JSL $C01F66          ; 22 66 1F C0 | Jump to subroutine long
    LDA #$F1             ; A9 F1 | Load immediate value into accumulator
    LDX #$71             ; A2 71 | Load immediate value into X register
    LDY #$0A             ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AEF
; Address: $D8E6A5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AEF:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA $FD22            ; 0D 22 FD | Logical OR with accumulator (absolute)
    LDY #$CD             ; A0 CD | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AF0
; Address: $D8E6AF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AF0:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $66C8            ; 4C C8 66 | Jump to address
    JMP $66B9            ; 4C B9 66 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AF2
; Address: $D8E6CC
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AF2:
    JSL $CCD086          ; 22 86 D0 CC | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$B8             ; A9 B8 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $66EB            ; 4C EB 66 | Jump to address
    JMP $66DC            ; 4C DC 66 | Jump to address
    LDA #$78             ; A9 78 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AF3
; Address: $D8E6EE
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AF3:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6707            ; 4C 07 67 | Jump to address
    JMP $66F8            ; 4C F8 66 | Jump to address
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $671C            ; 4C 1C 67 | Jump to address
    JMP $670D            ; 4C 0D 67 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AF5
; Address: $D8E720
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AF5:
    JSL $CCD086          ; 22 86 D0 CC | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6739            ; 4C 39 67 | Jump to address
    JMP $672A            ; 4C 2A 67 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LSR $35              ; 46 35 | Logical shift right (zero page)
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AF6
; Address: $D8E742
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AF6:
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AFA
; Address: $D8E757
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AFA:
    JSL $C7334A          ; 22 4A 33 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $681F            ; 4C 1F 68 | Jump to address
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $681F            ; 4C 1F 68 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LDX #$20             ; A2 20 | Load immediate value into X register
    LDY #$B8             ; A0 B8 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AFB
; Address: $D8E774
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AFB:
    JSL $C75365          ; 22 65 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $681F            ; 4C 1F 68 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AFD
; Address: $D8E781
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AFD:
    JSL $CDA0FD          ; 22 FD A0 CD | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $679A            ; 4C 9A 67 | Jump to address
    JMP $678B            ; 4C 8B 67 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_AFF
; Address: $D8E79E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_AFF:
    JSL $CCD086          ; 22 86 D0 CC | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $67B7            ; 4C B7 67 | Jump to address
    JMP $67A8            ; 4C A8 67 | Jump to address
    LDA #$78             ; A9 78 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B00
; Address: $D8E7BA
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B00:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $67D3            ; 4C D3 67 | Jump to address
    JMP $67C4            ; 4C C4 67 | Jump to address
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B01
; Address: $D8E7DC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B01:
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $67E8            ; 4C E8 67 | Jump to address
    JMP $67D9            ; 4C D9 67 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B03
; Address: $D8E7EC
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B03:
    JSL $CCD086          ; 22 86 D0 CC | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6805            ; 4C 05 68 | Jump to address
    JMP $67F6            ; 4C F6 67 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LSR $35              ; 46 35 | Logical shift right (zero page)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B06
; Address: $D8E821
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B06:
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6830            ; 4C 30 68 | Jump to address
    JMP $6821            ; 4C 21 68 | Jump to address
    LDA #$92             ; A9 92 | Load immediate value into accumulator
    LDX #$20             ; A2 20 | Load immediate value into X register
    LDY #$B0             ; A0 B0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B07
; Address: $D8E839
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B07:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    STA $AD03            ; 8D 03 AD | Store accumulator to absolute address
    LSR $35              ; 46 35 | Logical shift right (zero page)
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $68EC            ; 4C EC 68 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B08
; Address: $D8E84A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B08:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B0A
; Address: $D8E858
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B0A:
    JSL $CC6686          ; 22 86 66 CC | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6871            ; 4C 71 68 | Jump to address
    JMP $6862            ; 4C 62 68 | Jump to address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B0E
; Address: $D8E887
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B0E:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B12
; Address: $D8E89D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B12:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$94             ; A9 94 | Load immediate value into accumulator
    ORA ($8D),Y          ; 11 8D | Logical OR with accumulator ((zero page),Y)
    LDA #$50             ; A9 50 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B13
; Address: $D8E8AA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B13:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B14
; Address: $D8E8B4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B14:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B17
; Address: $D8E8C6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B17:
    JSL $CC74F6          ; 22 F6 74 CC | Jump to subroutine long
    LDA #$70             ; A9 70 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $68DF            ; 4C DF 68 | Jump to address
    JMP $68D0            ; 4C D0 68 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B18
; Address: $D8E8DF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B18:
    JSL $CC750E          ; 22 0E 75 CC | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    JMP $6963            ; 4C 63 69 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B19
; Address: $D8E8EC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B19:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B1B
; Address: $D8E8FA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B1B:
    JSL $CC6686          ; 22 86 66 CC | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6913            ; 4C 13 69 | Jump to address
    JMP $6904            ; 4C 04 69 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B1F
; Address: $D8E924
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B1F:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B20
; Address: $D8E92E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B20:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B23
; Address: $D8E940
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B23:
    JSL $CC74F6          ; 22 F6 74 CC | Jump to subroutine long
    LDA #$70             ; A9 70 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6959            ; 4C 59 69 | Jump to address
    JMP $694A            ; 4C 4A 69 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B24
; Address: $D8E959
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B24:
    JSL $CC750E          ; 22 0E 75 CC | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6972            ; 4C 72 69 | Jump to address
    JMP $6963            ; 4C 63 69 | Jump to address
    JMP $6821            ; 4C 21 68 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B25
; Address: $D8E976
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B25:
    PHA                  ; 48 | Push accumulator to stack
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6987            ; 4C 87 69 | Jump to address
    JMP $6978            ; 4C 78 69 | Jump to address
    LDA #$7C             ; A9 7C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B27
; Address: $D8E98E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B27:
    JSL $CDA876          ; 22 76 A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $69AD            ; 4C AD 69 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B28
; Address: $D8E9A1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B28:
    JSL $CDE1A5          ; 22 A5 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ADC #$22             ; 69 22 | Add with carry (immediate)
    ROR $CDA8,X          ; 7E A8 CD | Rotate right (absolute,X)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B29
; Address: $D8E9B7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B29:
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $69CC            ; 4C CC 69 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B2A
; Address: $D8E9C0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B2A:
    JSL $CDE1B1          ; 22 B1 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ADC #$A9             ; 69 A9 | Add with carry (immediate)
    CLV                  ; B8 | Clear overflow flag
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B2B
; Address: $D8E9D2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B2B:
    JSL $CDA886          ; 22 86 A8 CD | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $69E8            ; 4C E8 69 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B2D
; Address: $D8E9E8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B2D:
    JSL $CDA88E          ; 22 8E A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6A07            ; 4C 07 6A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B2E
; Address: $D8E9FB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B2E:
    JSL $CDE1B1          ; 22 B1 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SBC ($69),Y          ; F1 69 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B2F
; Address: $D8EA07
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B2F:
    JSL $CDA896          ; 22 96 A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6A26            ; 4C 26 6A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B30
; Address: $D8EA1A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B30:
    JSL $CDE1A5          ; 22 A5 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    BPL $6A              ; 10 6A | Branch if positive

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B31
; Address: $D8EA26
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B31:
    JSL $CDA89E          ; 22 9E A8 CD | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6A3F            ; 4C 3F 6A | Jump to address
    JMP $6A30            ; 4C 30 6A | Jump to address
    JMP $6978            ; 4C 78 69 | Jump to address
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B34
; Address: $D8EA4E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B34:
    JSL $C73C23          ; 22 23 3C C7 | Jump to subroutine long
    JMP $6A7D            ; 4C 7D 6A | Jump to address
    LDA #$07             ; A9 07 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B35
; Address: $D8EA58
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B35:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $6AA0            ; 4C A0 6A | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B36
; Address: $D8EA62
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B36:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $6AA0            ; 4C A0 6A | Jump to address
    LDA #$09             ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B37
; Address: $D8EA6C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B37:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $6AA0            ; 4C A0 6A | Jump to address
    LDA #$0A             ; A9 0A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B38
; Address: $D8EA76
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B38:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $6AA0            ; 4C A0 6A | Jump to address
    LDA $C141            ; AD 41 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6A55            ; 4C 55 6A | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6A5F            ; 4C 5F 6A | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6A69            ; 4C 69 6A | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6A73            ; 4C 73 6A | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B39
; Address: $D8EAA2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B39:
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6AB1            ; 4C B1 6A | Jump to address
    JMP $6AA2            ; 4C A2 6A | Jump to address
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $6AC6            ; 4C C6 6A | Jump to address
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B3A
; Address: $D8EABF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B3A:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $6ACD            ; 4C CD 6A | Jump to address
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B3B
; Address: $D8EAC9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B3B:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6ADC            ; 4C DC 6A | Jump to address
    JMP $6ACD            ; 4C CD 6A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B3C
; Address: $D8EADC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B3C:
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $6AF1            ; 4C F1 6A | Jump to address
    LDA #$AF             ; A9 AF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B3D
; Address: $D8EAEA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B3D:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $6AF8            ; 4C F8 6A | Jump to address
    LDA #$AF             ; A9 AF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B3E
; Address: $D8EAF4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B3E:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6B07            ; 4C 07 6B | Jump to address
    JMP $6AF8            ; 4C F8 6A | Jump to address
    JMP $6AA2            ; 4C A2 6A | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B3F
; Address: $D8EB0B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B3F:
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $9686            ; 8D 86 96 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($8D),Y          ; 11 8D | Logical OR with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    LDX #$02             ; A2 02 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B42
; Address: $D8EB26
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B42:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    ORA $FD22            ; 0D 22 FD | Logical OR with accumulator (absolute)
    LDY #$CD             ; A0 CD | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B46
; Address: $D8EB3F
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B46:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA #$C8             ; A9 C8 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    CMP #$F4             ; C9 F4 | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    JMP $6B5E            ; 4C 5E 6B | Jump to address
    JMP $6B4F            ; 4C 4F 6B | Jump to address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6B73            ; 4C 73 6B | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B49
; Address: $D8EB7A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B49:
    JSL $C74A4A          ; 22 4A 4A C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B4A
; Address: $D8EB84
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B4A:
    JSL $C02EC7          ; 22 C7 2E C0 | Jump to subroutine long
    BPL $00              ; 10 00 | Branch if positive
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CMP $CDC6,Y          ; D9 C6 CD | Compare accumulator (absolute,Y)
    LDA #$28             ; A9 28 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B4B
; Address: $D8EB92
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B4B:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B4C
; Address: $D8EB9F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B4C:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B4D
; Address: $D8EBA9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B4D:
    JSL $CCD428          ; 22 28 D4 CC | Jump to subroutine long
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B50
; Address: $D8EBBB
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B50:
    JSL $CCD428          ; 22 28 D4 CC | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6BDA            ; 4C DA 6B | Jump to address
    JMP $6BCB            ; 4C CB 6B | Jump to address
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6BEF            ; 4C EF 6B | Jump to address
    JMP $6BE0            ; 4C E0 6B | Jump to address
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$98             ; C9 98 | Compare accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6BFE            ; 4C FE 6B | Jump to address
    JMP $6BEF            ; 4C EF 6B | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LSR $0C8D            ; 4E 8D 0C | Logical shift right (absolute)
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B51
; Address: $D8EC0A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B51:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6C13            ; 4C 13 6C | Jump to address
    JMP $6C04            ; 4C 04 6C | Jump to address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B55
; Address: $D8EC25
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B55:
    JSL $CDCB37          ; 22 37 CB CD | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B5A
; Address: $D8EC40
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B5A:
    PHA                  ; 48 | Push accumulator to stack
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6C51            ; 4C 51 6C | Jump to address
    JMP $6C42            ; 4C 42 6C | Jump to address
    LDA #$C5             ; A9 C5 | Load immediate value into accumulator
    LDX #$8C             ; A2 8C | Load immediate value into X register
    LDY #$15             ; A0 15 | Load immediate value into Y register
    ORA ($22),Y          ; 11 22 | Logical OR with accumulator ((zero page),Y)
    WDM #$3C             ; 42 3C | Reserved instruction
    PLB                  ; AB | Pull data bank register from stack
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6C6F            ; 4C 6F 6C | Jump to address
    JMP $6C60            ; 4C 60 6C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B5B
; Address: $D8EC6F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B5B:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B5C
; Address: $D8EC79
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B5C:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6C98            ; 4C 98 6C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B5D
; Address: $D8EC8C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B5D:
    JSL $CC74F6          ; 22 F6 74 CC | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    JMP ($50A9)          ; 6C A9 50 | Jump to address (absolute indirect)
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B63
; Address: $D8ECB4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B63:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B64
; Address: $D8ECBE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B64:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$A8             ; C9 A8 | Compare accumulator (immediate)
    ADC ($90,X)          ; 61 90 | Add with carry ((zero page,X))
    JMP $6CD4            ; 4C D4 6C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B66
; Address: $D8ECD4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B66:
    JSL $CC750E          ; 22 0E 75 CC | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B67
; Address: $D8ECDB
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B67:
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6CEA            ; 4C EA 6C | Jump to address
    JMP $6CDB            ; 4C DB 6C | Jump to address
    LDA #$C5             ; A9 C5 | Load immediate value into accumulator
    LDX #$80             ; A2 80 | Load immediate value into X register
    LDY #$50             ; A0 50 | Load immediate value into Y register
    ORA ($22),Y          ; 11 22 | Logical OR with accumulator ((zero page),Y)
    WDM #$3C             ; 42 3C | Reserved instruction
    PLB                  ; AB | Pull data bank register from stack
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$50             ; C9 50 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6D08            ; 4C 08 6D | Jump to address
    JMP $6CF9            ; 4C F9 6C | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B6A
; Address: $D8ED19
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B6A:
    JSL $C73FB8          ; 22 B8 3F C7 | Jump to subroutine long
    LDA $C137            ; AD 37 C1 | Load from absolute address into accumulator
    STA $340E            ; 8D 0E 34 | Store accumulator to absolute address
    LDA $340E            ; AD 0E 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B6D
; Address: $D8ED32
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B6D:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B6E
; Address: $D8ED3C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B6E:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$20             ; C9 20 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B6F
; Address: $D8ED45
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B6F:
    LSR $0390            ; 4E 90 03 | Logical shift right (absolute)
    JMP $6D4F            ; 4C 4F 6D | Jump to address
    JMP $6D40            ; 4C 40 6D | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B72
; Address: $D8ED5A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B72:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    EOR $F6              ; 45 F6 | Exclusive OR with accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6D6A            ; 4C 6A 6D | Jump to address
    JMP $6D5A            ; 4C 5A 6D | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B74
; Address: $D8ED6E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B74:
    JSL $CCD066          ; 22 66 D0 CC | Jump to subroutine long
    LDA #$A8             ; A9 A8 | Load immediate value into accumulator
    ADC ($8D,X)          ; 61 8D | Add with carry ((zero page,X))
    LDA $340E            ; AD 0E 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B75
; Address: $D8ED7B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B75:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    EOR $F6              ; 45 F6 | Exclusive OR with accumulator (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    CPY #$7A             ; C0 7A | Compare Y register (immediate)
    EOR $F6              ; 45 F6 | Exclusive OR with accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6D93            ; 4C 93 6D | Jump to address
    JMP $6D83            ; 4C 83 6D | Jump to address
    LDA #$78             ; A9 78 | Load immediate value into accumulator
    ADC #$8D             ; 69 8D | Add with carry (immediate)
    LDA $340E            ; AD 0E 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B76
; Address: $D8ED9C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B76:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    EOR $F6              ; 45 F6 | Exclusive OR with accumulator (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    CPY #$14             ; C0 14 | Compare Y register (immediate)
    EOR $F6              ; 45 F6 | Exclusive OR with accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6DB4            ; 4C B4 6D | Jump to address
    JMP $6DA4            ; 4C A4 6D | Jump to address
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B78
; Address: $D8EDC0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B78:
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6DCF            ; 4C CF 6D | Jump to address
    JMP $6DC0            ; 4C C0 6D | Jump to address
    LDA #$C5             ; A9 C5 | Load immediate value into accumulator
    LDX #$AA             ; A2 AA | Load immediate value into X register
    LDY #$08             ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B79
; Address: $D8EDD7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B79:
    ORA ($22),Y          ; 11 22 | Logical OR with accumulator ((zero page),Y)
    WDM #$3C             ; 42 3C | Reserved instruction
    PLB                  ; AB | Pull data bank register from stack
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6DED            ; 4C ED 6D | Jump to address
    JMP $6DDE            ; 4C DE 6D | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B7A
; Address: $D8EDED
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B7A:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B7E
; Address: $D8EE03
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B7E:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B7F
; Address: $D8EE0D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B7F:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6E35            ; 4C 35 6E | Jump to address
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6E2E            ; 4C 2E 6E | Jump to address
    LDA #$98             ; A9 98 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B86
; Address: $D8EE48
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B86:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B89
; Address: $D8EE5A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B89:
    JSL $CC750E          ; 22 0E 75 CC | Jump to subroutine long
    LDA #$C9             ; A9 C9 | Load immediate value into accumulator
    LDX #$51             ; A2 51 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B8A
; Address: $D8EE64
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B8A:
    JSL $C72FE9          ; 22 E9 2F C7 | Jump to subroutine long
    LDA #$98             ; A9 98 | Load immediate value into accumulator
    DEC                  ; 3A | Decrement accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B8C
; Address: $D8EE74
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B8C:
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6E80            ; 4C 80 6E | Jump to address
    JMP $6E71            ; 4C 71 6E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B8E
; Address: $D8EE84
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B8E:
    JSL $CDA876          ; 22 76 A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6EA3            ; 4C A3 6E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B8F
; Address: $D8EE97
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B8F:
    JSL $CDE1A5          ; 22 A5 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    STA $226E            ; 8D 6E 22 | Store accumulator to absolute address
    ROR $CDA8,X          ; 7E A8 CD | Rotate right (absolute,X)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6EC2            ; 4C C2 6E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B90
; Address: $D8EEB6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B90:
    JSL $CDE1B1          ; 22 B1 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    LDY $A96E            ; AC 6E A9 | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B91
; Address: $D8EEC8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B91:
    JSL $CDA886          ; 22 86 A8 CD | Jump to subroutine long
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6EDE            ; 4C DE 6E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B93
; Address: $D8EEDE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B93:
    JSL $CDA88E          ; 22 8E A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6EFD            ; 4C FD 6E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B94
; Address: $D8EEF1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B94:
    JSL $CDE1B1          ; 22 B1 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ROR $9622            ; 6E 22 96 | Rotate right (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP $00A9            ; CD A9 00 | Compare accumulator (absolute)
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B95
; Address: $D8EF07
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B95:
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6F1C            ; 4C 1C 6F | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B96
; Address: $D8EF10
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B96:
    JSL $CDE1A5          ; 22 A5 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ASL $6F              ; 06 6F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B97
; Address: $D8EF1C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B97:
    JSL $CDA89E          ; 22 9E A8 CD | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B98
; Address: $D8EF28
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B98:
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    CMP #$C8             ; C9 C8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6F3A            ; 4C 3A 6F | Jump to address
    JMP $6F2B            ; 4C 2B 6F | Jump to address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $33D8            ; 8D D8 33 | Store accumulator to absolute address
    LDX #$CC             ; A2 CC | Load immediate value into X register
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B9A
; Address: $D8EF4D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B9A:
    JSL $C79961          ; 22 61 99 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $6F82            ; 8D 82 6F | Store accumulator to absolute address
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $6F84            ; 8D 84 6F | Store accumulator to absolute address
    LDX $6F82            ; AE 82 6F | Load from absolute address into X register
    LDY $6F84            ; AC 84 6F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B9B
; Address: $D8EF63
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B9B:
    JSL $C97E8D          ; 22 8D 7E C9 | Jump to subroutine long
    LDA #$F4             ; A9 F4 | Load immediate value into accumulator
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6F7C            ; 4C 7C 6F | Jump to address
    JMP $6F6D            ; 4C 6D 6F | Jump to address
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6FEB            ; 4C EB 6F | Jump to address
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6F9C            ; 4C 9C 6F | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B9C
; Address: $D8EF92
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B9C:
    LDA #$7E             ; A9 7E | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    JMP $6FA9            ; 4C A9 6F | Jump to address
    LDA #$7E             ; A9 7E | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $6F82            ; 8D 82 6F | Store accumulator to absolute address
    LDA $6F82            ; AD 82 6F | Load from absolute address into accumulator
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6FCC            ; 4C CC 6F | Jump to address
    LDA $6F82            ; AD 82 6F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B9E
; Address: $D8EFC1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B9E:
    JSL $C97F63          ; 22 63 7F C9 | Jump to subroutine long
    INC $6F82            ; EE 82 6F | Increment (absolute)
    JMP $6FAF            ; 4C AF 6F | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6FE8            ; 4C E8 6F | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_B9F
; Address: $D8EFDB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_B9F:
    JSL $C97F63          ; 22 63 7F C9 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    CMP ($6F),Y          ; D1 6F | Compare accumulator ((zero page),Y)
    JMP $6F7C            ; 4C 7C 6F | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BA2
; Address: $D8EFFC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BA2:
    JSL $C97F9C          ; 22 9C 7F C9 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BA3
; Address: $D8F004
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BA3:
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7013            ; 4C 13 70 | Jump to address
    JMP $7004            ; 4C 04 70 | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BA4
; Address: $D8F016
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BA4:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7084            ; 4C 84 70 | Jump to address
    LDA #$98             ; A9 98 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BA7
; Address: $D8F02F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BA7:
    JSL $C73C23          ; 22 23 3C C7 | Jump to subroutine long
    JMP $705E            ; 4C 5E 70 | Jump to address
    LDA #$0C             ; A9 0C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BA8
; Address: $D8F039
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BA8:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $7081            ; 4C 81 70 | Jump to address
    LDA #$0F             ; A9 0F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BA9
; Address: $D8F043
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BA9:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $7081            ; 4C 81 70 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BAA
; Address: $D8F04D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BAA:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $7081            ; 4C 81 70 | Jump to address
    LDA #$1B             ; A9 1B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BAB
; Address: $D8F057
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BAB:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $7081            ; 4C 81 70 | Jump to address
    LDA $C141            ; AD 41 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7036            ; 4C 36 70 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7040            ; 4C 40 70 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $704A            ; 4C 4A 70 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7054            ; 4C 54 70 | Jump to address
    JMP $701A            ; 4C 1A 70 | Jump to address
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$78             ; C9 78 | Compare accumulator (immediate)
    ADC #$90             ; 69 90 | Add with carry (immediate)
    JMP $7093            ; 4C 93 70 | Jump to address
    JMP $7084            ; 4C 84 70 | Jump to address
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $70AF            ; 4C AF 70 | Jump to address
    LDA #$AB             ; A9 AB | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BAD
; Address: $D8F0A8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BAD:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $7093            ; 4C 93 70 | Jump to address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$32             ; A2 32 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BAF
; Address: $D8F0BA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BAF:
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    BPL $8D              ; 10 8D | Branch if positive
    STX $96              ; 86 96 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BB0
; Address: $D8F0C0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BB0:
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $9688            ; 8D 88 96 | Store accumulator to absolute address
    LDX #$07             ; A2 07 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BB3
; Address: $D8F0D5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BB3:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA $3C22            ; 0D 22 3C | Logical OR with accumulator (absolute)
    CMP $5222            ; CD 22 52 | Compare accumulator (absolute)
    CMP $D222            ; CD 22 D2 | Compare accumulator (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    PHX                  ; DA | Push X register to stack
    CMP $3AA9            ; CD A9 3A | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BB4
; Address: $D8F0EE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BB4:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BB5
; Address: $D8F0F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BB5:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BB8
; Address: $D8F10A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BB8:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LSR $028D            ; 4E 8D 02 | Logical shift right (absolute)
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7123            ; 4C 23 71 | Jump to address
    JMP $7114            ; 4C 14 71 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BB9
; Address: $D8F123
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BB9:
    JSL $CDDA82          ; 22 82 DA CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BBB
; Address: $D8F134
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BBB:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7141            ; 4C 41 71 | Jump to address
    JMP $7131            ; 4C 31 71 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BBF
; Address: $D8F14F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BBF:
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $715E            ; 4C 5E 71 | Jump to address
    JMP $714F            ; 4C 4F 71 | Jump to address
    LDA #$C6             ; A9 C6 | Load immediate value into accumulator
    LDX #$51             ; A2 51 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BC1
; Address: $D8F167
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BC1:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    LDY $AD02            ; AC 02 AD | Load from absolute address into Y register
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $717C            ; 4C 7C 71 | Jump to address
    JMP $716D            ; 4C 6D 71 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BC2
; Address: $D8F17C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BC2:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BC6
; Address: $D8F192
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BC6:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BC8
; Address: $D8F1A0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BC8:
    JSL $CC74F6          ; 22 F6 74 CC | Jump to subroutine long
    LDA #$B8             ; A9 B8 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BCB
; Address: $D8F1B2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BCB:
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $71C1            ; 4C C1 71 | Jump to address
    JMP $71B2            ; 4C B2 71 | Jump to address
    LDA #$C6             ; A9 C6 | Load immediate value into accumulator
    LDX #$48             ; A2 48 | Load immediate value into X register
    BPL $A0              ; 10 A0 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BCC
; Address: $D8F1CA
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BCC:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    LDY $AD02            ; AC 02 AD | Load from absolute address into Y register
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $71DF            ; 4C DF 71 | Jump to address
    JMP $71D0            ; 4C D0 71 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BCF
; Address: $D8F1F0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BCF:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    STZ $F645,X          ; 9E 45 F6 | Store zero to absolute,X
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    CPY #$9E             ; C0 9E | Compare Y register (immediate)
    EOR $F6              ; 45 F6 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BD0
; Address: $D8F1FF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BD0:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7208            ; 4C 08 72 | Jump to address
    JMP $71F8            ; 4C F8 71 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BD4
; Address: $D8F216
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BD4:
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7225            ; 4C 25 72 | Jump to address
    JMP $7216            ; 4C 16 72 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BD5
; Address: $D8F22B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BD5:
    JSL $C9A0CF          ; 22 CF A0 C9 | Jump to subroutine long
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    CMP #$1F             ; C9 1F | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $724C            ; 4C 4C 72 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BD6
; Address: $D8F23A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BD6:
    JSL $C9A1DE          ; 22 DE A1 C9 | Jump to subroutine long
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$01             ; 69 01 | Add with carry (immediate)
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    JMP $722F            ; 4C 2F 72 | Jump to address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    LSR $0390            ; 4E 90 03 | Logical shift right (absolute)
    JMP $725F            ; 4C 5F 72 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BD7
; Address: $D8F257
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BD7:
    JSL $C9A1DE          ; 22 DE A1 C9 | Jump to subroutine long
    JMP $724C            ; 4C 4C 72 | Jump to address
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $727E            ; 4C 7E 72 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BD8
; Address: $D8F26C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BD8:
    JSL $C9A1DE          ; 22 DE A1 C9 | Jump to subroutine long
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    JMP $725F            ; 4C 5F 72 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BD9
; Address: $D8F27E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BD9:
    JSL $C9A1C3          ; 22 C3 A1 C9 | Jump to subroutine long
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BE0
; Address: $D8F2A5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BE0:
    JSL $C75203          ; 22 03 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $72B5            ; 4C B5 72 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BE2
; Address: $D8F2B5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BE2:
    JSL $C75219          ; 22 19 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $72C5            ; 4C C5 72 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BEC
; Address: $D8F2E6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BEC:
    JSL $C75203          ; 22 03 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $72F6            ; 4C F6 72 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BF4
; Address: $D8F30E
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BF4:
    JSL $CCD74C          ; 22 4C D7 CC | Jump to subroutine long
    LDA $3428            ; AD 28 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$08             ; 69 08 | Add with carry (immediate)
    STA $3428            ; 8D 28 34 | Store accumulator to absolute address
    LDA $3426            ; AD 26 34 | Load from absolute address into accumulator
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA $3428            ; AD 28 34 | Load from absolute address into accumulator
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$A0             ; A2 A0 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BF8
; Address: $D8F33B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BF8:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7374            ; 4C 74 73 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BFA
; Address: $D8F357
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BFA:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_BFC
; Address: $D8F368
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_BFC:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C07
; Address: $D8F3AA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C07:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $73CD            ; 4C CD 73 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C09
; Address: $D8F3C1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C09:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    BCS $73              ; B0 73 | Branch if carry set
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C0B
; Address: $D8F3CF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C0B:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $73FD            ; 4C FD 73 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C0F
; Address: $D8F3F1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C0F:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C11
; Address: $D8F404
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C11:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7427            ; 4C 27 74 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C13
; Address: $D8F41B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C13:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C14
; Address: $D8F429
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C14:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $744C            ; 4C 4C 74 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C16
; Address: $D8F440
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C16:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C22
; Address: $D8F488
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C22:
    JSL $C75612          ; 22 12 56 C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C23
; Address: $D8F493
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C23:
    JSL $C75612          ; 22 12 56 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C24
; Address: $D8F49E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C24:
    JSL $C75612          ; 22 12 56 C7 | Jump to subroutine long
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C27
; Address: $D8F4B0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C27:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $74BF            ; 4C BF 74 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C29
; Address: $D8F4C0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C29:
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $74CF            ; 4C CF 74 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C2E
; Address: $D8F4E4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C2E:
    JSL $CAE62A          ; 22 2A E6 CA | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C2F
; Address: $D8F4EE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C2F:
    JSL $C02EC7          ; 22 C7 2E C0 | Jump to subroutine long
    ADC #$02             ; 69 02 | Add with carry (immediate)
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C31
; Address: $D8F4FC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C31:
    JMP $7503            ; 4C 03 75 | Jump to address
    JMP $74F6            ; 4C F6 74 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C32
; Address: $D8F505
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C32:
    JSL $C73E69          ; 22 69 3E C7 | Jump to subroutine long
    JMP $7505            ; 4C 05 75 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C38
; Address: $D8F52A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C38:
    JSL $C73ED4          ; 22 D4 3E C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $753B            ; 4C 3B 75 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C3D
; Address: $D8F54A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C3D:
    JSL $C73EDF          ; 22 DF 3E C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $755B            ; 4C 5B 75 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C40
; Address: $D8F561
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C40:
    JSL $C73EF0          ; 22 F0 3E C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7572            ; 4C 72 75 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C43
; Address: $D8F578
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C43:
    JSL $C73ED4          ; 22 D4 3E C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7585            ; 4C 85 75 | Jump to address
    JMP $7578            ; 4C 78 75 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C49
; Address: $D8F59F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C49:
    LDA $3618            ; AD 18 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $75B7            ; 4C B7 75 | Jump to address
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C4A
; Address: $D8F5B0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C4A:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    JMP $75C1            ; 4C C1 75 | Jump to address
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C5E
; Address: $D8F61A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C5E:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BMI $22              ; 30 22 | Branch if negative
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C62
; Address: $D8F635
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C62:
    LDA #$81             ; A9 81 | Load immediate value into accumulator
    LDX $3426            ; AE 26 34 | Load from absolute address into X register
    LDY $3428            ; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C6B
; Address: $D8F664
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C6B:
    LDA #$81             ; A9 81 | Load immediate value into accumulator
    LDX $3430            ; AE 30 34 | Load from absolute address into X register
    LDY $3432            ; AC 32 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C74
; Address: $D8F692
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C74:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BMI $22              ; 30 22 | Branch if negative
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C78
; Address: $D8F6AD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C78:
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX $3426            ; AE 26 34 | Load from absolute address into X register
    LDY $3428            ; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C81
; Address: $D8F6DC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C81:
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX $3430            ; AE 30 34 | Load from absolute address into X register
    LDY $3432            ; AC 32 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C8C
; Address: $D8F713
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C8C:
    LDA #$82             ; A9 82 | Load immediate value into accumulator
    LDX $3426            ; AE 26 34 | Load from absolute address into X register
    LDY $3428            ; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C8D
; Address: $D8F71C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C8D:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    STX $03              ; 86 03 | Store X register to zero page
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_C98
; Address: $D8F74D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_C98:
    JSL $CDA7A5          ; 22 A5 A7 CD | Jump to subroutine long
    LDA #$84             ; A9 84 | Load immediate value into accumulator
    LDX $3426            ; AE 26 34 | Load from absolute address into X register
    LDY $3428            ; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CA3
; Address: $D8F788
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CA3:
    JSL $C73E89          ; 22 89 3E C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CA4
; Address: $D8F793
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CA4:
    JSL $C73E89          ; 22 89 3E C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CA5
; Address: $D8F79E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CA5:
    JSL $C73E89          ; 22 89 3E C7 | Jump to subroutine long
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CA9
; Address: $D8F7B8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CA9:
    JSL $C73E69          ; 22 69 3E C7 | Jump to subroutine long
    JMP $77B8            ; 4C B8 77 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CAA
; Address: $D8F7C1
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CAA:
    JSL $CC9106          ; 22 06 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $77D0            ; 4C D0 77 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LSR $35              ; 46 35 | Logical shift right (zero page)
    LDA $9850            ; AD 50 98 | Load from absolute address into accumulator
    CMP #$44             ; C9 44 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7800            ; 4C 00 78 | Jump to address
    LDA $3549            ; AD 49 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7800            ; 4C 00 78 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7800            ; 4C 00 78 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CAB
; Address: $D8F7F1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CAB:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7800            ; 4C 00 78 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CAD
; Address: $D8F801
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CAD:
    JSL $CC926F          ; 22 6F 92 CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7810            ; 4C 10 78 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ROL $6B35,X          ; 3E 35 6B | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CAE
; Address: $D8F811
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CAE:
    JSL $CC8A5E          ; 22 5E 8A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7824            ; 4C 24 78 | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CB0
; Address: $D8F825
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CB0:
    JSL $CC8231          ; 22 31 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $78BD            ; 4C BD 78 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $783C            ; 4C 3C 78 | Jump to address
    JMP $78BD            ; 4C BD 78 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $784E            ; 4C 4E 78 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CB1
; Address: $D8F847
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CB1:
    JSL $CC9C0F          ; 22 0F 9C CC | Jump to subroutine long
    JMP $78BD            ; 4C BD 78 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7860            ; 4C 60 78 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CB2
; Address: $D8F859
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CB2:
    JSL $CC9BF2          ; 22 F2 9B CC | Jump to subroutine long
    JMP $78BD            ; 4C BD 78 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7872            ; 4C 72 78 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CB3
; Address: $D8F86B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CB3:
    JSL $CC9BC0          ; 22 C0 9B CC | Jump to subroutine long
    JMP $78BD            ; 4C BD 78 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7884            ; 4C 84 78 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CB4
; Address: $D8F87D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CB4:
    JSL $CC9BA3          ; 22 A3 9B CC | Jump to subroutine long
    JMP $78BD            ; 4C BD 78 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7896            ; 4C 96 78 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CB6
; Address: $D8F893
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CB6:
    JMP $78BD            ; 4C BD 78 | Jump to address
    LDA $3547            ; AD 47 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $78BD            ; 4C BD 78 | Jump to address
    LDA $3549            ; AD 49 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $78BD            ; 4C BD 78 | Jump to address
    LDA $3549            ; AD 49 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $78BD            ; 4C BD 78 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CB7
; Address: $D8F8BE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CB7:
    JSL $CDDFAF          ; 22 AF DF CD | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CB9
; Address: $D8F8DF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CB9:
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $78FC            ; 4C FC 78 | Jump to address
    LDA $9850            ; AD 50 98 | Load from absolute address into accumulator
    CMP #$4F             ; C9 4F | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $78F8            ; 4C F8 78 | Jump to address
    JMP $78FC            ; 4C FC 78 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CBB
; Address: $D8F8FD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CBB:
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $791A            ; 4C 1A 79 | Jump to address
    LDA $9850            ; AD 50 98 | Load from absolute address into accumulator
    CMP #$4D             ; C9 4D | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7916            ; 4C 16 79 | Jump to address
    JMP $791A            ; 4C 1A 79 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CBE
; Address: $D8F91E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CBE:
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7935            ; 4C 35 79 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7935            ; 4C 35 79 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CC0
; Address: $D8F936
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CC0:
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    LDA $3553            ; AD 53 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7959            ; 4C 59 79 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CC1
; Address: $D8F95A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CC1:
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7978            ; 4C 78 79 | Jump to address
    LDA $3554            ; AD 54 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7978            ; 4C 78 79 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CC4
; Address: $D8F979
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CC4:
    LDA $9850            ; AD 50 98 | Load from absolute address into accumulator
    CMP #$76             ; C9 76 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7995            ; 4C 95 79 | Jump to address
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7995            ; 4C 95 79 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CC5
; Address: $D8F996
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CC5:
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $79B0            ; 4C B0 79 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $79B0            ; 4C B0 79 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CC8
; Address: $D8F9B4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CC8:
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $79D6            ; 4C D6 79 | Jump to address
    LDA $3558            ; AD 58 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $79D0            ; 4C D0 79 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    EOR $4C35,Y          ; 59 35 4C | Exclusive OR with accumulator (absolute,Y)
    ADC $80A9,Y          ; 79 A9 80 | Add with carry (absolute,Y)
    CLI                  ; 58 | Clear interrupt disable flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CC9
; Address: $D8F9D7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CC9:
    JSL $CC8FB8          ; 22 B8 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $79E4            ; 4C E4 79 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CCB
; Address: $D8F9E5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CCB:
    JSL $CC8FB8          ; 22 B8 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $79F6            ; 4C F6 79 | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CCE
; Address: $D8F9F7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CCE:
    JSL $C79190          ; 22 90 91 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7A04            ; 4C 04 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7A05            ; 4C 05 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CCF
; Address: $D8FA06
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CCF:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7A13            ; 4C 13 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7A14            ; 4C 14 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CD0
; Address: $D8FA15
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CD0:
    LDA $353D            ; AD 3D 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7A24            ; 4C 24 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7A25            ; 4C 25 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CD1
; Address: $D8FA26
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CD1:
    LDA $353D            ; AD 3D 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7A35            ; 4C 35 7A | Jump to address
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CD2
; Address: $D8FA32
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CD2:
    JMP $7A36            ; 4C 36 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CD3
; Address: $D8FA37
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CD3:
    JSL $CC7A15          ; 22 15 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7A44            ; 4C 44 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7A52            ; 4C 52 7A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CD4
; Address: $D8FA44
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CD4:
    JSL $CC7A26          ; 22 26 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7A51            ; 4C 51 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7A52            ; 4C 52 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CD5
; Address: $D8FA53
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CD5:
    LDA $3628            ; AD 28 36 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7A62            ; 4C 62 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7A63            ; 4C 63 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CD6
; Address: $D8FA64
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CD6:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDX #$41             ; A2 41 | Load immediate value into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CD7
; Address: $D8FA70
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CD7:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7A7D            ; 4C 7D 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7A7E            ; 4C 7E 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CD8
; Address: $D8FA7F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CD8:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDX #$81             ; A2 81 | Load immediate value into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CD9
; Address: $D8FA8B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CD9:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7A98            ; 4C 98 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7A99            ; 4C 99 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CDA
; Address: $D8FA9A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CDA:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7AB3            ; 4C B3 7A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CDC
; Address: $D8FAA9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CDC:
    JMP $7AB0            ; 4C B0 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7AC1            ; 4C C1 7A | Jump to address
    JMP $7AC0            ; 4C C0 7A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CDD
; Address: $D8FAB3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CDD:
    JSL $CC7D1C          ; 22 1C 7D CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7AC0            ; 4C C0 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7AC1            ; 4C C1 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CDE
; Address: $D8FAC2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CDE:
    JSL $CC7B6F          ; 22 6F 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7ADB            ; 4C DB 7A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CDF
; Address: $D8FACB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CDF:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7AD8            ; 4C D8 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7AE9            ; 4C E9 7A | Jump to address
    JMP $7AE8            ; 4C E8 7A | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CE0
; Address: $D8FADB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CE0:
    JSL $CC7D1C          ; 22 1C 7D CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7AE8            ; 4C E8 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7AE9            ; 4C E9 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CE1
; Address: $D8FAEA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CE1:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDX #$01             ; A2 01 | Load immediate value into X register
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CE2
; Address: $D8FAF6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CE2:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7B03            ; 4C 03 7B | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7B04            ; 4C 04 7B | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CE3
; Address: $D8FB05
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CE3:
    JSL $CC7B6F          ; 22 6F 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7B1B            ; 4C 1B 7B | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CE4
; Address: $D8FB0E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CE4:
    JSL $CC7AEA          ; 22 EA 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7B18            ; 4C 18 7B | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7B1C            ; 4C 1C 7B | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CE7
; Address: $D8FB26
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CE7:
    JSL $CC7A7F          ; 22 7F 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7B33            ; 4C 33 7B | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7B34            ; 4C 34 7B | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CE9
; Address: $D8FB3B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CE9:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7B4B            ; 4C 4B 7B | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7B59            ; 4C 59 7B | Jump to address
    JMP $7B58            ; 4C 58 7B | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CEA
; Address: $D8FB4B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CEA:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7B58            ; 4C 58 7B | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7B59            ; 4C 59 7B | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CEB
; Address: $D8FB5A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CEB:
    JSL $C76F8C          ; 22 8C 6F C7 | Jump to subroutine long
    LDA $C13F            ; AD 3F C1 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7B6D            ; 4C 6D 7B | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7B6E            ; 4C 6E 7B | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CEC
; Address: $D8FB6F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CEC:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDX #$01             ; A2 01 | Load immediate value into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CED
; Address: $D8FB7B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CED:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7B88            ; 4C 88 7B | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7B89            ; 4C 89 7B | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CEE
; Address: $D8FB8A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CEE:
    JSL $CC7B5A          ; 22 5A 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7BA0            ; 4C A0 7B | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CEF
; Address: $D8FB93
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CEF:
    JSL $CC7B6F          ; 22 6F 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7B9D            ; 4C 9D 7B | Jump to address
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CF0
; Address: $D8FB9D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CF0:
    JMP $7BA1            ; 4C A1 7B | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CF1
; Address: $D8FBA2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CF1:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7BDE            ; 4C DE 7B | Jump to address
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($A2,X)          ; C1 A2 | Compare accumulator ((zero page,X))
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CF2
; Address: $D8FBC3
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CF2:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7BD6            ; 4C D6 7B | Jump to address
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    LDX $AD7B            ; AE 7B AD | Load from absolute address into X register
    ROL $C934,X          ; 3E 34 C9 | Rotate left (absolute,X)
    INX                  ; E8 | Increment X register
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7BED            ; 4C ED 7B | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7BEE            ; 4C EE 7B | Jump to address
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CF4
; Address: $D8FBF1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CF4:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7C44            ; 4C 44 7C | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7C35            ; 4C 35 7C | Jump to address
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($A2,X)          ; C1 A2 | Compare accumulator ((zero page,X))
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CF5
; Address: $D8FC1A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CF5:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7C2D            ; 4C 2D 7C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CF6
; Address: $D8FC23
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CF6:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ORA $7C              ; 05 7C | Logical OR with accumulator (zero page)
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7C44            ; 4C 44 7C | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7C45            ; 4C 45 7C | Jump to address
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CF8
; Address: $D8FC4D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CF8:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7C5A            ; 4C 5A 7C | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7C5B            ; 4C 5B 7C | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CFA
; Address: $D8FC62
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CFA:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7C6F            ; 4C 6F 7C | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7C70            ; 4C 70 7C | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CFC
; Address: $D8FC77
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CFC:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7C84            ; 4C 84 7C | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7C85            ; 4C 85 7C | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CFD
; Address: $D8FC86
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CFD:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    STA $C10B            ; 8D 0B C1 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$05             ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CFE
; Address: $D8FC92
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CFE:
    JSL $C78AD5          ; 22 D5 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7C9F            ; 4C 9F 7C | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_CFF
; Address: $D8FC9B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_CFF:
    SEC                  ; 38 | Set carry flag
    JMP $7CA0            ; 4C A0 7C | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D00
; Address: $D8FCA1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D00:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    STA $C10B            ; 8D 0B C1 | Store accumulator to absolute address
    LDX #$05             ; A2 05 | Load immediate value into X register
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D01
; Address: $D8FCAD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D01:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7CBA            ; 4C BA 7C | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7CBB            ; 4C BB 7C | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D02
; Address: $D8FCBC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D02:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    STA $C10B            ; 8D 0B C1 | Store accumulator to absolute address
    LDX #$45             ; A2 45 | Load immediate value into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D03
; Address: $D8FCC8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D03:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7CD5            ; 4C D5 7C | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7CD6            ; 4C D6 7C | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D04
; Address: $D8FCD7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D04:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    STA $C10B            ; 8D 0B C1 | Store accumulator to absolute address
    LDX #$85             ; A2 85 | Load immediate value into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D05
; Address: $D8FCE3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D05:
    JSL $C78A23          ; 22 23 8A C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7CF0            ; 4C F0 7C | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7CF1            ; 4C F1 7C | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D07
; Address: $D8FCF8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D07:
    JSL $CC7CA1          ; 22 A1 7C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7D05            ; 4C 05 7D | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7D06            ; 4C 06 7D | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D0A
; Address: $D8FD13
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D0A:
    JMP $7D1A            ; 4C 1A 7D | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7D1B            ; 4C 1B 7D | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D0C
; Address: $D8FD22
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D0C:
    JSL $CC7CBC          ; 22 BC 7C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7D2F            ; 4C 2F 7D | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7D30            ; 4C 30 7D | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D0E
; Address: $D8FD37
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D0E:
    JSL $CC7CD7          ; 22 D7 7C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7D44            ; 4C 44 7D | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7D45            ; 4C 45 7D | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D0F
; Address: $D8FD46
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D0F:
    JSL $CC7D1C          ; 22 1C 7D CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7D56            ; 4C 56 7D | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7D64            ; 4C 64 7D | Jump to address
    JMP $7D63            ; 4C 63 7D | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D10
; Address: $D8FD56
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D10:
    JSL $CC7D07          ; 22 07 7D CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7D63            ; 4C 63 7D | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7D64            ; 4C 64 7D | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D12
; Address: $D8FD6B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D12:
    JSL $CC7CA1          ; 22 A1 7C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7D78            ; 4C 78 7D | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7D79            ; 4C 79 7D | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D14
; Address: $D8FD80
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D14:
    JSL $CC7CBC          ; 22 BC 7C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7D8D            ; 4C 8D 7D | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D15
; Address: $D8FD89
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D15:
    SEC                  ; 38 | Set carry flag
    JMP $7D8E            ; 4C 8E 7D | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D17
; Address: $D8FD95
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D17:
    JSL $CC7CD7          ; 22 D7 7C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7DA2            ; 4C A2 7D | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7DA3            ; 4C A3 7D | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D19
; Address: $D8FDAA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D19:
    JSL $CC7C86          ; 22 86 7C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7DB7            ; 4C B7 7D | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7DB8            ; 4C B8 7D | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D1B
; Address: $D8FDBF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D1B:
    JSL $CC7CA1          ; 22 A1 7C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7DCC            ; 4C CC 7D | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7DCD            ; 4C CD 7D | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D1D
; Address: $D8FDD4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D1D:
    JSL $CC7CA1          ; 22 A1 7C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7DE1            ; 4C E1 7D | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7DE2            ; 4C E2 7D | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D1E
; Address: $D8FDE3
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D1E:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    LDA $99C6            ; AD C6 99 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7E35            ; 4C 35 7E | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D1F
; Address: $D8FDFF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D1F:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7E26            ; 4C 26 7E | Jump to address
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($A9,X)          ; C1 A9 | Compare accumulator ((zero page,X))
    LDX #$03             ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D20
; Address: $D8FE0F
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D20:
    JSL $C78C66          ; 22 66 8C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7E1E            ; 4C 1E 7E | Jump to address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    ADC $3EAD,X          ; 7D AD 3E | Add with carry (absolute,X)
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7E35            ; 4C 35 7E | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7E36            ; 4C 36 7E | Jump to address
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D22
; Address: $D8FE3E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D22:
    JSL $C78C66          ; 22 66 8C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7E4B            ; 4C 4B 7E | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7E4C            ; 4C 4C 7E | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D23
; Address: $D8FE4D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D23:
    LDA $3540            ; AD 40 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7E5C            ; 4C 5C 7E | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7E6A            ; 4C 6A 7E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D24
; Address: $D8FE5C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D24:
    JSL $CC7E38          ; 22 38 7E CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7E69            ; 4C 69 7E | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7E6A            ; 4C 6A 7E | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D25
; Address: $D8FE6B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D25:
    JSL $CDDBB9          ; 22 B9 DB CD | Jump to subroutine long
    LDA $342A            ; AD 2A 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7E8B            ; 4C 8B 7E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D27
; Address: $D8FE7E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D27:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7E87            ; 4C 87 7E | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7E88            ; 4C 88 7E | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7ED1            ; 4C D1 7E | Jump to address
    LDA $342A            ; AD 2A 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7EA7            ; 4C A7 7E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D28
; Address: $D8FE96
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D28:
    JSL $CC7F2D          ; 22 2D 7F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7EA3            ; 4C A3 7E | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7EA4            ; 4C A4 7E | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7ED1            ; 4C D1 7E | Jump to address
    LDA $342A            ; AD 2A 34 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7EC3            ; 4C C3 7E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D29
; Address: $D8FEB2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D29:
    JSL $CC7F88          ; 22 88 7F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7EBF            ; 4C BF 7E | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7EC0            ; 4C C0 7E | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7ED1            ; 4C D1 7E | Jump to address

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D2A
; Address: $D8FEC3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D2A:
    JSL $CC7FE3          ; 22 E3 7F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7ED0            ; 4C D0 7E | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7ED1            ; 4C D1 7E | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D2B
; Address: $D8FED2
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D2B:
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    ORA $A3              ; 05 A3 | Logical OR with accumulator (zero page)
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    SBC #$02             ; E9 02 | Subtract with carry (immediate)
    ORA $AD              ; 05 AD | Logical OR with accumulator (zero page)
    BIT $34              ; 24 34 | Test bits in accumulator (zero page)
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    JMP $7EF0            ; 4C F0 7E | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7F29            ; 4C 29 7F | Jump to address
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D2C
; Address: $D8FEF9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D2C:
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ADC #$01             ; 69 01 | Add with carry (immediate)
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D2D
; Address: $D8FF0B
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D2D:
    JSL $03C334          ; 22 34 C3 03 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7F18            ; 4C 18 7F | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7F29            ; 4C 29 7F | Jump to address
    LDA $3422            ; AD 22 34 | Load from absolute address into accumulator
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7F28            ; 4C 28 7F | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7F29            ; 4C 29 7F | Jump to address
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D2E
; Address: $D8FF2D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D2E:
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    ORA $A3              ; 05 A3 | Logical OR with accumulator (zero page)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ADC #$02             ; 69 02 | Add with carry (immediate)
    ORA $AD              ; 05 AD | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D2F
; Address: $D8FF3E
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D2F:
    JSL $05C334          ; 22 34 C3 05 | Jump to subroutine long
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7F4B            ; 4C 4B 7F | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7F84            ; 4C 84 7F | Jump to address
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ADC #$01             ; 69 01 | Add with carry (immediate)
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))
    BIT $34              ; 24 34 | Test bits in accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7F73            ; 4C 73 7F | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7F84            ; 4C 84 7F | Jump to address
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D30
; Address: $D8FF7A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D30:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7F83            ; 4C 83 7F | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7F84            ; 4C 84 7F | Jump to address
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D31
; Address: $D8FF88
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D31:
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    ORA $A3              ; 05 A3 | Logical OR with accumulator (zero page)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ADC #$02             ; 69 02 | Add with carry (immediate)
    ORA $AD              ; 05 AD | Logical OR with accumulator (zero page)
    BIT $34              ; 24 34 | Test bits in accumulator (zero page)
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    JMP $7FA6            ; 4C A6 7F | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7FDF            ; 4C DF 7F | Jump to address
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ADC #$01             ; 69 01 | Add with carry (immediate)
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D32
; Address: $D8FFC1
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D32:
    JSL $03C334          ; 22 34 C3 03 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7FCE            ; 4C CE 7F | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7FDF            ; 4C DF 7F | Jump to address
    LDA $3422            ; AD 22 34 | Load from absolute address into accumulator
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7FDE            ; 4C DE 7F | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $7FDF            ; 4C DF 7F | Jump to address
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D33
; Address: $D8FFE3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D33:
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D34
; Address: $D8FFEA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D34:
    ORA $A3              ; 05 A3 | Logical OR with accumulator (zero page)
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    SBC #$02             ; E9 02 | Subtract with carry (immediate)
    ORA $AD              ; 05 AD | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank30_DmaFunction_D35
; Address: $D8FFF4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank30_DmaFunction_D35:
    JSL $05C334          ; 22 34 C3 05 | Jump to subroutine long
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8001            ; 4C 01 80 | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $803A            ; 4C 3A 80 | Jump to address
