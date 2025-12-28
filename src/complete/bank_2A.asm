;==============================================================================
; Dragon Quest III - Bank $2A
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $D50000-$D57FFF
; Instructions: 9853
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_2A"

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_001
; Address: $D58003
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_001:
    JSL $C743C6          ; 22 C6 43 C7 | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_00A
; Address: $D58036
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_00A:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    BCC $52              ; 90 52 | Branch if carry clear
    CPY $E222            ; CC 22 E2 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $CC51            ; 9C 51 CC | Store zero to absolute

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_010
; Address: $D58062
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_010:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY $FE22            ; CC 22 FE | Compare Y register (absolute)
    LDA #$CC             ; A9 CC | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_018
; Address: $D5809A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_018:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STX $58              ; 86 58 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_019
; Address: $D580A2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_019:
    CPY $2922            ; CC 22 29 | Compare Y register (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    CPY $A26B            ; CC 6B A2 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_02E
; Address: $D58122
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_02E:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDX $CD05            ; AE 05 CD | Load from absolute address into X register
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $813F            ; 4C 3F 81 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_02F
; Address: $D58136
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_02F:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($C8,X)          ; 01 C8 | Logical OR with accumulator ((zero page,X))
    ORA $CD              ; 05 CD | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_057
; Address: $D58216
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_057:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $CC63,X          ; 1E 63 CC | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_058
; Address: $D5821F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_058:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CPY $E222            ; CC 22 E2 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($5A,X)          ; 01 5A | Logical OR with accumulator ((zero page,X))
    CPY $AD22            ; CC 22 AD | Compare Y register (absolute)
    PLB                  ; AB | Pull data bank register from stack
    CPY $A26B            ; CC 6B A2 | Compare Y register (absolute)
    CMP ($01),Y          ; D1 01 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_059
; Address: $D58239
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_059:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$D2             ; A2 D2 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    CMP $2201,Y          ; D9 01 22 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_05A
; Address: $D58272
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_05A:
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PHX                  ; DA | Push X register to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $AD              ; C6 AD | Decrement (zero page)
    PHA                  ; 48 | Push accumulator to stack
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $829F            ; 4C 9F 82 | Jump to address
    LDX #$E1             ; A2 E1 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $4C              ; C6 4C | Decrement (zero page)
    SBC $82              ; E5 82 | Subtract with carry (zero page)
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $82B4            ; 4C B4 82 | Jump to address
    LDX #$E0             ; A2 E0 | Game work RAM access
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $4C              ; C6 4C | Decrement (zero page)
    SBC $82              ; E5 82 | Subtract with carry (zero page)
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $82C9            ; 4C C9 82 | Jump to address
    LDX #$DF             ; A2 DF | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $4C              ; C6 4C | Decrement (zero page)
    SBC $82              ; E5 82 | Subtract with carry (zero page)
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $82DE            ; 4C DE 82 | Jump to address
    LDX #$DE             ; A2 DE | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $4C              ; C6 4C | Decrement (zero page)
    SBC $82              ; E5 82 | Subtract with carry (zero page)
    LDX #$DD             ; A2 DD | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_05B
; Address: $D582E2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_05B:
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    SEP #$01             ; E2 01 | Set processor status bits

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_05C
; Address: $D582E8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_05C:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$E3             ; A2 E3 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    CPX $01              ; E4 01 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_05E
; Address: $D582FD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_05E:
    JSL $C61523          ; 22 23 15 C6 | Jump to subroutine long
    LDX #$E5             ; A2 E5 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    INC $01              ; E6 01 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_05F
; Address: $D5830B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_05F:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$E7             ; A2 E7 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    INX                  ; E8 | Increment X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    SBC #$01             ; E9 01 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_060
; Address: $D58320
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_060:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$EA             ; A2 EA | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    CPX $2201            ; EC 01 22 | Compare X register (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    SBC $2201            ; ED 01 22 | Subtract with carry (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    INC $2201            ; EE 01 22 | Increment (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BEQ $01              ; F0 01 | Branch if equal

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_062
; Address: $D58355
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_062:
    LDX #$F1             ; A2 F1 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PEA #$2201           ; F4 01 22 | Push effective address to stack
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    SBC $2201,Y          ; F9 01 22 | Subtract with carry (absolute,Y)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PLX                  ; FA | Pull X register from stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    SBC $2201,X          ; FD 01 22 | Subtract with carry (absolute,X)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    INC $2201,X          ; FE 01 22 | Increment (absolute,X)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_07E
; Address: $D5847B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_07E:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC $CDB2,X          ; DE B2 CD | Decrement (absolute,X)
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_084
; Address: $D584A7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_084:
    JSL $CC92FF          ; 22 FF 92 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $84CC            ; 4C CC 84 | Jump to address
    LDA #$3A             ; A9 3A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_089
; Address: $D584CC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_089:
    JSL $CC90CE          ; 22 CE 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $84FF            ; 4C FF 84 | Jump to address
    LDA #$2F             ; A9 2F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_090
; Address: $D584FF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_090:
    JSL $CC9106          ; 22 06 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $850F            ; 4C 0F 85 | Jump to address
    LDA #$38             ; A9 38 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_092
; Address: $D58512
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_092:
    JSL $C77E0C          ; 22 0C 7E C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $8557            ; 4C 57 85 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_094
; Address: $D5851F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_094:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $852B            ; 4C 2B 85 | Jump to address
    LDA #$8B             ; A9 8B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_095
; Address: $D58527
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_095:
    JSL $C758DE          ; 22 DE 58 C7 | Jump to subroutine long
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8544            ; 4C 44 85 | Jump to address
    LDA #$8E             ; A9 8E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_098
; Address: $D58544
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_098:
    JSL $CC9366          ; 22 66 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8554            ; 4C 54 85 | Jump to address
    LDA #$90             ; A9 90 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_099
; Address: $D58550
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_099:
    JSL $C758DE          ; 22 DE 58 C7 | Jump to subroutine long
    JMP $8588            ; 4C 88 85 | Jump to address
    LDA #$91             ; A9 91 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_0A6
; Address: $D585A8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_0A6:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $85BE            ; 4C BE 85 | Jump to address
    LDX #$20             ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_0B0
; Address: $D585F6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_0B0:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC $CDB2,X          ; DE B2 CD | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_0B1
; Address: $D585FF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_0B1:
    JSL $CC9122          ; 22 22 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $860F            ; 4C 0F 86 | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_0B3
; Address: $D5860F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_0B3:
    JSL $CC90EA          ; 22 EA 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $862D            ; 4C 2D 86 | Jump to address
    LDA #$3D             ; A9 3D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_0B6
; Address: $D58629
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_0B6:
    JSL $C758DE          ; 22 DE 58 C7 | Jump to subroutine long
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $863F            ; 4C 3F 86 | Jump to address
    LDA #$8C             ; A9 8C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_121
; Address: $D58898
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_121:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $CAEB,X          ; 5D EB CA | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_123
; Address: $D588A6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_123:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $892A            ; 4C 2A 89 | Jump to address
    LDX #$29             ; A2 29 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_133
; Address: $D5891D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_133:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDA #$87             ; A9 87 | Load immediate value into accumulator
    STA $352E            ; 8D 2E 35 | Store accumulator to absolute address
    JMP $8A4C            ; 4C 4C 8A | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $89A7            ; 4C A7 89 | Jump to address
    LDX #$25             ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_142
; Address: $D5899A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_142:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDA #$86             ; A9 86 | Load immediate value into accumulator
    STA $352E            ; 8D 2E 35 | Store accumulator to absolute address
    JMP $8A4C            ; 4C 4C 8A | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_143
; Address: $D589AA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_143:
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $89F3            ; 4C F3 89 | Jump to address
    LDX #$21             ; A2 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_14B
; Address: $D589E6
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_14B:
    JSL $C66696          ; 22 96 66 C6 | Jump to subroutine long
    LDA #$85             ; A9 85 | Load immediate value into accumulator
    STA $352E            ; 8D 2E 35 | Store accumulator to absolute address
    JMP $8A4C            ; 4C 4C 8A | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8A2A            ; 4C 2A 8A | Jump to address
    LDX #$1D             ; A2 1D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_150
; Address: $D58A1D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_150:
    JSL $C62407          ; 22 07 24 C6 | Jump to subroutine long
    LDA #$84             ; A9 84 | Load immediate value into accumulator
    STA $352E            ; 8D 2E 35 | Store accumulator to absolute address
    JMP $8A4C            ; 4C 4C 8A | Jump to address
    LDX #$19             ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_154
; Address: $D58A42
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_154:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDA #$83             ; A9 83 | Load immediate value into accumulator
    STA $352E            ; 8D 2E 35 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_157
; Address: $D58A51
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_157:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8A66            ; 4C 66 8A | Jump to address
    LDX #$10             ; A2 10 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_158
; Address: $D58A5F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_158:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    JMP $8A82            ; 4C 82 8A | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8A7B            ; 4C 7B 8A | Jump to address
    LDX #$0F             ; A2 0F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_159
; Address: $D58A74
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_159:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    JMP $8A82            ; 4C 82 8A | Jump to address
    LDX #$0E             ; A2 0E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_15C
; Address: $D58A87
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_15C:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8AA3            ; 4C A3 8A | Jump to address
    LDX #$17             ; A2 17 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_15E
; Address: $D58A9C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_15E:
    JSL $C62407          ; 22 07 24 C6 | Jump to subroutine long
    JMP $8AB1            ; 4C B1 8A | Jump to address
    LDX #$16             ; A2 16 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_165
; Address: $D58ACB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_165:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8AF5            ; 4C F5 8A | Jump to address
    LDX #$19             ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_16A
; Address: $D58AEE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_16A:
    JSL $C66696          ; 22 96 66 C6 | Jump to subroutine long
    JMP $8B23            ; 4C 23 8B | Jump to address
    LDX #$18             ; A2 18 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_170
; Address: $D58B1A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_170:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_183
; Address: $D58B8C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_183:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CMP $CDB2,Y          ; D9 B2 CD | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_1AC
; Address: $D58C7F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_1AC:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($B3,X)          ; 01 B3 | Logical OR with accumulator ((zero page,X))
    CMP $F722            ; CD 22 F7 | Compare accumulator (absolute)
    ADC $B0CC,Y          ; 79 CC B0 | Add with carry (absolute,Y)
    JMP $8C9D            ; 4C 9D 8C | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_1AD
; Address: $D58C91
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_1AD:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($B9,X)          ; 01 B9 | Logical OR with accumulator ((zero page,X))
    CMP $A64C            ; CD 4C A6 | Compare accumulator (absolute)
    STY $E222            ; 8C 22 E2 | Store Y register to absolute address
    SEC                  ; 38 | Set carry flag
    ORA ($86,X)          ; 01 86 | Logical OR with accumulator ((zero page,X))
    CMP $CA22            ; CD 22 CA | Compare accumulator (absolute)
    CPY $A26B            ; CC 6B A2 | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_1B8
; Address: $D58CE5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_1B8:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    CMP $E222            ; CD 22 E2 | Compare accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($BA,X)          ; 01 BA | Logical OR with accumulator ((zero page,X))
    CMP $4322            ; CD 22 43 | Compare accumulator (absolute)
    CPY $A26B            ; CC 6B A2 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_1E7
; Address: $D58E0D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_1E7:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_1FA
; Address: $D58E82
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_1FA:
    JSL $C66696          ; 22 96 66 C6 | Jump to subroutine long
    LDA $3558            ; AD 58 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8E98            ; 4C 98 8E | Jump to address
    LDX #$2A             ; A2 2A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_1FC
; Address: $D58E98
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_1FC:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $CAEB,X          ; 5D EB CA | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_25B
; Address: $D590C5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_25B:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    SBC $22CA            ; ED CA 22 | Subtract with carry (absolute)
    CPX $CB              ; E4 CB | Compare X register (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_28C
; Address: $D591D7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_28C:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDA $3558            ; AD 58 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $91ED            ; 4C ED 91 | Jump to address
    LDX #$4D             ; A2 4D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_2A1
; Address: $D5925D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_2A1:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    XBA                  ; EB | Exchange accumulator bytes
    DEX                  ; CA | Decrement X register
    LDX #$52             ; A2 52 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_2C5
; Address: $D5933A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_2C5:
    JSL $C66696          ; 22 96 66 C6 | Jump to subroutine long
    LDA $3558            ; AD 58 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9350            ; 4C 50 93 | Jump to address
    LDX #$59             ; A2 59 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_2C7
; Address: $D59350
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_2C7:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CMP $CDB2,Y          ; D9 B2 CD | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_313
; Address: $D5950E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_313:
    JSL $C614D5          ; 22 D5 14 C6 | Jump to subroutine long
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $952F            ; 4C 2F 95 | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $952F            ; 4C 2F 95 | Jump to address
    LDX #$17             ; A2 17 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_345
; Address: $D59662
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_345:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9678            ; 4C 78 96 | Jump to address
    LDX #$6D             ; A2 6D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_347
; Address: $D59678
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_347:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    STZ $CAED,X          ; 9E ED CA | Store zero to absolute,X
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_387
; Address: $D597FE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_387:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    PHX                  ; DA | Push X register to stack
    SBC $22CA            ; ED CA 22 | Subtract with carry (absolute)
    CPX $CB              ; E4 CB | Compare X register (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_3AF
; Address: $D598F0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_3AF:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    BRA $ED              ; 80 ED | Branch always
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_3C2
; Address: $D5996E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_3C2:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    CMP $1922            ; CD 22 19 | Compare accumulator (absolute)
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_41C
; Address: $D59B6D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_41C:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    SBC $6BCA            ; ED CA 6B | Subtract with carry (absolute)
    LDX #$47             ; A2 47 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_433
; Address: $D59C0B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_433:
    JSL $C66696          ; 22 96 66 C6 | Jump to subroutine long
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9C21            ; 4C 21 9C | Jump to address
    LDX #$61             ; A2 61 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_48C
; Address: $D59E14
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_48C:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($B4,X)          ; 01 B4 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_4A9
; Address: $D59EC3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_4A9:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    LDA                  ; BF 8A CB 22 | Load from absolute long,X into accumulator
    INC $CCC6            ; EE C6 CC | Increment (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_4EF
; Address: $D5A07D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_4EF:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $CAEB,X          ; 5D EB CA | Exclusive OR with accumulator (absolute,X)
    LDA #$7B             ; A9 7B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_50E
; Address: $D5A14C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_50E:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $CAEB,X          ; 5D EB CA | Exclusive OR with accumulator (absolute,X)
    LDX #$AF             ; A2 AF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_517
; Address: $D5A184
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_517:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $CAEB,X          ; 5D EB CA | Exclusive OR with accumulator (absolute,X)
    LDX #$B2             ; A2 B2 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_528
; Address: $D5A1E5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_528:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_52A
; Address: $D5A1F4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_52A:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    LDA $CDB2,Y          ; B9 B2 CD | Load from absolute,Y into accumulator
    JMP $A209            ; 4C 09 A2 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_52B
; Address: $D5A200
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_52B:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $CAEB,X          ; 5D EB CA | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_52F
; Address: $D5A215
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_52F:
    JSL $CC915A          ; 22 5A 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A23A            ; 4C 3A A2 | Jump to address
    LDX #$2C             ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_585
; Address: $D5A40C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_585:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_5FC
; Address: $D5A6E6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_5FC:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $CAEB,X          ; 5D EB CA | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_61A
; Address: $D5A793
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_61A:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A7A9            ; 4C A9 A7 | Jump to address
    LDX #$AD             ; A2 AD | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_626
; Address: $D5A7E8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_626:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $CAEB,X          ; 5D EB CA | Exclusive OR with accumulator (absolute,X)
    LDA $3553            ; AD 53 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A80A            ; 4C 0A A8 | Jump to address
    LDA #$53             ; A9 53 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_63A
; Address: $D5A876
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_63A:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA $CAEE,X          ; 1D EE CA | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_646
; Address: $D5A8B9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_646:
    JSL $C62407          ; 22 07 24 C6 | Jump to subroutine long
    LDX #$00             ; A2 00 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$01             ; A2 01 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$D3             ; A2 D3 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_64D
; Address: $D5A8F5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_64D:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $CAEB,X          ; 5D EB CA | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_64E
; Address: $D5A8FE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_64E:
    JSL $CC931B          ; 22 1B 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A910            ; 4C 10 A9 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_650
; Address: $D5A90D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_650:
    JSL $22CD56          ; 22 56 CD 22 | Jump to subroutine long
    EOR #$CB             ; 49 CB | Exclusive OR with accumulator (immediate)
    CPY $A26B            ; CC 6B A2 | Compare Y register (absolute)
    LDX $2200,Y          ; BE 00 22 | Load from absolute,Y into X register
    DEC $22              ; C6 22 | Decrement (zero page)
    SEP #$38             ; E2 38 | Set processor status bits

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_651
; Address: $D5A922
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_651:
    CPX $5D              ; E4 5D | Compare X register (zero page)
    CMP $E222            ; CD 22 E2 | Compare accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $22CD,X          ; 5D CD 22 | Exclusive OR with accumulator (absolute,X)
    SEP #$38             ; E2 38 | Set processor status bits
    ORA ($CA,X)          ; 01 CA | Logical OR with accumulator ((zero page,X))
    CMP $E222            ; CD 22 E2 | Compare accumulator (absolute)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_653
; Address: $D5A940
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_653:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $CAEB,X          ; 5D EB CA | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_665
; Address: $D5A9AB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_665:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$02             ; A2 02 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_666
; Address: $D5A9B6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_666:
    JSL $CBC50F          ; 22 0F C5 CB | Jump to subroutine long
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_667
; Address: $D5A9C0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_667:
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A9D7            ; 4C D7 A9 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A9D7            ; 4C D7 A9 | Jump to address
    LDA #$E7             ; A9 E7 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_68D
; Address: $D5AAB1
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_68D:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$03             ; A2 03 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$05             ; A2 05 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_69D
; Address: $D5AB18
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_69D:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    XBA                  ; EB | Exchange accumulator bytes
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_6BB
; Address: $D5ABBB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_6BB:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$06             ; A2 06 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_6C0
; Address: $D5ABDF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_6C0:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $EC              ; 06 EC | Arithmetic shift left (zero page)
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_6C8
; Address: $D5AC07
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_6C8:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    CPX $6BCA            ; EC CA 6B | Compare X register (absolute)
    LDX #$AF             ; A2 AF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_6DC
; Address: $D5AC84
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_6DC:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    STA ($B3,X)          ; 81 B3 | Store accumulator to (zero page,X)
    CMP $A26B            ; CD 6B A2 | Compare accumulator (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_6FC
; Address: $D5AD52
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_6FC:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$07             ; A2 07 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$08             ; A2 08 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$09             ; A2 09 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$0A             ; A2 0A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$0B             ; A2 0B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$0C             ; A2 0C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_707
; Address: $D5ADB9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_707:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$0D             ; A2 0D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$0E             ; A2 0E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$0F             ; A2 0F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$10             ; A2 10 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_722
; Address: $D5AE6D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_722:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP $6522            ; CD 22 65 | Compare accumulator (absolute)
    DEC $6BCC            ; CE CC 6B | Decrement (absolute)
    LDX #$CA             ; A2 CA | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_724
; Address: $D5AE85
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_724:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$11             ; A2 11 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_72A
; Address: $D5AEB0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_72A:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    CMP $E222            ; CD 22 E2 | Compare accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    CMP $6B6B            ; CD 6B 6B | Compare accumulator (absolute)
    LDX #$EC             ; A2 EC | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_739
; Address: $D5AF11
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_739:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $9622            ; CD 22 96 | Compare accumulator (absolute)
    DEC $6BCC            ; CE CC 6B | Decrement (absolute)
    LDX #$CB             ; A2 CB | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_756
; Address: $D5AFD3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_756:
    JSL $C66696          ; 22 96 66 C6 | Jump to subroutine long
    LDX #$00             ; A2 00 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_75C
; Address: $D5AFF8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_75C:
    JSL $CBD3F7          ; 22 F7 D3 CB | Jump to subroutine long
    LDX #$01             ; A2 01 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$02             ; A2 02 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_766
; Address: $D5B034
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_766:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $B055            ; 4C 55 B0 | Jump to address
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $B055            ; 4C 55 B0 | Jump to address
    LDA #$83             ; A9 83 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_769
; Address: $D5B059
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_769:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$12             ; A2 12 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$03             ; A2 03 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$16             ; A2 16 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_76D
; Address: $D5B087
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_76D:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    CMP $E222            ; CD 22 E2 | Compare accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP $9E22            ; CD 22 9E | Compare accumulator (absolute)
    DEC $6BCC            ; CE CC 6B | Decrement (absolute)
    LDX #$CF             ; A2 CF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_76E
; Address: $D5B0A1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_76E:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$05             ; A2 05 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$06             ; A2 06 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_776
; Address: $D5B0DB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_776:
    JSL $C666AF          ; 22 AF 66 C6 | Jump to subroutine long
    LDX #$07             ; A2 07 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_777
; Address: $D5B0E7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_777:
    LDX #$00             ; A2 00 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_779
; Address: $D5B0F5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_779:
    JSL $CBD4C8          ; 22 C8 D4 CB | Jump to subroutine long
    LDX #$08             ; A2 08 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$09             ; A2 09 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$0A             ; A2 0A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_77A
; Address: $D5B10F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_77A:
    LDX #$02             ; A2 02 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $6B              ; C6 6B | Decrement (zero page)
    LDX #$2A             ; A2 2A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_77B
; Address: $D5B11A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_77B:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$03             ; A2 03 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $22              ; C6 22 | Decrement (zero page)
    STA $CBC9            ; 8D C9 CB | Store accumulator to absolute address
    LDX #$0B             ; A2 0B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_77C
; Address: $D5B12B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_77C:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$0C             ; A2 0C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_77D
; Address: $D5B133
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_77D:
    JSL $C666E1          ; 22 E1 66 C6 | Jump to subroutine long
    LDX #$0C             ; A2 0C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_77E
; Address: $D5B13F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_77E:
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_781
; Address: $D5B152
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_781:
    LDX #$06             ; A2 06 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $22              ; C6 22 | Decrement (zero page)
    STX $CBD1            ; 8E D1 CB | Store X register to absolute address
    LDX #$0D             ; A2 0D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_783
; Address: $D5B170
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_783:
    LDX #$08             ; A2 08 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_784
; Address: $D5B17A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_784:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$0A             ; A2 0A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ASL $2201            ; 0E 01 22 | Arithmetic shift left (absolute)
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_785
; Address: $D5B18D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_785:
    LDX #$0B             ; A2 0B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$0F             ; A2 0F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_787
; Address: $D5B1A7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_787:
    LDX #$0C             ; A2 0C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_788
; Address: $D5B1AF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_788:
    ORA $2201            ; 0D 01 22 | Logical OR with accumulator (absolute)
    DEC $22              ; C6 22 | Decrement (zero page)
    SEP #$38             ; E2 38 | Set processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    XBA                  ; EB | Exchange accumulator bytes
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_789
; Address: $D5B1BE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_789:
    JSL $CBC818          ; 22 18 C8 CB | Jump to subroutine long
    LDX #$10             ; A2 10 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$11             ; A2 11 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_78A
; Address: $D5B1D1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_78A:
    LDX #$0E             ; A2 0E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$13             ; A2 13 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_78B
; Address: $D5B1EE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_78B:
    LDX #$10             ; A2 10 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_78C
; Address: $D5B1F8
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_78C:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$14             ; A2 14 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$15             ; A2 15 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$16             ; A2 16 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$17             ; A2 17 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$18             ; A2 18 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$19             ; A2 19 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$15             ; A2 15 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_78D
; Address: $D5B228
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_78D:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$14             ; A2 14 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_78F
; Address: $D5B239
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_78F:
    LDX #$12             ; A2 12 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_790
; Address: $D5B24E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_790:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $22CA            ; EE CA 22 | Increment (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_791
; Address: $D5B25C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_791:
    LDX #$14             ; A2 14 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A9              ; C6 A9 | Decrement (zero page)
    BRA $00              ; 80 00 | Branch always
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_793
; Address: $D5B275
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_793:
    LDX #$16             ; A2 16 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_794
; Address: $D5B286
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_794:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$1A             ; A2 1A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_796
; Address: $D5B296
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_796:
    LDX #$18             ; A2 18 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_797
; Address: $D5B2A0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_797:
    JSL $C614D5          ; 22 D5 14 C6 | Jump to subroutine long
    LDX #$1B             ; A2 1B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$17             ; A2 17 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$18             ; A2 18 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_798
; Address: $D5B2B4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_798:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$78             ; A2 78 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_79D
; Address: $D5B2CF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_79D:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$7D             ; A2 7D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_79E
; Address: $D5B2DD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_79E:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDX #$19             ; A2 19 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$1A             ; A2 1A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$40             ; A2 40 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7A2
; Address: $D5B2FE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7A2:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7A3
; Address: $D5B30C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7A3:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$1D             ; A2 1D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7A4
; Address: $D5B318
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7A4:
    LDX #$1D             ; A2 1D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ASL $2201,X          ; 1E 01 22 | Arithmetic shift left (absolute,X)
    DEC $A9              ; C6 A9 | Decrement (zero page)
    BRA $00              ; 80 00 | Branch always
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7A6
; Address: $D5B331
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7A6:
    LDX #$1F             ; A2 1F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7A7
; Address: $D5B339
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7A7:
    JSR $2201            ; 20 01 22 | Jump to subroutine
    DEC $A9              ; C6 A9 | Decrement (zero page)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7AA
; Address: $D5B34A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7AA:
    LDX #$21             ; A2 21 | PPU graphics register access
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7AC
; Address: $D5B35B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7AC:
    JSL $C666FA          ; 22 FA 66 C6 | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7B0
; Address: $D5B371
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7B0:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$1F             ; A2 1F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$20             ; A2 20 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$21             ; A2 21 | PPU graphics register access
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7B1
; Address: $D5B391
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7B1:
    JSL $CBD57D          ; 22 7D D5 CB | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$7E             ; A2 7E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7B2
; Address: $D5B39F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7B2:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDX #$1B             ; A2 1B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7B6
; Address: $D5B3B9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7B6:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDX #$1D             ; A2 1D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$1E             ; A2 1E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7B8
; Address: $D5B3CE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7B8:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDX #$1F             ; A2 1F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$81             ; A2 81 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7C0
; Address: $D5B3FB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7C0:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$20             ; A2 20 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$21             ; A2 21 | PPU graphics register access
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$22             ; A2 22 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7C4
; Address: $D5B423
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7C4:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$22             ; A2 22 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$23             ; A2 23 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$24             ; A2 24 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7C5
; Address: $D5B43C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7C5:
    JSL $CBD60E          ; 22 0E D6 CB | Jump to subroutine long
    LDX #$23             ; A2 23 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$24             ; A2 24 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7CA
; Address: $D5B464
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7CA:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$25             ; A2 25 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$26             ; A2 26 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7D0
; Address: $D5B493
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7D0:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$25             ; A2 25 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7D5
; Address: $D5B4B7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7D5:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$19             ; A2 19 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7D6
; Address: $D5B4C9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7D6:
    JSL $CBD62A          ; 22 2A D6 CB | Jump to subroutine long
    LDX #$27             ; A2 27 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$82             ; A2 82 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7D7
; Address: $D5B4D7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7D7:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDX #$28             ; A2 28 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7D9
; Address: $D5B4E7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7D9:
    LDX #$22             ; A2 22 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7DA
; Address: $D5B4F1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7DA:
    JSL $C666FA          ; 22 FA 66 C6 | Jump to subroutine long
    LDX #$26             ; A2 26 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7DC
; Address: $D5B500
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7DC:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$28             ; A2 28 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$83             ; A2 83 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7DD
; Address: $D5B50E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7DD:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDX #$2B             ; A2 2B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$29             ; A2 29 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$2A             ; A2 2A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7DF
; Address: $D5B52B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7DF:
    JSL $CC7A06          ; 22 06 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B53B            ; 4C 3B B5 | Jump to address
    LDA #$4F             ; A9 4F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7E2
; Address: $D5B53F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7E2:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$1A             ; A2 1A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $22              ; C6 22 | Decrement (zero page)
    CPY $6BCC            ; CC CC 6B | Compare Y register (absolute)
    LDX #$1B             ; A2 1B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BIT $2201            ; 2C 01 22 | Test bits in accumulator (absolute)
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$2D             ; A2 2D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7E9
; Address: $D5B57F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7E9:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$23             ; A2 23 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $6B              ; C6 6B | Decrement (zero page)
    LDX #$24             ; A2 24 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7EA
; Address: $D5B595
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7EA:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$29             ; A2 29 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7ED
; Address: $D5B5AB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7ED:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$25             ; A2 25 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROL $01              ; 26 01 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7EE
; Address: $D5B5B9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7EE:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$2A             ; A2 2A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$2B             ; A2 2B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7F0
; Address: $D5B5D0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7F0:
    LDX #$27             ; A2 27 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7F1
; Address: $D5B5E1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7F1:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$2C             ; A2 2C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7F2
; Address: $D5B5EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7F2:
    JSL $CBD62B          ; 22 2B D6 CB | Jump to subroutine long
    LDX #$2F             ; A2 2F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7F4
; Address: $D5B5FB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7F4:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$2D             ; A2 2D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$31             ; A2 31 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$30             ; A2 30 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_7FB
; Address: $D5B638
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_7FB:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$2E             ; A2 2E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$32             ; A2 32 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_803
; Address: $D5B672
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_803:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_808
; Address: $D5B691
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_808:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$2F             ; A2 2F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$30             ; A2 30 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_809
; Address: $D5B6A3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_809:
    JSL $CBD647          ; 22 47 D6 CB | Jump to subroutine long
    LDX #$33             ; A2 33 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_813
; Address: $D5B6E7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_813:
    JSL $C666FA          ; 22 FA 66 C6 | Jump to subroutine long
    LDX #$34             ; A2 34 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_814
; Address: $D5B6F2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_814:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ASL $22CD,X          ; 1E CD 22 | Arithmetic shift left (absolute,X)
    SBC $CC              ; E5 CC | Subtract with carry (zero page)
    CPY $A26B            ; CC 6B A2 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_816
; Address: $D5B70A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_816:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$29             ; A2 29 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $22              ; C6 22 | Decrement (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_817
; Address: $D5B728
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_817:
    LDX #$2C             ; A2 2C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    AND $2201            ; 2D 01 22 | Logical AND with accumulator (absolute)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROL $2201            ; 2E 01 22 | Rotate left (absolute)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_81F
; Address: $D5B76E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_81F:
    JSL $C666AF          ; 22 AF 66 C6 | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_822
; Address: $D5B781
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_822:
    LDX #$2F             ; A2 2F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BMI $01              ; 30 01 | Branch if negative

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_823
; Address: $D5B78B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_823:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$31             ; A2 31 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_827
; Address: $D5B7B2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_827:
    JSL $CBD7DF          ; 22 DF D7 CB | Jump to subroutine long
    LDX #$35             ; A2 35 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$36             ; A2 36 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_82B
; Address: $D5B7D3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_82B:
    LDX #$33             ; A2 33 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_82E
; Address: $D5B7F2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_82E:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_832
; Address: $D5B815
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_832:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$00             ; A2 00 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_833
; Address: $D5B823
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_833:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$02             ; A2 02 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_834
; Address: $D5B838
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_834:
    JSL $C62407          ; 22 07 24 C6 | Jump to subroutine long
    LDX #$39             ; A2 39 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$84             ; A2 84 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_835
; Address: $D5B846
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_835:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_839
; Address: $D5B85D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_839:
    LDX #$39             ; A2 39 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $22              ; C6 22 | Decrement (zero page)
    DEC $6BCC            ; CE CC 6B | Decrement (absolute)
    LDX #$35             ; A2 35 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    SEC                  ; 38 | Set carry flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_83A
; Address: $D5B88C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_83A:
    JSL $CBD8C1          ; 22 C1 D8 CB | Jump to subroutine long
    LDX #$37             ; A2 37 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$38             ; A2 38 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$1A             ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_83C
; Address: $D5B8A6
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_83C:
    LDX #$06             ; A2 06 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    DEC                  ; 3A | Decrement accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    AND $2201,X          ; 3D 01 22 | Logical AND with accumulator (absolute,X)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROL $2201,X          ; 3E 01 22 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_83D
; Address: $D5B8DD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_83D:
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    RTI                  ; 40 | Return from interrupt
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_83E
; Address: $D5B8EF
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_83E:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$0A             ; A2 0A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $22              ; C6 22 | Decrement (zero page)
    CMP $A2CB,Y          ; D9 CB A2 | Compare accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_840
; Address: $D5B918
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_840:
    LDX #$41             ; A2 41 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    WDM #$01             ; 42 01 | Reserved instruction

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_841
; Address: $D5B922
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_841:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$43             ; A2 43 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR $01              ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_842
; Address: $D5B937
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_842:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$46             ; A2 46 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR #$01             ; 49 01 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_843
; Address: $D5B953
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_843:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$4A             ; A2 4A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_844
; Address: $D5B964
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_844:
    DEC $A2              ; C6 A2 | Decrement (zero page)
    JMP $2201            ; 4C 01 22 | Jump to address
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR $2201            ; 4D 01 22 | Exclusive OR with accumulator (absolute)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA $2201            ; 0D 01 22 | Logical OR with accumulator (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_845
; Address: $D5B992
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_845:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$12             ; A2 12 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ASL $2201            ; 0E 01 22 | Arithmetic shift left (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BPL $01              ; 10 01 | Branch if positive

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_847
; Address: $D5B9C7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_847:
    JSL $CBD99B          ; 22 9B D9 CB | Jump to subroutine long
    LDX #$3B             ; A2 3B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_84A
; Address: $D5B9E1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_84A:
    LDX #$4E             ; A2 4E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BVC $01              ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_84B
; Address: $D5B9F2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_84B:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$51             ; A2 51 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_84C
; Address: $D5BA15
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_84C:
    JSL $C666AF          ; 22 AF 66 C6 | Jump to subroutine long
    LDX #$3C             ; A2 3C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_84E
; Address: $D5BA2B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_84E:
    LDX #$55             ; A2 55 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_84F
; Address: $D5BA48
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_84F:
    JSR $2201            ; 20 01 22 | Jump to subroutine
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_850
; Address: $D5BA51
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_850:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$22             ; A2 22 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_851
; Address: $D5BA66
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_851:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$25             ; A2 25 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_852
; Address: $D5BA6E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_852:
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROL $01              ; 26 01 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_853
; Address: $D5BA74
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_853:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$27             ; A2 27 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_854
; Address: $D5BA89
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_854:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$2A             ; A2 2A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA $2201,Y          ; 19 01 22 | Logical OR with accumulator (absolute,Y)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    INC                  ; 1A | Increment accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA $2201,X          ; 1D 01 22 | Logical OR with accumulator (absolute,X)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ASL $2201,X          ; 1E 01 22 | Arithmetic shift left (absolute,X)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A9              ; C6 A9 | Decrement (zero page)
    BRA $00              ; 80 00 | Branch always
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_857
; Address: $D5BACD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_857:
    LDX #$58             ; A2 58 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR $2201,Y          ; 59 01 22 | Exclusive OR with accumulator (absolute,Y)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PHY                  ; 5A | Push Y register to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_858
; Address: $D5BAE3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_858:
    AND $2201            ; 2D 01 22 | Logical AND with accumulator (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_859
; Address: $D5BAF3
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_859:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$33             ; A2 33 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BIT $2201            ; 2C 01 22 | Test bits in accumulator (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROL $2201            ; 2E 01 22 | Rotate left (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BMI $01              ; 30 01 | Branch if negative

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_85A
; Address: $D5BB16
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_85A:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$32             ; A2 32 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A9              ; C6 A9 | Decrement (zero page)
    BRA $00              ; 80 00 | Branch always
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_85D
; Address: $D5BB37
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_85D:
    LDX #$5B             ; A2 5B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    AND $2201,X          ; 3D 01 22 | Logical AND with accumulator (absolute,X)
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_85F
; Address: $D5BB50
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_85F:
    LDX #$35             ; A2 35 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_860
; Address: $D5BB5D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_860:
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$34             ; A2 34 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$35             ; A2 35 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$36             ; A2 36 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_862
; Address: $D5BB85
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_862:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $CAEB,Y          ; 99 EB CA | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_863
; Address: $D5BB8E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_863:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_864
; Address: $D5BB98
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_864:
    LDX #$5C             ; A2 5C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $22              ; C6 22 | Decrement (zero page)
    INC $CBD9            ; EE D9 CB | Increment (absolute)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_866
; Address: $D5BBAD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_866:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA $CAEB,Y          ; B9 EB CA | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_867
; Address: $D5BBB6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_867:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_868
; Address: $D5BBC0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_868:
    LDX #$5D             ; A2 5D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LSR $2201,X          ; 5E 01 22 | Logical shift right (absolute,X)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_869
; Address: $D5BBD7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_869:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_86A
; Address: $D5BBDF
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_86A:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$38             ; A2 38 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    AND $2201,Y          ; 39 01 22 | Logical AND with accumulator (absolute,Y)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    DEC                  ; 3A | Decrement accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    AND $2201,X          ; 3D 01 22 | Logical AND with accumulator (absolute,X)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROL $2201,X          ; 3E 01 22 | Rotate left (absolute,X)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    RTI                  ; 40 | Return from interrupt
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_86B
; Address: $D5BC25
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_86B:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$3E             ; A2 3E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$3F             ; A2 3F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$40             ; A2 40 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$1C             ; A2 1C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_86C
; Address: $D5BC41
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_86C:
    JSL $C666AF          ; 22 AF 66 C6 | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_86E
; Address: $D5BC4F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_86E:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP $CAEB,Y          ; D9 EB CA | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_870
; Address: $D5BC59
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_870:
    LDX #$62             ; A2 62 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STZ $01              ; 64 01 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_871
; Address: $D5BC6A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_871:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$65             ; A2 65 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROR $01              ; 66 01 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_872
; Address: $D5BC78
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_872:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$42             ; A2 42 | Hardware register operation
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR $01              ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_873
; Address: $D5BC94
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_873:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$46             ; A2 46 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR #$01             ; 49 01 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_874
; Address: $D5BCB0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_874:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_876
; Address: $D5BCBF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_876:
    LDX #$67             ; A2 67 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_877
; Address: $D5BCD1
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_877:
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    JMP $2201            ; 4C 01 22 | Jump to address
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR $2201            ; 4D 01 22 | Exclusive OR with accumulator (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LSR $2201            ; 4E 01 22 | Logical shift right (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BVC $01              ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_878
; Address: $D5BCF3
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_878:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$51             ; A2 51 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR $2201,Y          ; 59 01 22 | Exclusive OR with accumulator (absolute,Y)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PHY                  ; 5A | Push Y register to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_879
; Address: $D5BD41
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_879:
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    JMP $092201          ; 5C 01 22 09 | Jump to address long
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR $2201,X          ; 5D 01 22 | Exclusive OR with accumulator (absolute,X)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LSR $2201,X          ; 5E 01 22 | Logical shift right (absolute,X)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_87A
; Address: $D5BD62
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_87A:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_87B
; Address: $D5BD6A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_87B:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$62             ; A2 62 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STZ $01              ; 64 01 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_87C
; Address: $D5BD7F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_87C:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$65             ; A2 65 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROR $01              ; 66 01 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_87D
; Address: $D5BD8D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_87D:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$67             ; A2 67 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    WDM #$01             ; 42 01 | Reserved instruction

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_87F
; Address: $D5BDA2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_87F:
    JSL $C666E1          ; 22 E1 66 C6 | Jump to subroutine long
    LDX #$41             ; A2 41 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_882
; Address: $D5BDBA
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_882:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA $2200,X          ; 1D 00 22 | Logical OR with accumulator (absolute,X)
    LDA $22C666          ; AF 66 C6 22 | Load from absolute long address into accumulator
    LDA ($EB,X)          ; A1 EB | Load from (zero page,X) into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_883
; Address: $D5BDD2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_883:
    LDX #$69             ; A2 69 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ADC #$01             ; 69 01 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_884
; Address: $D5BDE3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_884:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$6A             ; A2 6A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_885
; Address: $D5BDF0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_885:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    JMP ($2201)          ; 6C 01 22 | Jump to address (absolute indirect)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ADC $2201            ; 6D 01 22 | Add with carry (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROR $2201            ; 6E 01 22 | Rotate right (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BVS $01              ; 70 01 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_886
; Address: $D5BE14
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_886:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$71             ; A2 71 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_887
; Address: $D5BE2F
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_887:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $22              ; C6 22 | Decrement (zero page)
    PHX                  ; DA | Push X register to stack
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_88A
; Address: $D5BE63
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_88A:
    LDX #$6B             ; A2 6B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    JMP ($2201)          ; 6C 01 22 | Jump to address (absolute indirect)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ADC $2201,Y          ; 79 01 22 | Add with carry (absolute,Y)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    DEY                  ; 88 | Decrement Y register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ADC $2201,X          ; 7D 01 22 | Add with carry (absolute,X)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROR $2201,X          ; 7E 01 22 | Rotate right (absolute,X)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_88B
; Address: $D5BEA4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_88B:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BRA $01              ; 80 01 | Branch always

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_88C
; Address: $D5BEAC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_88C:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$81             ; A2 81 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STY $01              ; 84 01 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_88D
; Address: $D5BEC8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_88D:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$85             ; A2 85 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STX $01              ; 86 01 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_88E
; Address: $D5BED6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_88E:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$87             ; A2 87 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $22              ; C6 22 | Decrement (zero page)
    LDX #$43             ; A2 43 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_892
; Address: $D5BEFF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_892:
    LDX #$6D             ; A2 6D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ROR $2201            ; 6E 01 22 | Rotate right (absolute)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BIT #$01             ; 89 01 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_893
; Address: $D5BF10
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_893:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$8A             ; A2 8A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PHB                  ; 8B | Push data bank register to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_894
; Address: $D5BF21
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_894:
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STY $2201            ; 8C 01 22 | Store Y register to absolute address
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STA $2201            ; 8D 01 22 | Store accumulator to absolute address
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STX $2201            ; 8E 01 22 | Store X register to absolute address
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STZ $2201            ; 9C 01 22 | Store zero to absolute
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STA $2201,X          ; 9D 01 22 | Store accumulator to absolute,X
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STZ $2201,X          ; 9E 01 22 | Store zero to absolute,X
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STA                  ; 9F 01 22 09 | Store accumulator to absolute long,X
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_895
; Address: $D5BF56
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_895:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$8F             ; A2 8F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BCC $01              ; 90 01 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_896
; Address: $D5BF64
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_896:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$91             ; A2 91 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_897
; Address: $D5BF98
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_897:
    DEC $A2              ; C6 A2 | Decrement (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STA $2201,Y          ; 99 01 22 | Store accumulator to absolute,Y
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_899
; Address: $D5BFC0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_899:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC $CAEB,X          ; DE EB CA | Decrement (absolute,X)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_89D
; Address: $D5BFDC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_89D:
    LDX #$6F             ; A2 6F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BVS $01              ; 70 01 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_89E
; Address: $D5BFE6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_89E:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$A1             ; A2 A1 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_89F
; Address: $D5BFF4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_89F:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8A3
; Address: $D5C00B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8A3:
    LDX #$71             ; A2 71 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8A4
; Address: $D5C01B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8A4:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$4E             ; A2 4E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8A7
; Address: $D5C036
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8A7:
    LDX #$A4             ; A2 A4 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    SEC                  ; 38 | Set carry flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$39             ; A2 39 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$3A             ; A2 3A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$3B             ; A2 3B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$3C             ; A2 3C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$3D             ; A2 3D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$3E             ; A2 3E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8A9
; Address: $D5C080
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8A9:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $CAEB,X          ; 5D EB CA | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8AA
; Address: $D5C089
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8AA:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    DEX                  ; CA | Decrement X register
    LDX #$1E             ; A2 1E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8AC
; Address: $D5C09C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8AC:
    JSL $C666E1          ; 22 E1 66 C6 | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8AF
; Address: $D5C0AF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8AF:
    LDX #$74             ; A2 74 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDA $01              ; A5 01 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8B0
; Address: $D5C0CE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8B0:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$A6             ; A2 A6 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8B1
; Address: $D5C0DC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8B1:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$AA             ; A2 AA | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $22              ; C6 22 | Decrement (zero page)
    CMP $A2CB,X          ; DD CB A2 | Compare accumulator (absolute,X)
    EOR $01              ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8B4
; Address: $D5C10A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8B4:
    JSL $C666AF          ; 22 AF 66 C6 | Jump to subroutine long
    LDX #$46             ; A2 46 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$47             ; A2 47 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$48             ; A2 48 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8B5
; Address: $D5C123
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8B5:
    LDX #$49             ; A2 49 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$4A             ; A2 4A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8B8
; Address: $D5C143
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8B8:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    DEX                  ; CA | Decrement X register
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8BB
; Address: $D5C15B
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8BB:
    LDX #$78             ; A2 78 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ADC $2201,Y          ; 79 01 22 | Add with carry (absolute,Y)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PLB                  ; AB | Pull data bank register from stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $22              ; C6 22 | Decrement (zero page)
    CMP $A2CB,X          ; DD CB A2 | Compare accumulator (absolute,X)
    JMP $2201            ; 4C 01 22 | Jump to address
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8BD
; Address: $D5C199
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8BD:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8BF
; Address: $D5C1AD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8BF:
    LDX #$7C             ; A2 7C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ADC $2201,X          ; 7D 01 22 | Add with carry (absolute,X)
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8C0
; Address: $D5C1BC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8C0:
    ROR $2201,X          ; 7E 01 22 | Rotate right (absolute,X)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDY $2201            ; AC 01 22 | Load from absolute address into Y register
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDA $2201            ; AD 01 22 | Load from absolute address into accumulator
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDX $2201            ; AE 01 22 | Load from absolute address into X register
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDA $092201          ; AF 01 22 09 | Load from absolute long address into accumulator
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BCS $01              ; B0 01 | Branch if carry set

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8C1
; Address: $D5C1E1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8C1:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$B1             ; A2 B1 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $22              ; C6 22 | Decrement (zero page)
    DEC $A2CB,X          ; DE CB A2 | Decrement (absolute,X)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8C3
; Address: $D5C20E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8C3:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8C6
; Address: $D5C226
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8C6:
    LDX #$7F             ; A2 7F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$4F             ; A2 4F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8C7
; Address: $D5C237
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8C7:
    JSL $C666FA          ; 22 FA 66 C6 | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8D1
; Address: $D5C270
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8D1:
    JSL $C614D5          ; 22 D5 14 C6 | Jump to subroutine long
    LDX #$80             ; A2 80 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8D2
; Address: $D5C27E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8D2:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$40             ; A2 40 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$4F             ; A2 4F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8D4
; Address: $D5C299
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8D4:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    INC $22CA            ; EE CA 22 | Increment (absolute)
    SEP #$38             ; E2 38 | Set processor status bits
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    INC $A9CA            ; EE CA A9 | Increment (absolute)
    BRA $00              ; 80 00 | Branch always
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8D8
; Address: $D5C2C0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8D8:
    JSL $C614D5          ; 22 D5 14 C6 | Jump to subroutine long
    LDX #$82             ; A2 82 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BVC $01              ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8D9
; Address: $D5C2CE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8D9:
    JSL $C66696          ; 22 96 66 C6 | Jump to subroutine long
    LDX #$51             ; A2 51 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8DC
; Address: $D5C2E7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8DC:
    JSL $C614D5          ; 22 D5 14 C6 | Jump to subroutine long
    LDX #$83             ; A2 83 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8DE
; Address: $D5C2F9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8DE:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $A9CA            ; EE CA A9 | Increment (absolute)
    BRA $00              ; 80 00 | Branch always
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8E2
; Address: $D5C317
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8E2:
    JSL $C614D5          ; 22 D5 14 C6 | Jump to subroutine long
    LDX #$84             ; A2 84 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$53             ; A2 53 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8E4
; Address: $D5C33B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8E4:
    LDX #$85             ; A2 85 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $22              ; C6 22 | Decrement (zero page)
    SEP #$38             ; E2 38 | Set processor status bits
    PHA                  ; 48 | Push accumulator to stack
    ORA ($CD),Y          ; 11 CD | Logical OR with accumulator ((zero page),Y)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8E7
; Address: $D5C35D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8E7:
    LDX #$B4             ; A2 B4 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8E9
; Address: $D5C375
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8E9:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$88             ; A2 88 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8F2
; Address: $D5C3BB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8F2:
    JSL $C666E1          ; 22 E1 66 C6 | Jump to subroutine long
    LDX #$54             ; A2 54 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8F3
; Address: $D5C3C6
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8F3:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    CPX $22CA            ; EC CA 22 | Compare X register (absolute)
    SEP #$38             ; E2 38 | Set processor status bits
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX $6BCA            ; EC CA 6B | Compare X register (absolute)
    LDX #$87             ; A2 87 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8F5
; Address: $D5C3EA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8F5:
    JSL $C666E1          ; 22 E1 66 C6 | Jump to subroutine long
    LDX #$54             ; A2 54 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$10             ; A2 10 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8FB
; Address: $D5C419
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8FB:
    LDX #$89             ; A2 89 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PHB                  ; 8B | Push data bank register to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8FC
; Address: $D5C436
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8FC:
    LDX #$8C             ; A2 8C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STA $2201            ; 8D 01 22 | Store accumulator to absolute address
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STX $2201            ; 8E 01 22 | Store X register to absolute address
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$57             ; A2 57 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDA $3558            ; AD 58 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $C472            ; 4C 72 C4 | Jump to address
    LDX #$52             ; A2 52 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_8FF
; Address: $D5C472
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_8FF:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $CAEC            ; 2C EC CA | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_901
; Address: $D5C480
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_901:
    LDX #$8F             ; A2 8F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BCC $01              ; 90 01 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_902
; Address: $D5C48A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_902:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$91             ; A2 91 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    WDM #$01             ; 42 01 | Reserved instruction

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_918
; Address: $D5C529
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_918:
    LDX #$92             ; A2 92 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$58             ; A2 58 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_919
; Address: $D5C540
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_919:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_91A
; Address: $D5C546
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_91A:
    LDX #$94             ; A2 94 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    CLV                  ; B8 | Clear overflow flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDA $2201,Y          ; B9 01 22 | Load from absolute,Y into accumulator
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR $2201,Y          ; 59 01 22 | Exclusive OR with accumulator (absolute,Y)
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_91C
; Address: $D5C57B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_91C:
    LDX #$95             ; A2 95 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_91E
; Address: $D5C58A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_91E:
    LDX #$97             ; A2 97 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$75             ; A2 75 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_921
; Address: $D5C5A3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_921:
    JSL $C6153D          ; 22 3D 15 C6 | Jump to subroutine long
    LDX #$98             ; A2 98 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STA $2201,Y          ; 99 01 22 | Store accumulator to absolute,Y
    DEC $A2              ; C6 A2 | Decrement (zero page)
    EOR $01              ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_924
; Address: $D5C5C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_924:
    LDX #$60             ; A2 60 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$76             ; A2 76 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_927
; Address: $D5C5D6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_927:
    LDX #$9A             ; A2 9A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LSR $01              ; 46 01 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_92A
; Address: $D5C5F2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_92A:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDX #$5D             ; A2 5D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$87             ; A2 87 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_92C
; Address: $D5C607
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_92C:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDX #$5E             ; A2 5E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$89             ; A2 89 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_92E
; Address: $D5C61C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_92E:
    JSL $C666C8          ; 22 C8 66 C6 | Jump to subroutine long
    LDX #$5F             ; A2 5F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$8B             ; A2 8B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_930
; Address: $D5C631
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_930:
    JSL $C666AF          ; 22 AF 66 C6 | Jump to subroutine long
    LDX #$5C             ; A2 5C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$21             ; A2 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_932
; Address: $D5C646
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_932:
    JSL $C666E1          ; 22 E1 66 C6 | Jump to subroutine long
    LDX #$5A             ; A2 5A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$5B             ; A2 5B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_935
; Address: $D5C65D
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_935:
    LDX #$BB             ; A2 BB | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $22              ; C6 22 | Decrement (zero page)
    SEP #$38             ; E2 38 | Set processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    CPX $22CA            ; EC CA 22 | Compare X register (absolute)
    CPY $A26B            ; CC 6B A2 | Compare Y register (absolute)
    LDY $2201,X          ; BC 01 22 | Load from absolute,X into Y register
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDA $2201,X          ; BD 01 22 | Load from absolute,X into accumulator
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDX $2201,Y          ; BE 01 22 | Load from absolute,Y into X register
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDA                  ; BF 01 22 09 | Load from absolute long,X into accumulator
    DEC $A2              ; C6 A2 | Decrement (zero page)
    CPY #$01             ; C0 01 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_936
; Address: $D5C691
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_936:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$47             ; A2 47 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_937
; Address: $D5C69D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_937:
    LDX #$C1             ; A2 C1 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STZ $2201            ; 9C 01 22 | Store zero to absolute
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_939
; Address: $D5C6B7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_939:
    LDX #$C2             ; A2 C2 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STA $2201,X          ; 9D 01 22 | Store accumulator to absolute,X
    DEC $A2              ; C6 A2 | Decrement (zero page)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$61             ; A2 61 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_93A
; Address: $D5C6CE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_93A:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$22             ; A2 22 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_93F
; Address: $D5C6ED
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_93F:
    LDX #$C3             ; A2 C3 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    CPY $01              ; C4 01 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_940
; Address: $D5C6F7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_940:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$C5             ; A2 C5 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    DEC $01              ; C6 01 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_942
; Address: $D5C70C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_942:
    JSL $C614D5          ; 22 D5 14 C6 | Jump to subroutine long
    LDX #$49             ; A2 49 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_944
; Address: $D5C71B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_944:
    JSL $C614D5          ; 22 D5 14 C6 | Jump to subroutine long
    LDX #$9E             ; A2 9E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ADC ($01),Y          ; 71 01 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_946
; Address: $D5C72E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_946:
    LDX #$9F             ; A2 9F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$6F             ; A2 6F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$70             ; A2 70 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_949
; Address: $D5C756
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_949:
    LDX #$C8             ; A2 C8 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_94A
; Address: $D5C760
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_94A:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$81             ; A2 81 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$82             ; A2 82 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_94C
; Address: $D5C777
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_94C:
    LDX #$A1             ; A2 A1 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$7C             ; A2 7C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_952
; Address: $D5C7A6
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_952:
    LDX #$C9             ; A2 C9 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    DEX                  ; CA | Decrement X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$7F             ; A2 7F | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$80             ; A2 80 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_954
; Address: $D5C7CE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_954:
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$99             ; A2 99 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$9A             ; A2 9A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_955
; Address: $D5C7EB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_955:
    LDX #$A3             ; A2 A3 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDY $01              ; A4 01 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_956
; Address: $D5C7F5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_956:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$CB             ; A2 CB | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$80             ; A2 80 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_95A
; Address: $D5C81A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_95A:
    LDX #$CC             ; A2 CC | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STY $00              ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_95B
; Address: $D5C824
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_95B:
    JSL $C614D5          ; 22 D5 14 C6 | Jump to subroutine long
    LDX #$A5             ; A2 A5 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    JMP $2201            ; 4C 01 22 | Jump to address
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$92             ; A2 92 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$96             ; A2 96 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_95C
; Address: $D5C84B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_95C:
    LDX #$97             ; A2 97 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$82             ; A2 82 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_960
; Address: $D5C865
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_960:
    LDX #$CD             ; A2 CD | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDX $01              ; A6 01 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_961
; Address: $D5C86F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_961:
    JSL $C614BB          ; 22 BB 14 C6 | Jump to subroutine long
    LDX #$93             ; A2 93 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_963
; Address: $D5C87E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_963:
    JSL $C614D5          ; 22 D5 14 C6 | Jump to subroutine long
    LDX #$A7             ; A2 A7 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_964
; Address: $D5C891
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_964:
    LDX #$A8             ; A2 A8 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    DEC $2201            ; CE 01 22 | Decrement (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_967
; Address: $D5C8AE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_967:
    LDX #$A9             ; A2 A9 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    STY $00              ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_96B
; Address: $D5C8CF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_96B:
    LDX #$AB             ; A2 AB | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $A2              ; C6 A2 | Decrement (zero page)
    LDY $2201,X          ; BC 01 22 | Load from absolute,X into Y register
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$BD             ; A2 BD | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$86             ; A2 86 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_970
; Address: $D5C8FC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_970:
    LDX #$CF             ; A2 CF | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    DEC $A2              ; C6 A2 | Decrement (zero page)
    BNE $01              ; D0 01 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_971
; Address: $D5C906
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_971:
    JSL $C61509          ; 22 09 15 C6 | Jump to subroutine long
    LDX #$4E             ; A2 4E | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    LDX #$BA             ; A2 BA | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$BB             ; A2 BB | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $C6              ; 66 C6 | Rotate right (zero page)
    LDX #$88             ; A2 88 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_97E
; Address: $D5C95E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_97E:
    JSL $C687A0          ; 22 A0 87 C6 | Jump to subroutine long
    JMP $C985            ; 4C 85 C9 | Jump to address
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    LDX #$2A             ; A2 2A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_983
; Address: $D5C97E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_983:
    JSL $C67A85          ; 22 85 7A C6 | Jump to subroutine long
    JMP $C998            ; 4C 98 C9 | Jump to address
    LDA $C149            ; AD 49 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C965            ; 4C 65 C9 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C97E            ; 4C 7E C9 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_985
; Address: $D5C99C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_985:
    JSL $C687A0          ; 22 A0 87 C6 | Jump to subroutine long
    JMP $C9DC            ; 4C DC C9 | Jump to address
    LDA #$36             ; A9 36 | Load immediate value into accumulator
    LDX #$38             ; A2 38 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_988
; Address: $D5C9B1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_988:
    JSL $CA2184          ; 22 84 21 CA | Jump to subroutine long
    LDA #$36             ; A9 36 | Load immediate value into accumulator
    LDX #$38             ; A2 38 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_98E
; Address: $D5C9D5
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_98E:
    JSL $C67A85          ; 22 85 7A C6 | Jump to subroutine long
    JMP $C9EF            ; 4C EF C9 | Jump to address
    LDA $C149            ; AD 49 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C9A3            ; 4C A3 C9 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C9D5            ; 4C D5 C9 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_98F
; Address: $D5C9F0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_98F:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $CA03            ; 4C 03 CA | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_991
; Address: $D5C9FC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_991:
    JSL $C687A0          ; 22 A0 87 C6 | Jump to subroutine long
    JMP $CA0A            ; 4C 0A CA | Jump to address
    LDA #$1D             ; A9 1D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_994
; Address: $D5CA14
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_994:
    JSL $C67A85          ; 22 85 7A C6 | Jump to subroutine long
    JMP $CA2E            ; 4C 2E CA | Jump to address
    LDA $C149            ; AD 49 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CA0D            ; 4C 0D CA | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CA14            ; 4C 14 CA | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_996
; Address: $D5CA32
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_996:
    JSL $C73C23          ; 22 23 3C C7 | Jump to subroutine long
    LDA $C141            ; AD 41 C1 | Load from absolute address into accumulator
    CMP #$32             ; C9 32 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CA4B            ; 4C 4B CA | Jump to address
    LDA #$15             ; A9 15 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_997
; Address: $D5CA44
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_997:
    JSL $C687A0          ; 22 A0 87 C6 | Jump to subroutine long
    JMP $CA52            ; 4C 52 CA | Jump to address
    LDA #$16             ; A9 16 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_998
; Address: $D5CA4E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_998:
    JSL $C687A0          ; 22 A0 87 C6 | Jump to subroutine long
    JMP $CA89            ; 4C 89 CA | Jump to address
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    LDX #$27             ; A2 27 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_99A
; Address: $D5CA5F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_99A:
    JSL $CDE0D0          ; 22 D0 E0 CD | Jump to subroutine long
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    LDX #$27             ; A2 27 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_99F
; Address: $D5CA82
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_99F:
    JSL $C67A85          ; 22 85 7A C6 | Jump to subroutine long
    JMP $CA9C            ; 4C 9C CA | Jump to address
    LDA $C149            ; AD 49 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CA55            ; 4C 55 CA | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9A1
; Address: $D5CA9D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9A1:
    LDA #$BC             ; A9 BC | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    BCS $03              ; B0 03 | Branch if carry set
    JMP $CAB3            ; 4C B3 CA | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9A4
; Address: $D5CAB7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9A4:
    JSL $CDA8D4          ; 22 D4 A8 CD | Jump to subroutine long
    LDA #$BC             ; A9 BC | Load immediate value into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9A5
; Address: $D5CAC1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9A5:
    JSL $CDA8FB          ; 22 FB A8 CD | Jump to subroutine long
    LDA #$BC             ; A9 BC | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CMP $81              ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9A8
; Address: $D5CAD8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9A8:
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CAEA            ; 4C EA CA | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9AA
; Address: $D5CAEA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9AA:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    LDA #$72             ; A9 72 | Load immediate value into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9AF
; Address: $D5CB05
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9AF:
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CB23            ; 4C 23 CB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9B4
; Address: $D5CB27
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9B4:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9B5
; Address: $D5CB31
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9B5:
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9B8
; Address: $D5CB45
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9B8:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LSR $A900,X          ; 5E 00 A9 | Logical shift right (absolute,X)
    LDX $8D00            ; AE 00 8D | Load from absolute address into X register
    ADC $A9BE,Y          ; 79 BE A9 | Add with carry (absolute,Y)
    STA $342C            ; 8D 2C 34 | Store accumulator to absolute address
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9BC
; Address: $D5CB66
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9BC:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDA $CDAC,X          ; BD AC CD | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9C1
; Address: $D5CB85
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9C1:
    LDA $3551            ; AD 51 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CBDF            ; 4C DF CB | Jump to address
    LDA $362C            ; AD 2C 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $CBDF            ; 4C DF CB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9C3
; Address: $D5CB9F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9C3:
    JSL $CDA8D4          ; 22 D4 A8 CD | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$A3             ; A2 A3 | Load immediate value into X register
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9C7
; Address: $D5CBC4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9C7:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ASL $CDA8,X          ; 1E A8 CD | Arithmetic shift left (absolute,X)
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9C8
; Address: $D5CBD2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9C8:
    BIT $2236            ; 2C 36 22 | Test bits in accumulator (absolute)
    SBC $AC              ; E5 AC | Subtract with carry (zero page)
    CMP $8322            ; CD 22 83 | Compare accumulator (absolute)
    CPY $E34C            ; CC 4C E3 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9CA
; Address: $D5CBE4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9CA:
    LDA $3572            ; AD 72 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CBF6            ; 4C F6 CB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9CD
; Address: $D5CBFA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9CD:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9D2
; Address: $D5CC27
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9D2:
    LDA $3572            ; AD 72 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CC39            ; 4C 39 CC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9D5
; Address: $D5CC3D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9D5:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9DA
; Address: $D5CC6A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9DA:
    LDA $3572            ; AD 72 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CC7C            ; 4C 7C CC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9DD
; Address: $D5CC80
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9DD:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9E2
; Address: $D5CCAD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9E2:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LSR $2200,X          ; 5E 00 22 | Logical shift right (absolute,X)
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9E7
; Address: $D5CCCF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9E7:
    LDA $358A            ; AD 8A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CCE1            ; 4C E1 CC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9EA
; Address: $D5CCE5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9EA:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9ED
; Address: $D5CD03
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9ED:
    JSL $CACCAD          ; 22 AD CC CA | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9EF
; Address: $D5CD12
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9EF:
    LDA $358A            ; AD 8A 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CD24            ; 4C 24 CD | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9F2
; Address: $D5CD28
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9F2:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$70             ; A9 70 | Load immediate value into accumulator
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9F5
; Address: $D5CD46
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9F5:
    JSL $CACCAD          ; 22 AD CC CA | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9F7
; Address: $D5CD55
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9F7:
    LDA $358A            ; AD 8A 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CD67            ; 4C 67 CD | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9FA
; Address: $D5CD6B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9FA:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$70             ; A9 70 | Load immediate value into accumulator
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_9FD
; Address: $D5CD89
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_9FD:
    JSL $CACCAD          ; 22 AD CC CA | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A03
; Address: $D5CDAE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A03:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A06
; Address: $D5CDCC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A06:
    JSL $CACCAD          ; 22 AD CC CA | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A08
; Address: $D5CDDB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A08:
    LDA $358B            ; AD 8B 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CDED            ; 4C ED CD | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A0B
; Address: $D5CDF1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A0B:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$70             ; A9 70 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A0E
; Address: $D5CE0F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A0E:
    JSL $CACCAD          ; 22 AD CC CA | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A10
; Address: $D5CE1E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A10:
    LDA $358B            ; AD 8B 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CE30            ; 4C 30 CE | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A14
; Address: $D5CE38
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A14:
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A17
; Address: $D5CE52
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A17:
    JSL $CACCAD          ; 22 AD CC CA | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A19
; Address: $D5CE61
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A19:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STX $2209            ; 8E 09 22 | Store X register to absolute address
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A1A
; Address: $D5CE6C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A1A:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LSR $2200,X          ; 5E 00 22 | Logical shift right (absolute,X)
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    BEQ $C9              ; F0 C9 | Branch if equal
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A1B
; Address: $D5CE84
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A1B:
    LDA $3589            ; AD 89 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CE96            ; 4C 96 CE | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A1E
; Address: $D5CE9A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A1E:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$E0             ; A9 E0 | Game work RAM access
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A21
; Address: $D5CEB8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A21:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A22
; Address: $D5CECC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A22:
    BIT #$35             ; 89 35 | Test bits in accumulator (immediate)
    LDX #$50             ; A2 50 | Load immediate value into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A27
; Address: $D5CEE7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A27:
    LDA $3589            ; AD 89 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CEF9            ; 4C F9 CE | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A2A
; Address: $D5CEFD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A2A:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$E0             ; A9 E0 | Game work RAM access
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A2D
; Address: $D5CF1B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A2D:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$B3             ; A9 B3 | Load immediate value into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    BIT #$35             ; 89 35 | Test bits in accumulator (immediate)
    LDA #$B3             ; A9 B3 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CMP $81              ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A32
; Address: $D5CF4A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A32:
    LDA $3589            ; AD 89 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CF5C            ; 4C 5C CF | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A36
; Address: $D5CF66
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A36:
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$E0             ; A9 E0 | Game work RAM access
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A39
; Address: $D5CF7E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A39:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA #$70             ; A9 70 | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    BIT #$35             ; 89 35 | Test bits in accumulator (immediate)
    LDX #$70             ; A2 70 | Load immediate value into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A3E
; Address: $D5CFAD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A3E:
    LDA $3589            ; AD 89 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CFBF            ; 4C BF CF | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A41
; Address: $D5CFC3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A41:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$E0             ; A9 E0 | Game work RAM access
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A44
; Address: $D5CFE1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A44:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$59             ; A9 59 | Load immediate value into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    BIT #$35             ; 89 35 | Test bits in accumulator (immediate)
    LDA #$59             ; A9 59 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CMP $81              ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A49
; Address: $D5D010
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A49:
    LDA $3589            ; AD 89 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D022            ; 4C 22 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A4C
; Address: $D5D026
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A4C:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A4F
; Address: $D5D044
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A4F:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    STA ($BE,X)          ; 81 BE | Store accumulator to (zero page,X)
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    BIT #$35             ; 89 35 | Test bits in accumulator (immediate)
    LDX #$30             ; A2 30 | Load immediate value into X register
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A54
; Address: $D5D073
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A54:
    LDA $3589            ; AD 89 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D085            ; 4C 85 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A57
; Address: $D5D089
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A57:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A58
; Address: $D5D095
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A58:
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A5B
; Address: $D5D0A7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A5B:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$91             ; A9 91 | Load immediate value into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    BIT #$35             ; 89 35 | Test bits in accumulator (immediate)
    LDA #$91             ; A9 91 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CMP $81              ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A60
; Address: $D5D0D6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A60:
    LDA $3589            ; AD 89 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D0E8            ; 4C E8 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A63
; Address: $D5D0EC
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A63:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A66
; Address: $D5D10A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A66:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA #$38             ; A9 38 | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    BIT #$35             ; 89 35 | Test bits in accumulator (immediate)
    LDX #$38             ; A2 38 | Load immediate value into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A6B
; Address: $D5D139
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A6B:
    LDA $3589            ; AD 89 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D14B            ; 4C 4B D1 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A6E
; Address: $D5D14F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A6E:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$E0             ; A9 E0 | Game work RAM access
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A71
; Address: $D5D16D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A71:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    BIT #$35             ; 89 35 | Test bits in accumulator (immediate)
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CMP $81              ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A76
; Address: $D5D19C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A76:
    LDA $358A            ; AD 8A 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D1AE            ; 4C AE D1 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A79
; Address: $D5D1B2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A79:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A7C
; Address: $D5D1D0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A7C:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$8E             ; A9 8E | Load immediate value into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    LDA #$8E             ; A9 8E | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CMP $81              ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A81
; Address: $D5D1FF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A81:
    LDA $358A            ; AD 8A 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D211            ; 4C 11 D2 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A84
; Address: $D5D215
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A84:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A87
; Address: $D5D233
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A87:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    LDX #$B0             ; A2 B0 | Load immediate value into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A90
; Address: $D5D278
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A90:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A93
; Address: $D5D296
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A93:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$BB             ; A9 BB | Load immediate value into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    LDA #$BB             ; A9 BB | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CMP $81              ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A98
; Address: $D5D2C5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A98:
    LDA $358A            ; AD 8A 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D2D7            ; 4C D7 D2 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A9B
; Address: $D5D2DB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A9B:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A9E
; Address: $D5D2F9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A9E:
    JSL $CACE6C          ; 22 6C CE CA | Jump to subroutine long
    LDA #$B2             ; A9 B2 | Load immediate value into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_A9F
; Address: $D5D303
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_A9F:
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    LDA #$B2             ; A9 B2 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CMP $81              ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AA4
; Address: $D5D328
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AA4:
    LDA $3558            ; AD 58 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D33A            ; 4C 3A D3 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AA7
; Address: $D5D33E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AA7:
    JSL $CDA8D4          ; 22 D4 A8 CD | Jump to subroutine long
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$A3             ; A2 A3 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AA8
; Address: $D5D354
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AA8:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDX #$96             ; A2 96 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    DEC $22              ; C6 22 | Decrement (zero page)
    ROR $D0              ; 66 D0 | Rotate right (zero page)
    CPY $BE22            ; CC 22 BE | Compare Y register (absolute)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ASL $CDA8,X          ; 1E A8 CD | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AA9
; Address: $D5D36D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AA9:
    JSL $CDACE5          ; 22 E5 AC CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AAB
; Address: $D5D37C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AAB:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D39C            ; 4C 9C D3 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AAD
; Address: $D5D38B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AAD:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STA $2209            ; 8D 09 22 | Store accumulator to absolute address
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    DEX                  ; CA | Decrement X register
    JMP $D3F6            ; 4C F6 D3 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AB0
; Address: $D5D3A6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AB0:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D3EE            ; 4C EE D3 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AB2
; Address: $D5D3B3
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AB2:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    ORA #$A9             ; 09 A9 | Logical OR with accumulator (immediate)
    ORA $8D00            ; 0D 00 8D | Logical OR with accumulator (absolute)
    BIT $AD34            ; 2C 34 AD | Test bits in accumulator (absolute)
    BIT $2234            ; 2C 34 22 | Test bits in accumulator (absolute)
    STA                  ; 9F CF C1 A9 | Store accumulator to absolute long,X
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CMP $81              ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AB3
; Address: $D5D3D6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AB3:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    PHB                  ; 8B | Push data bank register to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    STY $2209            ; 8C 09 22 | Store Y register to absolute address
    INX                  ; E8 | Increment X register
    CMP #$CD             ; C9 CD | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AB8
; Address: $D5D3F7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AB8:
    JSL $CDA766          ; 22 66 A7 CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$38             ; A9 38 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$87             ; A2 87 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ABB
; Address: $D5D416
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ABB:
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$38             ; A9 38 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$88             ; A2 88 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AC0
; Address: $D5D43C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AC0:
    JSL $CAD431          ; 22 31 D4 CA | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AC1
; Address: $D5D448
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AC1:
    JSL $CAD431          ; 22 31 D4 CA | Jump to subroutine long
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AC2
; Address: $D5D454
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AC2:
    JSL $CAD431          ; 22 31 D4 CA | Jump to subroutine long
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AC3
; Address: $D5D460
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AC3:
    JSL $CAD431          ; 22 31 D4 CA | Jump to subroutine long
    LDA #$0F             ; A9 0F | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AC4
; Address: $D5D46C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AC4:
    JSL $CAD431          ; 22 31 D4 CA | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AC5
; Address: $D5D478
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AC5:
    JSL $CAD431          ; 22 31 D4 CA | Jump to subroutine long
    LDA #$11             ; A9 11 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AC6
; Address: $D5D484
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AC6:
    JSL $CAD431          ; 22 31 D4 CA | Jump to subroutine long
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AC7
; Address: $D5D490
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AC7:
    JSL $CAD431          ; 22 31 D4 CA | Jump to subroutine long
    LDA #$25             ; A9 25 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AC8
; Address: $D5D49C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AC8:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AC9
; Address: $D5D4AA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AC9:
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D4DB            ; 4C DB D4 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ACB
; Address: $D5D4B8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ACB:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D4D4            ; 4C D4 D4 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ACC
; Address: $D5D4C1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ACC:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA #$A9             ; 09 A9 | Logical OR with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ACF
; Address: $D5D4DB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ACF:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AD0
; Address: $D5D4E6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AD0:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ROR $220D            ; 6E 0D 22 | Rotate right (absolute)
    CPX #$AC             ; E0 AC | Compare X register (immediate)
    CMP $BFA9            ; CD A9 BF | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AD3
; Address: $D5D4FC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AD3:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ROR $220D            ; 6E 0D 22 | Rotate right (absolute)
    CPX #$AC             ; E0 AC | Compare X register (immediate)
    CMP $BFA9            ; CD A9 BF | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AD9
; Address: $D5D523
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AD9:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register
    CLV                  ; B8 | Clear overflow flag
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ADA
; Address: $D5D534
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ADA:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register
    LDA $2209,Y          ; B9 09 22 | Load from absolute,Y into accumulator
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ADB
; Address: $D5D545
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ADB:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    SBC $2203,Y          ; F9 03 22 | Subtract with carry (absolute,Y)
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ADC
; Address: $D5D550
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ADC:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STA $2204            ; 8D 04 22 | Store accumulator to absolute address
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ADD
; Address: $D5D55B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ADD:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LDX $2208,Y          ; BE 08 22 | Load from absolute,Y into X register
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ADE
; Address: $D5D566
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ADE:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STA $D22209          ; 8F 09 22 D2 | Store accumulator to absolute long address
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AE1
; Address: $D5D57C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AE1:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STZ $2209,X          ; 9E 09 22 | Store zero to absolute,X
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AE2
; Address: $D5D587
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AE2:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STZ $220F,X          ; 9E 0F 22 | Store zero to absolute,X
    ADC $B0CC,X          ; 7D CC B0 | Add with carry (absolute,X)
    JMP $D59F            ; 4C 9F D5 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AE3
; Address: $D5D596
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AE3:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $D5A5            ; 4C A5 D5 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AE8
; Address: $D5D5B5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AE8:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D5C7            ; 4C C7 D5 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AF0
; Address: $D5D5E2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AF0:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ASL $CDA8,X          ; 1E A8 CD | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AF1
; Address: $D5D5EC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AF1:
    JSL $CDACE5          ; 22 E5 AC CD | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AF3
; Address: $D5D5FB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AF3:
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$A3             ; A2 A3 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AF5
; Address: $D5D612
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AF5:
    LDA $3582            ; AD 82 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D624            ; 4C 24 D6 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AFD
; Address: $D5D643
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AFD:
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_AFF
; Address: $D5D65A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_AFF:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LDY $2208            ; AC 08 22 | Load from absolute address into Y register
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B02
; Address: $D5D671
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B02:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D687            ; 4C 87 D6 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B0B
; Address: $D5D6A2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B0B:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STA $220F,Y          ; 99 0F 22 | Store accumulator to absolute,Y
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B0D
; Address: $D5D6B3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B0D:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D6C9            ; 4C C9 D6 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B0F
; Address: $D5D6C0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B0F:
    JSR $2203            ; 20 03 22 | Jump to subroutine
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    CMP $22D6            ; CD D6 22 | Compare accumulator (absolute)
    CPX #$AC             ; E0 AC | Compare X register (immediate)
    CMP $AD6B            ; CD 6B AD | Compare accumulator (absolute)
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D6DD            ; 4C DD D6 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B10
; Address: $D5D6D9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B10:
    JSL $CC6B0B          ; 22 0B 6B CC | Jump to subroutine long
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D6EC            ; 4C EC D6 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B12
; Address: $D5D6ED
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B12:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D70E            ; 4C 0E D7 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $9686            ; 8D 86 96 | Store accumulator to absolute address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $9688            ; 8D 88 96 | Store accumulator to absolute address
    LDX #$08             ; A2 08 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B13
; Address: $D5D70A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B13:
    JSL $C73518          ; 22 18 35 C7 | Jump to subroutine long
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D71D            ; 4C 1D D7 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B15
; Address: $D5D71E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B15:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D73F            ; 4C 3F D7 | Jump to address
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$A1             ; A2 A1 | Load immediate value into X register
    ORA ($A0,X)          ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B17
; Address: $D5D740
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B17:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D7BA            ; 4C BA D7 | Jump to address
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$2A             ; A2 2A | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B18
; Address: $D5D75D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B18:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$2B             ; A2 2B | Load immediate value into X register
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B19
; Address: $D5D773
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B19:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$19             ; A9 19 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B1A
; Address: $D5D795
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B1A:
    JSL $C736F7          ; 22 F7 36 C7 | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B1B
; Address: $D5D79F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B1B:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D7BA            ; 4C BA D7 | Jump to address
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$A0             ; A2 A0 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B1E
; Address: $D5D7BF
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B1E:
    JSL $CDE33E          ; 22 3E E3 CD | Jump to subroutine long
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D811            ; 4C 11 D8 | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D811            ; 4C 11 D8 | Jump to address
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$2D             ; A9 2D | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$19             ; A9 19 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B1F
; Address: $D5D7F7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B1F:
    JSL $C736BD          ; 22 BD 36 C7 | Jump to subroutine long
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D80D            ; 4C 0D D8 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B24
; Address: $D5D81B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B24:
    JSL $CC92BC          ; 22 BC 92 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D82B            ; 4C 2B D8 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B28
; Address: $D5D830
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B28:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D851            ; 4C 51 D8 | Jump to address
    LDA #$48             ; A9 48 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$E0             ; A9 E0 | Game work RAM access
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$C7             ; A2 C7 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B2B
; Address: $D5D856
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B2B:
    LDA $3551            ; AD 51 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D865            ; 4C 65 D8 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B2E
; Address: $D5D86A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B2E:
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D8A5            ; 4C A5 D8 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B2F
; Address: $D5D875
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B2F:
    JSL $CBAE5A          ; 22 5A AE CB | Jump to subroutine long
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$11             ; A2 11 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B30
; Address: $D5D88B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B30:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$15             ; A2 15 | Load immediate value into X register
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B31
; Address: $D5D8A1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B31:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D8B4            ; 4C B4 D8 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B35
; Address: $D5D8B9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B35:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D8C8            ; 4C C8 D8 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B38
; Address: $D5D8CD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B38:
    JSL $CDE326          ; 22 26 E3 CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$5E             ; A2 5E | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B39
; Address: $D5D8E6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B39:
    JSL $C734DE          ; 22 DE 34 C7 | Jump to subroutine long
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D8F9            ; 4C F9 D8 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B3B
; Address: $D5D8FA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B3B:
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D90D            ; 4C 0D D9 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B44
; Address: $D5D928
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B44:
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D94B            ; 4C 4B D9 | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDX #$6E             ; A2 6E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B45
; Address: $D5D93C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B45:
    JSL $C7377B          ; 22 7B 37 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D94B            ; 4C 4B D9 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B47
; Address: $D5D94C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B47:
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D960            ; 4C 60 D9 | Jump to address
    LDA #$A7             ; A9 A7 | Load immediate value into accumulator
    STA $352E            ; 8D 2E 35 | Store accumulator to absolute address
    JMP $D966            ; 4C 66 D9 | Jump to address
    LDA #$A6             ; A9 A6 | Load immediate value into accumulator
    STA $352E            ; 8D 2E 35 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B48
; Address: $D5D967
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B48:
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$38             ; A9 38 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$88             ; A2 88 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B4F
; Address: $D5D993
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B4F:
    JSL $C7787B          ; 22 7B 78 C7 | Jump to subroutine long
    ROL $E3              ; 26 E3 | Rotate left (zero page)
    CMP $AD6B            ; CD 6B AD | Compare accumulator (absolute)
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D9D9            ; 4C D9 D9 | Jump to address
    LDA #$F8             ; A9 F8 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B50
; Address: $D5D9AC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B50:
    JSL $C733E5          ; 22 E5 33 C7 | Jump to subroutine long
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B51
; Address: $D5D9B6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B51:
    JSL $C733E5          ; 22 E5 33 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B54
; Address: $D5D9CB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B54:
    JSL $C7473B          ; 22 3B 47 C7 | Jump to subroutine long
    LDA #$F8             ; A9 F8 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B57
; Address: $D5D9DA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B57:
    JSL $CDE326          ; 22 26 E3 CD | Jump to subroutine long
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D9ED            ; 4C ED D9 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B58
; Address: $D5D9E9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B58:
    JSL $CAD5FB          ; 22 FB D5 CA | Jump to subroutine long
    LDA $3553            ; AD 53 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DA04            ; 4C 04 DA | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B5C
; Address: $D5DA05
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B5C:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DA17            ; 4C 17 DA | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B5D
; Address: $D5DA10
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B5D:
    JSL $CDE326          ; 22 26 E3 CD | Jump to subroutine long
    JMP $DA36            ; 4C 36 DA | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B5E
; Address: $D5DA1D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B5E:
    JSL $C733E5          ; 22 E5 33 C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B61
; Address: $D5DA32
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B61:
    JSL $C74743          ; 22 43 47 C7 | Jump to subroutine long
    LDA #$F8             ; A9 F8 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B63
; Address: $D5DA41
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B63:
    JSL $CDE326          ; 22 26 E3 CD | Jump to subroutine long
    LDA $3582            ; AD 82 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DA54            ; 4C 54 DA | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B66
; Address: $D5DA58
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B66:
    JSL $C7334A          ; 22 4A 33 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DA82            ; 4C 82 DA | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B67
; Address: $D5DA61
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B67:
    JSL $CC7A06          ; 22 06 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DA82            ; 4C 82 DA | Jump to address
    LDA $3552            ; AD 52 35 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B68
; Address: $D5DA6D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B68:
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $DA82            ; 4C 82 DA | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B69
; Address: $D5DA75
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B69:
    JSL $CADA84          ; 22 84 DA CA | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DA82            ; 4C 82 DA | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DA83            ; 4C 83 DA | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B6A
; Address: $D5DA84
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B6A:
    JSL $C75219          ; 22 19 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DAA6            ; 4C A6 DA | Jump to address
    LDA #$B8             ; A9 B8 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$C8             ; A2 C8 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DAA3            ; 4C A3 DA | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DB0A            ; 4C 0A DB | Jump to address
    JMP $DB09            ; 4C 09 DB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B6B
; Address: $D5DAA6
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B6B:
    JSL $C751F0          ; 22 F0 51 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DAC8            ; 4C C8 DA | Jump to address
    LDA #$B8             ; A9 B8 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$C8             ; A2 C8 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$30             ; A0 30 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DAC5            ; 4C C5 DA | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DB0A            ; 4C 0A DB | Jump to address
    JMP $DB09            ; 4C 09 DB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B6C
; Address: $D5DAC8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B6C:
    JSL $C75203          ; 22 03 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DAEA            ; 4C EA DA | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B6E
; Address: $D5DADA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B6E:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DAE7            ; 4C E7 DA | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B6F
; Address: $D5DAE3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B6F:
    SEC                  ; 38 | Set carry flag
    JMP $DB0A            ; 4C 0A DB | Jump to address
    JMP $DB09            ; 4C 09 DB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B70
; Address: $D5DAEA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B70:
    JSL $C7522F          ; 22 2F 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DB09            ; 4C 09 DB | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B72
; Address: $D5DAFC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B72:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DB09            ; 4C 09 DB | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DB0A            ; 4C 0A DB | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B74
; Address: $D5DB0E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B74:
    JSL $C7334A          ; 22 4A 33 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DB24            ; 4C 24 DB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B75
; Address: $D5DB17
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B75:
    JSL $CADB26          ; 22 26 DB CA | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DB24            ; 4C 24 DB | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DB25            ; 4C 25 DB | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B76
; Address: $D5DB26
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B76:
    JSL $C75219          ; 22 19 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DB48            ; 4C 48 DB | Jump to address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    LDX #$38             ; A2 38 | Load immediate value into X register
    LDY #$B8             ; A0 B8 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B77
; Address: $D5DB38
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B77:
    JSL $C75365          ; 22 65 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DB45            ; 4C 45 DB | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DBAC            ; 4C AC DB | Jump to address
    JMP $DBAB            ; 4C AB DB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B78
; Address: $D5DB48
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B78:
    JSL $C751F0          ; 22 F0 51 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DB6A            ; 4C 6A DB | Jump to address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    LDX #$38             ; A2 38 | Load immediate value into X register
    LDY #$E8             ; A0 E8 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B7A
; Address: $D5DB60
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B7A:
    JMP $DB67            ; 4C 67 DB | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DBAC            ; 4C AC DB | Jump to address
    JMP $DBAB            ; 4C AB DB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B7B
; Address: $D5DB6A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B7B:
    JSL $C75203          ; 22 03 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DB8C            ; 4C 8C DB | Jump to address
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$E0             ; A2 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    LDY #$20             ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B7C
; Address: $D5DB7C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B7C:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DB89            ; 4C 89 DB | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DBAC            ; 4C AC DB | Jump to address
    JMP $DBAB            ; 4C AB DB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B7D
; Address: $D5DB8C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B7D:
    JSL $C7522F          ; 22 2F 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DBAB            ; 4C AB DB | Jump to address
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$E0             ; A2 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    LDY #$40             ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B7E
; Address: $D5DB9E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B7E:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DBAB            ; 4C AB DB | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DBAC            ; 4C AC DB | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B80
; Address: $D5DBB0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B80:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DBBD            ; 4C BD DB | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DBBE            ; 4C BE DB | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B82
; Address: $D5DBC2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B82:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DBCF            ; 4C CF DB | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DBD0            ; 4C D0 DB | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B84
; Address: $D5DBD4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B84:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DBE1            ; 4C E1 DB | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DBE2            ; 4C E2 DB | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B86
; Address: $D5DBE6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B86:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DBF3            ; 4C F3 DB | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DBF4            ; 4C F4 DB | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B87
; Address: $D5DBF5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B87:
    JSL $CADA55          ; 22 55 DA CA | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DC16            ; 4C 16 DC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B8B
; Address: $D5DC0E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B8B:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    JMP $DC27            ; 4C 27 DC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B8D
; Address: $D5DC1C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B8D:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    EOR $2200            ; 4D 00 22 | Exclusive OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    CPY $6B38            ; CC 38 6B | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B8E
; Address: $D5DC28
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B8E:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $DC5C            ; 4C 5C DC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B90
; Address: $D5DC3D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B90:
    JSL $CADB0B          ; 22 0B DB CA | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DC4E            ; 4C 4E DC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B91
; Address: $D5DC46
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B91:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    JMP $DC59            ; 4C 59 DC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B93
; Address: $D5DC54
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B93:
    JSL $CCD3F8          ; 22 F8 D3 CC | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    JMP $DC61            ; 4C 61 DC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B96
; Address: $D5DC62
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B96:
    JSL $CADC7A          ; 22 7A DC CA | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DC75            ; 4C 75 DC | Jump to address
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B99
; Address: $D5DC7A
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B99:
    JMP $DCC5            ; 4C C5 DC | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DC8C            ; 4C 8C DC | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DCE9            ; 4C E9 DC | Jump to address
    JMP $DCE8            ; 4C E8 DC | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DC9E            ; 4C 9E DC | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DCE9            ; 4C E9 DC | Jump to address
    JMP $DCE8            ; 4C E8 DC | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DCB0            ; 4C B0 DC | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DCE9            ; 4C E9 DC | Jump to address
    JMP $DCE8            ; 4C E8 DC | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DCC2            ; 4C C2 DC | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $DCE9            ; 4C E9 DC | Jump to address
    JMP $DCE8            ; 4C E8 DC | Jump to address
    LDA $C1AD            ; AD AD C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DC7D            ; 4C 7D DC | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DC8F            ; 4C 8F DC | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DCA1            ; 4C A1 DC | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_B9A
; Address: $D5DCE5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_B9A:
    JMP $DCB3            ; 4C B3 DC | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_BBB
; Address: $D5DD69
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_BBB:
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DD7A            ; 4C 7A DD | Jump to address
    ROR                  ; 6A | Rotate right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $DD7D            ; 4C 7D DD | Jump to address
    ADC #$0A             ; 69 0A | Add with carry (immediate)
    LDA #$5C             ; A9 5C | Load immediate value into accumulator
    LDY #$5C             ; A0 5C | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_BBC
; Address: $D5DD83
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_BBC:
    JSL $C3C4BA          ; 22 BA C4 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $DD99            ; 4C 99 DD | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_BC0
; Address: $D5DDA0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_BC0:
    JSL $CDBE18          ; 22 18 BE CD | Jump to subroutine long
    LDA #$5C             ; A9 5C | Load immediate value into accumulator
    LDY #$5C             ; A0 5C | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_BC1
; Address: $D5DDAA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_BC1:
    JSL $C3C58E          ; 22 8E C5 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $DDC0            ; 4C C0 DD | Jump to address
    BIT $0A              ; 24 0A | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_BC4
; Address: $D5DDC6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_BC4:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DDD3            ; 4C D3 DD | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_BC8
; Address: $D5DDDF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_BC8:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $A0              ; 80 A0 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_BCD
; Address: $D5DDF5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_BCD:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DE08            ; 4C 08 DE | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $A0              ; 80 A0 | Branch always

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_BCF
; Address: $D5DE09
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_BCF:
    JSL $CC7A06          ; 22 06 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DE1C            ; 4C 1C DE | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $A0              ; 80 A0 | Branch always

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_BD1
; Address: $D5DE1D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_BD1:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DE32            ; 4C 32 DE | Jump to address
    LDA #$2A             ; A9 2A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_BD2
; Address: $D5DE2B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_BD2:
    JSL $C77365          ; 22 65 73 C7 | Jump to subroutine long
    JMP $DE39            ; 4C 39 DE | Jump to address
    LDA #$29             ; A9 29 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_BFF
; Address: $D5DEF3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_BFF:
    JSL $C7919C          ; 22 9C 91 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DF06            ; 4C 06 DF | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_C02
; Address: $D5DF06
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_C02:
    JSL $C79190          ; 22 90 91 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DF19            ; 4C 19 DF | Jump to address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_C03
; Address: $D5DF12
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_C03:
    JSL $C7752B          ; 22 2B 75 C7 | Jump to subroutine long
    JMP $DF20            ; 4C 20 DF | Jump to address
    LDA #$0B             ; A9 0B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_C07
; Address: $D5DF2B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_C07:
    JSL $C77791          ; 22 91 77 C7 | Jump to subroutine long
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_C47
; Address: $D5E0B5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_C47:
    JSL $C778E7          ; 22 E7 78 C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDX #$02             ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_C48
; Address: $D5E0BF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_C48:
    JSL $C778FA          ; 22 FA 78 C7 | Jump to subroutine long
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    LDX #$02             ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_C52
; Address: $D5E100
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_C52:
    JSL $CBDFA1          ; 22 A1 DF CB | Jump to subroutine long
    LDA $8B6C            ; AD 6C 8B | Load from absolute address into accumulator
    STA $997F            ; 8D 7F 99 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_C54
; Address: $D5E10F
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_C54:
    LDA $3547            ; AD 47 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E139            ; 4C 39 E1 | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E132            ; 4C 32 E1 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_C55
; Address: $D5E12B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_C55:
    JSL $C02EC7          ; 22 C7 2E C0 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    JMP $E145            ; 4C 45 E1 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_C81
; Address: $D5E1FA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_C81:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E20D            ; 4C 0D E2 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D02
; Address: $D5E436
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D02:
    JSL $CC92E1          ; 22 E1 92 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $E44C            ; 4C 4C E4 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D1B
; Address: $D5E4AE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D1B:
    JSL $CC8F60          ; 22 60 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $E4BB            ; 4C BB E4 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D44
; Address: $D5E564
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D44:
    JSL $CBDF05          ; 22 05 DF CB | Jump to subroutine long
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E576            ; 4C 76 E5 | Jump to address
    JMP $E585            ; 4C 85 E5 | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $E585            ; 4C 85 E5 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D46
; Address: $D5E585
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D46:
    JSL $CC945F          ; 22 5F 94 CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E596            ; 4C 96 E5 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D48
; Address: $D5E592
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D48:
    JSL $CBE104          ; 22 04 E1 CB | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E5C9            ; 4C C9 E5 | Jump to address
    LDA #$F8             ; A9 F8 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D49
; Address: $D5E5A7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D49:
    JSL $C73465          ; 22 65 34 C7 | Jump to subroutine long
    LDA #$F8             ; A9 F8 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D4A
; Address: $D5E5B1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D4A:
    JSL $C733E5          ; 22 E5 33 C7 | Jump to subroutine long
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D4B
; Address: $D5E5BB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D4B:
    JSL $C733E5          ; 22 E5 33 C7 | Jump to subroutine long
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D89
; Address: $D5E6CF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D89:
    JSL $CAEB1A          ; 22 1A EB CA | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E701            ; 4C 01 E7 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D8C
; Address: $D5E6F6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D8C:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    PHB                  ; 8B | Push data bank register to stack
    JMP $E75E            ; 4C 5E E7 | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E713            ; 4C 13 E7 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D8D
; Address: $D5E70C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D8D:
    JSL $CBDF75          ; 22 75 DF CB | Jump to subroutine long
    JMP $E75E            ; 4C 5E E7 | Jump to address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E74D            ; 4C 4D E7 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D8F
; Address: $D5E725
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D8F:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    SBC $F638,Y          ; F9 38 F6 | Subtract with carry (absolute,Y)
    LDA $9977            ; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D90
; Address: $D5E730
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D90:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    AND #$39             ; 29 39 | Logical AND with accumulator (immediate)
    LDA $9977            ; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D91
; Address: $D5E73B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D91:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    EOR $F639,Y          ; 59 39 F6 | Exclusive OR with accumulator (absolute,Y)
    LDA #$1A             ; A9 1A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_D93
; Address: $D5E74D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_D93:
    JSL $CAEB3E          ; 22 3E EB CA | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E03
; Address: $D5E93F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E03:
    JSL $CBDF15          ; 22 15 DF CB | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E96D            ; 4C 6D E9 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E04
; Address: $D5E954
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E04:
    JSL $C02EC7          ; 22 C7 2E C0 | Jump to subroutine long
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $E96A            ; 4C 6A E9 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E2D
; Address: $D5EA22
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E2D:
    JSL $CBDF05          ; 22 05 DF CB | Jump to subroutine long
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $EA38            ; 4C 38 EA | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E2E
; Address: $D5EA31
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E2E:
    JSL $CBE032          ; 22 32 E0 CB | Jump to subroutine long
    JMP $EA3F            ; 4C 3F EA | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E74
; Address: $D5EB67
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E74:
    JSL $CDA724          ; 22 24 A7 CD | Jump to subroutine long
    LDA $354B            ; AD 4B 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $EB80            ; 4C 80 EB | Jump to address
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    JMP $EB87            ; 4C 87 EB | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E75
; Address: $D5EB88
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E75:
    JSL $CDA724          ; 22 24 A7 CD | Jump to subroutine long
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E77
; Address: $D5EB99
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E77:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EBA6            ; 4C A6 EB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E79
; Address: $D5EBA7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E79:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EBB8            ; 4C B8 EB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E7C
; Address: $D5EBB9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E7C:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EBC6            ; 4C C6 EB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E7E
; Address: $D5EBC7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E7E:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EBD8            ; 4C D8 EB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E83
; Address: $D5EBE3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E83:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EBF7            ; 4C F7 EB | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E84
; Address: $D5EBEC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E84:
    JSL $CAF3E6          ; 22 E6 F3 CA | Jump to subroutine long
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E85
; Address: $D5EBF8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E85:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EC05            ; 4C 05 EC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E87
; Address: $D5EC06
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E87:
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $EC2B            ; 4C 2B EC | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $EC2B            ; 4C 2B EC | Jump to address
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $EC2B            ; 4C 2B EC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E89
; Address: $D5EC2C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E89:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EC39            ; 4C 39 EC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E8F
; Address: $D5EC48
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E8F:
    JSL $CAF3E6          ; 22 E6 F3 CA | Jump to subroutine long
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E91
; Address: $D5EC57
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E91:
    JSL $C7518C          ; 22 8C 51 C7 | Jump to subroutine long
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$C8             ; A0 C8 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EC71            ; 4C 71 EC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E94
; Address: $D5EC75
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E94:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EC90            ; 4C 90 EC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E97
; Address: $D5EC89
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E97:
    JSL $CAED07          ; 22 07 ED CA | Jump to subroutine long
    JMP $ECAB            ; 4C AB EC | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E98
; Address: $D5EC93
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E98:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $ECAB            ; 4C AB EC | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E9D
; Address: $D5ECAF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E9D:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $ECC1            ; 4C C1 EC | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    ASL $ED              ; 06 ED | Arithmetic shift left (zero page)
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_E9F
; Address: $D5ECCA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_E9F:
    JMP $ECD6            ; 4C D6 EC | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    ASL $ED              ; 06 ED | Arithmetic shift left (zero page)
    LDA #$22             ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EA0
; Address: $D5ECD9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EA0:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $ECEB            ; 4C EB EC | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    ASL $ED              ; 06 ED | Arithmetic shift left (zero page)
    LDA #$23             ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EA1
; Address: $D5ECEE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EA1:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $ED00            ; 4C 00 ED | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    ASL $ED              ; 06 ED | Arithmetic shift left (zero page)
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)
    LDA #$20             ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EA2
; Address: $D5ED0A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EA2:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $ED1C            ; 4C 1C ED | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    ADC ($ED,X)          ; 61 ED | Add with carry ((zero page,X))
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EA3
; Address: $D5ED1F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EA3:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $ED31            ; 4C 31 ED | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    ADC ($ED,X)          ; 61 ED | Add with carry ((zero page,X))
    LDA #$22             ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EA4
; Address: $D5ED34
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EA4:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $ED46            ; 4C 46 ED | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    ADC ($ED,X)          ; 61 ED | Add with carry ((zero page,X))
    LDA #$23             ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EA5
; Address: $D5ED49
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EA5:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $ED5B            ; 4C 5B ED | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    ADC ($ED,X)          ; 61 ED | Add with carry ((zero page,X))
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EA7
; Address: $D5ED65
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EA7:
    JSL $C7518C          ; 22 8C 51 C7 | Jump to subroutine long
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$C8             ; A0 C8 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $ED7F            ; 4C 7F ED | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EAA
; Address: $D5ED83
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EAA:
    JSL $C7518C          ; 22 8C 51 C7 | Jump to subroutine long
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$C8             ; A0 C8 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $ED9D            ; 4C 9D ED | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EAD
; Address: $D5EDA1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EAD:
    JSL $C7518C          ; 22 8C 51 C7 | Jump to subroutine long
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$C8             ; A0 C8 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EDBB            ; 4C BB ED | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EB0
; Address: $D5EDBF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EB0:
    JSL $C7518C          ; 22 8C 51 C7 | Jump to subroutine long
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$C8             ; A0 C8 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EDD9            ; 4C D9 ED | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EB3
; Address: $D5EDDD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EB3:
    JSL $C7518C          ; 22 8C 51 C7 | Jump to subroutine long
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$C8             ; A0 C8 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EDF7            ; 4C F7 ED | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EB6
; Address: $D5EDFB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EB6:
    JSL $C7518C          ; 22 8C 51 C7 | Jump to subroutine long
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$C8             ; A0 C8 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EE15            ; 4C 15 EE | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EB9
; Address: $D5EE1D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EB9:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EE4C            ; 4C 4C EE | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EBB
; Address: $D5EE2A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EBB:
    JSL $CAF3E6          ; 22 E6 F3 CA | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$64             ; C9 64 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EE45            ; 4C 45 EE | Jump to address
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    JMP $EE4C            ; 4C 4C EE | Jump to address
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EBF
; Address: $D5EE59
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EBF:
    JSL $CCD2F4          ; 22 F4 D2 CC | Jump to subroutine long
    JMP $EE70            ; 4C 70 EE | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EC0
; Address: $D5EE63
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EC0:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EE70            ; 4C 70 EE | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EC4
; Address: $D5EE7B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EC4:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EEB3            ; 4C B3 EE | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EC6
; Address: $D5EE8B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EC6:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EE9C            ; 4C 9C EE | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EC8
; Address: $D5EE98
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EC8:
    JSL $CDA73D          ; 22 3D A7 CD | Jump to subroutine long
    LDA #$E0             ; A9 E0 | Game work RAM access
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR $C76D,Y          ; 59 6D C7 | Exclusive OR with accumulator (absolute,Y)
    LDA #$23             ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EC9
; Address: $D5EEA6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EC9:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EEB3            ; 4C B3 EE | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ECC
; Address: $D5EEB7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ECC:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EEC8            ; 4C C8 EE | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ED0
; Address: $D5EECC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ED0:
    JSL $C75001          ; 22 01 50 C7 | Jump to subroutine long
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROL $C76D            ; 2E 6D C7 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ED3
; Address: $D5EEE3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ED3:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EEF7            ; 4C F7 EE | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ED4
; Address: $D5EEEC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ED4:
    JSL $CAF3E6          ; 22 E6 F3 CA | Jump to subroutine long
    LDA #$36             ; A9 36 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_ED5
; Address: $D5EEF8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_ED5:
    JSL $CC7A06          ; 22 06 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EF0C            ; 4C 0C EF | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EDE
; Address: $D5EF2A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EDE:
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $EF3C            ; 4C 3C EF | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EDF
; Address: $D5EF35
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EDF:
    JSL $CCD211          ; 22 11 D2 CC | Jump to subroutine long
    JMP $EF52            ; 4C 52 EF | Jump to address
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $EF4E            ; 4C 4E EF | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EE2
; Address: $D5EF53
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EE2:
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $EF65            ; 4C 65 EF | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EE3
; Address: $D5EF5E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EE3:
    JSL $CCD211          ; 22 11 D2 CC | Jump to subroutine long
    JMP $EF7B            ; 4C 7B EF | Jump to address
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $EF77            ; 4C 77 EF | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EE7
; Address: $D5EF7C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EE7:
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $EF8E            ; 4C 8E EF | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EEA
; Address: $D5EF93
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EEA:
    JSL $CC7A15          ; 22 15 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EFAA            ; 4C AA EF | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    EOR $CDDC            ; 4D DC CD | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EEC
; Address: $D5EFAA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EEC:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EFC7            ; 4C C7 EF | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EF2
; Address: $D5EFCC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EF2:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $EFED            ; 4C ED EF | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EF9
; Address: $D5EFF2
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EF9:
    LDA $3572            ; AD 72 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $F013            ; 4C 13 F0 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EFB
; Address: $D5F013
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EFB:
    LDA $3572            ; AD 72 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $F034            ; 4C 34 F0 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EFC
; Address: $D5F030
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EFC:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDA $3572            ; AD 72 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $F055            ; 4C 55 F0 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EFD
; Address: $D5F051
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EFD:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $F078            ; 4C 78 F0 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_EFE
; Address: $D5F060
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_EFE:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    CMP #$46             ; C9 46 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $F078            ; 4C 78 F0 | Jump to address
    LDA #$ED             ; A9 ED | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F03
; Address: $D5F087
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F03:
    LDA $3552            ; AD 52 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $F0E9            ; 4C E9 F0 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F04
; Address: $D5F092
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F04:
    JSL $CC7A15          ; 22 15 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $F0B8            ; 4C B8 F0 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F05
; Address: $D5F09B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F05:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F08
; Address: $D5F0B8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F08:
    JSL $CC7A26          ; 22 26 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $F0DE            ; 4C DE F0 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F0D
; Address: $D5F0E9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F0D:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $F0F9            ; 4C F9 F0 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F10
; Address: $D5F0FE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F10:
    LDA $3552            ; AD 52 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $F179            ; 4C 79 F1 | Jump to address
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $F172            ; 4C 72 F1 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F11
; Address: $D5F114
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F11:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    CMP #$15             ; C9 15 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $F127            ; 4C 27 F1 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F12
; Address: $D5F123
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F12:
    JSL $CDDC56          ; 22 56 DC CD | Jump to subroutine long
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$2A             ; A9 2A | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$19             ; A9 19 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$2B             ; A9 2B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F13
; Address: $D5F13C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F13:
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F14
; Address: $D5F145
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F14:
    JSL $C736BD          ; 22 BD 36 C7 | Jump to subroutine long
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$A5             ; A2 A5 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F1A
; Address: $D5F179
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F1A:
    JSL $CC7A06          ; 22 06 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $F189            ; 4C 89 F1 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F20
; Address: $D5F19D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F20:
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $F209            ; 4C 09 F2 | Jump to address
    LDA #$D8             ; A9 D8 | Load immediate value into accumulator
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$46             ; A2 46 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F21
; Address: $D5F1BA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F21:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDA #$D8             ; A9 D8 | Load immediate value into accumulator
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$47             ; A2 47 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F24
; Address: $D5F1D4
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F24:
    JSL $CCD086          ; 22 86 D0 CC | Jump to subroutine long
    LDA #$7E             ; A9 7E | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$48             ; A9 48 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$7F             ; A9 7F | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$48             ; A9 48 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F29
; Address: $D5F20E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F29:
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $F274            ; 4C 74 F2 | Jump to address
    LDA #$C8             ; A9 C8 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$48             ; A2 48 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F2A
; Address: $D5F22E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F2A:
    JSL $C734DE          ; 22 DE 34 C7 | Jump to subroutine long
    LDA #$C8             ; A9 C8 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$49             ; A2 49 | Load immediate value into X register
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F2C
; Address: $D5F24B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F2C:
    JSL $CCD086          ; 22 86 D0 CC | Jump to subroutine long
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$49             ; A9 49 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1D             ; A9 1D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F2D
; Address: $D5F25E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F2D:
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$49             ; A9 49 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F2E
; Address: $D5F26D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F2E:
    JSL $C736BD          ; 22 BD 36 C7 | Jump to subroutine long
    JMP $F27C            ; 4C 7C F2 | Jump to address
    LDX #$75             ; A2 75 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F31
; Address: $D5F282
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F31:
    LDA #$9A             ; A9 9A | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$68             ; A9 68 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$9A             ; A9 9A | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$6D             ; A9 6D | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$01             ; A2 01 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F36
; Address: $D5F2B2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F36:
    LDA #$51             ; A9 51 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$5E             ; A9 5E | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$51             ; A9 51 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$63             ; A9 63 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$01             ; A2 01 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F37
; Address: $D5F2D0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F37:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$5E             ; A9 5E | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$63             ; A9 63 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$01             ; A2 01 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F43
; Address: $D5F327
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F43:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$21             ; A2 21 | PPU graphics register access
    LDA #$1B             ; A9 1B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F61
; Address: $D5F3BC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F61:
    JSL $C79983          ; 22 83 99 C7 | Jump to subroutine long
    JMP $F3DE            ; 4C DE F3 | Jump to address
    LDA $C149            ; AD 49 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $F3AE            ; 4C AE F3 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $F3B5            ; 4C B5 F3 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $F3BC            ; 4C BC F3 | Jump to address

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F62
; Address: $D5F3DE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F62:
    JSL $C7996B          ; 22 6B 99 C7 | Jump to subroutine long
    JMP $F31F            ; 4C 1F F3 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F64
; Address: $D5F3EA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F64:
    JSL $C77219          ; 22 19 72 C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    JMP ($6B98)          ; 6C 98 6B | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank2A_DmaFunction_F65
; Address: $D5F3F5
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank2A_DmaFunction_F65:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$34             ; C9 34 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $F425            ; 4C 25 F4 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    PHX                  ; DA | Push X register to stack
    CMP $294C            ; CD 4C 29 | Compare accumulator (absolute)
    PEA #$4B22           ; F4 22 4B | Push effective address to stack
    PHX                  ; DA | Push X register to stack
    CMP $2202            ; CD 02 22 | Compare accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY $AD6B            ; CC 6B AD | Compare Y register (absolute)
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $F441            ; 4C 41 F4 | Jump to address
