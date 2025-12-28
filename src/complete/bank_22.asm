;==============================================================================
; Dragon Quest III - Bank $22
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $D10000-$D17FFF
; Instructions: 9282
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_22"

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_000
; Address: $D18002
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_000:
    JMP ($0400)          ; 6C 00 04 | Jump to address (absolute indirect)
    JMP ($C500)          ; 6C 00 C5 | Jump to address (absolute indirect)
    JMP ($4500)          ; 6C 00 45 | Jump to address (absolute indirect)
    CPY $07              ; C4 07 | Compare Y register (zero page)
    JMP ($5900)          ; 6C 00 59 | Jump to address (absolute indirect)
    EOR $05              ; 45 05 | Exclusive OR with accumulator (zero page)
    STA $12C3,Y          ; 99 C3 12 | Update graphics data
    CPY $12              ; C4 12 | Compare Y register (zero page)
    CPY $12              ; C4 12 | Compare Y register (zero page)
    WDM #$06             ; 42 06 | Reserved instruction
    JMP ($8500)          ; 6C 00 85 | Jump to address (absolute indirect)
    CMP ($0E,X)          ; C1 0E | Compare accumulator ((zero page,X))
    JMP ($0500)          ; 6C 00 05 | Jump to address (absolute indirect)
    CPY $04              ; C4 04 | Compare Y register (zero page)
    JMP ($8700)          ; 6C 00 87 | Jump to address (absolute indirect)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    JMP ($C700)          ; 6C 00 C7 | Jump to address (absolute indirect)
    REP #$10             ; C2 10 | Reset processor status bits
    JMP ($2E00)          ; 6C 00 2E | Jump to address (absolute indirect)
    CMP #$17             ; C9 17 | Compare accumulator (immediate)
    LDA ($06,X)          ; A1 06 | Read graphics status
    STY $43              ; 84 43 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    JMP ($0A00)          ; 6C 00 0A | Jump to address (absolute indirect)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ROR $8A00,X          ; 7E 00 8A | Rotate right (absolute,X)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ROR $1800,X          ; 7E 00 18 | Rotate right (absolute,X)
    INY                  ; C8 | Increment Y register
    INC                  ; 1A | Increment accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    INY                  ; C8 | Increment Y register
    INC                  ; 1A | Increment accumulator
    CMP $1A49,Y          ; D9 49 1A | Compare accumulator (absolute,Y)
    DEX                  ; CA | Decrement X register
    JMP ($D900)          ; 6C 00 D9 | Jump to address (absolute indirect)
    CPY $07              ; C4 07 | Compare Y register (zero page)
    STA $07C8,Y          ; 99 C8 07 | Update graphics data
    CMP $07              ; C5 07 | Compare accumulator (zero page)
    INY                  ; C8 | Increment Y register
    CLI                  ; 58 | Clear interrupt disable flag
    PHX                  ; DA | Push X register to stack
    EOR #$0B             ; 49 0B | Exclusive OR with accumulator (immediate)
    EOR $04C2,Y          ; 59 C2 04 | Exclusive OR with accumulator (absolute,Y)
    STA $04C2,Y          ; 99 C2 04 | Update graphics data
    STY $42              ; 84 42 | Hardware register operation
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    JMP ($C400)          ; 6C 00 C4 | Jump to address (absolute indirect)
    LSR $11              ; 46 11 | Logical shift right (zero page)
    JMP ($0700)          ; 6C 00 07 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_001
; Address: $D180E9
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_001:
    JMP ($0700)          ; 6C 00 07 | Jump to address (absolute indirect)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    JMP ($C500)          ; 6C 00 C5 | Jump to address (absolute indirect)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    JMP ($D900)          ; 6C 00 D9 | Jump to address (absolute indirect)
    CPY $14              ; C4 14 | Compare Y register (zero page)
    EOR $0543,Y          ; 59 43 05 | Exclusive OR with accumulator (absolute,Y)
    DEC $14              ; C6 14 | Decrement (zero page)
    WDM #$05             ; 42 05 | Reserved instruction
    STA $DB0F,X          ; 9D 0F DB | Update graphics data
    DEC $14              ; C6 14 | Decrement (zero page)
    STA $440F,X          ; 9D 0F 44 | Update graphics data
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    JMP ($8400)          ; 6C 00 84 | Jump to address (absolute indirect)
    JMP ($4A00)          ; 6C 00 4A | Jump to address (absolute indirect)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROR $0400,X          ; 7E 00 04 | Rotate right (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    JMP ($8700)          ; 6C 00 87 | Jump to address (absolute indirect)
    WDM #$06             ; 42 06 | Reserved instruction
    JMP ($0700)          ; 6C 00 07 | Jump to address (absolute indirect)
    CPY $06              ; C4 06 | Compare Y register (zero page)
    JMP ($0700)          ; 6C 00 07 | Jump to address (absolute indirect)
    PHP                  ; 08 | Push processor status to stack
    JMP ($0A00)          ; 6C 00 0A | Jump to address (absolute indirect)
    STY $09              ; 84 09 | Store Y register to zero page
    ROR $8500,X          ; 7E 00 85 | Rotate right (absolute,X)
    CPY $1A              ; C4 1A | Compare Y register (zero page)
    JMP ($C700)          ; 6C 00 C7 | Jump to address (absolute indirect)
    JMP ($4700)          ; 6C 00 47 | Jump to address (absolute indirect)
    CPY $0F              ; C4 0F | Compare Y register (zero page)
    JMP ($C500)          ; 6C 00 C5 | Jump to address (absolute indirect)
    CPY $1A              ; C4 1A | Compare Y register (zero page)
    JMP ($4500)          ; 6C 00 45 | Jump to address (absolute indirect)
    EOR $1B              ; 45 1B | Exclusive OR with accumulator (zero page)
    JMP ($4400)          ; 6C 00 44 | Jump to address (absolute indirect)
    CMP $1B              ; C5 1B | Compare accumulator (zero page)
    JMP ($8400)          ; 6C 00 84 | Jump to address (absolute indirect)
    EOR $1C              ; 45 1C | Exclusive OR with accumulator (zero page)
    JMP ($C100)          ; 6C 00 C1 | Jump to address (absolute indirect)
    PHA                  ; 48 | Push accumulator to stack
    BRA $02              ; 80 02 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    CMP ($C5,X)          ; C1 C5 | Compare accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $81              ; 26 81 | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_002
; Address: $D1819F
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_002:
    INC $C101,X          ; FE 01 C1 | Increment (absolute,X)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    EOR ($CC,X)          ; 41 CC | Exclusive OR with accumulator ((zero page,X))
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    CMP ($CB,X)          ; C1 CB | Compare accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    EOR ($CC,X)          ; 41 CC | Exclusive OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    STA ($4C,X)          ; 81 4C | Update graphics data
    ASL $0900            ; 0E 00 09 | Arithmetic shift left (absolute)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    STA ($CF,X)          ; 81 CF | Update graphics data
    ASL $0900            ; 0E 00 09 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    CMP ($4F,X)          ; C1 4F | Compare accumulator ((zero page,X))
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    EOR ($43,X)          ; 41 43 | Exclusive OR with accumulator ((zero page,X))
    ORA $0980            ; 0D 80 09 | Logical OR with accumulator (absolute)
    EOR ($C4,X)          ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
    BRA $05              ; 80 05 | Branch always
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    STA ($47,X)          ; 81 47 | Update graphics data
    STA ($C7,X)          ; 81 C7 | Update graphics data
    ORA $0D00            ; 0D 00 0D | Logical OR with accumulator (absolute)
    ADC $02              ; 65 02 | Add with carry (zero page)
    BPL $C8              ; 10 C8 | Branch if positive
    ASL $0D00            ; 0E 00 0D | Arithmetic shift left (absolute)
    EOR ($44,X)          ; 41 44 | Exclusive OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    EOR ($44,X)          ; 41 44 | Exclusive OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CMP ($49,X)          ; C1 49 | Compare accumulator ((zero page,X))
    ASL $0289            ; 0E 89 02 | Arithmetic shift left (absolute)
    ORA ($C4,X)          ; 01 C4 | Logical OR with accumulator ((zero page,X))
    BRA $0F              ; 80 0F | Branch always
    BCC $02              ; 90 02 | Branch if carry clear
    SBC ($DF,X)          ; E1 DF | Subtract with carry ((zero page,X))
    BPL $C7              ; 10 C7 | Branch if positive
    CPY #$5E             ; C0 5E | Compare Y register (immediate)
    ROL $00              ; 26 00 | Rotate left (zero page)
    STA $CACA,X          ; 9D CA CA | Update graphics data
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_003
; Address: $D18221
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_003:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    EOR $6BCC,Y          ; 59 CC 6B | Exclusive OR with accumulator (absolute,Y)
    INC $33CC            ; EE CC 33 | Increment (absolute)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_004
; Address: $D18234
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_004:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_005
; Address: $D1823B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_005:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    REP #$06             ; C2 06 | Reset processor status bits
    STZ $CAD4            ; 9C D4 CA | Store zero to absolute
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_006
; Address: $D18248
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_006:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    WDM #$07             ; 42 07 | Reserved instruction
    STZ $CAD4            ; 9C D4 CA | Store zero to absolute
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_008
; Address: $D1825B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_008:
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    LDA #$CD             ; A9 CD | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_009
; Address: $D18262
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_009:
    INC $81CC            ; EE CC 81 | Increment (absolute)
    EOR $13              ; 45 13 | Exclusive OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_00A
; Address: $D1826F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_00A:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR $13              ; 45 13 | Exclusive OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_00B
; Address: $D1827C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_00B:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR $13              ; 45 13 | Exclusive OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_00C
; Address: $D18289
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_00C:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR $13              ; 45 13 | Exclusive OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_00D
; Address: $D18296
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_00D:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    DEC $1A              ; C6 1A | Decrement (zero page)
    LDA $CAD6            ; AD D6 CA | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_00E
; Address: $D182A3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_00E:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    LDA $CDA9,Y          ; B9 A9 CD | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_00F
; Address: $D182B0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_00F:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    STY $04C4            ; 8C C4 04 | Store Y register to absolute address
    LDA $CDA9,Y          ; B9 A9 CD | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_011
; Address: $D182C6
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_011:
    PHA                  ; 48 | Push accumulator to stack
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_012
; Address: $D182CA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_012:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    DEC $0A              ; C6 0A | Decrement (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_013
; Address: $D182D7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_013:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LDA $CDA9,Y          ; B9 A9 CD | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_014
; Address: $D182E4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_014:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    WDM #$08             ; 42 08 | Reserved instruction
    EOR $D5              ; 45 D5 | Exclusive OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_015
; Address: $D182F1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_015:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    PHP                  ; 08 | Push processor status to stack
    EOR $D5              ; 45 D5 | Exclusive OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_016
; Address: $D182FE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_016:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    REP #$09             ; C2 09 | Reset processor status bits
    EOR $D5              ; 45 D5 | Exclusive OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_017
; Address: $D1830B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_017:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    EOR $D5              ; 45 D5 | Exclusive OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_018
; Address: $D18318
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_018:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BRA $01              ; 80 01 | Branch always
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_019
; Address: $D18325
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_019:
    INC $43CC            ; EE CC 43 | Increment (absolute)
    STY $CAD6            ; 8C D6 CA | Store Y register to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_01A
; Address: $D18332
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_01A:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    STY $CAD6            ; 8C D6 CA | Store Y register to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_01B
; Address: $D1833F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_01B:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR $06              ; 45 06 | Exclusive OR with accumulator (zero page)
    BRA $01              ; 80 01 | Branch always
    STA ($40),Y          ; 91 40 | Update graphics data
    INC $4CCC            ; EE CC 4C | Increment (absolute)
    REP #$02             ; C2 02 | Reset processor status bits
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_01F
; Address: $D18366
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_01F:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CPY #$C5             ; C0 C5 | Compare Y register (immediate)
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_020
; Address: $D18373
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_020:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    RTI                  ; 40 | Return from interrupt
    DEC $1F              ; C6 1F | Decrement (zero page)
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_021
; Address: $D18380
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_021:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CPY #$43             ; C0 43 | Compare Y register (immediate)
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_022
; Address: $D1838D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_022:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    RTI                  ; 40 | Return from interrupt
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_023
; Address: $D1839A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_023:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_024
; Address: $D183A7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_024:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    BRA $C9              ; 80 C9 | Branch always
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_025
; Address: $D183B4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_025:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CPY #$C2             ; C0 C2 | Compare Y register (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_026
; Address: $D183C1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_026:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    BRA $42              ; 80 42 | Hardware register operation
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_027
; Address: $D183CE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_027:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_028
; Address: $D183D7
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_028:
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_029
; Address: $D183DB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_029:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    BRA $43              ; 80 43 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_02A
; Address: $D183E8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_02A:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CPY #$47             ; C0 47 | Compare Y register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_02B
; Address: $D183F5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_02B:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVC $D5              ; 50 D5 | Branch if overflow clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_02C
; Address: $D18402
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_02C:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CPY #$47             ; C0 47 | Compare Y register (immediate)
    ORA ($A7,X)          ; 01 A7 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_02D
; Address: $D1840F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_02D:
    INC $08CC            ; EE CC 08 | Increment (absolute)
    LSR $05              ; 46 05 | Logical shift right (zero page)
    LDX #$D6             ; A2 D6 | Load immediate value into X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_02E
; Address: $D1841C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_02E:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CPY $12              ; C4 12 | Compare Y register (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_02F
; Address: $D18429
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_02F:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CMP $12              ; C5 12 | Compare accumulator (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_030
; Address: $D18436
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_030:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CMP $0C              ; C5 0C | Compare accumulator (zero page)
    JMP ($CAD4)          ; 6C D4 CA | Jump to address (absolute indirect)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_031
; Address: $D18443
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_031:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STY $CAD6            ; 8C D6 CA | Store Y register to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_033
; Address: $D18459
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_033:
    SEI                  ; 78 | Set interrupt disable flag
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_034
; Address: $D1845D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_034:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    DEX                  ; CA | Decrement X register
    STY $D4              ; 84 D4 | Store Y register to zero page
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_035
; Address: $D1846A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_035:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_036
; Address: $D18477
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_036:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CPY $05              ; C4 05 | Compare Y register (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_037
; Address: $D18484
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_037:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CPY $05              ; C4 05 | Compare Y register (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_038
; Address: $D18491
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_038:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CPY $05              ; C4 05 | Compare Y register (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_039
; Address: $D1849E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_039:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_03A
; Address: $D184AB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_03A:
    INC $34CC            ; EE CC 34 | Increment (absolute)
    JMP $0583            ; 4C 83 05 | Jump to address
    LDA $CDA9,Y          ; B9 A9 CD | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_03B
; Address: $D184B8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_03B:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CPY $07C6            ; CC C6 07 | Compare Y register (absolute)
    LDA $CDA9,Y          ; B9 A9 CD | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_03C
; Address: $D184C5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_03C:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    ORA ($6E,X)          ; 01 6E | Logical OR with accumulator ((zero page,X))
    BCC $CB              ; 90 CB | Branch if carry clear
    INC $3ECC            ; EE CC 3E | Increment (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_03D
; Address: $D184D6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_03D:
    JSR $0584            ; 20 84 05 | Jump to subroutine
    BRA $01              ; 80 01 | Branch always
    JMP ($CDA9)          ; 6C A9 CD | Jump to address (absolute indirect)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_03E
; Address: $D184DF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_03E:
    INC $B5CC            ; EE CC B5 | Increment (absolute)
    INY                  ; C8 | Increment Y register
    STZ $CB99            ; 9C 99 CB | Store zero to absolute
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_03F
; Address: $D184EC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_03F:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    STA $CB              ; 85 CB | Update graphics data
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_040
; Address: $D184F9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_040:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    BPL $80              ; 10 80 | Branch if positive
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_041
; Address: $D18506
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_041:
    INC $C0CC            ; EE CC C0 | Increment (absolute)
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    CPY $10              ; C4 10 | Compare Y register (zero page)
    BRA $01              ; 80 01 | Branch always
    CPY $6BCA            ; CC CA 6B | Compare Y register (absolute)
    INC $C1CC            ; EE CC C1 | Increment (absolute)
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    ORA ($80),Y          ; 11 80 | Logical OR with accumulator ((zero page),Y)
    ORA ($6A,X)          ; 01 6A | Logical OR with accumulator ((zero page,X))
    CPY $6BCA            ; CC CA 6B | Compare Y register (absolute)
    INC $C2CC            ; EE CC C2 | Increment (absolute)
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($B5,X)          ; 01 B5 | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_042
; Address: $D1852D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_042:
    INC $0ACC            ; EE CC 0A | Increment (absolute)
    BRA $01              ; 80 01 | Branch always
    ORA $CB              ; 05 CB | Logical OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    INC $3CCC            ; EE CC 3C | Increment (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BCC $D4              ; 90 D4 | Branch if carry clear
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_043
; Address: $D18547
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_043:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    LDY #$84             ; A0 84 | Load immediate value into Y register
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_044
; Address: $D18554
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_044:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ADC $D6              ; 65 D6 | Add with carry (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_047
; Address: $D1856E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_047:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_048
; Address: $D1857B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_048:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    REP #$06             ; C2 06 | Reset processor status bits
    BRA $01              ; 80 01 | Branch always
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_049
; Address: $D18588
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_049:
    INC $42CC            ; EE CC 42 | Hardware register operation
    BRA $C3              ; 80 C3 | Branch always
    BRA $01              ; 80 01 | Branch always
    TAY                  ; A8 | Transfer accumulator to Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_04A
; Address: $D18595
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_04A:
    INC $D4CC            ; EE CC D4 | Increment (absolute)
    LSR $0C              ; 46 0C | Logical shift right (zero page)
    BIT $CD              ; 24 CD | Test bits in accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_04B
; Address: $D185A2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_04B:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    WDM #$38             ; 42 38 | Reserved instruction
    CMP $EE6B            ; CD 6B EE | Compare accumulator (absolute)
    CPY $0033            ; CC 33 00 | Compare Y register (absolute)
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    CMP $EE6B            ; CD 6B EE | Compare accumulator (absolute)
    CPY $0033            ; CC 33 00 | Compare Y register (absolute)
    STX $09              ; 86 09 | Store X register to zero page
    LDY $CD38,X          ; BC 38 CD | Load from absolute,X into Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_04C
; Address: $D185C9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_04C:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    STX $0E              ; 86 0E | Store X register to zero page
    SBC $CD38,Y          ; F9 38 CD | Subtract with carry (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_04D
; Address: $D185D6
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_04D:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    AND $6BCD,Y          ; 39 CD 6B | Logical AND with accumulator (absolute,Y)
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    AND $6BCD,Y          ; 39 CD 6B | Logical AND with accumulator (absolute,Y)
    INC $33CC            ; EE CC 33 | Increment (absolute)
    BRA $01              ; 80 01 | Branch always
    EOR $CBB6            ; 4D B6 CB | Exclusive OR with accumulator (absolute)
    INC $3ACC            ; EE CC 3A | Increment (absolute)
    EOR #$CD             ; 49 CD | Exclusive OR with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_04E
; Address: $D1860A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_04E:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    BRA $01              ; 80 01 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_050
; Address: $D18617
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_050:
    INC $3BCC            ; EE CC 3B | Increment (absolute)
    INY                  ; C8 | Increment Y register
    LDA ($B9,X)          ; A1 B9 | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_051
; Address: $D18624
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_051:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR $0113            ; 4D 13 01 | Exclusive OR with accumulator (absolute)
    ROR $D5              ; 66 D5 | Rotate right (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_052
; Address: $D18631
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_052:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    LSR $0113            ; 4E 13 01 | Logical shift right (absolute)
    ROR $D5              ; 66 D5 | Rotate right (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_053
; Address: $D1863E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_053:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    INY                  ; C8 | Increment Y register
    ADC ($D5),Y          ; 71 D5 | Add with carry ((zero page),Y)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_054
; Address: $D1864B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_054:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    INY                  ; C8 | Increment Y register
    ADC ($D5),Y          ; 71 D5 | Add with carry ((zero page),Y)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_055
; Address: $D18658
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_055:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    BPL $81              ; 10 81 | Branch if positive
    ORA ($CF,X)          ; 01 CF | Logical OR with accumulator ((zero page,X))
    CPY $6BCA            ; CC CA 6B | Compare Y register (absolute)
    INC $85CC            ; EE CC 85 | Increment (absolute)
    CMP $1B              ; C5 1B | Compare accumulator (zero page)
    STA ($01,X)          ; 81 01 | Update graphics data
    CMP $6BCA            ; CD CA 6B | Compare accumulator (absolute)
    INC $86CC            ; EE CC 86 | Increment (absolute)
    DEC $811B            ; CE 1B 81 | Decrement (absolute)
    ORA ($55,X)          ; 01 55 | Logical OR with accumulator ((zero page,X))
    CMP $6BCA            ; CD CA 6B | Compare accumulator (absolute)
    INC $87CC            ; EE CC 87 | Increment (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    BRA $01              ; 80 01 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP $6BCA            ; CD CA 6B | Compare accumulator (absolute)
    INC $88CC            ; EE CC 88 | Increment (absolute)
    ASL $0180            ; 0E 80 01 | Arithmetic shift left (absolute)
    STY $CE              ; 84 CE | Store Y register to zero page
    DEX                  ; CA | Decrement X register
    INC $78CC            ; EE CC 78 | Increment (absolute)
    ASL $0180            ; 0E 80 01 | Arithmetic shift left (absolute)
    DEC $87CA            ; CE CA 87 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_056
; Address: $D186A6
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_056:
    INC $79CC            ; EE CC 79 | Increment (absolute)
    BRA $01              ; 80 01 | Branch always
    LSR                  ; 4A | Logical shift right (accumulator)
    DEX                  ; CA | Decrement X register
    INC $7ACC            ; EE CC 7A | Increment (absolute)
    BRA $01              ; 80 01 | Branch always
    LDA $CACF            ; AD CF CA | Read graphics status
    INC $7BCC            ; EE CC 7B | Increment (absolute)
    BRA $01              ; 80 01 | Branch always
    BPL $D0              ; 10 D0 | Branch if positive
    DEX                  ; CA | Decrement X register
    INC $7CCC            ; EE CC 7C | Increment (absolute)
    BRA $01              ; 80 01 | Branch always
    BNE $CA              ; D0 CA | Branch if not equal
    INC $7DCC            ; EE CC 7D | Increment (absolute)
    DEC $0F              ; C6 0F | Decrement (zero page)
    BRA $01              ; 80 01 | Branch always
    BNE $CA              ; D0 CA | Branch if not equal
    INC $7ECC            ; EE CC 7E | Increment (absolute)
    LSR $0F              ; 46 0F | Logical shift right (zero page)
    BRA $01              ; 80 01 | Branch always
    AND $CAD1,Y          ; 39 D1 CA | Logical AND with accumulator (absolute,Y)
    INC $7FCC            ; EE CC 7F | Increment (absolute)
    DEC $0E              ; C6 0E | Decrement (zero page)
    BRA $01              ; 80 01 | Branch always
    STZ $CAD1            ; 9C D1 CA | Store zero to absolute
    INC $80CC            ; EE CC 80 | Increment (absolute)
    LSR $0E              ; 46 0E | Logical shift right (zero page)
    BRA $01              ; 80 01 | Branch always
    CMP ($CA),Y          ; D1 CA | Compare accumulator ((zero page),Y)
    INC $81CC            ; EE CC 81 | Increment (absolute)
    ASL $0180            ; 0E 80 01 | Arithmetic shift left (absolute)
    DEX                  ; CA | Decrement X register
    INC $82CC            ; EE CC 82 | Increment (absolute)
    ASL $0180            ; 0E 80 01 | Arithmetic shift left (absolute)
    CMP $D2              ; C5 D2 | Compare accumulator (zero page)
    DEX                  ; CA | Decrement X register
    INC $83CC            ; EE CC 83 | Increment (absolute)
    EOR $0B              ; 45 0B | Exclusive OR with accumulator (zero page)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_057
; Address: $D18735
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_057:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR $0B              ; 45 0B | Exclusive OR with accumulator (zero page)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_058
; Address: $D18742
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_058:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CMP $0D              ; C5 0D | Compare accumulator (zero page)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_05A
; Address: $D1874F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_05A:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CMP $0D              ; C5 0D | Compare accumulator (zero page)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_05B
; Address: $D1875C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_05B:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR $10              ; 45 10 | Exclusive OR with accumulator (zero page)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_05C
; Address: $D18769
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_05C:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR $10              ; 45 10 | Exclusive OR with accumulator (zero page)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_05D
; Address: $D18776
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_05D:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CMP $12              ; C5 12 | Compare accumulator (zero page)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_05E
; Address: $D18783
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_05E:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CMP $12              ; C5 12 | Compare accumulator (zero page)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_05F
; Address: $D18790
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_05F:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_060
; Address: $D1879D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_060:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_061
; Address: $D187AA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_061:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_062
; Address: $D187B7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_062:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_063
; Address: $D187C4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_063:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_065
; Address: $D187D1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_065:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_066
; Address: $D187DE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_066:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    INY                  ; C8 | Increment Y register
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_067
; Address: $D187EB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_067:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    INY                  ; C8 | Increment Y register
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_068
; Address: $D187F8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_068:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CPX #$46             ; E0 46 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_069
; Address: $D18805
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_069:
    INC $F5CC            ; EE CC F5 | Increment (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $01              ; 80 01 | Branch always
    DEX                  ; CA | Decrement X register
    INC $59CC            ; EE CC 59 | Increment (absolute)
    BPL $80              ; 10 80 | Branch if positive
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    INC $33CC            ; EE CC 33 | Increment (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    INC $D4              ; E6 D4 | Increment (zero page)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_06A
; Address: $D1882C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_06A:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    REP #$06             ; C2 06 | Reset processor status bits
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_06B
; Address: $D18839
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_06B:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    WDM #$07             ; 42 07 | Reserved instruction
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_06C
; Address: $D18846
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_06C:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_06E
; Address: $D18853
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_06E:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    STY $05              ; 84 05 | Store Y register to zero page
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_06F
; Address: $D18860
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_06F:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    DEY                  ; 88 | Decrement Y register
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_070
; Address: $D1886D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_070:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    STA $0C              ; 85 0C | Update graphics data
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_071
; Address: $D1887A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_071:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_072
; Address: $D18887
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_072:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    PHP                  ; 08 | Push processor status to stack
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_073
; Address: $D18894
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_073:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_074
; Address: $D188A1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_074:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    INC                  ; 1A | Increment accumulator
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_075
; Address: $D188AE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_075:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR $07              ; 45 07 | Exclusive OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_076
; Address: $D188BB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_076:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    LSR $07              ; 46 07 | Logical shift right (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_077
; Address: $D188C8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_077:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    EOR $05              ; 45 05 | Exclusive OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_079
; Address: $D188D5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_079:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    LSR $05              ; 46 05 | Logical shift right (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_07A
; Address: $D188E2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_07A:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    CMP $06              ; C5 06 | Compare accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_07B
; Address: $D188EF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_07B:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    DEC $06              ; C6 06 | Decrement (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_07C
; Address: $D188FC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_07C:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    STA $06              ; 85 06 | Update graphics data
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_07D
; Address: $D18909
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_07D:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_07E
; Address: $D18916
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_07E:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    STY $0E              ; 84 0E | Store Y register to zero page
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_07F
; Address: $D18923
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_07F:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    DEX                  ; CA | Decrement X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_080
; Address: $D18930
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_080:
    INC $33CC            ; EE CC 33 | Increment (absolute)
    BIT $01C4            ; 2C C4 01 | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP ($0000)          ; 6C 00 00 | Jump to address (absolute indirect)
    ORA $64              ; 05 64 | Logical OR with accumulator (zero page)
    LDY $0000,X          ; BC 00 00 | Load from absolute,X into Y register
    BIT $AC              ; 24 AC | Test bits in accumulator (zero page)
    JMP $00009C          ; 5C 9C 00 00 | Jump to address long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCC $BC              ; 90 BC | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    STZ $0124            ; 9C 24 01 | Store zero to absolute
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    JMP $1001            ; 4C 01 10 | Jump to address
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_081
; Address: $D18982
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_081:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    JMP ($0000)          ; 6C 00 00 | Jump to address (absolute indirect)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    PEA #$0000           ; F4 00 00 | Push effective address to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    SEC                  ; 38 | Set carry flag
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BMI $AC              ; 30 AC | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BIT $6C              ; 24 6C | Test bits in accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $30              ; 05 30 | Logical OR with accumulator (zero page)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    BIT $A4              ; 24 A4 | Test bits in accumulator (zero page)
    JMP $00009C          ; 5C 9C 00 00 | Jump to address long
    BCC $BC              ; 90 BC | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $0124            ; 9C 24 01 | Store zero to absolute
    SEC                  ; 38 | Set carry flag
    JMP $1021            ; 4C 21 10 | Jump to address
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    ORA $5C              ; 05 5C | Logical OR with accumulator (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    LDY $20CC,X          ; BC CC 20 | Load from absolute,X into Y register
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $20              ; A4 20 | Load from zero page into Y register
    BPL $00              ; 10 00 | Branch if positive
    ORA $48              ; 05 48 | Logical OR with accumulator (zero page)
    STZ $01              ; 64 01 | Store zero to zero page
    BVC $EC              ; 50 EC | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive
    JMP $1800AC          ; 5C AC 00 18 | Jump to address long
    PHA                  ; 48 | Push accumulator to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_082
; Address: $D18A52
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_082:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)
    STY $0094            ; 8C 94 00 | Store Y register to absolute address
    BMI $4C              ; 30 4C | Branch if negative
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    JMP ($0154)          ; 6C 54 01 | Jump to address (absolute indirect)
    BCS $94              ; B0 94 | Branch if carry set
    BPL $00              ; 10 00 | Branch if positive
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    INY                  ; C8 | Increment Y register
    LDY $1000            ; AC 00 10 | Load from absolute address into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDY $0000,X          ; BC 00 00 | Load from absolute,X into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BIT $0001            ; 2C 01 00 | Test bits in accumulator (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    JMP ($0154)          ; 6C 54 01 | Jump to address (absolute indirect)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCS $94              ; B0 94 | Branch if carry set
    BPL $00              ; 10 00 | Branch if positive
    INY                  ; C8 | Increment Y register
    LDY $1000            ; AC 00 10 | Load from absolute address into Y register
    LDY $0000,X          ; BC 00 00 | Load from absolute,X into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0200            ; 0D 00 02 | Logical OR with accumulator (absolute)
    INY                  ; C8 | Increment Y register
    BIT $AC              ; 24 AC | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BIT $AC              ; 24 AC | Test bits in accumulator (zero page)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_083
; Address: $D18ADD
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_083:
    JSR $0184            ; 20 84 01 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    STY $00              ; 84 00 | Store Y register to zero page
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    STZ $1000            ; 9C 00 10 | Store zero to absolute
    BMI $9C              ; 30 9C | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STY $2154            ; 8C 54 21 | PPU graphics register access
    BPL $00              ; 10 00 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_084
; Address: $D18B1E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_084:
    JMP ($1820)          ; 6C 20 18 | Jump to address (absolute indirect)
    BVC $8C              ; 50 8C | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    STY $00              ; 84 00 | Store Y register to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY $00              ; C4 00 | Compare Y register (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $7C              ; 30 7C | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $015C            ; 2C 5C 01 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_085
; Address: $D18B70
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_085:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    BVC $3C              ; 50 3C | Branch if overflow clear
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    JMP $20013C          ; 5C 3C 01 20 | Jump to address long
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    STY $015C            ; 8C 5C 01 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_086
; Address: $D18B90
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_086:
    JSR $0500            ; 20 00 05 | Jump to subroutine
    LDY $0000            ; AC 00 00 | Load from absolute address into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_087
; Address: $D18B9E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_087:
    LDY $01              ; A4 01 | Load from zero page into Y register
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $20CC            ; 4C CC 20 | Jump to address
    BIT $009C            ; 2C 9C 00 | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    LDY $00              ; A4 00 | Load from zero page into Y register
    BPL $00              ; 10 00 | Branch if positive
    BVC $A4              ; 50 A4 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive
    JMP ($0020)          ; 6C 20 00 | Jump to address (absolute indirect)
    LDY #$6C             ; A0 6C | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_088
; Address: $D18BCF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_088:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$14             ; C0 14 | Compare Y register (immediate)
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    CPY $2134            ; CC 34 21 | PPU graphics register access
    BPL $00              ; 10 00 | Branch if positive
    BIT $0084            ; 2C 84 00 | Test bits in accumulator (absolute)
    STY $00              ; 84 00 | Store Y register to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_089
; Address: $D18BF8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_089:
    JSR $0400            ; 20 00 04 | Jump to subroutine
    JMP ($00C4)          ; 6C C4 00 | Jump to address (absolute indirect)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_08A
; Address: $D18C06
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_08A:
    STY $00              ; 84 00 | Store Y register to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STY $0000            ; 8C 00 00 | Store Y register to absolute address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $0084            ; 2C 84 00 | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCC $EC              ; 90 EC | Branch if carry clear

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_08B
; Address: $D18C3F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_08B:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    STY $00              ; 84 00 | Store Y register to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    CPY $00              ; C4 00 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_08C
; Address: $D18C50
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_08C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    BCC $DC              ; 90 DC | Branch if carry clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STY $00E4            ; 8C E4 00 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_08D
; Address: $D18C68
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_08D:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    LDY $00              ; A4 00 | Load from zero page into Y register
    BIT $00B4            ; 2C B4 00 | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    JMP $0021            ; 4C 21 00 | Jump to address
    BIT $94              ; 24 94 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    LDY $1040,X          ; BC 40 10 | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    STZ $7C              ; 64 7C | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BIT $008C            ; 2C 8C 00 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_08E
; Address: $D18CB8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_08E:
    JSR $0600            ; 20 00 06 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    STY $00              ; 84 00 | Store Y register to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $94              ; 30 94 | Branch if negative
    BIT $0094            ; 2C 94 00 | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_08F
; Address: $D18CDD
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_08F:
    BCC $7C              ; 90 7C | Branch if carry clear
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    SEC                  ; 38 | Set carry flag
    JMP $001001          ; 5C 01 10 00 | Jump to address long
    BIT $01C4            ; 2C C4 01 | Test bits in accumulator (absolute)
    BIT $EC              ; 24 EC | Test bits in accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$E4             ; A0 E4 | Load immediate value into Y register
    ORA $64              ; 05 64 | Logical OR with accumulator (zero page)
    LDY $0000,X          ; BC 00 00 | Load from absolute,X into Y register
    BMI $6C              ; 30 6C | Branch if negative
    JMP ($0000)          ; 6C 00 00 | Jump to address (absolute indirect)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    STZ $00              ; 64 00 | Store zero to zero page
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    SEC                  ; 38 | Set carry flag
    STY $00              ; 84 00 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    STY $00              ; 84 00 | Store Y register to zero page
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    CPX $0021            ; EC 21 00 | Compare X register (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    LDY $0021,X          ; BC 21 00 | Load from absolute,X into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $BC              ; 80 BC | Branch always
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    STY $2164            ; 8C 64 21 | PPU graphics register access
    BPL $00              ; 10 00 | Branch if positive
    JMP ($00BC)          ; 6C BC 00 | Jump to address (absolute indirect)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    LDY $1000,X          ; BC 00 10 | Load from absolute,X into Y register
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BIT $1C              ; 24 1C | Test bits in accumulator (zero page)
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    BIT $74              ; 24 74 | Test bits in accumulator (zero page)
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_092
; Address: $D18DB8
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_092:
    JSR $1400            ; 20 00 14 | Jump to subroutine
    JMP $00B4            ; 4C B4 00 | Jump to address
    BPL $00              ; 10 00 | Branch if positive
    JMP $0144            ; 4C 44 01 | Jump to address
    RTI                  ; 40 | Return from interrupt
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    BMI $FC              ; 30 FC | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $60              ; 06 60 | Arithmetic shift left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    STY $44              ; 84 44 | Store Y register to zero page
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BMI $AC              ; 30 AC | Branch if negative
    SEC                  ; 38 | Set carry flag
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ASL $60              ; 06 60 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP ($40CC)          ; 6C CC 40 | Jump to address (absolute indirect)
    CLC                  ; 18 | Clear carry flag
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BMI $94              ; 30 94 | Branch if negative

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_094
; Address: $D18E38
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_094:
    JSR $0800            ; 20 00 08 | Jump to subroutine
    ORA $60              ; 05 60 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $60              ; 05 60 | Logical OR with accumulator (zero page)
    PEA #$0000           ; F4 00 00 | Push effective address to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PEA #$0000           ; F4 00 00 | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    ORA $44              ; 05 44 | Logical OR with accumulator (zero page)
    STZ $0001            ; 9C 01 00 | Store zero to absolute
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVS $C4              ; 70 C4 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    JMP ($1001)          ; 6C 01 10 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_095
; Address: $D18E8A
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_095:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $3C              ; 05 3C | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $40              ; E4 40 | Compare X register (zero page)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPX $40              ; E4 40 | Compare X register (zero page)
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    LDY $1840            ; AC 40 18 | Load from absolute address into Y register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    JMP ($40AC)          ; 6C AC 40 | Jump to address (absolute indirect)
    CLC                  ; 18 | Clear carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVC $AC              ; 50 AC | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    BIT $A4              ; 24 A4 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $48              ; 05 48 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STY $00A4            ; 8C A4 00 | Store Y register to absolute address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    BVS $F4              ; 70 F4 | Branch if overflow set
    ASL $3C              ; 06 3C | Arithmetic shift left (zero page)
    LDY $AC              ; A4 AC | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_096
; Address: $D18F1F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_096:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STY $BC              ; 84 BC | Store Y register to zero page
    CPX #$18             ; E0 18 | Compare X register (immediate)
    PEA #$18A0           ; F4 A0 18 | Push effective address to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PEA #$18C0           ; F4 C0 18 | Push effective address to stack
    ADC ($18,X)          ; 61 18 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_097
; Address: $D18F47
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_097:
    ADC ($18,X)          ; 61 18 | Add with carry ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BCS $94              ; B0 94 | Branch if carry set
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDY $01              ; A4 01 | Load from zero page into Y register
    CLC                  ; 18 | Clear carry flag
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    BIT $21              ; 24 21 | PPU graphics register access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    CPY $20              ; C4 20 | Compare Y register (zero page)
    BIT $D4              ; 24 D4 | Test bits in accumulator (zero page)
    BVS $F4              ; 70 F4 | Branch if overflow set
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    STY $0000            ; 8C 00 00 | Store Y register to absolute address
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $60              ; 05 60 | Logical OR with accumulator (zero page)
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    STY $00              ; 84 00 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag
    STZ $01              ; 64 01 | Store zero to zero page
    CLC                  ; 18 | Clear carry flag
    JMP ($015C)          ; 6C 5C 01 | Jump to address (absolute indirect)
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    BMI $CC              ; 30 CC | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL $0500            ; 0E 00 05 | Arithmetic shift left (absolute)
    BVC $EC              ; 50 EC | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STY $012C            ; 8C 2C 01 | Store Y register to absolute address
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_098
; Address: $D18FFD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_098:
    JSR $00CC            ; 20 CC 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    STY $2000            ; 8C 00 20 | Store Y register to absolute address
    BVC $8C              ; 50 8C | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_09D
; Address: $D19030
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_09D:
    JSR $1400            ; 20 00 14 | Jump to subroutine
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    STZ $74              ; 64 74 | Store zero to zero page
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BIT $0094            ; 2C 94 00 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_09F
; Address: $D1905F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_09F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $B4              ; 80 B4 | Branch always

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0A0
; Address: $D19067
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0A0:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BIT $21              ; 24 21 | PPU graphics register access
    BPL $00              ; 10 00 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BIT $21              ; 24 21 | PPU graphics register access
    BMI $7C              ; 30 7C | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $60              ; 05 60 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0500            ; 0E 00 05 | Arithmetic shift left (absolute)
    BVS $DC              ; 70 DC | Branch if overflow set
    ORA $60              ; 05 60 | Logical OR with accumulator (zero page)
    LDY $0021,X          ; BC 21 00 | Load from absolute,X into Y register
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    LDY $0020,X          ; BC 20 00 | Load from absolute,X into Y register
    BPL $00              ; 10 00 | Branch if positive
    BRA $BC              ; 80 BC | Branch always

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0A1
; Address: $D190A7
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0A1:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BMI $8C              ; 30 8C | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    JMP $008C            ; 4C 8C 00 | Jump to address
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0A2
; Address: $D190CA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0A2:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $AC              ; 30 AC | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    JMP $00AC            ; 4C AC 00 | Jump to address
    BPL $00              ; 10 00 | Branch if positive
    ORA $3C              ; 05 3C | Logical OR with accumulator (zero page)
    PEA #$0000           ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0A3
; Address: $D190E8
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0A3:
    JSR $0D00            ; 20 00 0D | Jump to subroutine
    ORA $60              ; 05 60 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPY $0500            ; CC 00 05 | Compare Y register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CMP $0400            ; CD 00 04 | Compare accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVC $64              ; 50 64 | Branch if overflow clear
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    BCS $64              ; B0 64 | Branch if carry set
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $D4              ; 80 D4 | Branch always
    CLC                  ; 18 | Clear carry flag
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0A4
; Address: $D19148
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0A4:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    CPX $1000            ; EC 00 10 | Compare X register (absolute)
    JMP ($00B4)          ; 6C B4 00 | Jump to address (absolute indirect)
    BPL $00              ; 10 00 | Branch if positive
    STY $00B4            ; 8C B4 00 | Store Y register to absolute address
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0A5
; Address: $D1917A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0A5:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $00B4            ; AC B4 00 | Load from absolute address into Y register
    BPL $00              ; 10 00 | Branch if positive
    JMP $022C            ; 4C 2C 02 | Jump to address
    BPL $00              ; 10 00 | Branch if positive
    JMP ($022C)          ; 6C 2C 02 | Jump to address (absolute indirect)
    BPL $00              ; 10 00 | Branch if positive
    STY $022C            ; 8C 2C 02 | Store Y register to absolute address
    BPL $00              ; 10 00 | Branch if positive
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BMI $A4              ; 30 A4 | Branch if negative

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0A6
; Address: $D1919F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0A6:
    JSR $0018            ; 20 18 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    ORA #$48             ; 09 48 | Logical OR with accumulator (immediate)
    CPY $0841            ; CC 41 08 | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA #$68             ; 09 68 | Logical OR with accumulator (immediate)
    CPY $0841            ; CC 41 08 | Compare Y register (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    JMP ($2154)          ; 6C 54 21 | PPU graphics register access
    BPL $00              ; 10 00 | Branch if positive
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0A7
; Address: $D191D0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0A7:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    STY $2000            ; 8C 00 20 | Store Y register to absolute address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $8C              ; 50 8C | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0AC
; Address: $D19200
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0AC:
    JSR $0600            ; 20 00 06 | Jump to subroutine
    BIT $A4              ; 24 A4 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    STY $1000            ; 8C 00 10 | Store Y register to absolute address
    JMP $20011C          ; 5C 1C 01 20 | Jump to address long
    BMI $D4              ; 30 D4 | Branch if negative
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0AD
; Address: $D19228
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0AD:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0AF
; Address: $D19235
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0AF:
    BMI $64              ; 30 64 | Branch if negative
    STA ($20,X)          ; 81 20 | Update graphics data
    DEY                  ; 88 | Decrement Y register
    STZ $A1              ; 64 A1 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0B2
; Address: $D1924F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0B2:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $8C              ; 64 8C | Store zero to zero page

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0B3
; Address: $D19257
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0B3:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    LDY $00              ; A4 00 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0B5
; Address: $D19268
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0B5:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $0094            ; 4C 94 00 | Jump to address

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0B6
; Address: $D19298
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0B6:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    STY $2000            ; 8C 00 20 | Store Y register to absolute address
    ASL $3C              ; 06 3C | Arithmetic shift left (zero page)
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT $2021            ; 2C 21 20 | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX $1000            ; EC 00 10 | Compare X register (absolute)
    PEA #$00C4           ; F4 C4 00 | Push effective address to stack
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $54              ; 64 54 | Store zero to zero page
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $94              ; 64 94 | Store zero to zero page
    BPL $00              ; 10 00 | Branch if positive
    STY $00E4            ; 8C E4 00 | Store Y register to absolute address
    BPL $00              ; 10 00 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BIT $1001            ; 2C 01 10 | Test bits in accumulator (absolute)
    BRA $84              ; 80 84 | Branch always

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0B7
; Address: $D192F8
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0B7:
    BPL $00              ; 10 00 | Branch if positive
    BRA $44              ; 80 44 | Branch always
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BRA $DC              ; 80 DC | Branch always
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $5C              ; 80 5C | Branch always
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ASL $74              ; 06 74 | Arithmetic shift left (zero page)
    JMP $0001            ; 4C 01 00 | Jump to address
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $64              ; 06 64 | Arithmetic shift left (zero page)
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BVS $9C              ; 70 9C | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    JMP $00A4            ; 4C A4 00 | Jump to address
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    JMP $01D4            ; 4C D4 01 | Jump to address
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $44              ; 05 44 | Logical OR with accumulator (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $58              ; 06 58 | Arithmetic shift left (zero page)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    CPY $0800            ; CC 00 08 | Compare Y register (absolute)
    ASL $98              ; 06 98 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0B8
; Address: $D19398
; Size: 134 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0B8:
    PHP                  ; 08 | Push processor status to stack
    ASL $58              ; 06 58 | Arithmetic shift left (zero page)
    LDY $0800            ; AC 00 08 | Load from absolute address into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $60              ; 06 60 | Arithmetic shift left (zero page)
    STZ $0800            ; 9C 00 08 | Store zero to absolute
    STY $BC              ; 84 BC | Store Y register to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$C4             ; E0 C4 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $0001            ; 2C 01 00 | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9600            ; CD 00 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9801            ; CD 01 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9602            ; CD 02 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9803            ; CD 03 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9604            ; CD 04 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9805            ; CD 05 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9606            ; CD 06 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9807            ; CD 07 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9608            ; CD 08 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9809            ; CD 09 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $960A            ; CD 0A 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $980B            ; CD 0B 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $960C            ; CD 0C 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $980D            ; CD 0D 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9611            ; CD 11 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9812            ; CD 12 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0B9
; Address: $D1946C
; Size: 149 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0B9:
    CMP $960E            ; CD 0E 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $980F            ; CD 0F 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9814            ; CD 14 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9815            ; CD 15 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9816            ; CD 16 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9817            ; CD 17 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9818            ; CD 18 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9819            ; CD 19 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $981A            ; CD 1A 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $981D            ; CD 1D 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $981B            ; CD 1B 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $961C            ; CD 1C 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $961E            ; CD 1E 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $981F            ; CD 1F 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $964D            ; CD 4D 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9613            ; CD 13 96 | Compare accumulator (absolute)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $964E            ; CD 4E 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $966B            ; CD 6B 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $966D            ; CD 6D 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $966C            ; CD 6C 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $966E            ; CD 6E 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $966F            ; CD 6F 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9670            ; CD 70 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9671            ; CD 71 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9672            ; CD 72 96 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0BA
; Address: $D1954A
; Size: 124 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0BA:
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9821            ; CD 21 98 | Compare accumulator (absolute)
    PHY                  ; 5A | Push Y register to stack
    LDY $C8CD,X          ; BC CD C8 | Load from absolute,X into Y register
    CMP $9822            ; CD 22 98 | Compare accumulator (absolute)
    ORA $B7              ; 05 B7 | Logical OR with accumulator (zero page)
    CMP $B557            ; CD 57 B5 | Compare accumulator (absolute)
    CMP $9823            ; CD 23 98 | Compare accumulator (absolute)
    PLX                  ; FA | Pull X register from stack
    LDA $30CD,Y          ; B9 CD 30 | Read graphics status
    CMP $9624            ; CD 24 96 | Compare accumulator (absolute)
    CMP $B55F            ; CD 5F B5 | Compare accumulator (absolute)
    CMP $9825            ; CD 25 98 | Compare accumulator (absolute)
    AND #$BA             ; 29 BA | Logical AND with accumulator (immediate)
    CMP $B638            ; CD 38 B6 | Compare accumulator (absolute)
    CMP $9826            ; CD 26 98 | Compare accumulator (absolute)
    AND #$BA             ; 29 BA | Logical AND with accumulator (immediate)
    CMP $B638            ; CD 38 B6 | Compare accumulator (absolute)
    CMP $9847            ; CD 47 98 | Compare accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    CMP $B648            ; CD 48 B6 | Compare accumulator (absolute)
    CMP $9849            ; CD 49 98 | Compare accumulator (absolute)
    AND #$BA             ; 29 BA | Logical AND with accumulator (immediate)
    CMP $B638            ; CD 38 B6 | Compare accumulator (absolute)
    CMP $9627            ; CD 27 96 | Compare accumulator (absolute)
    LDY $B7              ; A4 B7 | Load from zero page into Y register
    CMP $B58B            ; CD 8B B5 | Compare accumulator (absolute)
    CMP $9628            ; CD 28 96 | Compare accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    TSX                  ; BA | Transfer stack pointer to X register
    CMP $B640            ; CD 40 B6 | Compare accumulator (absolute)
    CMP $9629            ; CD 29 96 | Compare accumulator (absolute)
    JMP ($CDB7)          ; 6C B7 CD | Jump to address (absolute indirect)
    CMP $963F            ; CD 3F 96 | Compare accumulator (absolute)
    JMP ($CDB7)          ; 6C B7 CD | Jump to address (absolute indirect)
    CMP $962A            ; CD 2A 96 | Compare accumulator (absolute)
    BCC $BA              ; 90 BA | Branch if carry clear
    CMP $B650            ; CD 50 B6 | Compare accumulator (absolute)
    CMP $962B            ; CD 2B 96 | Compare accumulator (absolute)
    DEY                  ; 88 | Decrement Y register
    CMP $B583            ; CD 83 B5 | Compare accumulator (absolute)
    CMP $982C            ; CD 2C 98 | Compare accumulator (absolute)
    LDY $CDBA            ; AC BA CD | Load from absolute address into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    CMP $982D            ; CD 2D 98 | Compare accumulator (absolute)
    LDY $CDBA            ; AC BA CD | Load from absolute address into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    CMP $982E            ; CD 2E 98 | Compare accumulator (absolute)
    INY                  ; C8 | Increment Y register
    TSX                  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0BB
; Address: $D195E3
; Size: 122 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0BB:
    CMP $B660            ; CD 60 B6 | Compare accumulator (absolute)
    CMP $962F            ; CD 2F 96 | Compare accumulator (absolute)
    LDY $B7              ; A4 B7 | Load from zero page into Y register
    CMP $B58B            ; CD 8B B5 | Compare accumulator (absolute)
    CMP $9640            ; CD 40 96 | Compare accumulator (absolute)
    CPY #$B7             ; C0 B7 | Compare Y register (immediate)
    CMP $B593            ; CD 93 B5 | Compare accumulator (absolute)
    CMP $9630            ; CD 30 96 | Compare accumulator (absolute)
    CPY #$B7             ; C0 B7 | Compare Y register (immediate)
    CMP $B593            ; CD 93 B5 | Compare accumulator (absolute)
    CMP $9631            ; CD 31 96 | Compare accumulator (absolute)
    CMP $B59B            ; CD 9B B5 | Compare accumulator (absolute)
    CMP $9832            ; CD 32 98 | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $B5CB            ; CD CB B5 | Compare accumulator (absolute)
    CMP $9633            ; CD 33 96 | Compare accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    CMP $B5A3            ; CD A3 B5 | Compare accumulator (absolute)
    CMP $9634            ; CD 34 96 | Compare accumulator (absolute)
    BVC $B7              ; 50 B7 | Branch if overflow clear
    CMP $B567            ; CD 67 B5 | Compare accumulator (absolute)
    CMP $9635            ; CD 35 96 | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $B5B3            ; CD B3 B5 | Compare accumulator (absolute)
    CMP $9636            ; CD 36 96 | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $B5AB            ; CD AB B5 | Compare accumulator (absolute)
    CMP $963C            ; CD 3C 96 | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $B5BB            ; CD BB B5 | Compare accumulator (absolute)
    CMP $9637            ; CD 37 96 | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $B5C3            ; CD C3 B5 | Compare accumulator (absolute)
    CMP $9638            ; CD 38 96 | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $B5C3            ; CD C3 B5 | Compare accumulator (absolute)
    CMP $964B            ; CD 4B 96 | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $B5C3            ; CD C3 B5 | Compare accumulator (absolute)
    CMP $9639            ; CD 39 96 | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $B5D3            ; CD D3 B5 | Compare accumulator (absolute)
    CMP $963B            ; CD 3B 96 | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $B5DB            ; CD DB B5 | Compare accumulator (absolute)
    CMP $963D            ; CD 3D 96 | Compare accumulator (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    CLV                  ; B8 | Clear overflow flag
    CMP $B5E3            ; CD E3 B5 | Compare accumulator (absolute)
    CMP $963A            ; CD 3A 96 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0BC
; Address: $D1967A
; Size: 136 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0BC:
    BVC $B7              ; 50 B7 | Branch if overflow clear
    CMP $B567            ; CD 67 B5 | Compare accumulator (absolute)
    CMP $963E            ; CD 3E 96 | Compare accumulator (absolute)
    DEY                  ; 88 | Decrement Y register
    CMP $B583            ; CD 83 B5 | Compare accumulator (absolute)
    CMP $9641            ; CD 41 96 | Compare accumulator (absolute)
    JMP ($CDB7)          ; 6C B7 CD | Jump to address (absolute indirect)
    CMP $9842            ; CD 42 98 | Compare accumulator (absolute)
    LDY $B8CD,X          ; BC CD B8 | Load from absolute,X into Y register
    CMP $9844            ; CD 44 98 | Compare accumulator (absolute)
    CPX $BA              ; E4 BA | Compare X register (zero page)
    CMP $B668            ; CD 68 B6 | Compare accumulator (absolute)
    CMP $9845            ; CD 45 98 | Compare accumulator (absolute)
    CMP $B670            ; CD 70 B6 | Compare accumulator (absolute)
    CMP $9848            ; CD 48 98 | Compare accumulator (absolute)
    CMP $B670            ; CD 70 B6 | Compare accumulator (absolute)
    CMP $9846            ; CD 46 98 | Compare accumulator (absolute)
    CMP $B670            ; CD 70 B6 | Compare accumulator (absolute)
    CMP $984A            ; CD 4A 98 | Compare accumulator (absolute)
    AND #$BA             ; 29 BA | Logical AND with accumulator (immediate)
    CMP $B638            ; CD 38 B6 | Compare accumulator (absolute)
    CMP $9643            ; CD 43 96 | Compare accumulator (absolute)
    BCC $BA              ; 90 BA | Branch if carry clear
    CMP $B650            ; CD 50 B6 | Compare accumulator (absolute)
    CMP $984F            ; CD 4F 98 | Compare accumulator (absolute)
    CMP $B6A0            ; CD A0 B6 | Compare accumulator (absolute)
    CMP $9659            ; CD 59 96 | Compare accumulator (absolute)
    LDA $EBCD,Y          ; B9 CD EB | Read graphics status
    CMP $9650            ; CD 50 96 | Compare accumulator (absolute)
    LDA $F3CD,Y          ; B9 CD F3 | Read graphics status
    CMP $985A            ; CD 5A 98 | Compare accumulator (absolute)
    CMP $B678            ; CD 78 B6 | Compare accumulator (absolute)
    CMP $9851            ; CD 51 98 | Compare accumulator (absolute)
    LDY $D0CD,X          ; BC CD D0 | Load from absolute,X into Y register
    CMP $9652            ; CD 52 96 | Compare accumulator (absolute)
    LDY $D8CD,X          ; BC CD D8 | Load from absolute,X into Y register
    CMP $9653            ; CD 53 96 | Compare accumulator (absolute)
    LDX $CDBC            ; AE BC CD | Load from absolute address into X register
    CPX #$B6             ; E0 B6 | Compare X register (immediate)
    CMP $9A54            ; CD 54 9A | Compare accumulator (absolute)
    DEX                  ; CA | Decrement X register
    LDY $E8CD,X          ; BC CD E8 | Load from absolute,X into Y register
    CMP $9A20            ; CD 20 9A | Compare accumulator (absolute)
    INC $BC              ; E6 BC | Increment (zero page)
    CMP $B6F0            ; CD F0 B6 | Compare accumulator (absolute)
    CMP $9855            ; CD 55 98 | Compare accumulator (absolute)
    LDA $F8CD,X          ; BD CD F8 | Read graphics status
    CMP $965B            ; CD 5B 96 | Compare accumulator (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0BD
; Address: $D19730
; Size: 139 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0BD:
    CMP $B5E3            ; CD E3 B5 | Compare accumulator (absolute)
    CMP $985C            ; CD 5C 98 | Compare accumulator (absolute)
    CMP $B680            ; CD 80 B6 | Compare accumulator (absolute)
    CMP $9656            ; CD 56 96 | Compare accumulator (absolute)
    LDA $00CD,Y          ; B9 CD 00 | Read graphics status
    CMP $9857            ; CD 57 98 | Compare accumulator (absolute)
    CMP $B688            ; CD 88 B6 | Compare accumulator (absolute)
    CMP $985F            ; CD 5F 98 | Compare accumulator (absolute)
    CMP $B688            ; CD 88 B6 | Compare accumulator (absolute)
    CMP $985D            ; CD 5D 98 | Compare accumulator (absolute)
    ORA $B7              ; 05 B7 | Logical OR with accumulator (zero page)
    CMP $B557            ; CD 57 B5 | Compare accumulator (absolute)
    CMP $965E            ; CD 5E 96 | Compare accumulator (absolute)
    LDA $08CD,Y          ; B9 CD 08 | Read graphics status
    CMP $9662            ; CD 62 96 | Compare accumulator (absolute)
    LDX $B9              ; A6 B9 | Load from zero page into X register
    CMP $B618            ; CD 18 B6 | Compare accumulator (absolute)
    CMP $9863            ; CD 63 98 | Compare accumulator (absolute)
    CMP $B690            ; CD 90 B6 | Compare accumulator (absolute)
    CMP $9664            ; CD 64 96 | Compare accumulator (absolute)
    REP #$B9             ; C2 B9 | Reset processor status bits
    CMP $B620            ; CD 20 B6 | Compare accumulator (absolute)
    CMP $9665            ; CD 65 96 | Compare accumulator (absolute)
    STA                  ; 9F BB CD 98 | Update graphics data
    CMP $9866            ; CD 66 98 | Compare accumulator (absolute)
    LDA $10CD,Y          ; B9 CD 10 | Read graphics status
    CMP $9667            ; CD 67 96 | Compare accumulator (absolute)
    DEC $CDB9,X          ; DE B9 CD | Decrement (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    CMP $9668            ; CD 68 96 | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $B5C3            ; CD C3 B5 | Compare accumulator (absolute)
    CMP $967A            ; CD 7A 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $967B            ; CD 7B 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9A76            ; CD 76 9A | Compare accumulator (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    CLV                  ; B8 | Clear overflow flag
    CMP $B5E3            ; CD E3 B5 | Compare accumulator (absolute)
    CMP $9877            ; CD 77 98 | Compare accumulator (absolute)
    CMP $B6A0            ; CD A0 B6 | Compare accumulator (absolute)
    CMP $9878            ; CD 78 98 | Compare accumulator (absolute)
    CMP $B6A8            ; CD A8 B6 | Compare accumulator (absolute)
    CMP $9673            ; CD 73 96 | Compare accumulator (absolute)
    CMP $B6B0            ; CD B0 B6 | Compare accumulator (absolute)
    CMP $9674            ; CD 74 96 | Compare accumulator (absolute)
    LDX $CDBC            ; AE BC CD | Load from absolute address into X register
    CPX #$B6             ; E0 B6 | Compare X register (immediate)
    CMP $9A75            ; CD 75 9A | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0BE
; Address: $D197EB
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0BE:
    DEY                  ; 88 | Decrement Y register
    CMP $B583            ; CD 83 B5 | Compare accumulator (absolute)
    CMP $9679            ; CD 79 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $967C            ; CD 7C 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $984C            ; CD 4C 98 | Compare accumulator (absolute)
    LDY $C0CD,X          ; BC CD C0 | Load from absolute,X into Y register
    CMP $9A60            ; CD 60 9A | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9A61            ; CD 61 9A | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9658            ; CD 58 96 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $9869            ; CD 69 98 | Compare accumulator (absolute)
    CMP $B552            ; CD 52 B5 | Compare accumulator (absolute)
    CMP $966A            ; CD 6A 96 | Compare accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    CMP $B5A3            ; CD A3 B5 | Compare accumulator (absolute)
    CMP $0122            ; CD 22 01 | Compare accumulator (absolute)
    BIT $02              ; 24 02 | Test bits in accumulator (zero page)
    AND $04              ; 25 04 | Logical AND with accumulator (zero page)
    ROL $04              ; 26 04 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0BF
; Address: $D1984F
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0BF:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDX $1D7B            ; AE 7B 1D | Load from absolute address into X register
    CPX $5762            ; EC 62 57 | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    ORA $72EE,X          ; 1D EE 72 | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    TSX                  ; BA | Transfer stack pointer to X register
    ORA $7AEF,X          ; 1D EF 7A | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    REP #$1B             ; C2 1B | Reset processor status bits
    ASL $8AF1,X          ; 1E F1 8A | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ORA $6AED,X          ; 1D ED 6A | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDX $1DFB,Y          ; BE FB 1D | Load from absolute,Y into X register
    BEQ $82              ; F0 82 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    REP #$1B             ; C2 1B | Reset processor status bits
    ASL $8AF1,X          ; 1E F1 8A | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    DEC $3B              ; C6 3B | Decrement (zero page)
    ASL $92F2,X          ; 1E F2 92 | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDY $CC              ; A4 CC | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0C0
; Address: $D198A7
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0C0:
    LDY $CC              ; A4 CC | Load from zero page into Y register
    LDY $CC              ; A4 CC | Load from zero page into Y register
    LDX $CC              ; A6 CC | Load from zero page into X register
    LDY $CC              ; A4 CC | Load from zero page into Y register
    LDA $CC              ; A5 CC | Read graphics status
    LDA $CC              ; A5 CC | Read graphics status
    LDA $CC              ; A5 CC | Read graphics status
    RTI                  ; 40 | Return from interrupt
    LDA $CC              ; A5 CC | Read graphics status
    LDX $CC              ; A6 CC | Load from zero page into X register
    ROR $A5              ; 66 A5 | Rotate right (zero page)
    CPY $A616            ; CC 16 A6 | Compare Y register (absolute)
    CPY $A57B            ; CC 7B A5 | Compare Y register (absolute)
    CPY $A627            ; CC 27 A6 | Compare Y register (absolute)
    CPY $19BC            ; CC BC 19 | Compare Y register (absolute)
    DEC $5C              ; C6 5C | Decrement (zero page)
    INC                  ; 1A | Increment accumulator
    DEC $71              ; C6 71 | Decrement (zero page)
    DEC $B2              ; C6 B2 | Decrement (zero page)
    DEC $F1              ; C6 F1 | Decrement (zero page)
    DEC $75              ; C6 75 | Decrement (zero page)
    ORA $31C6,X          ; 1D C6 31 | Logical OR with accumulator (absolute,X)
    ASL $11C6,X          ; 1E C6 11 | Arithmetic shift left (absolute,X)
    LSR $8300,X          ; 5E 00 83 | Logical shift right (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    STA $9100            ; 8D 00 91 | Update graphics data
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    LSR $5E00,X          ; 5E 00 5E | Logical shift right (absolute,X)
    ROR $00              ; 66 00 | Rotate right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0C1
; Address: $D19909
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0C1:
    PHB                  ; 8B | Push data bank register to stack
    STA $009300          ; 8F 00 93 00 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    LSR $5E00,X          ; 5E 00 5E | Logical shift right (absolute,X)
    ROR $00              ; 66 00 | Rotate right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0C2
; Address: $D19922
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0C2:
    PHB                  ; 8B | Push data bank register to stack
    STA $009300          ; 8F 00 93 00 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$F2             ; 49 F2 | Exclusive OR with accumulator (immediate)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ROR $00              ; 66 00 | Rotate right (zero page)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0C3
; Address: $D1993D
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0C3:
    STA $009300          ; 8F 00 93 00 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    ADC $5E00            ; 6D 00 5E | Add with carry (absolute)
    ROR $6C00            ; 6E 00 6C | Rotate right (absolute)
    ADC $8A00            ; 6D 00 8A | Add with carry (absolute)
    STX $9200            ; 8E 00 92 | Store X register to absolute address
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    BRA $00              ; 80 00 | Branch always
    LSR $8100,X          ; 5E 00 81 | Logical shift right (absolute,X)
    JMP ($8000)          ; 6C 00 80 | Jump to address (absolute indirect)
    STX $0000            ; 8E 00 00 | Store X register to absolute address
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    STX $00              ; 86 00 | Store X register to zero page
    LSR $8800,X          ; 5E 00 88 | Logical shift right (absolute,X)
    JMP ($8600)          ; 6C 00 86 | Jump to address (absolute indirect)
    STA $0000            ; 8D 00 00 | Update graphics data
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$42             ; 49 42 | Hardware register operation
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0C4
; Address: $D1999B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0C4:
    JMP ($0000)          ; 6C 00 00 | Jump to address (absolute indirect)
    STX $0000            ; 8E 00 00 | Store X register to absolute address
    EOR ($82,X)          ; 41 82 | Exclusive OR with accumulator ((zero page,X))
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$42             ; 49 42 | Hardware register operation
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0C5
; Address: $D199B4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0C5:
    JMP ($0000)          ; 6C 00 00 | Jump to address (absolute indirect)
    STX $0000            ; 8E 00 00 | Store X register to absolute address
    EOR ($82,X)          ; 41 82 | Exclusive OR with accumulator ((zero page,X))
    AND ($10),Y          ; 31 10 | Logical AND with accumulator ((zero page),Y)
    EOR #$42             ; 49 42 | Hardware register operation
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0C6
; Address: $D199CD
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0C6:
    JMP ($0000)          ; 6C 00 00 | Jump to address (absolute indirect)
    STX $0000            ; 8E 00 00 | Store X register to absolute address
    EOR ($82,X)          ; 41 82 | Exclusive OR with accumulator ((zero page,X))
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$42             ; 49 42 | Hardware register operation
    ADC $7F00,X          ; 7D 00 7F | Add with carry (absolute,X)
    ROR $7C00,X          ; 7E 00 7C | Rotate right (absolute,X)
    STY $9000            ; 8C 00 90 | Store Y register to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    AND ($10),Y          ; 31 10 | Logical AND with accumulator ((zero page),Y)
    EOR #$42             ; 49 42 | Hardware register operation
    ADC $7F00,X          ; 7D 00 7F | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0C7
; Address: $D199FF
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0C7:
    ROR $7C00,X          ; 7E 00 7C | Rotate right (absolute,X)
    STY $9000            ; 8C 00 90 | Store Y register to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    STA $9100            ; 8D 00 91 | Update graphics data
    BPL $10              ; 10 10 | Branch if positive
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    ADC $7400,X          ; 7D 00 74 | Add with carry (absolute,X)
    STA $0000            ; 8D 00 00 | Update graphics data
    BPL $10              ; 10 10 | Branch if positive
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    ADC $7400,X          ; 7D 00 74 | Add with carry (absolute,X)
    STA $0000            ; 8D 00 00 | Update graphics data
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$42             ; 49 42 | Hardware register operation
    BVS $00              ; 70 00 | Branch if overflow set
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    STA $0000            ; 8D 00 00 | Update graphics data
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR $5E00,X          ; 5E 00 5E | Logical shift right (absolute,X)
    ROR $00              ; 66 00 | Rotate right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0C8
; Address: $D19A80
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0C8:
    PHB                  ; 8B | Push data bank register to stack
    STA $009300          ; 8F 00 93 00 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    WDM #$6F             ; 42 6F | Reserved instruction
    BVS $00              ; 70 00 | Branch if overflow set
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    STA $0000            ; 8D 00 00 | Update graphics data
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    STA $0000            ; 8D 00 00 | Update graphics data
    BPL $49              ; 10 49 | Branch if positive
    STA $0000            ; 8D 00 00 | Update graphics data
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    STA $0000            ; 8D 00 00 | Update graphics data
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $0000            ; 8D 00 00 | Update graphics data
    BPL $49              ; 10 49 | Branch if positive
    STA $0000            ; 8D 00 00 | Update graphics data
    BPL $10              ; 10 10 | Branch if positive
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0C9
; Address: $D19B31
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0C9:
    STA $9100            ; 8D 00 91 | Update graphics data
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    STA $9100            ; 8D 00 91 | Update graphics data
    BPL $10              ; 10 10 | Branch if positive
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    TXS                  ; 9A | Transfer X register to stack pointer
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    STA $9100            ; 8D 00 91 | Update graphics data
    BPL $10              ; 10 10 | Branch if positive
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    STA $9100            ; 8D 00 91 | Update graphics data
    BPL $10              ; 10 10 | Branch if positive
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    STZ $000F            ; 9C 0F 00 | Store zero to absolute
    STA $000F,X          ; 9D 0F 00 | Update graphics data
    BPL $10              ; 10 10 | Branch if positive
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    LDA #$0F             ; A9 0F | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ADC ($B8),Y          ; 71 B8 | Add with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BPL $85              ; 10 85 | Branch if positive
    BCS $41              ; B0 41 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ASL $A03C,X          ; 1E 3C A0 | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    BVC $2A              ; 50 2A | Branch if overflow clear
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    ORA $104C,X          ; 1D 4C 10 | Logical OR with accumulator (absolute,X)
    BNE $38              ; D0 38 | Branch if not equal
    LSR $10              ; 46 10 | Logical shift right (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    BPL $34              ; 10 34 | Branch if positive
    CPY #$59             ; C0 59 | Compare Y register (immediate)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    BCS $FA              ; B0 FA | Branch if carry set

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0CA
; Address: $D19C05
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0CA:
    LSR $10              ; 46 10 | Logical shift right (zero page)
    DEY                  ; 88 | Decrement Y register
    PLB                  ; AB | Pull data bank register from stack
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    EOR $3510            ; 4D 10 35 | Exclusive OR with accumulator (absolute)
    BVS $BC              ; 70 BC | Branch if overflow set
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $35              ; 10 35 | Branch if positive
    BVC $DD              ; 50 DD | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    BPL $35              ; 10 35 | Branch if positive
    INX                  ; E8 | Increment X register
    NOP                  ; EA | No operation
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    LDA #$48             ; A9 48 | Read graphics status
    BPL $34              ; 10 34 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    LSR $104F            ; 4E 4F 10 | Logical shift right (absolute)
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    WDM #$10             ; 42 10 | Reserved instruction
    BEQ $98              ; F0 98 | Branch if equal
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    BVC $F9              ; 50 F9 | Branch if overflow clear
    BPL $34              ; 10 34 | Branch if positive
    BEQ $4C              ; F0 4C | Branch if equal
    LSR $10              ; 46 10 | Logical shift right (zero page)
    INX                  ; E8 | Increment X register
    BIT $1049            ; 2C 49 10 | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    DEC $104C            ; CE 4C 10 | Decrement (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    DEC $1044,X          ; DE 44 10 | Decrement (absolute,X)
    BPL $AE              ; 10 AE | Branch if positive
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0CC
; Address: $D19C59
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0CC:
    LDA $104D,X          ; BD 4D 10 | Read graphics status
    LDY #$99             ; A0 99 | Load immediate value into Y register
    EOR $10              ; 45 10 | Exclusive OR with accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    INY                  ; C8 | Increment Y register
    WDM #$10             ; 42 10 | Reserved instruction
    CLC                  ; 18 | Clear carry flag
    LDA #$48             ; A9 48 | Read graphics status
    BPL $34              ; 10 34 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0CD
; Address: $D19C6D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0CD:
    CMP #$4A             ; C9 4A | Compare accumulator (immediate)
    BPL $34              ; 10 34 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BPL $34              ; 10 34 | Branch if positive
    BNE $2B              ; D0 2B | Branch if not equal
    PHA                  ; 48 | Push accumulator to stack
    BPL $34              ; 10 34 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    LDX $1049,Y          ; BE 49 10 | Load from absolute,Y into X register
    BRA $0B              ; 80 0B | Branch always
    BPL $35              ; 10 35 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0CE
; Address: $D19C88
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0CE:
    BPL $34              ; 10 34 | Branch if positive
    CPX #$8D             ; E0 8D | Compare X register (immediate)
    EOR $3410            ; 4D 10 34 | Exclusive OR with accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    LSR $10              ; 46 10 | Logical shift right (zero page)
    BVS $8A              ; 70 8A | Branch if overflow set
    BPL $34              ; 10 34 | Branch if positive
    CPY #$49             ; C0 49 | Compare Y register (immediate)
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $34              ; 10 34 | Branch if positive
    BNE $D9              ; D0 D9 | Branch if not equal
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $34              ; 10 34 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    PHA                  ; 48 | Push accumulator to stack
    BPL $34              ; 10 34 | Branch if positive
    LDY #$9F             ; A0 9F | Load immediate value into Y register
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    DEC $1042,X          ; DE 42 10 | Decrement (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    BPL $35              ; 10 35 | Branch if positive
    CPX #$DA             ; E0 DA | Compare X register (immediate)
    LSR $10              ; 46 10 | Logical shift right (zero page)
    LDY #$6C             ; A0 6C | Load immediate value into Y register
    BPL $35              ; 10 35 | Branch if positive
    BVS $2D              ; 70 2D | Branch if overflow set
    BPL $34              ; 10 34 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    CMP #$45             ; C9 45 | Compare accumulator (immediate)
    BPL $34              ; 10 34 | Branch if positive
    SEC                  ; 38 | Set carry flag
    LDA #$44             ; A9 44 | Read graphics status

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0CF
; Address: $D19CD3
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0CF:
    BPL $34              ; 10 34 | Branch if positive
    BPL $BD              ; 10 BD | Branch if positive
    BPL $34              ; 10 34 | Branch if positive
    BNE $2B              ; D0 2B | Branch if not equal
    BPL $34              ; 10 34 | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    ORA $1045,X          ; 1D 45 10 | Logical OR with accumulator (absolute,X)
    CPY #$CA             ; C0 CA | Compare Y register (immediate)
    BPL $34              ; 10 34 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    ADC #$4F             ; 69 4F | Add with carry (immediate)
    BPL $34              ; 10 34 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    LSR $3410            ; 4E 10 34 | Logical shift right (absolute)
    CLC                  ; 18 | Clear carry flag
    STA $104C,X          ; 9D 4C 10 | Update graphics data
    BEQ $3D              ; F0 3D | Branch if equal
    EOR $3410            ; 4D 10 34 | Exclusive OR with accumulator (absolute)
    CMP $1041,Y          ; D9 41 10 | Compare accumulator (absolute,Y)
    CPX #$8A             ; E0 8A | Compare X register (immediate)
    LSR $10              ; 46 10 | Logical shift right (zero page)
    LDY #$59             ; A0 59 | Load immediate value into Y register
    BPL $34              ; 10 34 | Branch if positive
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    INX                  ; E8 | Increment X register
    BIT $1049            ; 2C 49 10 | Test bits in accumulator (absolute)
    BMI $9B              ; 30 9B | Branch if negative
    EOR $3410            ; 4D 10 34 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0D0
; Address: $D19D1B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0D0:
    JSR $4A9F            ; 20 9F 4A | Jump to subroutine
    BPL $35              ; 10 35 | Branch if positive
    EOR $10              ; 45 10 | Exclusive OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0D1
; Address: $D19D26
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0D1:
    SBC $1046,X          ; FD 46 10 | Subtract with carry (absolute,X)
    BPL $FB              ; 10 FB | Branch if positive
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    ORA ($34),Y          ; 11 34 | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    LDA $104D,X          ; BD 4D 10 | Read graphics status
    BPL $34              ; 10 34 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    ROR $1046            ; 6E 46 10 | Rotate right (absolute)
    BEQ $D8              ; F0 D8 | Branch if equal
    BPL $35              ; 10 35 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP ($1044)          ; 6C 44 10 | Jump to address (absolute indirect)
    WDM #$B9             ; 42 B9 | Reserved instruction
    SEC                  ; 38 | Set carry flag
    WDM #$10             ; 42 10 | Reserved instruction

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0D2
; Address: $D19D51
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0D2:
    ORA $89              ; 05 89 | Logical OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    JMP $6849            ; 4C 49 68 | Jump to address
    WDM #$08             ; 42 08 | Reserved instruction
    BEQ $A9              ; F0 A9 | Branch if equal
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $34              ; 10 34 | Branch if positive
    BPL $69              ; 10 69 | Branch if positive
    BPL $34              ; 10 34 | Branch if positive
    CPY #$89             ; C0 89 | Compare Y register (immediate)
    BPL $34              ; 10 34 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0D3
; Address: $D19D6C
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0D3:
    PHX                  ; DA | Push X register to stack
    BPL $34              ; 10 34 | Branch if positive
    BRA $2A              ; 80 2A | Branch always
    BPL $59              ; 10 59 | Branch if positive
    BVS $43              ; 70 43 | Branch if overflow set
    EOR $687D,X          ; 5D 7D 68 | Exclusive OR with accumulator (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction
    PHA                  ; 48 | Push accumulator to stack
    CMP $104D            ; CD 4D 10 | Compare accumulator (absolute)
    LDA $104B,X          ; BD 4B 10 | Read graphics status
    BCC $79              ; 90 79 | Branch if carry clear
    EOR $10              ; 45 10 | Exclusive OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    STA $1041,Y          ; 99 41 10 | Update graphics data
    CPX #$79             ; E0 79 | Compare X register (immediate)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    BCS $0A              ; B0 0A | Branch if carry set
    BPL $34              ; 10 34 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    CMP $1046,Y          ; D9 46 10 | Compare accumulator (absolute,Y)
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    LSR $10              ; 46 10 | Logical shift right (zero page)
    BCS $EB              ; B0 EB | Branch if carry set
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    INX                  ; E8 | Increment X register
    PHA                  ; 48 | Push accumulator to stack
    BPL $34              ; 10 34 | Branch if positive
    LDY #$5B             ; A0 5B | Load immediate value into Y register
    EOR $3410            ; 4D 10 34 | Exclusive OR with accumulator (absolute)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    CLV                  ; B8 | Clear overflow flag
    WDM #$10             ; 42 10 | Reserved instruction
    LDA                  ; BF 4A 10 34 | Read graphics status
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0D4
; Address: $D19DC6
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0D4:
    DEC $1044            ; CE 44 10 | Decrement (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    LSR $10              ; 46 10 | Logical shift right (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    INC                  ; 1A | Increment accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $35              ; 10 35 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    PLB                  ; AB | Pull data bank register from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $35              ; 10 35 | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    BPL $35              ; 10 35 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    AND $1049,X          ; 3D 49 10 | Logical AND with accumulator (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    LDA $104D,X          ; BD 4D 10 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    JMP $3410            ; 4C 10 34 | Jump to address
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $1045,Y          ; 99 45 10 | Update graphics data
    PLY                  ; 7A | Pull Y register from stack
    WDM #$10             ; 42 10 | Reserved instruction
    CLV                  ; B8 | Clear overflow flag
    EOR $1041,Y          ; 59 41 10 | Exclusive OR with accumulator (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    PLX                  ; FA | Pull X register from stack
    LSR $10              ; 46 10 | Logical shift right (zero page)
    BPL $A9              ; 10 A9 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BPL $34              ; 10 34 | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    LSR $10              ; 46 10 | Logical shift right (zero page)
    BRA $AB              ; 80 AB | Branch always
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    BPL $34              ; 10 34 | Branch if positive
    BVS $7B              ; 70 7B | Branch if overflow set
    EOR $3410            ; 4D 10 34 | Exclusive OR with accumulator (absolute)
    CPX #$2C             ; E0 2C | Compare X register (immediate)
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    BCC $C8              ; 90 C8 | Branch if carry clear
    WDM #$10             ; 42 10 | Reserved instruction
    BCS $BE              ; B0 BE | Branch if carry set
    EOR #$10             ; 49 10 | Exclusive OR with accumulator (immediate)
    BCS $DE              ; B0 DE | Branch if carry set
    BPL $34              ; 10 34 | Branch if positive
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0D5
; Address: $D19E31
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0D5:
    BPL $62              ; 10 62 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BPL $39              ; 10 39 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    BVC $A0              ; 50 A0 | Branch if overflow clear
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    AND $1842,Y          ; 39 42 18 | Logical AND with accumulator (absolute,Y)
    CPY $4110            ; CC 10 41 | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag
    CPX $4190            ; EC 90 41 | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    CMP ($41),Y          ; D1 41 | Compare accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    CMP ($41),Y          ; D1 41 | Compare accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    CMP ($41),Y          ; D1 41 | Compare accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    EOR #$2C             ; 49 2C | Exclusive OR with accumulator (immediate)
    LDA ($42,X)          ; A1 42 | Hardware register operation
    CLC                  ; 18 | Clear carry flag
    EOR $18CC            ; 4D CC 18 | Exclusive OR with accumulator (absolute)
    BVC $4C              ; 50 4C | Branch if overflow clear
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    LDA ($44,X)          ; A1 44 | Read graphics status
    ROR $78              ; 66 78 | Rotate right (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    LDY #$41             ; A0 41 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    ADC $5064            ; 6D 64 50 | Add with carry (absolute)
    ROR $10C0            ; 6E C0 10 | Rotate right (absolute)
    ADC ($A0),Y          ; 71 A0 | Add with carry ((zero page),Y)
    CPX #$43             ; E0 43 | Compare X register (immediate)
    CMP ($43),Y          ; D1 43 | Compare accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ADC $70E8,Y          ; 79 E8 70 | Add with carry (absolute,Y)
    LDY $42D8            ; AC D8 42 | Hardware register operation
    BRA $8C              ; 80 8C | Branch always
    BVS $43              ; 70 43 | Branch if overflow set
    STA $28              ; 85 28 | Update graphics data
    BCS $42              ; B0 42 | Hardware register operation
    PHP                  ; 08 | Push processor status to stack
    CPY $88              ; C4 88 | Compare Y register (zero page)
    STA                  ; 9F C4 18 43 | Update graphics data

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0D6
; Address: $D19EAF
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0D6:
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT $F9              ; 24 F9 | Test bits in accumulator (zero page)
    LDA $44B908          ; AF 08 B9 44 | Read graphics status
    BCS $FC              ; B0 FC | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    PLP                  ; 28 | Pull processor status from stack
    BPL $42              ; 10 42 | Hardware register operation
    PHP                  ; 08 | Push processor status to stack
    CMP ($28,X)          ; C1 28 | Compare accumulator ((zero page,X))
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CMP ($88,X)          ; C1 88 | Compare accumulator ((zero page,X))
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    CMP ($D8),Y          ; D1 D8 | Compare accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BPL $0D              ; 10 0D | Branch if positive
    ADC $4098            ; 6D 98 40 | Add with carry (absolute)
    BPL $0E              ; 10 0E | Branch if positive
    ADC $4198,Y          ; 79 98 41 | Add with carry (absolute,Y)
    LDA #$60             ; A9 60 | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    BPL $81              ; 10 81 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($79),Y          ; 11 79 | Logical OR with accumulator ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDA ($28),Y          ; B1 28 | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $F889,Y          ; 19 89 F8 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    BPL $1B              ; 10 1B | Branch if positive
    EOR $4171,Y          ; 59 71 41 | Exclusive OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    EOR ($70),Y          ; 51 70 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    ORA $3889,X          ; 1D 89 38 | Logical OR with accumulator (absolute,X)
    WDM #$10             ; 42 10 | Reserved instruction
    ASL $007D,X          ; 1E 7D 00 | Arithmetic shift left (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0D7
; Address: $D19F09
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0D7:
    JSR $B8D9            ; 20 D9 B8 | Jump to subroutine
    WDM #$00             ; 42 00 | Reserved instruction
    AND ($D1,X)          ; 21 D1 | Logical AND with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    BNE $98              ; D0 98 | Branch if not equal
    CPX #$41             ; E0 41 | Compare X register (immediate)
    CMP ($BC),Y          ; D1 BC | Compare accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    WDM #$00             ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0D9
; Address: $D19F22
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0D9:
    PLP                  ; 28 | Pull processor status from stack
    ORA #$E2             ; 09 E2 | Logical OR with accumulator (immediate)
    EOR ($18,X)          ; 41 18 | Exclusive OR with accumulator ((zero page,X))
    ROL $68C9            ; 2E C9 68 | Rotate left (absolute)
    STA ($69,X)          ; 81 69 | Update graphics data
    WDM #$18             ; 42 18 | Reserved instruction
    JMP $6849            ; 4C 49 68 | Jump to address
    WDM #$08             ; 42 08 | Reserved instruction
    LSR $1959            ; 4E 59 19 | Logical shift right (absolute)
    BPL $4F              ; 10 4F | Branch if positive
    STA $4230            ; 8D 30 42 | Hardware register operation
    LDA $30              ; A5 30 | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    SEC                  ; 38 | Set carry flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STX $4894            ; 8E 94 48 | Store X register to absolute address
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STX $58A0            ; 8E A0 58 | Store X register to absolute address
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BIT #$7C             ; 89 7C | Test bits in accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    STA $38D4,Y          ; 99 D4 38 | Update graphics data
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDA ($7C,X)          ; A1 7C | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDY $88              ; A4 88 | Load from zero page into Y register
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BCS $08              ; B0 08 | Branch if carry set
    ADC #$43             ; 69 43 | Add with carry (immediate)
    LDA $B8A4,Y          ; B9 A4 B8 | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    CMP $7C              ; C5 7C | Compare accumulator (zero page)
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    DEC                  ; 3A | Decrement accumulator
    LDY #$42             ; A0 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    BCC $D1              ; 90 D1 | Branch if carry clear
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    SBC ($40),Y          ; F1 40 | Subtract with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    BVC $F1              ; 50 F1 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    EOR #$A0             ; 49 A0 | Exclusive OR with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0DA
; Address: $D19F8E
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0DA:
    WDM #$00             ; 42 00 | Reserved instruction
    EOR $4108            ; 4D 08 41 | Exclusive OR with accumulator (absolute)
    WDM #$00             ; 42 00 | Reserved instruction
    BVC $E0              ; 50 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    BVC $44              ; 50 44 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $40              ; F0 40 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PHY                  ; 5A | Push Y register to stack
    BVS $F9              ; 70 F9 | Branch if overflow set
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR $C8D8,X          ; 5D D8 C8 | Exclusive OR with accumulator (absolute,X)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ADC ($A0,X)          ; 61 A0 | Add with carry ((zero page,X))
    SEC                  ; 38 | Set carry flag
    WDM #$10             ; 42 10 | Reserved instruction
    ROR                  ; 6A | Rotate right (accumulator)
    PEA #$4240           ; F4 40 42 | Hardware register operation
    ROR $3078            ; 6E 78 30 | Rotate right (absolute)
    WDM #$00             ; 42 00 | Reserved instruction
    ADC ($70),Y          ; 71 70 | Add with carry ((zero page),Y)
    BMI $43              ; 30 43 | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    WDM #$08             ; 42 08 | Reserved instruction
    PHP                  ; 08 | Push processor status to stack
    LDA ($41,X)          ; A1 41 | Read graphics status
    STA $B8              ; 85 B8 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    LDA ($42),Y          ; B1 42 | Hardware register operation
    LDA ($B8),Y          ; B1 B8 | Read graphics status
    CPY #$41             ; C0 41 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDX $F890,Y          ; BE 90 F8 | Load from absolute,Y into X register
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    BPL $81              ; 10 81 | Branch if positive

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0DC
; Address: $D19FEA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0DC:
    JSR $3111            ; 20 11 31 | Jump to subroutine
    ROL $81              ; 26 81 | Rotate left (zero page)
    BPL $41              ; 10 41 | Branch if positive
    BCC $98              ; 90 98 | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    BNE $78              ; D0 78 | Branch if not equal

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0DD
; Address: $D19FFB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0DD:
    PHA                  ; 48 | Push accumulator to stack
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    LDY #$09             ; A0 09 | Load immediate value into Y register
    BPL $08              ; 10 08 | Branch if positive
    CMP ($F8,X)          ; C1 F8 | Compare accumulator ((zero page,X))
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    PHB                  ; 8B | Push data bank register to stack
    LSR $10              ; 46 10 | Logical shift right (zero page)
    ORA $60              ; 05 60 | Logical OR with accumulator (zero page)
    LDA $004D,X          ; BD 4D 00 | Read graphics status
    ASL $60              ; 06 60 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0DE
; Address: $D1A018
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0DE:
    CPY $4210            ; CC 10 42 | Hardware register operation
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA #$6C             ; 09 6C | Logical OR with accumulator (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0DF
; Address: $D1A02D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0DF:
    LDA $104D            ; AD 4D 10 | Read graphics status
    LDY $4200,X          ; BC 00 42 | Hardware register operation
    ORA $60B8            ; 0D B8 60 | Logical OR with accumulator (absolute)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $B8FC            ; 0E FC B8 | Arithmetic shift left (absolute)
    WDM #$00             ; 42 00 | Reserved instruction
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0E0
; Address: $D1A041
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0E0:
    ORA $0043,Y          ; 19 43 00 | Logical OR with accumulator (absolute,Y)
    BPL $94              ; 10 94 | Branch if positive
    BVC $41              ; 50 41 | Branch if overflow clear
    ORA ($F0),Y          ; 11 F0 | Logical OR with accumulator ((zero page),Y)
    JMP $0046            ; 4C 46 00 | Jump to address
    BRA $58              ; 80 58 | Branch always
    WDM #$00             ; 42 00 | Reserved instruction
    LDY #$88             ; A0 88 | Load immediate value into Y register
    BEQ $3C              ; F0 3C | Branch if equal
    LSR $10              ; 46 10 | Logical shift right (zero page)
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    WDM #$00             ; 42 00 | Reserved instruction
    BPL $19              ; 10 19 | Branch if positive
    WDM #$00             ; 42 00 | Reserved instruction
    JMP ($4120)          ; 6C 20 41 | Jump to address (absolute indirect)
    CLC                  ; 18 | Clear carry flag
    INY                  ; C8 | Increment Y register
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0E1
; Address: $D1A070
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0E1:
    CLC                  ; 18 | Clear carry flag
    ORA $AA78,Y          ; 19 78 AA | Logical OR with accumulator (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    ORA $7A40,Y          ; 19 40 7A | Logical OR with accumulator (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    BPL $1A              ; 10 1A | Branch if positive
    STY $50              ; 84 50 | Store Y register to zero page
    BPL $1B              ; 10 1B | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0E2
; Address: $D1A082
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0E2:
    LDA $004D,X          ; BD 4D 00 | Read graphics status
    CPY $41A8            ; CC A8 41 | Compare Y register (absolute)
    ORA $3094,X          ; 1D 94 30 | Logical OR with accumulator (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction
    SEC                  ; 38 | Set carry flag
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0E3
; Address: $D1A099
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0E3:
    JSR $E870            ; 20 70 E8 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    ADC $0840,Y          ; 79 40 08 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0E4
; Address: $D1A0A3
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0E4:
    JSL $6598F8          ; 22 F8 98 65 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    CLI                  ; 58 | Clear interrupt disable flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BIT $E8              ; 24 E8 | Test bits in accumulator (zero page)
    INY                  ; C8 | Increment Y register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BIT $B8              ; 24 B8 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    ROL $6C              ; 26 6C | Rotate left (zero page)
    SEC                  ; 38 | Set carry flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    WDM #$00             ; 42 00 | Reserved instruction
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    BMI $42              ; 30 42 | Hardware register operation
    BPL $2C              ; 10 2C | Branch if positive
    STZ $43C8            ; 9C C8 43 | Store zero to absolute
    AND $9888            ; 2D 88 98 | Logical AND with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    BPL $40              ; 10 40 | Branch if positive
    LDY $4218,X          ; BC 18 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0E7
; Address: $D1A0DD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0E7:
    EOR $3410            ; 4D 10 34 | Exclusive OR with accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    EOR $5410            ; 4D 10 54 | Exclusive OR with accumulator (absolute)
    LDY $4180,X          ; BC 80 41 | Load from absolute,X into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0E8
; Address: $D1A0EA
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0E8:
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    ADC $78              ; 65 78 | Add with carry (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ROR                  ; 6A | Rotate right (accumulator)
    WDM #$10             ; 42 10 | Reserved instruction
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $40              ; B0 40 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    BCS $F0              ; B0 F0 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    STY $78              ; 84 78 | Store Y register to zero page
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0E9
; Address: $D1A113
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0E9:
    CMP $104D,X          ; DD 4D 10 | Compare accumulator (absolute,X)
    STA $58              ; 85 58 | Update graphics data
    BCC $43              ; 90 43 | Branch if carry clear
    BPL $86              ; 10 86 | Branch if positive
    BRA $F8              ; 80 F8 | Branch always
    RTI                  ; 40 | Return from interrupt
    BPL $86              ; 10 86 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    BCC $40              ; 90 40 | Branch if carry clear
    BPL $91              ; 10 91 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    LDA ($42),Y          ; B1 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0EA
; Address: $D1A134
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0EA:
    STA $28D4,Y          ; 99 D4 28 | Update graphics data
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    STA $38D4,Y          ; 99 D4 38 | Update graphics data
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    LDA $410908          ; AF 08 09 41 | Read graphics status
    BPL $BA              ; 10 BA | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    LDY $C860,X          ; BC 60 C8 | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    BPL $30              ; 10 30 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    AND ($C4),Y          ; 31 C4 | Logical AND with accumulator ((zero page),Y)
    CPX #$41             ; E0 41 | Compare X register (immediate)
    CPY $80              ; C4 80 | Compare Y register (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    CPX #$58             ; E0 58 | Compare X register (immediate)
    BPL $CB              ; 10 CB | Branch if positive
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    BPL $DF              ; 10 DF | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    STA ($D8,X)          ; 81 D8 | Update graphics data
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    ORA ($71),Y          ; 11 71 | Logical OR with accumulator ((zero page),Y)
    EOR ($18,X)          ; 41 18 | Exclusive OR with accumulator ((zero page,X))
    ADC #$98             ; 69 98 | Add with carry (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $34              ; 10 34 | Branch if positive
    BCS $69              ; B0 69 | Branch if carry set
    BPL $37              ; 10 37 | Branch if positive
    ADC $4108            ; 6D 08 41 | Add with carry (absolute)
    BPL $F6              ; 10 F6 | Branch if positive
    BVS $41              ; 70 41 | Branch if overflow set
    BPL $35              ; 10 35 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP ($1044)          ; 6C 44 10 | Jump to address (absolute indirect)
    ROL $A8C9            ; 2E C9 A8 | Rotate left (absolute)
    STA ($10,X)          ; 81 10 | Update graphics data
    ROL $B8C9            ; 2E C9 B8 | Rotate left (absolute)
    STA ($10,X)          ; 81 10 | Update graphics data

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0EB
; Address: $D1A1A2
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0EB:
    ROL $A8D1            ; 2E D1 A8 | Rotate left (absolute)
    STA ($10,X)          ; 81 10 | Update graphics data
    ROL $B8D1            ; 2E D1 B8 | Rotate left (absolute)
    STA ($10,X)          ; 81 10 | Update graphics data
    CMP ($78,X)          ; C1 78 | Compare accumulator ((zero page,X))
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    CMP ($88,X)          ; C1 88 | Compare accumulator ((zero page,X))
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    CMP #$78             ; C9 78 | Compare accumulator (immediate)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    BIT #$D8             ; 89 D8 | Test bits in accumulator (immediate)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    EOR $71              ; 45 71 | Exclusive OR with accumulator (zero page)
    BIT #$42             ; 89 42 | Hardware register operation
    BPL $45              ; 10 45 | Branch if positive
    SBC $4288,Y          ; F9 88 42 | Hardware register operation
    BPL $4A              ; 10 4A | Branch if positive
    STA $1042,Y          ; 99 42 10 | Update graphics data
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($41),Y          ; 31 41 | Logical AND with accumulator ((zero page),Y)
    BPL $50              ; 10 50 | Branch if positive
    LDA ($78,X)          ; A1 78 | Read graphics status
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    BVC $61              ; 50 61 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    BPL $51              ; 10 51 | Branch if positive
    STA $43D0            ; 8D D0 43 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    EOR ($85),Y          ; 51 85 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($85),Y          ; 51 85 | Exclusive OR with accumulator ((zero page),Y)
    LDY #$41             ; A0 41 | Load immediate value into Y register
    EOR ($85),Y          ; 51 85 | Exclusive OR with accumulator ((zero page),Y)
    LDY #$43             ; A0 43 | Load immediate value into Y register
    BPL $53              ; 10 53 | Branch if positive
    ADC $40B8,X          ; 7D B8 40 | Add with carry (absolute,X)
    BPL $54              ; 10 54 | Branch if positive
    LDA $4160,X          ; BD 60 41 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $40F8,X          ; 7D F8 40 | Add with carry (absolute,X)
    BPL $53              ; 10 53 | Branch if positive
    BNE $40              ; D0 40 | Branch if not equal
    BPL $53              ; 10 53 | Branch if positive
    LDA $40A8,Y          ; B9 A8 40 | Read graphics status

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0EC
; Address: $D1A214
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0EC:
    BPL $54              ; 10 54 | Branch if positive
    BNE $42              ; D0 42 | Hardware register operation
    BPL $54              ; 10 54 | Branch if positive
    STA $20              ; 85 20 | Update graphics data
    BPL $54              ; 10 54 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    LDA $98              ; A5 98 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    BPL $56              ; 10 56 | Branch if positive
    SBC ($A0),Y          ; F1 A0 | Subtract with carry ((zero page),Y)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    AND $4131,X          ; 3D 31 41 | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    STA $4120            ; 8D 20 41 | Update graphics data
    BPL $55              ; 10 55 | Branch if positive
    ADC ($98,X)          ; 61 98 | Add with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BPL $56              ; 10 56 | Branch if positive
    ADC ($41),Y          ; 71 41 | Add with carry ((zero page),Y)
    BPL $56              ; 10 56 | Branch if positive
    BNE $41              ; D0 41 | Branch if not equal
    BPL $56              ; 10 56 | Branch if positive
    BVC $42              ; 50 42 | Hardware register operation
    BPL $56              ; 10 56 | Branch if positive
    ADC ($41),Y          ; 71 41 | Add with carry ((zero page),Y)
    BPL $56              ; 10 56 | Branch if positive
    BNE $41              ; D0 41 | Branch if not equal
    BPL $56              ; 10 56 | Branch if positive
    AND $D1              ; 25 D1 | Logical AND with accumulator (zero page)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    BVS $42              ; 70 42 | Hardware register operation
    BPL $57              ; 10 57 | Branch if positive
    BPL $41              ; 10 41 | Branch if positive
    BPL $57              ; 10 57 | Branch if positive
    BEQ $42              ; F0 42 | Hardware register operation
    BPL $57              ; 10 57 | Branch if positive
    CMP ($42),Y          ; D1 42 | Hardware register operation
    BPL $56              ; 10 56 | Branch if positive
    SBC ($41),Y          ; F1 41 | Subtract with carry ((zero page),Y)
    BPL $57              ; 10 57 | Branch if positive
    BCC $42              ; 90 42 | Hardware register operation
    BPL $56              ; 10 56 | Branch if positive
    ORA ($41),Y          ; 11 41 | Logical OR with accumulator ((zero page),Y)
    BPL $58              ; 10 58 | Branch if positive
    LDA $A8              ; A5 A8 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    BPL $59              ; 10 59 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    WDM #$10             ; 42 10 | Reserved instruction

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0ED
; Address: $D1A288
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0ED:
    EOR $D8DD,Y          ; 59 DD D8 | Exclusive OR with accumulator (absolute,Y)
    WDM #$18             ; 42 18 | Reserved instruction
    CLI                  ; 58 | Clear interrupt disable flag
    ADC #$D8             ; 69 D8 | Add with carry (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $58              ; 10 58 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    EOR $7095,Y          ; 59 95 70 | Exclusive OR with accumulator (absolute,Y)
    WDM #$10             ; 42 10 | Reserved instruction
    EOR $7115,Y          ; 59 15 71 | Exclusive OR with accumulator (absolute,Y)
    WDM #$10             ; 42 10 | Reserved instruction
    EOR $70C5,Y          ; 59 C5 70 | Exclusive OR with accumulator (absolute,Y)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    EOR $7085,Y          ; 59 85 70 | Exclusive OR with accumulator (absolute,Y)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    EOR $B915,Y          ; 59 15 B9 | Exclusive OR with accumulator (absolute,Y)
    WDM #$10             ; 42 10 | Reserved instruction
    EOR $9951,Y          ; 59 51 99 | Exclusive OR with accumulator (absolute,Y)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    AND ($41),Y          ; 31 41 | Logical AND with accumulator ((zero page),Y)
    BPL $5A              ; 10 5A | Branch if positive
    BMI $41              ; 30 41 | Branch if negative
    BPL $59              ; 10 59 | Branch if positive
    BPL $41              ; 10 41 | Branch if positive
    BPL $5A              ; 10 5A | Branch if positive
    BCS $41              ; B0 41 | Branch if carry set
    BPL $59              ; 10 59 | Branch if positive
    BCS $42              ; B0 42 | Hardware register operation
    BPL $5D              ; 10 5D | Branch if positive
    ADC $4128,X          ; 7D 28 41 | Add with carry (absolute,X)
    BPL $5E              ; 10 5E | Branch if positive
    ORA $42A9            ; 0D A9 42 | Hardware register operation
    CLC                  ; 18 | Clear carry flag
    EOR $603D,X          ; 5D 3D 60 | Exclusive OR with accumulator (absolute,X)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    EOR $D8A1,X          ; 5D A1 D8 | Exclusive OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BPL $5E              ; 10 5E | Branch if positive
    BVC $41              ; 50 41 | Branch if overflow clear
    BPL $5E              ; 10 5E | Branch if positive
    BVC $41              ; 50 41 | Branch if overflow clear
    BPL $5E              ; 10 5E | Branch if positive
    ADC ($41),Y          ; 71 41 | Add with carry ((zero page),Y)
    BPL $5E              ; 10 5E | Branch if positive
    BVC $42              ; 50 42 | Hardware register operation
    BPL $5E              ; 10 5E | Branch if positive
    LDA $50              ; A5 50 | Read graphics status
    WDM #$10             ; 42 10 | Reserved instruction

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0EE
; Address: $D1A2FB
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0EE:
    LSR $F085,X          ; 5E 85 F0 | Logical shift right (absolute,X)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    LSR $78ED,X          ; 5E ED 78 | Logical shift right (absolute,X)
    WDM #$10             ; 42 10 | Reserved instruction
    LSR $3075,X          ; 5E 75 30 | Logical shift right (absolute,X)
    WDM #$10             ; 42 10 | Reserved instruction
    LSR $70A5,X          ; 5E A5 70 | Logical shift right (absolute,X)
    WDM #$10             ; 42 10 | Reserved instruction
    LSR $D0C5,X          ; 5E C5 D0 | Logical shift right (absolute,X)
    WDM #$10             ; 42 10 | Reserved instruction
    LSR $10C5,X          ; 5E C5 10 | Logical shift right (absolute,X)
    BPL $5F              ; 10 5F | Branch if positive
    CMP $30              ; C5 30 | Compare accumulator (zero page)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    BVC $41              ; 50 41 | Branch if overflow clear
    BPL $5F              ; 10 5F | Branch if positive
    SBC $F0              ; E5 F0 | Subtract with carry (zero page)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    CMP ($58,X)          ; C1 58 | Compare accumulator ((zero page,X))
    BPL $5F              ; 10 5F | Branch if positive
    BVC $42              ; 50 42 | Hardware register operation
    BPL $60              ; 10 60 | Branch if positive
    BCS $42              ; B0 42 | Hardware register operation
    BPL $60              ; 10 60 | Branch if positive
    BCC $42              ; 90 42 | Hardware register operation
    BPL $61              ; 10 61 | Branch if positive
    BEQ $42              ; F0 42 | Hardware register operation
    BPL $61              ; 10 61 | Branch if positive
    BCC $43              ; 90 43 | Branch if carry clear
    BPL $61              ; 10 61 | Branch if positive
    STA ($43),Y          ; 91 43 | Update graphics data
    BPL $61              ; 10 61 | Branch if positive
    CMP $70              ; C5 70 | Compare accumulator (zero page)
    WDM #$10             ; 42 10 | Reserved instruction
    ADC ($15,X)          ; 61 15 | Add with carry ((zero page,X))
    SBC ($42),Y          ; F1 42 | Hardware register operation
    BPL $5E              ; 10 5E | Branch if positive
    CMP $70              ; C5 70 | Compare accumulator (zero page)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    CMP $50              ; C5 50 | Compare accumulator (zero page)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0EF
; Address: $D1A360
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0EF:
    CMP $F0              ; C5 F0 | Compare accumulator (zero page)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    ADC ($F5,X)          ; 61 F5 | Add with carry ((zero page,X))
    BCC $43              ; 90 43 | Branch if carry clear
    BPL $5E              ; 10 5E | Branch if positive
    ORA $91              ; 05 91 | Logical OR with accumulator (zero page)
    WDM #$10             ; 42 10 | Reserved instruction
    AND $1105,X          ; 3D 05 11 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0F0
; Address: $D1A371
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0F0:
    WDM #$00             ; 42 00 | Reserved instruction
    BVC $FA              ; 50 FA | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    BPL $63              ; 10 63 | Branch if positive
    EOR #$98             ; 49 98 | Exclusive OR with accumulator (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR $40D8,Y          ; 59 D8 40 | Exclusive OR with accumulator (absolute,Y)
    BPL $2C              ; 10 2C | Branch if positive
    SBC $1041,Y          ; F9 41 10 | Subtract with carry (absolute,Y)
    ORA $B1              ; 05 B1 | Logical OR with accumulator (zero page)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    LDA $80              ; A5 80 | Read graphics status
    WDM #$10             ; 42 10 | Reserved instruction
    PHY                  ; 5A | Push Y register to stack
    ORA ($42),Y          ; 11 42 | Hardware register operation
    BPL $60              ; 10 60 | Branch if positive
    BCS $42              ; B0 42 | Hardware register operation
    BPL $61              ; 10 61 | Branch if positive
    CMP $50              ; C5 50 | Compare accumulator (zero page)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0F1
; Address: $D1A3A2
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0F1:
    LDA $104D,X          ; BD 4D 10 | Read graphics status
    SEC                  ; 38 | Set carry flag
    BRA $0B              ; 80 0B | Branch always
    BPL $34              ; 10 34 | Branch if positive
    PHX                  ; DA | Push X register to stack
    LSR $18              ; 46 18 | Logical shift right (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    BVC $00              ; 50 00 | Branch if overflow clear
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    DEC                  ; 3A | Decrement accumulator
    LDA ($80),Y          ; B1 80 | Read graphics status
    SEC                  ; 38 | Set carry flag
    CMP ($40,X)          ; C1 40 | Compare accumulator ((zero page,X))
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    AND $E103,X          ; 3D 03 E1 | Logical AND with accumulator (absolute,X)
    CPX #$0B             ; E0 0B | Compare X register (immediate)
    BRA $39              ; 80 39 | Branch always
    ROL $F103,X          ; 3E 03 F1 | Rotate left (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))
    BRA $3B              ; 80 3B | Branch always
    RTI                  ; 40 | Return from interrupt
    ORA ($A1),Y          ; 11 A1 | Logical OR with accumulator ((zero page),Y)
    BRA $3C              ; 80 3C | Branch always
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0F3
; Address: $D1A406
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0F3:
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    WDM #$01             ; 42 01 | Reserved instruction
    CPY #$1A             ; C0 1A | Compare Y register (immediate)
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    EOR $03              ; 45 03 | Exclusive OR with accumulator (zero page)
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    LSR $03              ; 46 03 | Logical shift right (zero page)
    ADC ($C1),Y          ; 71 C1 | Add with carry ((zero page),Y)
    AND $0347,Y          ; 39 47 03 | Logical AND with accumulator (absolute,Y)
    STA ($01,X)          ; 81 01 | Update graphics data
    PHA                  ; 48 | Push accumulator to stack
    STA ($01),Y          ; 91 01 | Update graphics data
    EOR #$03             ; 49 03 | Exclusive OR with accumulator (immediate)
    LDA ($01,X)          ; A1 01 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA ($C1),Y          ; B1 C1 | Read graphics status
    AND $034B,X          ; 3D 4B 03 | Logical AND with accumulator (absolute,X)
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    JMP $D103            ; 4C 03 D1 | Jump to address
    AND ($0D,X)          ; 21 0D | Logical AND with accumulator ((zero page,X))
    BRA $3E              ; 80 3E | Branch always
    EOR $E103            ; 4D 03 E1 | Exclusive OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR $F203            ; 4E 03 F2 | Logical shift right (absolute)
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    BRA $37              ; 80 37 | Branch always
    BVC $03              ; 50 03 | Branch if overflow clear
    ORA ($A2),Y          ; 11 A2 | Logical OR with accumulator ((zero page),Y)
    BRA $38              ; 80 38 | Branch always
    EOR ($03),Y          ; 51 03 | Exclusive OR with accumulator ((zero page),Y)
    AND ($E2,X)          ; 21 E2 | Logical AND with accumulator ((zero page,X))
    BRA $3D              ; 80 3D | Branch always
    AND ($22),Y          ; 31 22 | Logical AND with accumulator ((zero page),Y)
    BRA $3A              ; 80 3A | Branch always
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    EOR ($02),Y          ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
    ADC ($82,X)          ; 61 82 | Add with carry ((zero page,X))
    ADC ($02),Y          ; 71 02 | Add with carry ((zero page),Y)
    ORA $3E00            ; 0D 00 3E | Logical OR with accumulator (absolute)
    BRA $1A              ; 80 1A | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $A103,Y          ; 59 03 A1 | Exclusive OR with accumulator (absolute,Y)
    PHY                  ; 5A | Push Y register to stack
    LDA ($02),Y          ; B1 02 | Read graphics status
    CMP ($02,X)          ; C1 02 | Compare accumulator ((zero page,X))
    JMP $02D103          ; 5C 03 D1 02 | Jump to address long
    EOR $E103,X          ; 5D 03 E1 | Exclusive OR with accumulator (absolute,X)
    LSR $F103,X          ; 5E 03 F1 | Logical shift right (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0F5
; Address: $D1A4D7
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0F5:
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    ADC ($03,X)          ; 61 03 | Add with carry ((zero page,X))
    AND ($03,X)          ; 21 03 | Logical AND with accumulator ((zero page,X))
    WDM #$03             ; 42 03 | Reserved instruction
    STZ $03              ; 64 03 | Store zero to zero page
    ADC $03              ; 65 03 | Add with carry (zero page)
    ROR $03              ; 66 03 | Rotate right (zero page)
    ADC ($03),Y          ; 71 03 | Add with carry ((zero page),Y)
    STA ($03,X)          ; 81 03 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    STA ($03),Y          ; 91 03 | Update graphics data
    ADC #$03             ; 69 03 | Add with carry (immediate)
    LDA ($03,X)          ; A1 03 | Read graphics status
    ROR                  ; 6A | Rotate right (accumulator)
    LDA ($03),Y          ; B1 03 | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0F6
; Address: $D1A524
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0F6:
    CMP ($03,X)          ; C1 03 | Compare accumulator ((zero page,X))
    JMP ($D103)          ; 6C 03 D1 | Jump to address (absolute indirect)
    ADC $E103            ; 6D 03 E1 | Add with carry (absolute)
    ROR $F103            ; 6E 03 F1 | Rotate right (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BVS $03              ; 70 03 | Branch if overflow set
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    ADC ($03),Y          ; 71 03 | Add with carry ((zero page),Y)
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    EOR ($04),Y          ; 51 04 | Exclusive OR with accumulator ((zero page),Y)
    ADC ($04,X)          ; 61 04 | Add with carry ((zero page,X))
    ADC ($04),Y          ; 71 04 | Add with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    ADC $A203,Y          ; 79 03 A2 | Add with carry (absolute,Y)
    PLY                  ; 7A | Pull Y register from stack
    CMP ($04,X)          ; C1 04 | Compare accumulator ((zero page,X))
    CMP ($04),Y          ; D1 04 | Compare accumulator ((zero page),Y)
    ADC $E103,X          ; 7D 03 E1 | Add with carry (absolute,X)
    ROR $F103,X          ; 7E 03 F1 | Rotate right (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BRA $03              ; 80 03 | Branch always
    ORA ($05),Y          ; 11 05 | Logical OR with accumulator ((zero page),Y)
    STA ($03,X)          ; 81 03 | Update graphics data
    AND ($05,X)          ; 21 05 | Logical AND with accumulator ((zero page,X))
    AND ($05),Y          ; 31 05 | Logical AND with accumulator ((zero page),Y)
    EOR ($05,X)          ; 41 05 | Exclusive OR with accumulator ((zero page,X))
    STY $03              ; 84 03 | Store Y register to zero page
    EOR ($05),Y          ; 51 05 | Exclusive OR with accumulator ((zero page),Y)
    STA $03              ; 85 03 | Update graphics data
    ADC ($05,X)          ; 61 05 | Add with carry ((zero page,X))
    STX $03              ; 86 03 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0F7
; Address: $D1A5E1
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0F7:
    ADC ($05),Y          ; 71 05 | Add with carry ((zero page),Y)
    STA ($05,X)          ; 81 05 | Update graphics data
    DEY                  ; 88 | Decrement Y register
    STA ($05),Y          ; 91 05 | Update graphics data
    BIT #$03             ; 89 03 | Test bits in accumulator (immediate)
    LDA ($05,X)          ; A1 05 | Read graphics status
    ADC ($4B,X)          ; 61 4B | Add with carry ((zero page,X))
    ADC ($6B),Y          ; 71 6B | Add with carry ((zero page),Y)
    BRA $37              ; 80 37 | Branch always
    STA ($6B,X)          ; 81 6B | Update graphics data
    BRA $37              ; 80 37 | Branch always
    STA ($6B),Y          ; 91 6B | Update graphics data
    BRA $37              ; 80 37 | Branch always
    BVC $03              ; 50 03 | Branch if overflow clear
    LDA ($AB,X)          ; A1 AB | Read graphics status
    BRA $38              ; 80 38 | Branch always
    EOR ($03),Y          ; 51 03 | Exclusive OR with accumulator ((zero page),Y)
    LDA ($EB),Y          ; B1 EB | Read graphics status
    BRA $3D              ; 80 3D | Branch always
    CMP ($2B,X)          ; C1 2B | Compare accumulator ((zero page,X))
    BRA $3A              ; 80 3A | Branch always
    CMP ($8B),Y          ; D1 8B | Compare accumulator ((zero page),Y)
    SBC ($0B,X)          ; E1 0B | Subtract with carry ((zero page,X))
    ORA $3E00            ; 0D 00 3E | Logical OR with accumulator (absolute)
    BRA $1A              ; 80 1A | Branch always
    RTI                  ; 40 | Return from interrupt
    STA ($10),Y          ; 91 10 | Update graphics data
    ADC ($11,X)          ; 61 11 | Add with carry ((zero page,X))
    AND ($71,X)          ; 21 71 | Logical AND with accumulator ((zero page,X))
    BRA $37              ; 80 37 | Branch always
    STA $F103            ; 8D 03 F1 | Update graphics data
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    STA $0103            ; 8D 03 01 | Update graphics data
    STA $1103            ; 8D 03 11 | Update graphics data
    STA $2103            ; 8D 03 21 | PPU graphics register access
    BIT $7100            ; 2C 00 71 | Test bits in accumulator (absolute)
    STX $D103            ; 8E 03 D1 | Store X register to absolute address
    CLC                  ; 18 | Clear carry flag
    STX $E103            ; 8E 03 E1 | Store X register to absolute address
    CLC                  ; 18 | Clear carry flag
    STX $E103            ; 8E 03 E1 | Store X register to absolute address
    STX $1103            ; 8E 03 11 | Store X register to absolute address
    BPL $00              ; 10 00 | Branch if positive
    STX $4103            ; 8E 03 41 | Store X register to absolute address
    SBC ($18),Y          ; F1 18 | Subtract with carry ((zero page),Y)
    ROR $1103,X          ; 7E 03 11 | Rotate right (absolute,X)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    AND ($19,X)          ; 21 19 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0F8
; Address: $D1A6B8
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0F8:
    BIT #$03             ; 89 03 | Test bits in accumulator (immediate)
    AND ($19),Y          ; 31 19 | Logical AND with accumulator ((zero page),Y)
    BIT #$03             ; 89 03 | Test bits in accumulator (immediate)
    EOR ($19,X)          ; 41 19 | Exclusive OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    EOR ($19),Y          ; 51 19 | Exclusive OR with accumulator ((zero page),Y)
    ADC ($19,X)          ; 61 19 | Add with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    CPY #$29             ; C0 29 | Compare Y register (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CPY #$29             ; C0 29 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $29              ; 80 29 | Branch always
    LDA ($00,X)          ; A1 00 | Read graphics status
    ROL $0000            ; 2E 00 00 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0F9
; Address: $D1A745
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0F9:
    JSR $3A10            ; 20 10 3A | Jump to subroutine
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BPL $3B              ; 10 3B | Branch if positive
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0FA
; Address: $D1A758
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0FA:
    BPL $3C              ; 10 3C | Branch if positive
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ORA ($3D),Y          ; 11 3D | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0FC
; Address: $D1A769
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0FC:
    JSR $3E11            ; 20 11 3E | Jump to subroutine
    ADC ($02,X)          ; 61 02 | Add with carry ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    SBC ($02,X)          ; E1 02 | Subtract with carry ((zero page,X))
    LSR $00              ; 46 00 | Logical shift right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0FD
; Address: $D1A77C
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0FD:
    ORA ($40),Y          ; 11 40 | Logical OR with accumulator ((zero page),Y)
    SEP #$04             ; E2 04 | Set processor status bits
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    ORA $4E              ; 05 4E | Logical OR with accumulator (zero page)
    WDM #$03             ; 42 03 | Reserved instruction
    LDX #$04             ; A2 04 | Load immediate value into X register
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    BPL $44              ; 10 44 | Branch if positive
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    BRA $11              ; 80 11 | Branch always
    EOR $03              ; 45 03 | Exclusive OR with accumulator (zero page)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    LSR $0000,X          ; 5E 00 00 | Logical shift right (absolute,X)
    LDY #$11             ; A0 11 | Load immediate value into Y register
    LSR $03              ; 46 03 | Logical shift right (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$11             ; C0 11 | Compare Y register (immediate)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ROR $00              ; 66 00 | Rotate right (zero page)
    CPX #$11             ; E0 11 | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    EOR #$03             ; 49 03 | Exclusive OR with accumulator (immediate)
    AND ($03,X)          ; 21 03 | Logical AND with accumulator ((zero page,X))
    ROR $0000            ; 6E 00 00 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0FE
; Address: $D1A7D5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0FE:
    JSR $4A12            ; 20 12 4A | Jump to subroutine
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    SBC ($03,X)          ; E1 03 | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_0FF
; Address: $D1A7E9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_0FF:
    JMP $2103            ; 4C 03 21 | PPU graphics register access
    PLY                  ; 7A | Pull Y register from stack
    BRA $12              ; 80 12 | Branch always
    EOR $2203            ; 4D 03 22 | Exclusive OR with accumulator (absolute)
    ORA $7E              ; 05 7E | Logical OR with accumulator (zero page)
    LSR $6103            ; 4E 03 61 | Logical shift right (absolute)
    LDY #$12             ; A0 12 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_100
; Address: $D1A806
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_100:
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page
    CPY #$12             ; C0 12 | Compare Y register (immediate)
    BVC $03              ; 50 03 | Branch if overflow clear
    ADC ($03,X)          ; 61 03 | Add with carry ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    CPX #$12             ; E0 12 | Compare X register (immediate)
    EOR ($03),Y          ; 51 03 | Exclusive OR with accumulator ((zero page),Y)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    STX $0000            ; 8E 00 00 | Store X register to absolute address
    BPL $52              ; 10 52 | Branch if positive
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_101
; Address: $D1A824
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_101:
    JSR $0001            ; 20 01 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_102
; Address: $D1A82F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_102:
    JSR $5413            ; 20 13 54 | Jump to subroutine
    LDA ($02,X)          ; A1 02 | Read graphics status
    TXS                  ; 9A | Transfer X register to stack pointer
    RTI                  ; 40 | Return from interrupt
    LDA ($03,X)          ; A1 03 | Read graphics status
    STZ $0000,X          ; 9E 00 00 | Store zero to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_104
; Address: $D1A84E
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_104:
    JSL $48A740          ; 22 40 A7 48 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    BRA $13              ; 80 13 | Branch always
    EOR $2103,Y          ; 59 03 21 | PPU graphics register access
    LDX $0000            ; AE 00 00 | Load from absolute address into X register
    LDY #$13             ; A0 13 | Load immediate value into Y register
    PHY                  ; 5A | Push Y register to stack
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$13             ; C0 13 | Compare Y register (immediate)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPX #$93             ; E0 93 | Compare X register (immediate)
    JMP $002103          ; 5C 03 21 00 | Jump to address long
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $2103,X          ; 5D 03 21 | PPU graphics register access
    LDX $0000,Y          ; BE 00 00 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_105
; Address: $D1A889
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_105:
    JSR $5E14            ; 20 14 5E | Jump to subroutine
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    REP #$00             ; C2 00 | Reset processor status bits
    BRA $5F              ; 80 5F | Branch always
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    DEC $00              ; C6 00 | Decrement (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_107
; Address: $D1A8A1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_107:
    DEX                  ; CA | Decrement X register
    BRA $94              ; 80 94 | Branch always
    ADC ($03,X)          ; 61 03 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_10B
; Address: $D1A8C3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_10B:
    JSL $00DA00          ; 22 00 DA 00 | Jump to subroutine long
    ADC $03              ; 65 03 | Add with carry (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    DEC $0000,X          ; DE 00 00 | Decrement (absolute,X)
    LDY #$94             ; A0 94 | Load immediate value into Y register
    ROR $03              ; 66 03 | Rotate right (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    SEP #$00             ; E2 00 | Set processor status bits
    BRA $67              ; 80 67 | Branch always
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    INC $00              ; E6 00 | Increment (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_10C
; Address: $D1A8EC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_10C:
    JSR $6995            ; 20 95 69 | Jump to subroutine
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    INC $0000            ; EE 00 00 | Increment (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BRA $6B              ; 80 6B | Branch always
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_10D
; Address: $D1A909
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_10D:
    JMP ($2103)          ; 6C 03 21 | PPU graphics register access
    RTI                  ; 40 | Return from interrupt
    CPY #$6D             ; C0 6D | Compare Y register (immediate)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BRA $95              ; 80 95 | Branch always
    ROR $2103            ; 6E 03 21 | PPU graphics register access
    RTI                  ; 40 | Return from interrupt
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    LDY #$D5             ; A0 D5 | Load immediate value into Y register
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    ORA ($D2),Y          ; 11 D2 | Logical OR with accumulator ((zero page),Y)
    ORA $71C0            ; 0D C0 71 | Logical OR with accumulator (absolute)
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    ORA $0DB2,Y          ; 19 B2 0D | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_10E
; Address: $D1A944
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_10E:
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    CPY #$73             ; C0 73 | Compare Y register (immediate)
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    CPY #$74             ; C0 74 | Compare Y register (immediate)
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    AND ($02),Y          ; 31 02 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    AND $0002,Y          ; 39 02 00 | Logical AND with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_112
; Address: $D1A980
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_112:
    JSL $512B40          ; 22 40 2B 51 | Jump to subroutine long
    CPY #$7A             ; C0 7A | Compare Y register (immediate)
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$D5             ; C0 D5 | Compare Y register (immediate)
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    ADC #$02             ; 69 02 | Add with carry (immediate)
    CPX #$D5             ; E0 D5 | Compare X register (immediate)
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    ADC ($02),Y          ; 71 02 | Add with carry ((zero page),Y)
    ADC $2103,X          ; 7D 03 21 | PPU graphics register access
    RTI                  ; 40 | Return from interrupt
    ADC $2002,Y          ; 79 02 20 | Add with carry (absolute,Y)
    ROR $2203,X          ; 7E 03 22 | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STA ($02,X)          ; 81 02 | Update graphics data
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_113
; Address: $D1A9B6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_113:
    JSR $0140            ; 20 40 01 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $03              ; 80 03 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    LDA ($02,X)          ; A1 02 | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_114
; Address: $D1A9D1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_114:
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    LDA #$02             ; A9 02 | Read graphics status
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_115
; Address: $D1A9E1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_115:
    STA $03              ; 85 03 | Update graphics data
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LSR $0001,X          ; 5E 01 00 | Logical shift right (absolute,X)
    STX $03              ; 86 03 | Store X register to zero page
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_116
; Address: $D1A9F5
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_116:
    JSL $007E00          ; 22 00 7E 00 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ROR $0000            ; 6E 00 00 | Rotate right (absolute)
    BIT #$03             ; 89 03 | Test bits in accumulator (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CMP $1393,Y          ; D9 93 13 | Compare accumulator (absolute,Y)
    CMP $13A3,Y          ; D9 A3 13 | Compare accumulator (absolute,Y)
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    XBA                  ; EB | Exchange accumulator bytes
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_117
; Address: $D1AA37
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_117:
    CLD                  ; D8 | Clear decimal mode flag
    PHB                  ; 8B | Push data bank register to stack
    CMP $13AB,Y          ; D9 AB 13 | Compare accumulator (absolute,Y)
    DEC $1433,X          ; DE 33 14 | Decrement (absolute,X)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CMP $14E3,X          ; DD E3 14 | Compare accumulator (absolute,X)
    CMP $142B,X          ; DD 2B 14 | Compare accumulator (absolute,X)
    CMP $142B,X          ; DD 2B 14 | Compare accumulator (absolute,X)
    CMP $14DB,X          ; DD DB 14 | Compare accumulator (absolute,X)
    CMP $1463,X          ; DD 63 14 | Compare accumulator (absolute,X)
    CPX #$53             ; E0 53 | Compare X register (immediate)
    CPX #$5B             ; E0 5B | Compare X register (immediate)
    CPX #$F3             ; E0 F3 | Compare X register (immediate)
    CPX #$5B             ; E0 5B | Compare X register (immediate)
    CPX #$FB             ; E0 FB | Compare X register (immediate)
    CPX #$5B             ; E0 5B | Compare X register (immediate)
    CPX #$03             ; E0 03 | Compare X register (immediate)
    CPX #$5B             ; E0 5B | Compare X register (immediate)
    SBC #$13             ; E9 13 | Subtract with carry (immediate)
    SBC #$1B             ; E9 1B | Subtract with carry (immediate)
    SBC #$13             ; E9 13 | Subtract with carry (immediate)
    CPX $1523            ; EC 23 15 | Compare X register (absolute)
    SBC #$2B             ; E9 2B | Subtract with carry (immediate)
    SBC #$2B             ; E9 2B | Subtract with carry (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    SBC ($6B,X)          ; E1 6B | Subtract with carry ((zero page,X))
    SBC ($73,X)          ; E1 73 | Subtract with carry ((zero page,X))
    INC $BB              ; E6 BB | Increment (zero page)
    INC $C3              ; E6 C3 | Increment (zero page)
    SEP #$7B             ; E2 7B | Set processor status bits

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_118
; Address: $D1AAA6
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_118:
    SEP #$83             ; E2 83 | Set processor status bits
    SBC $150B            ; ED 0B 15 | Subtract with carry (absolute)
    SBC $AB              ; E5 AB | Subtract with carry (zero page)
    SBC $AB              ; E5 AB | Subtract with carry (zero page)
    SBC $AB              ; E5 AB | Subtract with carry (zero page)
    SBC $AB              ; E5 AB | Subtract with carry (zero page)
    SBC $B3              ; E5 B3 | Subtract with carry (zero page)
    SBC $B3              ; E5 B3 | Subtract with carry (zero page)
    CPX $A3              ; E4 A3 | Compare X register (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    CMP $139B,Y          ; D9 9B 13 | Compare accumulator (absolute,Y)
    PHX                  ; DA | Push X register to stack
    CMP $14EB,X          ; DD EB 14 | Compare accumulator (absolute,X)
    NOP                  ; EA | No operation
    INC $153B            ; EE 3B 15 | Increment (absolute)
    CPX $43              ; E4 43 | Compare X register (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $0200,X          ; 3E 00 02 | Rotate left (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    WDM #$00             ; 42 00 | Reserved instruction
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $4400            ; 0D 00 44 | Logical OR with accumulator (absolute)
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $1900,Y          ; 19 00 19 | Logical OR with accumulator (absolute,Y)
    ORA $1A00,Y          ; 19 00 1A | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ORA $1D00,X          ; 1D 00 1D | Logical OR with accumulator (absolute,X)
    ORA $1E00,X          ; 1D 00 1E | Logical OR with accumulator (absolute,X)
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_11A
; Address: $D1AB81
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_11A:
    JSL $002200          ; 22 00 22 00 | Jump to subroutine long
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_11B
; Address: $D1AB8D
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_11B:
    ROL $00              ; 26 00 | Rotate left (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $2C00            ; 2C 00 2C | Test bits in accumulator (absolute)
    BIT $2D00            ; 2C 00 2D | Test bits in accumulator (absolute)
    AND $2D00            ; 2D 00 2D | Logical AND with accumulator (absolute)
    ROL $2E00            ; 2E 00 2E | Rotate left (absolute)
    ROL $2F00            ; 2E 00 2F | Rotate left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    AND $3900,Y          ; 39 00 39 | Logical AND with accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    AND $3D00,X          ; 3D 00 3D | Logical AND with accumulator (absolute,X)
    AND $4500,X          ; 3D 00 45 | Logical AND with accumulator (absolute,X)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    SBC $AA              ; E5 AA | Subtract with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    TAX                  ; AA | Transfer accumulator to X register
    SBC ($AA),Y          ; F1 AA | Subtract with carry ((zero page),Y)
    TAX                  ; AA | Transfer accumulator to X register
    SBC $03AA,X          ; FD AA 03 | Subtract with carry (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    ORA #$AB             ; 09 AB | Logical OR with accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    AND $33AB            ; 2D AB 33 | Logical AND with accumulator (absolute)
    PLB                  ; AB | Pull data bank register from stack
    AND $3FAB,Y          ; 39 AB 3F | Logical AND with accumulator (absolute,Y)
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_11C
; Address: $D1AC26
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_11C:
    EOR $AB              ; 45 AB | Exclusive OR with accumulator (zero page)
    PLB                  ; AB | Pull data bank register from stack
    EOR ($AB),Y          ; 51 AB | Exclusive OR with accumulator ((zero page),Y)
    PLB                  ; AB | Pull data bank register from stack
    EOR $63AB,X          ; 5D AB 63 | Exclusive OR with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    ADC #$AB             ; 69 AB | Add with carry (immediate)
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA ($AB,X)          ; 81 AB | Update graphics data
    PLB                  ; AB | Pull data bank register from stack
    STA $93AB            ; 8D AB 93 | Update graphics data
    PLB                  ; AB | Pull data bank register from stack
    STA $9FAB,Y          ; 99 AB 9F | Update graphics data
    PLB                  ; AB | Pull data bank register from stack
    LDA $AB              ; A5 AB | Read graphics status
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA ($AB),Y          ; B1 AB | Read graphics status
    PLB                  ; AB | Pull data bank register from stack
    LDA $C3AB,X          ; BD AB C3 | Read graphics status
    PLB                  ; AB | Pull data bank register from stack
    CMP #$AB             ; C9 AB | Compare accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    SBC ($AB,X)          ; E1 AB | Subtract with carry ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    SBC $F3AB            ; ED AB F3 | Subtract with carry (absolute)
    PLB                  ; AB | Pull data bank register from stack
    SBC $FFAB,Y          ; F9 AB FF | Subtract with carry (absolute,Y)
    PLB                  ; AB | Pull data bank register from stack
    CMP $0002            ; CD 02 00 | Compare accumulator (absolute)
    ORA $0034            ; 0D 34 00 | Logical OR with accumulator (absolute)
    CMP $2402            ; CD 02 24 | Compare accumulator (absolute)
    ORA $59FE            ; 0D FE 59 | Logical OR with accumulator (absolute)
    CMP $2F02            ; CD 02 2F | Compare accumulator (absolute)
    ORA $4D5E            ; 0D 5E 4D | Logical OR with accumulator (absolute)
    CMP $9F02            ; CD 02 9F | Compare accumulator (absolute)
    ORA $61BE            ; 0D BE 61 | Logical OR with accumulator (absolute)
    CMP $2702            ; CD 02 27 | Compare accumulator (absolute)
    ORA $5C7E            ; 0D 7E 5C | Logical OR with accumulator (absolute)
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ORA $58DE            ; 0D DE 58 | Logical OR with accumulator (absolute)
    CMP $2002            ; CD 02 20 | Compare accumulator (absolute)
    ORA $9DFE            ; 0D FE 9D | Logical OR with accumulator (absolute)
    CMP $2102            ; CD 02 21 | PPU graphics register access
    ORA $60FE            ; 0D FE 60 | Logical OR with accumulator (absolute)
    CMP $2102            ; CD 02 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_11D
; Address: $D1ACC1
; Size: 133 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_11D:
    ORA $613E            ; 0D 3E 61 | Logical OR with accumulator (absolute)
    CMP $2102            ; CD 02 21 | PPU graphics register access
    ORA $617E            ; 0D 7E 61 | Logical OR with accumulator (absolute)
    CMP $A202            ; CD 02 A2 | Compare accumulator (absolute)
    ORA $61FE            ; 0D FE 61 | Logical OR with accumulator (absolute)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA $58DE            ; 0D DE 58 | Logical OR with accumulator (absolute)
    CMP $1602            ; CD 02 16 | Compare accumulator (absolute)
    ORA $27FE            ; 0D FE 27 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP $1602            ; CD 02 16 | Compare accumulator (absolute)
    ORA $62FE            ; 0D FE 62 | Logical OR with accumulator (absolute)
    ROL $0005,X          ; 3E 05 00 | Rotate left (absolute,X)
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    ORA $4DDE            ; 0D DE 4D | Logical OR with accumulator (absolute)
    CMP $1302            ; CD 02 13 | Compare accumulator (absolute)
    ORA $59BE            ; 0D BE 59 | Logical OR with accumulator (absolute)
    CMP $1302            ; CD 02 13 | Compare accumulator (absolute)
    ORA $59FE            ; 0D FE 59 | Logical OR with accumulator (absolute)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA $58DE            ; 0D DE 58 | Logical OR with accumulator (absolute)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA $58DE            ; 0D DE 58 | Logical OR with accumulator (absolute)
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    ORA $58DE            ; 0D DE 58 | Logical OR with accumulator (absolute)
    ORA ($2D,X)          ; 01 2D | Logical OR with accumulator ((zero page,X))
    ORA $58DE            ; 0D DE 58 | Logical OR with accumulator (absolute)
    CMP $2902            ; CD 02 29 | Compare accumulator (absolute)
    ORA $677E            ; 0D 7E 67 | Logical OR with accumulator (absolute)
    CMP $2902            ; CD 02 29 | Compare accumulator (absolute)
    ORA $66FE            ; 0D FE 66 | Logical OR with accumulator (absolute)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA $4DDE            ; 0D DE 4D | Logical OR with accumulator (absolute)
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    ORA $4DDE            ; 0D DE 4D | Logical OR with accumulator (absolute)
    CMP $1C02            ; CD 02 1C | Compare accumulator (absolute)
    ORA $62BE            ; 0D BE 62 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    DEC $00              ; C6 00 | Decrement (zero page)
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    ORA $58DE            ; 0D DE 58 | Logical OR with accumulator (absolute)
    CMP $AE02            ; CD 02 AE | Compare accumulator (absolute)
    ORA $67BE            ; 0D BE 67 | Logical OR with accumulator (absolute)
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    ORA $4DDE            ; 0D DE 4D | Logical OR with accumulator (absolute)
    CMP $2302            ; CD 02 23 | Compare accumulator (absolute)
    ORA $085E            ; 0D 5E 08 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP $2602            ; CD 02 26 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_11E
; Address: $D1ADB3
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_11E:
    ORA $581E            ; 0D 1E 58 | Logical OR with accumulator (absolute)
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    ORA $58DE            ; 0D DE 58 | Logical OR with accumulator (absolute)
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ORA $58DE            ; 0D DE 58 | Logical OR with accumulator (absolute)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    WDM #$41             ; 42 41 | Reserved instruction
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    WDM #$46             ; 42 46 | Reserved instruction
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND #$44             ; 29 44 | Logical AND with accumulator (immediate)
    EOR ($42,X)          ; 41 42 | Hardware register operation
    AND #$42             ; 29 42 | Hardware register operation
    EOR ($4A,X)          ; 41 4A | Exclusive OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    WDM #$44             ; 42 44 | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR $44              ; 46 44 | Logical shift right (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $56              ; 45 56 | Exclusive OR with accumulator (zero page)
    ORA $0408,X          ; 1D 08 04 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    EOR $43              ; 45 43 | Exclusive OR with accumulator (zero page)
    EOR $46              ; 45 46 | Exclusive OR with accumulator (zero page)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_11F
; Address: $D1AEA3
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_11F:
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $080C            ; 0D 0C 08 | Logical OR with accumulator (absolute)
    ASL $0D00            ; 0E 00 0D | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0F10            ; 0E 10 0F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $11              ; 05 11 | Logical OR with accumulator (zero page)
    ASL $1012            ; 0E 12 10 | Arithmetic shift left (absolute)
    BPL $0E              ; 10 0E | Branch if positive
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $15              ; 10 15 | Branch if positive
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ADC $64              ; 65 64 | Add with carry (zero page)
    ROR $0068            ; 6E 68 00 | Rotate right (absolute)
    BVS $2F              ; 70 2F | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    JMP $005C00          ; 5C 00 5C 00 | Jump to address long
    AND $08              ; 25 08 | Logical AND with accumulator (zero page)
    ORA $1A17,X          ; 1D 17 1A | Logical OR with accumulator (absolute,X)
    ORA $1F1F,X          ; 1D 1F 1F | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_121
; Address: $D1AF1B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_121:
    JSL $241B1D          ; 22 1D 1B 24 | Jump to subroutine long
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA $0308            ; 0D 08 03 | Logical OR with accumulator (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BIT $1D              ; 24 1D | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_123
; Address: $D1AF30
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_123:
    JSL $211D24          ; 22 24 1D 21 | PPU graphics register access
    ORA $0308            ; 0D 08 03 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ORA $0308            ; 0D 08 03 | Logical OR with accumulator (absolute)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_124
; Address: $D1AF53
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_124:
    JSL $00281D          ; 22 1D 28 00 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $00              ; 26 00 | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_125
; Address: $D1AF68
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_125:
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $00              ; 26 00 | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ROL $00              ; 26 00 | Rotate left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    BPL $08              ; 10 08 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ROL $29              ; 26 29 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    BPL $08              ; 10 08 | Branch if positive
    AND $2B30            ; 2D 30 2B | Logical AND with accumulator (absolute)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BMI $29              ; 30 29 | Branch if negative
    AND $342D            ; 2D 2D 34 | Logical AND with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BMI $2D              ; 30 2D | Branch if negative
    AND #$32             ; 29 32 | Logical AND with accumulator (immediate)
    ROL $302D            ; 2E 2D 30 | Rotate left (absolute)
    AND #$34             ; 29 34 | Logical AND with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    AND ($4A),Y          ; 31 4A | Logical AND with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    DEC                  ; 3A | Decrement accumulator
    AND ($48),Y          ; 31 48 | Logical AND with accumulator ((zero page),Y)
    ORA $0308,Y          ; 19 08 03 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $003A,X          ; 3E 3A 00 | Rotate left (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ROL $003C,X          ; 3E 3C 00 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $003A,X          ; 3E 3A 00 | Rotate left (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ROL $003C,X          ; 3E 3C 00 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $8180,Y          ; 79 80 81 | Add with carry (absolute,Y)
    STA ($80,X)          ; 81 80 | Update graphics data
    ADC #$82             ; 69 82 | Add with carry (immediate)
    ADC #$0E             ; 69 0E | Add with carry (immediate)
    AND $0308            ; 2D 08 03 | Logical AND with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_126
; Address: $D1B01D
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_126:
    AND $3300,X          ; 3D 00 33 | Logical AND with accumulator (absolute,X)
    ROL $3F3D,X          ; 3E 3D 3F | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $00              ; 50 00 | Branch if overflow clear
    AND $3300,X          ; 3D 00 33 | Logical AND with accumulator (absolute,X)
    BVC $3D              ; 50 3D | Branch if overflow clear
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ASL $0047,X          ; 1E 47 00 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BVC $19              ; 50 19 | Branch if overflow clear
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $0033,Y          ; 19 33 00 | Logical OR with accumulator (absolute,Y)
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    LSR $47              ; 46 47 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    JMP $190000          ; 5C 00 00 19 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $003F,X          ; 3D 3F 00 | Logical AND with accumulator (absolute,X)
    BIT $3C3F            ; 2C 3F 3C | Test bits in accumulator (absolute)
    AND $0000,X          ; 3D 00 00 | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    JMP $5046            ; 4C 46 50 | Jump to address
    LSR $4C              ; 46 4C | Logical shift right (zero page)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    JMP $4600            ; 4C 00 46 | Jump to address
    BVC $4B              ; 50 4B | Branch if overflow clear
    EOR $4C              ; 45 4C | Exclusive OR with accumulator (zero page)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BRA $79              ; 80 79 | Branch always
    STA ($00,X)          ; 81 00 | Update graphics data
    BRA $81              ; 80 81 | Branch always
    BIT $0308            ; 2C 08 03 | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $4A4B            ; 4C 4B 4A | Jump to address
    BVC $49              ; 50 49 | Branch if overflow clear
    JMP $4B49            ; 4C 49 4B | Jump to address
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    EOR #$50             ; 49 50 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_127
; Address: $D1B0E4
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_127:
    JMP $3600            ; 4C 00 36 | Jump to address
    JMP $4C49            ; 4C 49 4C | Jump to address
    ROR $0000            ; 6E 00 00 | Rotate right (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    EOR #$53             ; 49 53 | Exclusive OR with accumulator (immediate)
    EOR #$53             ; 49 53 | Exclusive OR with accumulator (immediate)
    JMP $190000          ; 5C 00 00 19 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    ROR $817D,X          ; 7E 7D 81 | Rotate right (absolute,X)
    ROR $7981,X          ; 7E 81 79 | Rotate right (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    AND $0308,Y          ; 39 08 03 | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $4C              ; 50 4C | Branch if overflow clear
    JMP $5555            ; 4C 55 55 | Jump to address
    BVC $00              ; 50 00 | Branch if overflow clear
    ORA $0308,Y          ; 19 08 03 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ROR $007A            ; 6E 7A 00 | Rotate right (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ROR $7A76            ; 6E 76 7A | Rotate right (absolute)
    PLY                  ; 7A | Pull Y register from stack
    ADC #$0D             ; 69 0D | Add with carry (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    LSR $55              ; 46 55 | Logical shift right (zero page)
    JMP $0000            ; 4C 00 00 | Jump to address
    ORA $0308,Y          ; 19 08 03 | Logical OR with accumulator (absolute,Y)
    WDM #$00             ; 42 00 | Reserved instruction
    EOR ($59),Y          ; 51 59 | Exclusive OR with accumulator ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack
    EOR ($5A),Y          ; 51 5A | Exclusive OR with accumulator ((zero page),Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $0308,X          ; 1D 08 03 | Logical OR with accumulator (absolute,X)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    EOR $0000            ; 4D 00 00 | Exclusive OR with accumulator (absolute)
    EOR ($4D),Y          ; 51 4D | Exclusive OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0208,X          ; 1D 08 02 | Logical OR with accumulator (absolute,X)
    EOR ($4D),Y          ; 51 4D | Exclusive OR with accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $5100,Y          ; 59 00 51 | Exclusive OR with accumulator (absolute,Y)
    EOR $4D32,Y          ; 59 32 4D | Exclusive OR with accumulator (absolute,Y)
    EOR $0000,Y          ; 59 00 00 | Exclusive OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    EOR $4D00,Y          ; 59 00 4D | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_129
; Address: $D1B199
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_129:
    EOR ($57),Y          ; 51 57 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($59),Y          ; 51 59 | Exclusive OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    LSR $5859            ; 4E 59 58 | Logical shift right (absolute)
    EOR ($57),Y          ; 51 57 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($58),Y          ; 51 58 | Exclusive OR with accumulator ((zero page),Y)
    LSR $0059            ; 4E 59 00 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_12A
; Address: $D1B1B7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_12A:
    JSR $0308            ; 20 08 03 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1C0C            ; 0E 0C 1C | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_12B
; Address: $D1B1C3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_12B:
    JSL $1F1A17          ; 22 17 1A 1F | Jump to subroutine long
    AND $1C              ; 25 1C | Logical AND with accumulator (zero page)
    ORA $0308            ; 0D 08 03 | Logical OR with accumulator (absolute)
    LSR $005D,X          ; 5E 5D 00 | Logical shift right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_12C
; Address: $D1B1D6
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_12C:
    BIT $5D60            ; 2C 60 5D | Test bits in accumulator (absolute)
    LSR $005D,X          ; 5E 5D 00 | Logical shift right (absolute,X)
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    JMP $5B5E53          ; 5C 53 5E 5B | Jump to address long
    LSR $0000,X          ; 5E 00 00 | Logical shift right (absolute,X)
    BIT $08              ; 24 08 | Test bits in accumulator (zero page)
    ORA ($6A,X)          ; 01 6A | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_12E
; Address: $D1B200
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_12E:
    ORA ($6A,X)          ; 01 6A | Logical OR with accumulator ((zero page,X))
    ADC #$13             ; 69 13 | Add with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    WDM #$00             ; 42 00 | Reserved instruction
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_131
; Address: $D1B218
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_131:
    ADC #$00             ; 69 00 | Add with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_133
; Address: $D1B22A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_133:
    PLA                  ; 68 | Pull accumulator from stack
    ADC $0000,Y          ; 79 00 00 | Add with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_134
; Address: $D1B236
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_134:
    PLY                  ; 7A | Pull Y register from stack
    SEI                  ; 78 | Set interrupt disable flag
    JMP ($7800)          ; 6C 00 78 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_135
; Address: $D1B23D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_135:
    PLY                  ; 7A | Pull Y register from stack
    SEI                  ; 78 | Set interrupt disable flag
    JMP ($0078)          ; 6C 78 00 | Jump to address (absolute indirect)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    JMP ($6A00)          ; 6C 00 6A | Jump to address (absolute indirect)
    JMP ($5400)          ; 6C 00 54 | Jump to address (absolute indirect)
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_137
; Address: $D1B26C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_137:
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    ROR $0078            ; 6E 78 00 | Rotate right (absolute)
    ADC $007A            ; 6D 7A 00 | Add with carry (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_139
; Address: $D1B290
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_139:
    ROR $0000            ; 6E 00 00 | Rotate right (absolute)
    PHP                  ; 08 | Push processor status to stack
    JMP ($726F)          ; 6C 6F 72 | Jump to address (absolute indirect)
    STZ $76              ; 64 76 | Store zero to zero page
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ADC $76              ; 65 76 | Add with carry (zero page)
    STZ $65              ; 64 65 | Store zero to zero page
    STZ $65              ; 64 65 | Store zero to zero page
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_13B
; Address: $D1B2C4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_13B:
    ROR $0076            ; 6E 76 00 | Rotate right (absolute)
    ROR $0076            ; 6E 76 00 | Rotate right (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_13D
; Address: $D1B2E3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_13D:
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    ADC #$7B             ; 69 7B | Add with carry (immediate)
    ADC $0000,X          ; 7D 00 00 | Add with carry (absolute,X)
    ADC $7B7C,X          ; 7D 7C 7B | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_13E
; Address: $D1B2F3
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_13E:
    ADC $0079,X          ; 7D 79 00 | Add with carry (absolute,X)
    AND $0408,Y          ; 39 08 04 | Logical AND with accumulator (absolute,Y)
    ADC $6D7C,X          ; 7D 7C 6D | Add with carry (absolute,X)
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    ADC $7C7E,X          ; 7D 7E 7C | Add with carry (absolute,X)
    ROR $0C6D,X          ; 7E 6D 0C | Rotate right (absolute,X)
    AND $0308,Y          ; 39 08 03 | Logical AND with accumulator (absolute,Y)
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    ADC $74              ; 65 74 | Add with carry (zero page)
    ADC ($75,X)          ; 61 75 | Add with carry ((zero page,X))
    LSR $0075,X          ; 5E 75 00 | Logical shift right (absolute,X)
    ROL $08              ; 26 08 | Rotate left (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    STA ($00,X)          ; 81 00 | Update graphics data
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_13F
; Address: $D1B3DA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_13F:
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $2400,X          ; 1E 00 24 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_141
; Address: $D1B40C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_141:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA $0208            ; 0D 08 02 | Logical OR with accumulator (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL $2500,X          ; 1E 00 25 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_142
; Address: $D1B41A
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_142:
    JSR $001E            ; 20 1E 00 | Jump to subroutine
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    ORA $0208            ; 0D 08 02 | Logical OR with accumulator (absolute)
    EOR ($45,X)          ; 41 45 | Exclusive OR with accumulator ((zero page,X))
    ADC ($48,X)          ; 61 48 | Add with carry ((zero page,X))
    EOR $44              ; 45 44 | Exclusive OR with accumulator (zero page)
    ADC ($48,X)          ; 61 48 | Add with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    BVS $5E              ; 70 5E | Branch if overflow set
    STZ $00              ; 64 00 | Store zero to zero page
    LSR $6470,X          ; 5E 70 64 | Logical shift right (absolute,X)
    BIT $08              ; 24 08 | Test bits in accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $19              ; 25 19 | Logical AND with accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL $2521,X          ; 1E 21 25 | Arithmetic shift left (absolute,X)
    ORA $0019,Y          ; 19 19 00 | Logical OR with accumulator (absolute,Y)
    ORA $0308            ; 0D 08 03 | Logical OR with accumulator (absolute)
    STZ $70              ; 64 70 | Store zero to zero page
    LSR $605F,X          ; 5E 5F 60 | Logical shift right (absolute,X)
    ADC $60              ; 65 60 | Add with carry (zero page)
    BVS $64              ; 70 64 | Branch if overflow set
    ROR $0000            ; 6E 00 00 | Rotate right (absolute)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_143
; Address: $D1B477
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_143:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $65              ; 64 65 | Store zero to zero page
    EOR $0060,X          ; 5D 60 00 | Exclusive OR with accumulator (absolute,X)
    STZ $5D              ; 64 5D | Store zero to zero page
    ADC $60              ; 65 60 | Add with carry (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_145
; Address: $D1B487
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_145:
    JSL $000108          ; 22 08 01 00 | Jump to subroutine long
    ORA $1900,Y          ; 19 00 19 | Logical OR with accumulator (absolute,Y)
    AND #$2E             ; 29 2E | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_146
; Address: $D1B492
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_146:
    JSR $3419            ; 20 19 34 | Jump to subroutine
    AND #$2E             ; 29 2E | Logical AND with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    AND $3919            ; 2D 19 39 | Logical AND with accumulator (absolute)
    AND #$2D             ; 29 2D | Logical AND with accumulator (immediate)
    AND $0030,Y          ; 39 30 00 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $3B4A,Y          ; 39 4A 3B | Logical AND with accumulator (absolute,Y)
    AND $4A39,Y          ; 39 39 4A | Logical AND with accumulator (absolute,Y)
    ORA $0308,Y          ; 19 08 03 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($32),Y          ; 31 32 | Logical AND with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $3B31,Y          ; 39 31 3B | Logical AND with accumulator (absolute,Y)
    ORA $0308,Y          ; 19 08 03 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $3000            ; 2D 00 30 | Logical AND with accumulator (absolute)
    ROL $1D              ; 26 1D | Rotate left (zero page)
    BIT $25              ; 24 25 | Test bits in accumulator (zero page)
    AND $3B3F,X          ; 3D 3F 3B | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $0036,X          ; 1E 36 00 | Arithmetic shift left (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $4C38            ; 4D 38 4C | Exclusive OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    EOR $4D49            ; 4D 49 4D | Exclusive OR with accumulator (absolute)
    ORA $0208,Y          ; 19 08 02 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_147
; Address: $D1B52D
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_147:
    EOR $384A            ; 4D 4A 38 | Exclusive OR with accumulator (absolute)
    ORA $003C,Y          ; 19 3C 00 | Logical OR with accumulator (absolute,Y)
    EOR $4D3C            ; 4D 3C 4D | Exclusive OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ORA $0208,Y          ; 19 08 02 | Logical OR with accumulator (absolute,Y)
    EOR $4C3C            ; 4D 3C 4C | Exclusive OR with accumulator (absolute)
    LSR $38              ; 46 38 | Logical shift right (zero page)
    SEC                  ; 38 | Set carry flag
    EOR $3C3B            ; 4D 3B 3C | Exclusive OR with accumulator (absolute)
    ORA $0308,Y          ; 19 08 03 | Logical OR with accumulator (absolute,Y)
    ORA $56              ; 05 56 | Logical OR with accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    PHP                  ; 08 | Push processor status to stack
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $2B              ; 30 2B | Branch if negative
    AND $22              ; 25 22 | Logical AND with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    BRA $69              ; 80 69 | Branch always
    TXS                  ; 9A | Transfer X register to stack pointer
    STA $9A7E,Y          ; 99 7E 9A | Update graphics data
    STA $0000,X          ; 9D 00 00 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    ROR $9B9A            ; 6E 9A 9B | Rotate right (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    STZ $6E83            ; 9C 83 6E | Store zero to absolute
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $9981            ; 9C 81 99 | Store zero to absolute
    STA ($9C,X)          ; 81 9C | Update graphics data
    STA $0080,Y          ; 99 80 00 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    STZ $9996            ; 9C 96 99 | Store zero to absolute
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $0097,X          ; 9D 97 00 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    STA $9D97,Y          ; 99 97 9D | Update graphics data
    ROR $979C            ; 6E 9C 97 | Rotate right (absolute)
    STA $0099,X          ; 9D 99 00 | Update graphics data
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_148
; Address: $D1B605
; Size: 123 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_148:
    INY                  ; C8 | Increment Y register
    CMP ($AD),Y          ; D1 AD | Compare accumulator ((zero page),Y)
    SBC $AD              ; E5 AD | Subtract with carry (zero page)
    SBC $0DAD,Y          ; F9 AD 0D | Subtract with carry (absolute,Y)
    LDX $AE21            ; AE 21 AE | Load from absolute address into X register
    LDX $AE49            ; AE 49 AE | Load from absolute address into X register
    EOR $71AE,X          ; 5D AE 71 | Exclusive OR with accumulator (absolute,X)
    LDX $AE85            ; AE 85 AE | Load from absolute address into X register
    STA $ADAE,Y          ; 99 AE AD | Update graphics data
    LDX $AEC1            ; AE C1 AE | Load from absolute address into X register
    LDX $AEE9            ; AE E9 AE | Load from absolute address into X register
    SBC $11AE,X          ; FD AE 11 | Subtract with carry (absolute,X)
    LDA $39AF25          ; AF 25 AF 39 | Read graphics status
    LDA $61AF4D          ; AF 4D AF 61 | Read graphics status
    LDA $89AF75          ; AF 75 AF 89 | Read graphics status
    LDA $B1AF9D          ; AF 9D AF B1 | Read graphics status
    LDA $D9AFC5          ; AF C5 AF D9 | Read graphics status
    LDA $01AFED          ; AF ED AF 01 | Read graphics status
    BCS $15              ; B0 15 | Branch if carry set
    BCS $29              ; B0 29 | Branch if carry set
    BCS $3D              ; B0 3D | Branch if carry set
    BCS $51              ; B0 51 | Branch if carry set
    BCS $65              ; B0 65 | Branch if carry set
    BCS $79              ; B0 79 | Branch if carry set
    BCS $8D              ; B0 8D | Branch if carry set
    BCS $A1              ; B0 A1 | Branch if carry set
    BCS $B5              ; B0 B5 | Branch if carry set
    BCS $C9              ; B0 C9 | Branch if carry set
    BCS $DD              ; B0 DD | Branch if carry set
    BCS $F1              ; B0 F1 | Branch if carry set
    BCS $05              ; B0 05 | Branch if carry set
    LDA ($19),Y          ; B1 19 | Read graphics status
    LDA ($2D),Y          ; B1 2D | Read graphics status
    LDA ($41),Y          ; B1 41 | Read graphics status
    LDA ($55),Y          ; B1 55 | Read graphics status
    LDA ($69),Y          ; B1 69 | Read graphics status
    LDA ($7D),Y          ; B1 7D | Read graphics status
    LDA ($91),Y          ; B1 91 | Read graphics status
    LDA ($A5),Y          ; B1 A5 | Read graphics status
    LDA ($B9),Y          ; B1 B9 | Read graphics status
    LDA ($CD),Y          ; B1 CD | Read graphics status
    LDA ($E1),Y          ; B1 E1 | Read graphics status
    LDA ($F5),Y          ; B1 F5 | Read graphics status
    LDA ($09),Y          ; B1 09 | Read graphics status
    ORA $31B2,X          ; 1D B2 31 | Logical OR with accumulator (absolute,X)
    EOR $B2              ; 45 B2 | Exclusive OR with accumulator (zero page)
    EOR $6DB2,Y          ; 59 B2 6D | Exclusive OR with accumulator (absolute,Y)
    STA ($B2,X)          ; 81 B2 | Update graphics data
    LDA #$B2             ; A9 B2 | Read graphics status
    LDA $D1B2,X          ; BD B2 D1 | Read graphics status

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_149
; Address: $D1B688
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_149:
    SBC $B2              ; E5 B2 | Subtract with carry (zero page)
    SBC $0DB2,Y          ; F9 B2 0D | Subtract with carry (absolute,Y)
    AND ($B3,X)          ; 21 B3 | Logical AND with accumulator ((zero page,X))
    EOR #$B3             ; 49 B3 | Exclusive OR with accumulator (immediate)
    EOR $71B3,X          ; 5D B3 71 | Exclusive OR with accumulator (absolute,X)
    STA $B3              ; 85 B3 | Update graphics data
    STA $ADB3,Y          ; 99 B3 AD | Update graphics data
    CMP ($B3,X)          ; C1 B3 | Compare accumulator ((zero page,X))
    SBC #$B3             ; E9 B3 | Subtract with carry (immediate)
    SBC $11B3,X          ; FD B3 11 | Subtract with carry (absolute,X)
    AND $B4              ; 25 B4 | Logical AND with accumulator (zero page)
    AND $4DB4,Y          ; 39 B4 4D | Logical AND with accumulator (absolute,Y)
    ADC ($B4,X)          ; 61 B4 | Add with carry ((zero page,X))
    BIT #$B4             ; 89 B4 | Test bits in accumulator (immediate)
    STA $B1B4,X          ; 9D B4 B1 | Update graphics data
    CMP $B4              ; C5 B4 | Compare accumulator (zero page)
    CMP $EDB4,Y          ; D9 B4 ED | Compare accumulator (absolute,Y)
    ORA ($B5,X)          ; 01 B5 | Logical OR with accumulator ((zero page,X))
    AND #$B5             ; 29 B5 | Logical AND with accumulator (immediate)
    AND $51B5,X          ; 3D B5 51 | Logical AND with accumulator (absolute,X)
    ADC $B5              ; 65 B5 | Add with carry (zero page)
    ADC $8DB5,Y          ; 79 B5 8D | Add with carry (absolute,Y)
    LDA ($B5,X)          ; A1 B5 | Read graphics status
    CMP #$B5             ; C9 B5 | Compare accumulator (immediate)
    CMP $F1B5,X          ; DD B5 F1 | Compare accumulator (absolute,X)
    ASL $260E            ; 0E 0E 26 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    ASL $0B1C            ; 0E 1C 0B | Arithmetic shift left (absolute)
    ASL $030F            ; 0E 0F 03 | Arithmetic shift left (absolute)
    ASL $1414,X          ; 1E 14 14 | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_14A
; Address: $D1B703
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_14A:
    JSR $050D            ; 20 0D 05 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0F13,Y          ; 19 13 0F | Logical OR with accumulator (absolute,Y)
    ASL $0F05,X          ; 1E 05 0F | Arithmetic shift left (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BPL $0A              ; 10 0A | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_14B
; Address: $D1B721
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_14B:
    LSR $0A              ; 46 0A | Logical shift right (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $00              ; 66 00 | Rotate right (zero page)
    ADC $006E,Y          ; 79 6E 00 | Add with carry (absolute,Y)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_14C
; Address: $D1B75E
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_14C:
    ROL $00              ; 26 00 | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $00              ; 26 00 | Rotate left (zero page)
    BVC $48              ; 50 48 | Branch if overflow clear
    ROL $00              ; 26 00 | Rotate left (zero page)
    PHY                  ; 5A | Push Y register to stack
    PHA                  ; 48 | Push accumulator to stack
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    BIT $5500            ; 2C 00 55 | Test bits in accumulator (absolute)
    ROR $5700            ; 6E 00 57 | Rotate right (absolute)
    ROR $0057,X          ; 7E 57 00 | Rotate right (absolute,X)
    ADC $6500,Y          ; 79 00 65 | Add with carry (absolute,Y)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $7600,X          ; 1D 00 76 | Logical OR with accumulator (absolute,X)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ROL $00              ; 26 00 | Rotate left (zero page)
    EOR $002C            ; 4D 2C 00 | Exclusive OR with accumulator (absolute)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_14D
; Address: $D1B7B0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_14D:
    JSL $090000          ; 22 00 00 09 | Jump to subroutine long
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    EOR $0000,Y          ; 59 00 00 | Exclusive OR with accumulator (absolute,Y)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_14E
; Address: $D1B7C9
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_14E:
    SEI                  ; 78 | Set interrupt disable flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ADC #$00             ; 69 00 | Add with carry (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_14F
; Address: $D1B7FD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_14F:
    JSL $0D0D0D          ; 22 0D 0D 0D | Jump to subroutine long
    ORA $0D0D            ; 0D 0D 0D | Logical OR with accumulator (absolute)
    ORA $280D            ; 0D 0D 28 | Logical OR with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_150
; Address: $D1B80D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_150:
    JSL $0D0D0D          ; 22 0D 0D 0D | Jump to subroutine long
    ORA $0D0D            ; 0D 0D 0D | Logical OR with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_152
; Address: $D1B82D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_152:
    JSL $0B0C0C          ; 22 0C 0C 0B | Jump to subroutine long
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    ROL $27              ; 26 27 | Rotate left (zero page)
    ROL $26              ; 26 26 | Rotate left (zero page)
    ROL $26              ; 26 26 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_153
; Address: $D1B83D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_153:
    JSL $0B0B0C          ; 22 0C 0B 0B | Jump to subroutine long
    BMI $2F              ; 30 2F | Branch if negative
    BIT $23              ; 24 23 | Test bits in accumulator (zero page)
    BMI $30              ; 30 30 | Branch if negative
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ORA $1B1A,Y          ; 19 1A 1B | Logical OR with accumulator (absolute,Y)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ORA $1011,X          ; 1D 11 10 | Logical OR with accumulator (absolute,X)
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $1A1A,Y          ; 19 1A 1A | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_154
; Address: $D1B87D
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_154:
    ORA $1111,X          ; 1D 11 11 | Logical OR with accumulator (absolute,X)
    BPL $10              ; 10 10 | Branch if positive
    ORA $2A1A,Y          ; 19 1A 2A | Logical OR with accumulator (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    AND $1D2D            ; 2D 2D 1D | Logical AND with accumulator (absolute)
    ORA $101D,X          ; 1D 1D 10 | Logical OR with accumulator (absolute,X)
    BIT $2D2E            ; 2C 2E 2D | Test bits in accumulator (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $1D1D,X          ; 1D 1D 1D | Logical OR with accumulator (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $2A2A            ; 2E 2A 2A | Rotate left (absolute)
    ASL $1E1E,X          ; 1E 1E 1E | Arithmetic shift left (absolute,X)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $2A2A            ; 2C 2A 2A | Test bits in accumulator (absolute)
    ASL $1E1E,X          ; 1E 1E 1E | Arithmetic shift left (absolute,X)
    ASL $201E,X          ; 1E 1E 20 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_155
; Address: $D1B8C3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_155:
    JSR $0820            ; 20 20 08 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_158
; Address: $D1B8D4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_158:
    JSR $0808            ; 20 08 08 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BIT $2A2A            ; 2C 2A 2A | Test bits in accumulator (absolute)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    AND ($21,X)          ; 21 21 | PPU graphics register access
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_159
; Address: $D1B8E3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_159:
    JSR $0820            ; 20 20 08 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $2C2C            ; 2C 2C 2C | Test bits in accumulator (absolute)
    BIT $2121            ; 2C 21 21 | PPU graphics register access
    AND ($21,X)          ; 21 21 | PPU graphics register access
    AND ($21,X)          ; 21 21 | PPU graphics register access
    AND ($21,X)          ; 21 21 | PPU graphics register access
    AND ($21,X)          ; 21 21 | PPU graphics register access
    AND ($21,X)          ; 21 21 | PPU graphics register access
    BIT $2C2C            ; 2C 2C 2C | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_15A
; Address: $D1B8FC
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_15A:
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    WDM #$3F             ; 42 3F | Reserved instruction
    AND $3939,Y          ; 39 39 39 | Logical AND with accumulator (absolute,Y)
    AND $3C3A,Y          ; 39 3A 3C | Logical AND with accumulator (absolute,Y)
    AND $3D3D,X          ; 3D 3D 3D | Logical AND with accumulator (absolute,X)
    AND $3939,Y          ; 39 39 39 | Logical AND with accumulator (absolute,Y)
    AND $3A3A,Y          ; 39 3A 3A | Logical AND with accumulator (absolute,Y)
    AND $3D3D,X          ; 3D 3D 3D | Logical AND with accumulator (absolute,X)
    AND $3939,Y          ; 39 39 39 | Logical AND with accumulator (absolute,Y)
    AND $3C3A,Y          ; 39 3A 3C | Logical AND with accumulator (absolute,Y)
    AND $3D3D,X          ; 3D 3D 3D | Logical AND with accumulator (absolute,X)
    AND $3939,Y          ; 39 39 39 | Logical AND with accumulator (absolute,Y)
    AND $3C3A,Y          ; 39 3A 3C | Logical AND with accumulator (absolute,Y)
    AND $3D3D,X          ; 3D 3D 3D | Logical AND with accumulator (absolute,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_15B
; Address: $D1BCF2
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_15B:
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    INY                  ; C8 | Increment Y register
    SBC $0DB7,X          ; FD B7 0D | Subtract with carry (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    ORA $2DB8,X          ; 1D B8 2D | Logical OR with accumulator (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    AND $4DB8,X          ; 3D B8 4D | Logical AND with accumulator (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    EOR $6DB8,X          ; 5D B8 6D | Exclusive OR with accumulator (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    ADC $8DB8,X          ; 7D B8 8D | Add with carry (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    STA $ADB8,X          ; 9D B8 AD | Update graphics data
    CLV                  ; B8 | Clear overflow flag
    LDA $CDB8,X          ; BD B8 CD | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    CMP $EDB8,X          ; DD B8 ED | Compare accumulator (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    SBC $0DB8,X          ; FD B8 0D | Subtract with carry (absolute,X)
    LDA $B91D,Y          ; B9 1D B9 | Read graphics status
    AND $3DB9            ; 2D B9 3D | Logical AND with accumulator (absolute)
    LDA $B94D,Y          ; B9 4D B9 | Read graphics status
    EOR $6DB9,X          ; 5D B9 6D | Exclusive OR with accumulator (absolute,X)
    LDA $B97D,Y          ; B9 7D B9 | Read graphics status
    STA $9DB9            ; 8D B9 9D | Update graphics data
    LDA $B9AD,Y          ; B9 AD B9 | Read graphics status
    LDA $CDB9,X          ; BD B9 CD | Read graphics status
    LDA $B9DD,Y          ; B9 DD B9 | Read graphics status
    SBC $FDB9            ; ED B9 FD | Subtract with carry (absolute)
    LDA $BA0D,Y          ; B9 0D BA | Read graphics status
    ORA $2DBA,X          ; 1D BA 2D | Logical OR with accumulator (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    AND $4DBA,X          ; 3D BA 4D | Logical AND with accumulator (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $6DBA,X          ; 5D BA 6D | Exclusive OR with accumulator (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    ADC $8DBA,X          ; 7D BA 8D | Add with carry (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    STA $ADBA,X          ; 9D BA AD | Update graphics data
    TSX                  ; BA | Transfer stack pointer to X register
    LDA $CDBA,X          ; BD BA CD | Read graphics status
    TSX                  ; BA | Transfer stack pointer to X register
    CMP $EDBA,X          ; DD BA ED | Compare accumulator (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    SBC $0DBA,X          ; FD BA 0D | Subtract with carry (absolute,X)
    ORA $2DBB,X          ; 1D BB 2D | Logical OR with accumulator (absolute,X)
    AND $4DBB,X          ; 3D BB 4D | Logical AND with accumulator (absolute,X)
    EOR $6DBB,X          ; 5D BB 6D | Exclusive OR with accumulator (absolute,X)
    ADC $8DBB,X          ; 7D BB 8D | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_15C
; Address: $D1BE72
; Size: 128 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_15C:
    STA $ADBB,X          ; 9D BB AD | Update graphics data
    LDA $CDBB,X          ; BD BB CD | Read graphics status
    CMP $EDBB,X          ; DD BB ED | Compare accumulator (absolute,X)
    SBC $0DBB,X          ; FD BB 0D | Subtract with carry (absolute,X)
    LDY $BC1D,X          ; BC 1D BC | Load from absolute,X into Y register
    AND $3DBC            ; 2D BC 3D | Logical AND with accumulator (absolute)
    LDY $BC4D,X          ; BC 4D BC | Load from absolute,X into Y register
    EOR $6DBC,X          ; 5D BC 6D | Exclusive OR with accumulator (absolute,X)
    LDY $BC7D,X          ; BC 7D BC | Load from absolute,X into Y register
    STA $9DBC            ; 8D BC 9D | Update graphics data
    LDY $BCAD,X          ; BC AD BC | Load from absolute,X into Y register
    LDA $CDBC,X          ; BD BC CD | Read graphics status
    LDY $BCDD,X          ; BC DD BC | Load from absolute,X into Y register
    SBC $FDBC            ; ED BC FD | Subtract with carry (absolute)
    LDY $BD0D,X          ; BC 0D BD | Load from absolute,X into Y register
    ORA $2DBD,X          ; 1D BD 2D | Logical OR with accumulator (absolute,X)
    LDA $BD3D,X          ; BD 3D BD | Read graphics status
    EOR $5DBD            ; 4D BD 5D | Exclusive OR with accumulator (absolute)
    LDA $BD6D,X          ; BD 6D BD | Read graphics status
    ADC $8DBD,X          ; 7D BD 8D | Add with carry (absolute,X)
    LDA $BD9D,X          ; BD 9D BD | Read graphics status
    LDA $BDBD            ; AD BD BD | Read graphics status
    LDA $BDCD,X          ; BD CD BD | Read graphics status
    CMP $EDBD,X          ; DD BD ED | Compare accumulator (absolute,X)
    LDA $0001,X          ; BD 01 00 | Read graphics status
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $01              ; 80 01 | Branch always
    BRA $01              ; 80 01 | Branch always
    CPY $0601            ; CC 01 06 | Compare Y register (absolute)
    CPY $0401            ; CC 01 04 | Compare Y register (absolute)
    BRA $02              ; 80 02 | Branch always
    ROR $00              ; 66 00 | Rotate right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BRA $01              ; 80 01 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $01              ; 80 01 | Branch always
    ORA #$CC             ; 09 CC | Logical OR with accumulator (immediate)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    CPY $0B01            ; CC 01 0B | Compare Y register (absolute)
    BRA $02              ; 80 02 | Branch always
    ORA $0066            ; 0D 66 00 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_15D
; Address: $D1BF05
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_15D:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $01              ; 80 01 | Branch always
    BRA $01              ; 80 01 | Branch always
    CPY $0001            ; CC 01 00 | Compare Y register (absolute)
    CPY $0001            ; CC 01 00 | Compare Y register (absolute)
    BRA $02              ; 80 02 | Branch always
    ROR $00              ; 66 00 | Rotate right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($C8,X)          ; 01 C8 | Logical OR with accumulator ((zero page,X))
    LDX $C1BE,Y          ; BE BE C1 | Load from absolute,Y into X register
    LDX $BEC4,Y          ; BE C4 BE | Load from absolute,Y into X register
    LDX $BECA,Y          ; BE CA BE | Load from absolute,Y into X register
    CMP $D0BE            ; CD BE D0 | Compare accumulator (absolute)
    LDX $BED3,Y          ; BE D3 BE | Load from absolute,Y into X register
    LDX $BED9,Y          ; BE D9 BE | Load from absolute,Y into X register
    LDX $BEDF,Y          ; BE DF BE | Load from absolute,Y into X register
    SEP #$BE             ; E2 BE | Set processor status bits
    SBC $BE              ; E5 BE | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_15E
; Address: $D1BF9B
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_15E:
    INX                  ; E8 | Increment X register
    LDX $BEEB,Y          ; BE EB BE | Load from absolute,Y into X register
    INC $F1BE            ; EE BE F1 | Increment (absolute)
    LDX $BEF4,Y          ; BE F4 BE | Load from absolute,Y into X register
    LDX $BEFA,Y          ; BE FA BE | Load from absolute,Y into X register
    SBC $00BE,X          ; FD BE 00 | Subtract with carry (absolute,X)
    LDA                  ; BF 03 BF 06 | Read graphics status
    LDA                  ; BF 09 BF 0C | Read graphics status
    LDA                  ; BF 0F BF 12 | Read graphics status
    LDA                  ; BF 15 BF 18 | Read graphics status
    LDA                  ; BF 1B BF 1E | Read graphics status
    LDA                  ; BF 21 BF 24 | Read graphics status
    LDA                  ; BF 27 BF 2A | Read graphics status
    LDA                  ; BF 2D BF 30 | Read graphics status
    LDA                  ; BF 33 BF 36 | Read graphics status
    LDA                  ; BF 39 BF 3C | Read graphics status
    LDA                  ; BF 3F BF 42 | Read graphics status
    LDA                  ; BF 45 BF 48 | Read graphics status
    LDA                  ; BF 4B BF 4E | Read graphics status
    LDA                  ; BF 51 BF 54 | Read graphics status
    LDA                  ; BF 57 BF 5A | Read graphics status
    LDA                  ; BF 5D BF 60 | Read graphics status
    LDA                  ; BF 63 BF 66 | Read graphics status
    LDA                  ; BF 69 BF 6C | Read graphics status
    LDA                  ; BF 6F BF 72 | Read graphics status
    LDA                  ; BF 75 BF 78 | Read graphics status
    LDA                  ; BF 7B BF E6 | Read graphics status
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    JMP ($AF02)          ; 6C 02 AF | Jump to address (absolute indirect)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_15F
; Address: $D1C00F
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_15F:
    JSR $3F00            ; 20 00 3F | Jump to subroutine
    INC $4103,X          ; FE 03 41 | Increment (absolute,X)
    STY $04              ; 84 04 | Store Y register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $4D              ; 05 4D | Logical OR with accumulator (zero page)
    ORA $90              ; 05 90 | Logical OR with accumulator (zero page)
    ORA $D3              ; 05 D3 | Logical OR with accumulator (zero page)
    ORA $40              ; 05 40 | Logical OR with accumulator (zero page)
    ASL $59              ; 06 59 | Arithmetic shift left (zero page)
    ASL $9C              ; 06 9C | Arithmetic shift left (zero page)
    ASL $DF              ; 06 DF | Arithmetic shift left (zero page)
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    ADC $07              ; 65 07 | Add with carry (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    XBA                  ; EB | Exchange accumulator bytes
    BRA $00              ; 80 00 | Branch always
    ROL $3508            ; 2E 08 35 | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_160
; Address: $D1C043
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_160:
    LSR                  ; 4A | Logical shift right (accumulator)
    PHP                  ; 08 | Push processor status to stack
    EOR ($08),Y          ; 51 08 | Exclusive OR with accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ROR $08              ; 66 08 | Rotate right (zero page)
    ADC $7408            ; 6D 08 74 | Add with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT #$08             ; 89 08 | Test bits in accumulator (immediate)
    BCC $08              ; 90 08 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    STZ $A508,X          ; 9E 08 A5 | Store zero to absolute,X
    PHP                  ; 08 | Push processor status to stack
    LDY $B308            ; AC 08 B3 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    TSX                  ; BA | Transfer stack pointer to X register
    PHP                  ; 08 | Push processor status to stack
    CMP ($08,X)          ; C1 08 | Compare accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CMP $E408,X          ; DD 08 E4 | Compare accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $0008,Y          ; F9 08 00 | Subtract with carry (absolute,Y)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    TXA                  ; 8A | Transfer X register to accumulator
    STA ($0B),Y          ; 91 0B | Update graphics data
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F 0B A6 0B | Update graphics data
    LDA $B40B            ; AD 0B B4 | Read graphics status
    ASL $9109            ; 0E 09 91 | Arithmetic shift left (absolute)
    ORA #$14             ; 09 14 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $9109            ; 0E 09 91 | Arithmetic shift left (absolute)
    ORA #$14             ; 09 14 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_161
; Address: $D1C0B2
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_161:
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND ($0B,X)          ; 21 0B | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    AND $440B,X          ; 3D 0B 44 | Logical AND with accumulator (absolute,X)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($52,X)          ; 01 52 | Logical OR with accumulator ((zero page,X))
    EOR $600B,Y          ; 59 0B 60 | Exclusive OR with accumulator (absolute,Y)
    ROR $750B            ; 6E 0B 75 | Rotate right (absolute)
    ORA ($C2,X)          ; 01 C2 | Logical OR with accumulator ((zero page,X))
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BNE $0B              ; D0 0B | Branch if not equal
    DEC $E50B,X          ; DE 0B E5 | Decrement (absolute,X)
    CPX $F30B            ; EC 0B F3 | Compare X register (absolute)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $240C,X          ; 1D 0C 24 | Logical OR with accumulator (absolute,X)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    AND $320C,Y          ; 39 0C 32 | Logical AND with accumulator (absolute,Y)
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ADC $4008            ; 6D 08 40 | Add with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    ROR $08              ; 66 08 | Rotate right (zero page)
    CPY $0C              ; C4 0C | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT #$08             ; 89 08 | Test bits in accumulator (immediate)
    BCC $08              ; 90 08 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    ROR $08              ; 66 08 | Rotate right (zero page)
    PHP                  ; 08 | Push processor status to stack
    STA $820C,Y          ; 99 0C 82 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    BIT #$08             ; 89 08 | Test bits in accumulator (immediate)
    BCC $08              ; 90 08 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    ASL $310D            ; 0E 0D 31 | Arithmetic shift left (absolute)
    ORA $0D58            ; 0D 58 0D | Logical OR with accumulator (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack
    BIT #$08             ; 89 08 | Test bits in accumulator (immediate)
    BCC $08              ; 90 08 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    LDX #$0D             ; A2 0D | Load immediate value into X register
    CMP $0D              ; C5 0D | Compare accumulator (zero page)
    INX                  ; E8 | Increment X register
    ORA $0E0B            ; 0D 0B 0E | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_162
; Address: $D1C184
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_162:
    PHP                  ; 08 | Push processor status to stack
    BIT #$08             ; 89 08 | Test bits in accumulator (immediate)
    BCC $08              ; 90 08 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    ASL $0EFE            ; 0E FE 0E | Arithmetic shift left (absolute)
    ORA $480F,Y          ; 19 0F 48 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BIT #$08             ; 89 08 | Test bits in accumulator (immediate)
    BCC $08              ; 90 08 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BPL $6D              ; 10 6D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT #$08             ; 89 08 | Test bits in accumulator (immediate)
    BCC $08              ; 90 08 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SBC ($20),Y          ; F1 20 | Subtract with carry ((zero page),Y)
    BPL $21              ; 10 21 | PPU graphics register access
    AND ($4E,X)          ; 21 4E | Logical AND with accumulator ((zero page,X))
    AND ($F1,X)          ; 21 F1 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_163
; Address: $D1C1D4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_163:
    JSR $20F1            ; 20 F1 20 | Jump to subroutine
    SBC ($20),Y          ; F1 20 | Subtract with carry ((zero page),Y)
    SBC ($20),Y          ; F1 20 | Subtract with carry ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    PLX                  ; FA | Pull X register from stack
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    JMP $050170          ; 5C 70 01 05 | Jump to address long
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_164
; Address: $D1C20F
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_164:
    RTI                  ; 40 | Return from interrupt
    CPY #$5B             ; C0 5B | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA ($92),Y          ; B1 92 | Read graphics status
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    BIT #$28             ; 89 28 | Test bits in accumulator (immediate)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    BRA $36              ; 80 36 | Branch always
    ADC ($80,X)          ; 61 80 | Add with carry ((zero page,X))
    EOR $0166,Y          ; 59 66 01 | Exclusive OR with accumulator (absolute,Y)
    ORA ($D1,X)          ; 01 D1 | Logical OR with accumulator ((zero page,X))
    STA ($8E),Y          ; 91 8E | Update graphics data
    BCC $C0              ; 90 C0 | Branch if carry clear
    EOR $0167,Y          ; 59 67 01 | Exclusive OR with accumulator (absolute,Y)
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    WDM #$5E             ; 42 5E | Reserved instruction
    PLY                  ; 7A | Pull Y register from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$C5             ; C0 C5 | Compare Y register (immediate)
    STZ $4130,X          ; 9E 30 41 | Store zero to absolute,X
    JMP $010172          ; 5C 72 01 01 | Jump to address long
    PLX                  ; FA | Pull X register from stack
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $00              ; B0 00 | Branch if carry set
    PHY                  ; 5A | Push Y register to stack
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    ASL $C0              ; 06 C0 | Arithmetic shift left (zero page)
    PHY                  ; 5A | Push Y register to stack
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_165
; Address: $D1C263
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_165:
    JSR $1346            ; 20 46 13 | Jump to subroutine
    TXS                  ; 9A | Transfer X register to stack pointer
    BNE $40              ; D0 40 | Branch if not equal
    PHY                  ; 5A | Push Y register to stack
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    AND $C138,Y          ; 39 38 C1 | Logical AND with accumulator (absolute,Y)
    LSR $5A              ; 46 5A | Logical shift right (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_166
; Address: $D1C278
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_166:
    INC $07F8,X          ; FE F8 07 | Increment (absolute,X)
    STZ $40E0            ; 9C E0 40 | Store zero to absolute
    PHY                  ; 5A | Push Y register to stack
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $0009,Y          ; B9 09 00 | Read graphics status
    LDA ($46),Y          ; B1 46 | Read graphics status
    PHY                  ; 5A | Push Y register to stack
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA #$CE             ; A9 CE | Read graphics status
    SBC ($C0),Y          ; F1 C0 | Subtract with carry ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack
    JMP ($0101)          ; 6C 01 01 | Jump to address (absolute indirect)
    STA                  ; 9F 01 0D 00 | Update graphics data
    BPL $41              ; 10 41 | Branch if positive
    ADC $0101            ; 6D 01 01 | Add with carry (absolute)
    LDY $29              ; A4 29 | Load from zero page into Y register
    ORA $4600            ; 0D 00 46 | Logical OR with accumulator (absolute)
    CMP ($87,X)          ; C1 87 | Compare accumulator ((zero page,X))
    ADC $01B7            ; 6D B7 01 | Add with carry (absolute)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    CPY #$39             ; C0 39 | Compare Y register (immediate)
    DEC $8121            ; CE 21 81 | Decrement (absolute)
    ROR $0101            ; 6E 01 01 | Rotate right (absolute)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BEQ $C5              ; F0 C5 | Branch if equal
    ADC #$A7             ; 69 A7 | Add with carry (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    BPL $C0              ; 10 C0 | Branch if positive
    ORA $0100            ; 0D 00 01 | Logical OR with accumulator (absolute)
    ORA $4060            ; 0D 60 40 | Logical OR with accumulator (absolute)
    AND ($80,X)          ; 21 80 | Logical AND with accumulator ((zero page,X))
    ORA ($B7,X)          ; 01 B7 | Logical OR with accumulator ((zero page,X))
    CPY #$C5             ; C0 C5 | Compare Y register (immediate)
    STZ $4130,X          ; 9E 30 41 | Store zero to absolute,X
    JMP $010172          ; 5C 72 01 01 | Jump to address long
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    EOR ($5C,X)          ; 41 5C | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $0008,Y          ; 19 08 00 | Logical OR with accumulator (absolute,Y)
    LDY #$50             ; A0 50 | Load immediate value into Y register
    EOR ($5C,X)          ; 41 5C | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_167
; Address: $D1C300
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_167:
    LDX #$60             ; A2 60 | Load immediate value into X register
    EOR ($5C,X)          ; 41 5C | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    LDY $70              ; A4 70 | Load from zero page into Y register
    EOR ($5C,X)          ; 41 5C | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    EOR #$08             ; 49 08 | Exclusive OR with accumulator (immediate)
    LDX $80              ; A6 80 | Load from zero page into X register
    EOR ($5C,X)          ; 41 5C | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $05D0,Y          ; B9 D0 05 | Read graphics status
    ORA ($BB,X)          ; 01 BB | Logical OR with accumulator ((zero page,X))
    CPX #$05             ; E0 05 | Compare X register (immediate)
    ORA ($D6,X)          ; 01 D6 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    BCC $C1              ; 90 C1 | Branch if carry clear
    JMP $010174          ; 5C 74 01 01 | Jump to address long
    ORA $000B,Y          ; 19 0B 00 | Logical OR with accumulator (absolute,Y)
    TAX                  ; AA | Transfer accumulator to X register
    LDY #$C1             ; A0 C1 | Load immediate value into Y register
    ADC #$A8             ; 69 A8 | Add with carry (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STZ $29              ; 64 29 | Store zero to zero page
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BCS $81              ; B0 81 | Branch if carry set
    EOR $0176,X          ; 5D 76 01 | Exclusive OR with accumulator (absolute,X)
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))
    AND $000B,Y          ; 39 0B 00 | Logical AND with accumulator (absolute,Y)
    CPY #$41             ; C0 41 | Compare Y register (immediate)
    EOR $0175,X          ; 5D 75 01 | Exclusive OR with accumulator (absolute,X)
    ORA ($D8,X)          ; 01 D8 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($DA,X)          ; 01 DA | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    LDY $C1D0            ; AC D0 C1 | Load from absolute address into Y register
    EOR $0178,X          ; 5D 78 01 | Exclusive OR with accumulator (absolute,X)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    LDX $C1E0            ; AE E0 C1 | Load from absolute address into X register
    EOR $0178,X          ; 5D 78 01 | Exclusive OR with accumulator (absolute,X)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_168
; Address: $D1C38C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_168:
    CLD                  ; D8 | Clear decimal mode flag
    BCS $F0              ; B0 F0 | Branch if carry set
    CMP ($5D,X)          ; C1 5D | Compare accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_16A
; Address: $D1C39B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_16A:
    JSR $5DC2            ; 20 C2 5D | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    REP #$5D             ; C2 5D | Reset processor status bits
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_16B
; Address: $D1C3AC
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_16B:
    JSR $0108            ; 20 08 01 | Jump to subroutine
    BMI $42              ; 30 42 | Hardware register operation
    LSR $017A,X          ; 5E 7A 01 | Logical shift right (absolute,X)
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    WDM #$5E             ; 42 5E | Reserved instruction
    PLY                  ; 7A | Pull Y register from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    BVC $42              ; 50 42 | Hardware register operation
    LSR $017A,X          ; 5E 7A 01 | Logical shift right (absolute,X)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BPL $C2              ; 10 C2 | Branch if positive
    EOR $0178,X          ; 5D 78 01 | Exclusive OR with accumulator (absolute,X)
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_16C
; Address: $D1C3DE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_16C:
    REP #$5D             ; C2 5D | Reset processor status bits
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA $30              ; 85 30 | Update graphics data
    LDY $C270,X          ; BC 70 C2 | Load from absolute,X into Y register
    LSR $017C,X          ; 5E 7C 01 | Logical shift right (absolute,X)
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $C2              ; 80 C2 | Branch always
    LSR $017C,X          ; 5E 7C 01 | Logical shift right (absolute,X)
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_16D
; Address: $D1C3FA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_16D:
    BVC $04              ; 50 04 | Branch if overflow clear
    LDX $C290,Y          ; BE 90 C2 | Load from absolute,Y into X register
    LSR $017C,X          ; 5E 7C 01 | Logical shift right (absolute,X)
    ORA ($8B,X)          ; 01 8B | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_16E
; Address: $D1C408
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_16E:
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    REP #$5E             ; C2 5E | Reset processor status bits
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA $0470            ; 8D 70 04 | Update graphics data
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    BRA $04              ; 80 04 | Branch always
    ORA ($58,X)          ; 01 58 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    WDM #$18             ; 42 18 | Reserved instruction
    REP #$B0             ; C2 B0 | Reset processor status bits
    WDM #$5F             ; 42 5F | Reserved instruction
    ROR $0101,X          ; 7E 01 01 | Rotate right (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$42             ; C0 42 | Hardware register operation
    ROR $0101,X          ; 7E 01 01 | Rotate right (absolute,X)
    JMP $0002E8          ; 5C E8 02 00 | Jump to address long
    CPY $D0              ; C4 D0 | Compare Y register (zero page)
    WDM #$5F             ; 42 5F | Reserved instruction
    ROR $0101,X          ; 7E 01 01 | Rotate right (absolute,X)
    LSR $02F8,X          ; 5E F8 02 | Logical shift right (absolute,X)
    DEC $00              ; C6 00 | Decrement (zero page)
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($64,X)          ; 01 64 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    CPX #$C2             ; E0 C2 | Compare X register (immediate)
    BRA $01              ; 80 01 | Branch always
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $C2              ; F0 C2 | Branch if equal
    BRA $01              ; 80 01 | Branch always
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    DEC $4300            ; CE 00 43 | Decrement (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_16F
; Address: $D1C490
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_16F:
    BRA $01              ; 80 01 | Branch always
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY $C310            ; CC 10 C3 | Compare Y register (absolute)
    BRA $01              ; 80 01 | Branch always
    ORA ($34,X)          ; 01 34 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $00              ; D0 00 | Branch if not equal
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($C8,X)          ; 01 C8 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    STX $1A              ; 86 1A | Store X register to zero page

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_170
; Address: $D1C4B9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_170:
    JSR $6083            ; 20 83 60 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR $0008,Y          ; 59 08 00 | Exclusive OR with accumulator (absolute,Y)
    BMI $83              ; 30 83 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_171
; Address: $D1C4C8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_171:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    JMP $0268            ; 4C 68 02 | Jump to address
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    ADC ($85,X)          ; 61 85 | Add with carry ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    EOR $000B,Y          ; 59 0B 00 | Exclusive OR with accumulator (absolute,Y)
    BVC $03              ; 50 03 | Branch if overflow clear
    ADC ($85,X)          ; 61 85 | Add with carry ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    EOR #$0B             ; 49 0B | Exclusive OR with accumulator (immediate)
    PHX                  ; DA | Push X register to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_172
; Address: $D1C4E7
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_172:
    ADC ($85,X)          ; 61 85 | Add with carry ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LSR $8278            ; 4E 78 82 | Logical shift right (absolute)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    BVS $83              ; 70 83 | Branch if overflow set
    ADC ($86,X)          ; 61 86 | Add with carry ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVC $88              ; 50 88 | Branch if overflow clear
    ORA ($52,X)          ; 01 52 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_173
; Address: $D1C518
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_173:
    CLV                  ; B8 | Clear overflow flag
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    DEC $C380,X          ; DE 80 C3 | Decrement (absolute,X)
    ADC ($88,X)          ; 61 88 | Add with carry ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    PHA                  ; 48 | Push accumulator to stack
    CPX #$90             ; E0 90 | Compare X register (immediate)
    ADC ($88,X)          ; 61 88 | Add with carry ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    CLI                  ; 58 | Clear interrupt disable flag
    SEP #$A0             ; E2 A0 | Set processor status bits
    ADC ($88,X)          ; 61 88 | Add with carry ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX $0768            ; EC 68 07 | Compare X register (absolute)
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    CPX $00              ; E4 00 | Compare X register (zero page)
    ORA ($F2,X)          ; 01 F2 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $00              ; E6 00 | Increment (zero page)
    ORA ($F4,X)          ; 01 F4 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    BCS $43              ; B0 43 | Branch if carry set
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    CPY #$43             ; C0 43 | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    BNE $43              ; D0 43 | Branch if not equal
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $4FF9,X          ; FE F9 4F | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    REP #$E1             ; C2 E1 | Reset processor status bits
    JMP $6C0102          ; 5C 02 01 6C | Jump to address long
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_174
; Address: $D1C5B5
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_174:
    NOP                  ; EA | No operation
    ORA ($6E,X)          ; 01 6E | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($74,X)          ; 01 74 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    CPX #$C3             ; E0 C3 | Compare X register (immediate)
    STY $0101            ; 8C 01 01 | Store Y register to absolute address
    CLV                  ; B8 | Clear overflow flag
    BEQ $C3              ; F0 C3 | Branch if equal
    STY $0101            ; 8C 01 01 | Store Y register to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    INC $C400            ; EE 00 C4 | Increment (absolute)
    STY $0101            ; 8C 01 01 | Store Y register to absolute address
    PLY                  ; 7A | Pull Y register from stack
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BPL $44              ; 10 44 | Branch if positive
    STA $0101            ; 8D 01 01 | Update graphics data
    PLX                  ; FA | Pull X register from stack
    CMP $37CF,Y          ; D9 CF 37 | Compare accumulator (absolute,Y)
    LDX $D3C1,Y          ; BE C1 D3 | Load from absolute,Y into X register
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($5A,X)          ; 01 5A | Logical OR with accumulator ((zero page,X))
    CMP $1E0A,Y          ; D9 0A 1E | Compare accumulator (absolute,Y)
    BEQ $20              ; F0 20 | Branch if equal
    STY $63              ; 84 63 | Store Y register to zero page
    STA $5C0101          ; 8F 01 01 5C | Update graphics data
    SBC #$4A             ; E9 4A | Subtract with carry (immediate)
    ASL $30F2,X          ; 1E F2 30 | Arithmetic shift left (absolute,X)
    STY $63              ; 84 63 | Store Y register to zero page
    STA $5E0101          ; 8F 01 01 5E | Update graphics data
    SBC $000A,Y          ; F9 0A 00 | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    STY $63              ; 84 63 | Store Y register to zero page
    STA $600101          ; 8F 01 01 60 | Update graphics data
    ORA #$8B             ; 09 8B | Logical OR with accumulator (immediate)
    ASL $50F4,X          ; 1E F4 50 | Arithmetic shift left (absolute,X)
    STY $63              ; 84 63 | Store Y register to zero page
    STA $0C0101          ; 8F 01 01 0C | Update graphics data
    ADC #$08             ; 69 08 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_176
; Address: $D1C65D
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_176:
    STZ $91              ; 64 91 | Store zero to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0879            ; 0E 79 08 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    BVS $04              ; 70 04 | Branch if overflow set
    STZ $91              ; 64 91 | Store zero to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $89              ; 10 89 | Branch if positive
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    PLX                  ; FA | Pull X register from stack
    BRA $04              ; 80 04 | Branch always
    STZ $91              ; 64 91 | Store zero to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA $0008,Y          ; 99 08 00 | Update graphics data
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    LDA #$08             ; A9 08 | Read graphics status
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    LDA $0008,Y          ; B9 08 00 | Read graphics status
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_177
; Address: $D1C6A4
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_177:
    JSR $3944            ; 20 44 39 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    STA ($84),Y          ; 91 84 | Update graphics data
    STZ $93              ; 64 93 | Store zero to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($90),Y          ; 91 90 | Update graphics data
    CPY $35              ; C4 35 | Compare Y register (zero page)
    LDX $04A1            ; AE A1 04 | Load from absolute address into X register
    ADC $95              ; 65 95 | Add with carry (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDY #$C4             ; A0 C4 | Load immediate value into Y register
    LDX $04B1            ; AE B1 04 | Load from absolute address into X register
    ADC $95              ; 65 95 | Add with carry (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BCS $44              ; B0 44 | Branch if carry set
    ASL $32              ; 06 32 | Arithmetic shift left (zero page)
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    ADC $96              ; 65 96 | Add with carry (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    CMP $2008,Y          ; D9 08 20 | Compare accumulator (absolute,Y)
    CMP ($C4),Y          ; D1 C4 | Compare accumulator ((zero page),Y)
    ADC $98              ; 65 98 | Add with carry (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_17A
; Address: $D1C6E0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_17A:
    CPY $65              ; C4 65 | Compare Y register (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC #$48             ; E9 48 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_17B
; Address: $D1C6E8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_17B:
    JSR $F102            ; 20 02 F1 | Jump to subroutine
    CPY $65              ; C4 65 | Compare Y register (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $08F9,X          ; 1E F9 08 | Arithmetic shift left (absolute,X)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    CMP $65              ; C5 65 | Compare accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_17C
; Address: $D1C6FB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_17C:
    JSL $000919          ; 22 19 09 00 | Jump to subroutine long
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    AND #$09             ; 29 09 | Logical AND with accumulator (immediate)
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    AND $0009,Y          ; 39 09 00 | Logical AND with accumulator (absolute,Y)
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    BVC $85              ; 50 85 | Branch if overflow clear
    AND $1108,Y          ; 39 08 11 | Logical AND with accumulator (absolute,Y)
    EOR $66              ; 45 66 | Exclusive OR with accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_17D
; Address: $D1C729
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_17D:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($C5,X)          ; 21 C5 | Logical AND with accumulator ((zero page,X))
    ROR $9C              ; 66 9C | Rotate right (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    STA ($21,X)          ; 81 21 | PPU graphics register access
    AND ($45),Y          ; 31 45 | Logical AND with accumulator ((zero page),Y)
    STA $0101,X          ; 9D 01 01 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    CMP #$8F             ; C9 8F | Compare accumulator (immediate)
    LDY $53B1,X          ; BC B1 53 | Load from absolute,X into Y register
    ORA ($97,X)          ; 01 97 | Logical OR with accumulator ((zero page,X))
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    AND ($0E,X)          ; 21 0E | Logical AND with accumulator ((zero page,X))
    EOR ($85,X)          ; 41 85 | Exclusive OR with accumulator ((zero page,X))
    STA                  ; 9F 01 01 99 | Update graphics data
    BNE $84              ; D0 84 | Branch if not equal
    ASL $34              ; 06 34 | Arithmetic shift left (zero page)
    BVC $05              ; 50 05 | Branch if overflow clear
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    ORA ($9B,X)          ; 01 9B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_17E
; Address: $D1C75F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_17E:
    CPX #$C4             ; E0 C4 | Compare X register (immediate)
    ASL $36              ; 06 36 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_17F
; Address: $D1C764
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_17F:
    ORA $68              ; 05 68 | Logical OR with accumulator (zero page)
    LDY #$01             ; A0 01 | Load immediate value into Y register
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    BEQ $04              ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_180
; Address: $D1C76C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_180:
    JSL $000110          ; 22 10 01 00 | Jump to subroutine long
    ORA ($9F,X)          ; 01 9F | Logical OR with accumulator ((zero page,X))
    EOR $22              ; 45 22 | Exclusive OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    BPL $85              ; 10 85 | Branch if positive
    BVS $45              ; 70 45 | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    LDX #$01             ; A2 01 | Load immediate value into X register
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_181
; Address: $D1C78B
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_181:
    JSR $23C5            ; 20 C5 23 | Jump to subroutine
    ASL $4581,X          ; 1E 81 45 | Arithmetic shift left (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    LDX #$01             ; A2 01 | Load immediate value into X register
    ORA ($A5,X)          ; 01 A5 | Logical OR with accumulator ((zero page,X))
    BMI $05              ; 30 05 | Branch if negative
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    STA ($45),Y          ; 91 45 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    LDX #$01             ; A2 01 | Load immediate value into X register
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    SBC #$0F             ; E9 0F | Subtract with carry (immediate)
    SEC                  ; 38 | Set carry flag
    CPY #$D1             ; C0 D1 | Compare Y register (immediate)
    PHY                  ; 5A | Push Y register to stack
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    STA ($22,X)          ; 81 22 | Update graphics data
    LDA ($C5,X)          ; A1 C5 | Read graphics status
    PLA                  ; 68 | Pull accumulator from stack
    LDY $01              ; A4 01 | Load from zero page into Y register
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($C5),Y          ; B1 C5 | Read graphics status
    PLA                  ; 68 | Pull accumulator from stack
    LDY $01              ; A4 01 | Load from zero page into Y register
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))
    BVS $05              ; 70 05 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CMP ($45,X)          ; C1 45 | Compare accumulator ((zero page,X))
    ADC #$A6             ; 69 A6 | Add with carry (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_182
; Address: $D1C7CC
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_182:
    LDA $000580          ; AF 80 05 00 | Read graphics status
    INC                  ; 1A | Increment accumulator
    CMP ($45),Y          ; D1 45 | Compare accumulator ((zero page),Y)
    ADC #$A6             ; 69 A6 | Add with carry (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $374F,Y          ; B9 4F 37 | Read graphics status
    TSX                  ; BA | Transfer stack pointer to X register
    LDA ($D3,X)          ; A1 D3 | Read graphics status
    ORA ($B1,X)          ; 01 B1 | Logical OR with accumulator ((zero page,X))
    BCC $45              ; 90 45 | Branch if carry clear
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    SBC ($C5,X)          ; E1 C5 | Subtract with carry ((zero page,X))
    ADC #$A8             ; 69 A8 | Add with carry (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    EOR #$09             ; 49 09 | Exclusive OR with accumulator (immediate)
    BIT $F1              ; 24 F1 | Test bits in accumulator (zero page)
    CMP $69              ; C5 69 | Compare accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    EOR $0009,Y          ; 59 09 00 | Exclusive OR with accumulator (absolute,Y)
    DEC $69              ; C6 69 | Decrement (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BIT $0969            ; 2C 69 09 | Test bits in accumulator (absolute)
    ROL $11              ; 26 11 | Rotate left (zero page)
    DEC $69              ; C6 69 | Decrement (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $0979            ; 2E 79 09 | Rotate left (absolute)
    PLP                  ; 28 | Pull processor status from stack
    AND ($C6,X)          ; 21 C6 | Logical AND with accumulator ((zero page,X))
    ADC #$A8             ; 69 A8 | Add with carry (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BMI $89              ; 30 89 | Branch if negative
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    AND ($C6),Y          ; 31 C6 | Logical AND with accumulator ((zero page),Y)
    ADC #$A8             ; 69 A8 | Add with carry (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA $0009,Y          ; 99 09 00 | Update graphics data
    BIT $C641            ; 2C 41 C6 | Test bits in accumulator (absolute)
    ADC #$A8             ; 69 A8 | Add with carry (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA #$09             ; A9 09 | Read graphics status
    BVC $C6              ; 50 C6 | Branch if overflow clear
    ADC #$A8             ; 69 A8 | Add with carry (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    JMP ($0B69)          ; 6C 69 0B | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_183
; Address: $D1C83E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_183:
    ROL $4661            ; 2E 61 46 | Rotate left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR $0B79            ; 6E 79 0B | Rotate right (absolute)
    BMI $71              ; 30 71 | Branch if negative
    STX $6A              ; 86 6A | Store X register to zero page
    PLB                  ; AB | Pull data bank register from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVS $89              ; 70 89 | Branch if overflow set
    BPL $80              ; 10 80 | Branch if positive
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)
    LDY $0101            ; AC 01 01 | Load from absolute address into Y register
    STA $024B,Y          ; 99 4B 02 | Update graphics data
    BCC $06              ; 90 06 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_184
; Address: $D1C863
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_184:
    LDY $0101            ; AC 01 01 | Load from absolute address into Y register
    PEA #$0FA9           ; F4 A9 0F | Push effective address to stack
    CLV                  ; B8 | Clear overflow flag
    STA ($13,X)          ; 81 13 | Update graphics data
    EOR ($02),Y          ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($A7,X)          ; 01 A7 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    EOR $26              ; 45 26 | Exclusive OR with accumulator (zero page)
    STA ($93),Y          ; 91 93 | Update graphics data
    ORA ($C5,X)          ; 01 C5 | Logical OR with accumulator ((zero page,X))
    BMI $06              ; 30 06 | Branch if negative
    LDA ($46,X)          ; A1 46 | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_185
; Address: $D1C884
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_185:
    LDA $360101          ; AF 01 01 36 | Read graphics status
    LDA $0009,Y          ; B9 09 00 | Read graphics status
    LDA ($46),Y          ; B1 46 | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_186
; Address: $D1C88F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_186:
    LDA $380101          ; AF 01 01 38 | Read graphics status
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    AND $C138,Y          ; 39 38 C1 | Logical AND with accumulator (absolute,Y)
    LSR $6B              ; 46 6B | Logical shift right (zero page)
    LDA $9B0101          ; AF 01 01 9B | Read graphics status
    SBC ($8C,X)          ; E1 8C | Subtract with carry ((zero page,X))
    BNE $06              ; D0 06 | Branch if not equal
    JMP ($01B0)          ; 6C B0 01 | Jump to address (absolute indirect)
    ORA ($B3,X)          ; 01 B3 | Logical OR with accumulator ((zero page,X))
    LDY #$05             ; A0 05 | Load immediate value into Y register
    DEC                  ; 3A | Decrement accumulator
    SBC ($46,X)          ; E1 46 | Subtract with carry ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_187
; Address: $D1C8B0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_187:
    LDA $B50101          ; AF 01 01 B5 | Read graphics status
    BCS $05              ; B0 05 | Branch if carry set
    DEC                  ; 3A | Decrement accumulator
    SBC ($46),Y          ; F1 46 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_189
; Address: $D1C8BB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_189:
    LDA $7C0101          ; AF 01 01 7C | Read graphics status
    SBC #$0B             ; E9 0B | Subtract with carry (immediate)
    ORA ($47,X)          ; 01 47 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_18A
; Address: $D1C8C6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_18A:
    LDA $7E0101          ; AF 01 01 7E | Read graphics status
    SBC $000B,Y          ; F9 0B 00 | Subtract with carry (absolute,Y)
    ROL $4711,X          ; 3E 11 47 | Rotate left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_18C
; Address: $D1C8D9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_18C:
    JSR $6B47            ; 20 47 6B | Jump to subroutine
    LDA $740101          ; AF 01 01 74 | Read graphics status
    LDA #$0B             ; A9 0B | Read graphics status
    BMI $47              ; 30 47 | Branch if negative
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_18D
; Address: $D1C8E7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_18D:
    LDA $7A0101          ; AF 01 01 7A | Read graphics status
    CMP $000B,Y          ; D9 0B 00 | Compare accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_18E
; Address: $D1C8F2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_18E:
    LDA $780101          ; AF 01 01 78 | Read graphics status
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BVC $47              ; 50 47 | Branch if overflow clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_18F
; Address: $D1C8FD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_18F:
    LDA $800101          ; AF 01 01 80 | Read graphics status
    ORA #$0C             ; 09 0C | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_190
; Address: $D1C907
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_190:
    JMP ($01B1)          ; 6C B1 01 | Jump to address (absolute indirect)
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    ADC ($87),Y          ; 71 87 | Add with carry ((zero page),Y)
    JMP ($01B3)          ; 6C B3 01 | Jump to address (absolute indirect)
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    ADC ($4C),Y          ; 71 4C | Add with carry ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    WDM #$81             ; 42 81 | Reserved instruction
    ADC $01B3            ; 6D B3 01 | Add with carry (absolute)
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    STA ($0C,X)          ; 81 0C | Update graphics data
    BCC $07              ; 90 07 | Branch if carry clear
    ADC $01B3            ; 6D B3 01 | Add with carry (absolute)
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    ORA $02CC,Y          ; 19 CC 02 | Logical OR with accumulator (absolute,Y)
    LDY #$47             ; A0 47 | Load immediate value into Y register
    ADC $01B5            ; 6D B5 01 | Add with carry (absolute)
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    ORA $000D,Y          ; 19 0D 00 | Logical OR with accumulator (absolute,Y)
    LDA ($87),Y          ; B1 87 | Read graphics status

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_191
; Address: $D1C93E
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_191:
    ADC $01B7            ; 6D B7 01 | Add with carry (absolute)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    AND #$0D             ; 29 0D | Logical AND with accumulator (immediate)
    LSR $C1              ; 46 C1 | Logical shift right (zero page)
    ADC $01B7            ; 6D B7 01 | Add with carry (absolute)
    ORA ($A6,X)          ; 01 A6 | Logical OR with accumulator ((zero page,X))
    AND $000D,Y          ; 39 0D 00 | Logical AND with accumulator (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    CMP ($87),Y          ; D1 87 | Compare accumulator ((zero page),Y)
    ADC $01B7            ; 6D B7 01 | Add with carry (absolute)
    ORA ($A8,X)          ; 01 A8 | Logical OR with accumulator ((zero page,X))
    EOR #$0D             ; 49 0D | Exclusive OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    CPX #$07             ; E0 07 | Compare X register (immediate)
    ROR $01B8            ; 6E B8 01 | Rotate right (absolute)
    ORA ($AA,X)          ; 01 AA | Logical OR with accumulator ((zero page,X))
    EOR $034D,Y          ; 59 4D 03 | Exclusive OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    BEQ $07              ; F0 07 | Branch if equal
    ROR $01B8            ; 6E B8 01 | Rotate right (absolute)
    ORA ($AC,X)          ; 01 AC | Logical OR with accumulator ((zero page,X))
    ADC #$0D             ; 69 0D | Add with carry (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($AE,X)          ; 01 AE | Logical OR with accumulator ((zero page,X))
    ADC $000D,Y          ; 79 0D 00 | Add with carry (absolute,Y)
    JMP $0001            ; 4C 01 00 | Jump to address
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    BIT #$4D             ; 89 4D | Test bits in accumulator (immediate)
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    ROR $01B9            ; 6E B9 01 | Rotate right (absolute)
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    BIT #$4D             ; 89 4D | Test bits in accumulator (immediate)
    ORA ($48),Y          ; 11 48 | Logical OR with accumulator ((zero page),Y)
    ROR $01B9            ; 6E B9 01 | Rotate right (absolute)
    ORA ($B2,X)          ; 01 B2 | Logical OR with accumulator ((zero page,X))
    STA $29CD,Y          ; 99 CD 29 | Update graphics data
    LSR $C821            ; 4E 21 C8 | Logical shift right (absolute)
    ROR $01BB            ; 6E BB 01 | Rotate right (absolute)
    ORA ($B4,X)          ; 01 B4 | Logical OR with accumulator ((zero page,X))
    LDA #$0D             ; A9 0D | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    BVC $31              ; 50 31 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    ROR $01BB            ; 6E BB 01 | Rotate right (absolute)
    ORA ($B6,X)          ; 01 B6 | Logical OR with accumulator ((zero page,X))
    LDA $038D,Y          ; B9 8D 03 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    LDA $0101,X          ; BD 01 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_192
; Address: $D1C9BB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_192:
    CLV                  ; B8 | Clear overflow flag
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BVC $48              ; 50 48 | Branch if overflow clear
    LDA $0101,X          ; BD 01 01 | Read graphics status
    TSX                  ; BA | Transfer stack pointer to X register
    CMP $000D,Y          ; D9 0D 00 | Compare accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_193
; Address: $D1C9CC
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_193:
    DEY                  ; 88 | Decrement Y register
    LDX $0101,Y          ; BE 01 01 | Load from absolute,Y into X register
    CMP #$52             ; C9 52 | Compare accumulator (immediate)
    BVS $08              ; 70 08 | Branch if overflow set
    BVS $C1              ; 70 C1 | Branch if overflow set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDY $CDE9,X          ; BC E9 CD | Load from absolute,X into Y register
    STA ($88,X)          ; 81 88 | Update graphics data
    BVS $C3              ; 70 C3 | Branch if overflow set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDX $0DF9,Y          ; BE F9 0D | Load from absolute,Y into X register
    CLI                  ; 58 | Clear interrupt disable flag
    STA ($88),Y          ; 91 88 | Update graphics data
    BVS $C3              ; 70 C3 | Branch if overflow set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHY                  ; 5A | Push Y register to stack
    LDA ($88,X)          ; A1 88 | Read graphics status
    ADC ($C7),Y          ; 71 C7 | Add with carry ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC #$09             ; E9 09 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_194
; Address: $D1CA01
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_194:
    JSR $08B0            ; 20 B0 08 | Jump to subroutine
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    ORA ($BD,X)          ; 01 BD | Logical OR with accumulator ((zero page,X))
    BEQ $05              ; F0 05 | Branch if equal
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    ADC ($C7),Y          ; 71 C7 | Add with carry ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    CMP $0009,Y          ; D9 09 00 | Compare accumulator (absolute,Y)
    JMP $7188D1          ; 5C D1 88 71 | Jump to address long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA $CCF1,X          ; 9D F1 CC | Update graphics data
    ROL $E0              ; 26 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $09F9,X          ; 3E F9 09 | Rotate left (absolute,X)
    BEQ $88              ; F0 88 | Branch if equal
    ADC ($C7),Y          ; 71 C7 | Add with carry ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEP #$18             ; E2 18 | Set processor status bits

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_195
; Address: $D1CA38
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_195:
    LSR $0901,X          ; 5E 01 09 | Logical shift right (absolute,X)
    ADC ($C5),Y          ; 71 C5 | Add with carry ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA $31              ; 85 31 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_196
; Address: $D1CA44
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_196:
    ORA ($09),Y          ; 11 09 | Logical OR with accumulator ((zero page),Y)
    ADC ($C5),Y          ; 71 C5 | Add with carry ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    EOR ($0C,X)          ; 41 0C | Exclusive OR with accumulator ((zero page,X))
    AND ($09,X)          ; 21 09 | Logical AND with accumulator ((zero page,X))
    ADC ($C5),Y          ; 71 C5 | Add with carry ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BIT #$51             ; 89 51 | Test bits in accumulator (immediate)
    BMI $09              ; 30 09 | Branch if negative
    ADC ($C5),Y          ; 71 C5 | Add with carry ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $04              ; 50 04 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_197
; Address: $D1CA64
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_197:
    JSL $728940          ; 22 40 89 72 | Jump to subroutine long
    DEX                  ; CA | Decrement X register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    BCC $04              ; 90 04 | Branch if carry clear
    BIT $50              ; 24 50 | Test bits in accumulator (zero page)
    BIT #$72             ; 89 72 | Test bits in accumulator (immediate)
    DEX                  ; CA | Decrement X register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY $0668            ; CC 68 06 | Compare Y register (absolute)
    ORA ($CE,X)          ; 01 CE | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($D0,X)          ; 01 D0 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($D2,X)          ; 01 D2 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    EOR #$0A             ; 49 0A | Exclusive OR with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    ADC ($09,X)          ; 61 09 | Add with carry ((zero page,X))
    CMP $0101            ; CD 01 01 | Compare accumulator (absolute)
    JMP $0A69            ; 4C 69 0A | Jump to address
    JMP ($0971)          ; 6C 71 09 | Jump to address (absolute indirect)
    CMP $0101            ; CD 01 01 | Compare accumulator (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $000A,Y          ; 59 0A 00 | Exclusive OR with accumulator (absolute,Y)
    ROR                  ; 6A | Rotate right (accumulator)
    STA ($09,X)          ; 81 09 | Update graphics data
    CMP $0101            ; CD 01 01 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_198
; Address: $D1CAC3
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_198:
    RTI                  ; 40 | Return from interrupt
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    BCC $09              ; 90 09 | Branch if carry clear
    CMP $0101            ; CD 01 01 | Compare accumulator (absolute)
    CPX $28              ; E4 28 | Compare X register (zero page)
    LDA ($09,X)          ; A1 09 | Read graphics status
    CMP ($01),Y          ; D1 01 | Compare accumulator ((zero page),Y)
    ORA ($91,X)          ; 01 91 | Logical OR with accumulator ((zero page,X))
    STA ($0C),Y          ; 91 0C | Update graphics data
    ROR $89C1            ; 6E C1 89 | Rotate right (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA ($0C,X)          ; A1 0C | Read graphics status
    BVS $D1              ; 70 D1 | Branch if overflow set
    BIT #$73             ; 89 73 | Test bits in accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA ($0C),Y          ; B1 0C | Read graphics status
    SBC ($C9,X)          ; E1 C9 | Subtract with carry ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CMP ($0C,X)          ; C1 0C | Compare accumulator ((zero page,X))
    SBC ($89),Y          ; F1 89 | Subtract with carry ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA $0CD1,Y          ; 99 D1 0C | Update graphics data
    ORA $28              ; 05 28 | Logical OR with accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LSR $0A79            ; 4E 79 0A | Logical shift right (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    BIT #$0A             ; 89 0A | Test bits in accumulator (immediate)
    PLY                  ; 7A | Pull Y register from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($52,X)          ; 01 52 | Logical OR with accumulator ((zero page,X))
    STA $000A,Y          ; 99 0A 00 | Update graphics data
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    LDA #$0A             ; A9 0A | Read graphics status
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    LDA $000A,Y          ; B9 0A 00 | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($58,X)          ; 01 58 | Logical OR with accumulator ((zero page,X))
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    ROR $0001,X          ; 7E 01 00 | Rotate right (absolute,X)
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    ORA #$4E             ; 09 4E | Logical OR with accumulator (immediate)
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    REP #$19             ; C2 19 | Reset processor status bits
    LSR $2A05            ; 4E 05 2A | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_19A
; Address: $D1CB68
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_19A:
    CPY $29              ; C4 29 | Compare Y register (zero page)
    STX $2C05            ; 8E 05 2C | Store X register to absolute address
    BMI $4A              ; 30 4A | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEC $39              ; C6 39 | Decrement (zero page)
    DEC $2E05            ; CE 05 2E | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    EOR #$0E             ; 49 0E | Exclusive OR with accumulator (immediate)
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    BVC $4A              ; 50 4A | Branch if overflow clear
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY $0E69            ; CC 69 0E | Compare Y register (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_19B
; Address: $D1CB8F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_19B:
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEC $0E69            ; CE 69 0E | Decrement (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_19C
; Address: $D1CB9A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_19C:
    DEX                  ; CA | Decrement X register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $070E,Y          ; B9 0E 07 | Read graphics status
    SEC                  ; 38 | Set carry flag
    BRA $CA              ; 80 CA | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    CMP #$4E             ; C9 4E | Compare accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    BCC $CA              ; 90 CA | Branch if carry clear
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $01F8,X          ; 3E F8 01 | Rotate left (absolute,X)
    BRA $A1              ; 80 A1 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $0101,Y          ; D9 01 01 | Compare accumulator (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    BCS $8A              ; B0 8A | Branch if carry set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $3A              ; 06 3A | Arithmetic shift left (zero page)
    BCC $07              ; 90 07 | Branch if carry clear
    CPY #$0A             ; C0 0A | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    BNE $0A              ; D0 0A | Branch if not equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_19D
; Address: $D1CBE3
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_19D:
    BPL $08              ; 10 08 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPX #$0A             ; E0 0A | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    BVC $08              ; 50 08 | Branch if overflow clear
    WDM #$F0             ; 42 F0 | Reserved instruction
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    CMP $088E,Y          ; D9 8E 08 | Compare accumulator (absolute,Y)
    CMP $0101,X          ; DD 01 01 | Compare accumulator (absolute,X)
    SBC #$CE             ; E9 CE | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LSR $10              ; 46 10 | Logical shift right (zero page)
    CMP $0101,X          ; DD 01 01 | Compare accumulator (absolute,X)
    DEC $0EF9,X          ; DE F9 0E | Decrement (absolute,X)
    ORA #$48             ; 09 48 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_19E
; Address: $D1CC12
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_19E:
    JSR $774B            ; 20 4B 77 | Jump to subroutine
    CMP $0101,X          ; DD 01 01 | Compare accumulator (absolute,X)
    CPX #$09             ; E0 09 | Compare X register (immediate)
    ORA #$4A             ; 09 4A | Logical OR with accumulator (immediate)
    BMI $4B              ; 30 4B | Branch if negative
    CMP $0101,X          ; DD 01 01 | Compare accumulator (absolute,X)
    SEP #$19             ; E2 19 | Set processor status bits
    STA $404C09          ; 8F 09 4C 40 | Update graphics data
    CMP $0101,X          ; DD 01 01 | Compare accumulator (absolute,X)
    CPX $29              ; E4 29 | Compare X register (zero page)
    ORA #$4E             ; 09 4E | Logical OR with accumulator (immediate)
    BVC $4B              ; 50 4B | Branch if overflow clear
    CMP $0101,X          ; DD 01 01 | Compare accumulator (absolute,X)
    INC $39              ; E6 39 | Increment (zero page)
    LDX $8B61            ; AE 61 8B | Load from absolute address into X register
    DEC $0101,X          ; DE 01 01 | Decrement (absolute,X)
    WDM #$1A             ; 42 1A | Reserved instruction
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $70              ; 50 70 | Branch if overflow clear
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $CB              ; 80 CB | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA #$CE             ; A9 CE | Read graphics status
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    JMP ($0101)          ; 6C 01 01 | Jump to address (absolute indirect)
    LSR                  ; 4A | Logical shift right (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCC $0B              ; 90 0B | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_19F
; Address: $D1CC6D
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_19F:
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    LDY #$0B             ; A0 0B | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($4E,X)          ; 01 4E | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    BCS $0B              ; B0 0B | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    BNE $0B              ; D0 0B | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($52,X)          ; 01 52 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    CPX #$0B             ; E0 0B | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    BEQ $0B              ; F0 0B | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    BPL $0C              ; 10 0C | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1A0
; Address: $D1CCAD
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1A0:
    JMP $E178            ; 4C 78 E1 | Jump to address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    DEX                  ; CA | Decrement X register
    BVC $0C              ; 50 0C | Branch if overflow clear
    BPL $4C              ; 10 4C | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    ORA ($5A,X)          ; 01 5A | Logical OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    AND $21CC,Y          ; 39 CC 21 | PPU graphics register access
    STY $E278            ; 8C 78 E2 | Store Y register to absolute address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    JMP $3992EA          ; 5C EA 92 39 | Jump to address long
    CPY $8C31            ; CC 31 8C | Compare Y register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SEP #$01             ; E2 01 | Set processor status bits
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    BCC $0C              ; 90 0C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1A1
; Address: $D1CCD7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1A1:
    STZ $40              ; 64 40 | Store zero to zero page
    CPY $E378            ; CC 78 E3 | Compare Y register (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $D0FA,X          ; 1E FA D0 | Arithmetic shift left (absolute,X)
    ROR $80              ; 66 80 | Rotate right (zero page)
    CPY $E378            ; CC 78 E3 | Compare Y register (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1A2
; Address: $D1CCE9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1A2:
    JSR $110A            ; 20 0A 11 | Jump to subroutine
    ORA $A068            ; 0D 68 A0 | Logical OR with accumulator (absolute)
    CPY $E378            ; CC 78 E3 | Compare Y register (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1A3
; Address: $D1CCF4
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1A3:
    JSL $0D511A          ; 22 1A 51 0D | Jump to subroutine long
    ROR                  ; 6A | Rotate right (accumulator)
    BCS $CC              ; B0 CC | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BIT $2A              ; 24 2A | Test bits in accumulator (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BCC $CC              ; 90 CC | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $3A              ; 26 3A | Rotate left (zero page)
    STA ($0D),Y          ; 91 0D | Update graphics data
    JMP ($0CC0)          ; 6C C0 0C | Jump to address (absolute indirect)
    ADC $01E4,Y          ; 79 E4 01 | Add with carry (absolute,Y)
    ORA ($E8,X)          ; 01 E8 | Logical OR with accumulator ((zero page,X))
    EOR #$CF             ; 49 CF | Exclusive OR with accumulator (immediate)
    LDX $4CD1            ; AE D1 4C | Load from absolute address into X register
    ADC $01E5,Y          ; 79 E5 01 | Add with carry (absolute,Y)
    ORA ($EA,X)          ; 01 EA | Logical OR with accumulator ((zero page,X))
    EOR $35CF,Y          ; 59 CF 35 | Exclusive OR with accumulator (absolute,Y)
    LDX $4CE1            ; AE E1 4C | Load from absolute address into X register
    ADC $01E5,Y          ; 79 E5 01 | Add with carry (absolute,Y)
    ORA ($EC,X)          ; 01 EC | Logical OR with accumulator ((zero page,X))
    ADC #$CF             ; 69 CF | Add with carry (immediate)
    LDX $4CF1            ; AE F1 4C | Load from absolute address into X register
    ADC $01E5,Y          ; 79 E5 01 | Add with carry (absolute,Y)
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    ADC $35CF,Y          ; 79 CF 35 | Add with carry (absolute,Y)
    LDX $4D01            ; AE 01 4D | Load from absolute address into X register
    ADC $01E5,Y          ; 79 E5 01 | Add with carry (absolute,Y)
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP ($0D),Y          ; D1 0D | Compare accumulator ((zero page),Y)
    ROR $8D10            ; 6E 10 8D | Rotate right (absolute)
    ADC $01E6,Y          ; 79 E6 01 | Add with carry (absolute,Y)
    ORA ($2A,X)          ; 01 2A | Logical OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BVS $20              ; 70 20 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1A4
; Address: $D1CD52
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1A4:
    STA $E679            ; 8D 79 E6 | Update graphics data
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BIT $D16A            ; 2C 6A D1 | Test bits in accumulator (absolute)
    LDX $CD31            ; AE 31 CD | Load from absolute address into X register
    ADC $01E7,Y          ; 79 E7 01 | Add with carry (absolute,Y)
    ORA ($71,X)          ; 01 71 | Logical OR with accumulator ((zero page,X))
    ASL $4072            ; 0E 72 40 | Arithmetic shift left (absolute)
    ORA $E87A            ; 0D 7A E8 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    STA ($0E),Y          ; 91 0E | Update graphics data
    BVC $4D              ; 50 4D | Branch if overflow clear
    PLY                  ; 7A | Pull Y register from stack
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    CMP ($0E),Y          ; D1 0E | Compare accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1A5
; Address: $D1CD7E
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1A5:
    EOR $E97A            ; 4D 7A E9 | Exclusive OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    PHX                  ; DA | Push X register to stack
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $4D              ; 70 4D | Branch if overflow set
    PLY                  ; 7A | Pull Y register from stack
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    LDY #$0B             ; A0 0B | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    BEQ $0B              ; F0 0B | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($5A,X)          ; 01 5A | Logical OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    AND $21CC,Y          ; 39 CC 21 | PPU graphics register access
    STY $E278            ; 8C 78 E2 | Store Y register to absolute address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$91             ; C0 91 | Compare Y register (immediate)
    STY $0233            ; 8C 33 02 | Store Y register to absolute address
    ORA ($99,X)          ; 01 99 | Logical OR with accumulator ((zero page,X))
    CMP ($0C),Y          ; D1 0C | Compare accumulator ((zero page),Y)
    ORA $28              ; 05 28 | Logical OR with accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC #$CE             ; E9 CE | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1A6
; Address: $D1CDC8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1A6:
    PHP                  ; 08 | Push processor status to stack
    LSR $10              ; 46 10 | Logical shift right (zero page)
    CMP $0101,X          ; DD 01 01 | Compare accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCC $0B              ; 90 0B | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $04              ; 50 04 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1A7
; Address: $D1CDDF
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1A7:
    JSL $728940          ; 22 40 89 72 | Jump to subroutine long
    DEX                  ; CA | Decrement X register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LSR $8278            ; 4E 78 82 | Logical shift right (absolute)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    BVS $83              ; 70 83 | Branch if overflow set
    ADC ($86,X)          ; 61 86 | Add with carry ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    REP #$15             ; C2 15 | Reset processor status bits
    LDY #$8D             ; A0 8D | Load immediate value into Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDY $29              ; A4 29 | Load from zero page into Y register
    ORA $4600            ; 0D 00 46 | Logical OR with accumulator (absolute)
    CMP ($87,X)          ; C1 87 | Compare accumulator ((zero page,X))
    ADC $01B7            ; 6D B7 01 | Add with carry (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    LDX #$60             ; A2 60 | Load immediate value into X register
    EOR ($5C,X)          ; 41 5C | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    ADC ($4C,X)          ; 61 4C | Add with carry ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    BRA $8D              ; 80 8D | Branch always
    PLY                  ; 7A | Pull Y register from stack
    XBA                  ; EB | Exchange accumulator bytes
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($0D),Y          ; 91 0D | Update graphics data
    SBC $0101            ; ED 01 01 | Subtract with carry (absolute)
    REP #$15             ; C2 15 | Reset processor status bits
    LDY #$8D             ; A0 8D | Load immediate value into Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $15D2,Y          ; B9 D2 15 | Read graphics status
    BCS $8D              ; B0 8D | Branch if carry set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEP #$15             ; E2 15 | Set processor status bits
    CPY #$8D             ; C0 8D | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1A8
; Address: $D1CE49
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1A8:
    LDA $15F2,X          ; BD F2 15 | Read graphics status
    BNE $0D              ; D0 0D | Branch if not equal
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    STY $E1              ; 84 E1 | Store Y register to zero page
    STA $F37C            ; 8D 7C F3 | Update graphics data
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    STX $F1              ; 86 F1 | Store X register to zero page
    ORA $F57D            ; 0D 7D F5 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 02 D6 35 | Read graphics status
    LDX $8E01            ; AE 01 8E | Load from absolute address into X register
    ADC $01F7,X          ; 7D F7 01 | Add with carry (absolute,X)
    ORA ($42,X)          ; 01 42 | Hardware register operation
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ROR $01F9,X          ; 7E F9 01 | Rotate right (absolute,X)
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    TXA                  ; 8A | Transfer X register to accumulator
    AND ($8E,X)          ; 21 8E | Logical AND with accumulator ((zero page,X))
    ROR $01FB,X          ; 7E FB 01 | Rotate right (absolute,X)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    STY $0E31            ; 8C 31 0E | Store Y register to absolute address
    SBC $0101,X          ; FD 01 01 | Subtract with carry (absolute,X)
    WDM #$19             ; 42 19 | Reserved instruction
    DEX                  ; CA | Decrement X register
    AND ($8E),Y          ; 31 8E | Logical AND with accumulator ((zero page),Y)
    EOR ($8E,X)          ; 41 8E | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND #$8A             ; 29 8A | Logical AND with accumulator (immediate)
    BVC $0E              ; 50 0E | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    LDX $4E61            ; AE 61 4E | Load from absolute address into X register
    BRA $02              ; 80 02 | Branch always
    ORA ($CC,X)          ; 01 CC | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    ROR $CE70,X          ; 7E 70 CE | Rotate right (absolute,X)
    BRA $04              ; 80 04 | Branch always
    ORA ($CE,X)          ; 01 CE | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    BPL $80              ; 10 80 | Branch if positive
    BRA $CE              ; 80 CE | Branch always
    BRA $04              ; 80 04 | Branch always

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1A9
; Address: $D1CECC
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1A9:
    ORA ($D0,X)          ; 01 D0 | Logical OR with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    BPL $82              ; 10 82 | Branch if positive
    BCC $4E              ; 90 4E | Branch if carry clear
    STA ($06,X)          ; 81 06 | Update graphics data
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$CE             ; A0 CE | Load immediate value into Y register
    ORA $0100            ; 0D 00 01 | Logical OR with accumulator (absolute)
    NOP                  ; EA | No operation
    STA ($10),Y          ; 91 10 | Update graphics data
    STY $B0              ; 84 B0 | Store Y register to zero page
    ASL $0882            ; 0E 82 08 | Arithmetic shift left (absolute)
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    BCC $C1              ; 90 C1 | Branch if carry clear
    LSR $0A82            ; 4E 82 0A | Logical shift right (absolute)
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    REP #$10             ; C2 10 | Reset processor status bits
    STX $D0              ; 86 D0 | Store X register to zero page
    DEC $0B82            ; CE 82 0B | Decrement (absolute)
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1AA
; Address: $D1CF05
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1AA:
    JSL $881116          ; 22 16 11 88 | Jump to subroutine long
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    ORA $0102            ; 0D 02 01 | Logical OR with accumulator (absolute)
    CMP $32              ; C5 32 | Compare accumulator (zero page)
    BCS $F1              ; B0 F1 | Branch if carry set
    STX $0F83            ; 8E 83 0F | Store X register to absolute address
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    AND $35CA,Y          ; 39 CA 35 | Logical AND with accumulator (absolute,Y)
    LDX $0F01            ; AE 01 0F | Load from absolute address into X register
    STY $11              ; 84 11 | Store Y register to zero page
    ORA ($C7,X)          ; 01 C7 | Logical OR with accumulator ((zero page,X))
    WDM #$D6             ; 42 D6 | Reserved instruction
    LDX $8F11            ; AE 11 8F | Load from absolute address into X register
    STY $13              ; 84 13 | Store Y register to zero page
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($0F,X)          ; 21 0F | Logical AND with accumulator ((zero page,X))
    STA $15              ; 85 15 | Update graphics data
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    EOR ($0F,X)          ; 41 0F | Exclusive OR with accumulator ((zero page,X))
    STX $19              ; 86 19 | Store X register to zero page
    ORA ($8B,X)          ; 01 8B | Logical OR with accumulator ((zero page,X))
    BVC $8F              ; 50 8F | Branch if overflow clear
    STX $1B              ; 86 1B | Store X register to zero page
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1AB
; Address: $D1CF57
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1AB:
    STA $021B86          ; 8F 86 1B 02 | Update graphics data
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    BVS $8F              ; 70 8F | Branch if overflow set
    STX $1B              ; 86 1B | Store X register to zero page
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($8C),Y          ; 11 8C | Logical OR with accumulator ((zero page),Y)
    BRA $0F              ; 80 0F | Branch always
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    EOR ($11),Y          ; 51 11 | Exclusive OR with accumulator ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator
    BCC $0F              ; 90 0F | Branch if carry clear
    ORA ($91,X)          ; 01 91 | Logical OR with accumulator ((zero page,X))
    STZ $4FA1            ; 9C A1 4F | Store zero to absolute
    ASL $0102,X          ; 1E 02 01 | Arithmetic shift left (absolute,X)
    LDX #$14             ; A2 14 | Load immediate value into X register
    BCS $CF              ; B0 CF | Branch if carry set

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1AD
; Address: $D1CF9B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1AD:
    JSR $0102            ; 20 02 01 | Jump to subroutine
    REP #$14             ; C2 14 | Reset processor status bits
    BNE $CF              ; D0 CF | Branch if not equal

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1AE
; Address: $D1CFA6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1AE:
    JSR $0102            ; 20 02 01 | Jump to subroutine
    STA $14D2,Y          ; 99 D2 14 | Update graphics data
    CPX #$CF             ; E0 CF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1AF
; Address: $D1CFB1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1AF:
    JSR $0102            ; 20 02 01 | Jump to subroutine
    SEP #$14             ; E2 14 | Set processor status bits
    BEQ $CF              ; F0 CF | Branch if equal

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1B0
; Address: $D1CFBC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1B0:
    JSR $0102            ; 20 02 01 | Jump to subroutine
    STA $14F2,X          ; 9D F2 14 | Update graphics data
    STZ $5001,X          ; 9E 01 50 | Store zero to absolute,X
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1B1
; Address: $D1CFC7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1B1:
    JSL $9F0102          ; 22 02 01 9F | Jump to subroutine long
    BPL $D0              ; 10 D0 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    BIT $02              ; 24 02 | Test bits in accumulator (zero page)
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1B2
; Address: $D1CFDA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1B2:
    JSR $88D0            ; 20 D0 88 | Jump to subroutine
    BIT $02              ; 24 02 | Test bits in accumulator (zero page)
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1B3
; Address: $D1CFE1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1B3:
    JSL $000015          ; 22 15 00 00 | Jump to subroutine long
    BMI $D0              ; 30 D0 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    BIT $02              ; 24 02 | Test bits in accumulator (zero page)
    ORA ($A5,X)          ; 01 A5 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BNE $88              ; D0 88 | Branch if not equal
    BIT $02              ; 24 02 | Test bits in accumulator (zero page)
    ORA ($A7,X)          ; 01 A7 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1B4
; Address: $D1CFF7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1B4:
    WDM #$15             ; 42 15 | Reserved instruction
    LDY #$51             ; A0 51 | Load immediate value into Y register
    BVC $89              ; 50 89 | Branch if overflow clear
    ROL $02              ; 26 02 | Rotate left (zero page)
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1B5
; Address: $D1D007
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1B5:
    BNE $89              ; D0 89 | Branch if not equal
    PLP                  ; 28 | Pull processor status from stack
    ORA ($AB,X)          ; 01 AB | Logical OR with accumulator ((zero page,X))
    BVS $D0              ; 70 D0 | Branch if overflow set
    BIT #$28             ; 89 28 | Test bits in accumulator (immediate)
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))
    BRA $D0              ; 80 D0 | Branch always
    BIT #$28             ; 89 28 | Test bits in accumulator (immediate)
    ORA ($AF,X)          ; 01 AF | Logical OR with accumulator ((zero page,X))
    BCC $D0              ; 90 D0 | Branch if carry clear
    BIT #$28             ; 89 28 | Test bits in accumulator (immediate)
    ORA ($B1,X)          ; 01 B1 | Logical OR with accumulator ((zero page,X))
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    BIT #$28             ; 89 28 | Test bits in accumulator (immediate)
    ORA ($D2,X)          ; 01 D2 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    BCS $50              ; B0 50 | Branch if carry set
    TXA                  ; 8A | Transfer X register to accumulator
    BIT $0102            ; 2C 02 01 | Test bits in accumulator (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    BIT $0102            ; 2C 02 01 | Test bits in accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    BNE $50              ; D0 50 | Branch if not equal
    TXA                  ; 8A | Transfer X register to accumulator
    BIT $0102            ; 2C 02 01 | Test bits in accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    DEX                  ; CA | Decrement X register
    CPX #$50             ; E0 50 | Compare X register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    BIT $0102            ; 2C 02 01 | Test bits in accumulator (absolute)
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    BEQ $D0              ; F0 D0 | Branch if equal
    TXA                  ; 8A | Transfer X register to accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($DC,X)          ; 01 DC | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    EOR ($8B),Y          ; 51 8B | Exclusive OR with accumulator ((zero page),Y)
    ROL $0102            ; 2E 02 01 | Rotate left (absolute)
    DEC $16FA,X          ; DE FA 16 | Decrement (absolute,X)
    BPL $51              ; 10 51 | Branch if positive
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1B7
; Address: $D1D08A
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1B7:
    JSR $8BD1            ; 20 D1 8B | Jump to subroutine
    BMI $02              ; 30 02 | Branch if negative
    ORA ($E2,X)          ; 01 E2 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    BMI $51              ; 30 51 | Branch if negative
    PHB                  ; 8B | Push data bank register to stack
    ROL $0102            ; 2E 02 01 | Rotate left (absolute)
    CPX $2A              ; E4 2A | Compare X register (zero page)
    RTI                  ; 40 | Return from interrupt
    EOR ($8C),Y          ; 51 8C | Exclusive OR with accumulator ((zero page),Y)
    AND ($02),Y          ; 31 02 | Logical AND with accumulator ((zero page),Y)
    ORA ($73,X)          ; 01 73 | Logical OR with accumulator ((zero page,X))
    LDX #$13             ; A2 13 | Load immediate value into X register
    BVS $91              ; 70 91 | Branch if overflow set
    STY $0233            ; 8C 33 02 | Store Y register to absolute address
    ORA ($73,X)          ; 01 73 | Logical OR with accumulator ((zero page,X))
    LDX #$13             ; A2 13 | Load immediate value into X register
    BCS $91              ; B0 91 | Branch if carry set
    STY $0233            ; 8C 33 02 | Store Y register to absolute address
    ORA ($75,X)          ; 01 75 | Logical OR with accumulator ((zero page,X))
    CPY #$91             ; C0 91 | Compare Y register (immediate)
    STY $0233            ; 8C 33 02 | Store Y register to absolute address
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    REP #$53             ; C2 53 | Reset processor status bits
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    ORA ($8D),Y          ; 11 8D | Logical OR with accumulator ((zero page),Y)
    ORA ($79,X)          ; 01 79 | Logical OR with accumulator ((zero page,X))
    CPX #$91             ; E0 91 | Compare X register (immediate)
    STY $0233            ; 8C 33 02 | Store Y register to absolute address
    ORA ($7B,X)          ; 01 7B | Logical OR with accumulator ((zero page,X))
    SEP #$13             ; E2 13 | Set processor status bits
    BEQ $91              ; F0 91 | Branch if equal
    STY $0233            ; 8C 33 02 | Store Y register to absolute address
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    STA $0237            ; 8D 37 02 | Update graphics data
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    BPL $12              ; 10 12 | Branch if positive
    STX $0238            ; 8E 38 02 | Store X register to absolute address
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1B8
; Address: $D1D103
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1B8:
    JSR $8E52            ; 20 52 8E | Jump to subroutine
    AND $0102,Y          ; 39 02 01 | Logical AND with accumulator (absolute,Y)
    INC $3A              ; E6 3A | Increment (zero page)
    LDX $9151            ; AE 51 91 | Load from absolute address into X register
    STX $023B            ; 8E 3B 02 | Store X register to absolute address
    ORA ($E8,X)          ; 01 E8 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $9161            ; AE 61 91 | Load from absolute address into X register
    STX $023B            ; 8E 3B 02 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1B9
; Address: $D1D11E
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1B9:
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($8E),Y          ; 11 8E | Logical OR with accumulator ((zero page),Y)
    BMI $12              ; 30 12 | Branch if negative
    STA $01023D          ; 8F 3D 02 01 | Update graphics data
    CLI                  ; 58 | Clear interrupt disable flag
    DEX                  ; CA | Decrement X register
    LDX $9241            ; AE 41 92 | Load from absolute address into X register
    STA $01023F          ; 8F 3F 02 01 | Update graphics data
    LDA                  ; BF 00 86 34 | Read graphics status
    LDY $51              ; A4 51 | Load from zero page into Y register
    BCC $42              ; 90 42 | Hardware register operation
    ORA ($EA,X)          ; 01 EA | Logical OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    LDX $61              ; A6 61 | Load from zero page into X register
    BCC $40              ; 90 40 | Branch if carry clear
    ORA ($EC,X)          ; 01 EC | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    SEC                  ; 38 | Set carry flag
    CPY $71              ; C4 71 | Compare Y register (zero page)
    BCC $40              ; 90 40 | Branch if carry clear
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    BPL $06              ; 10 06 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    STA ($92,X)          ; 81 92 | Update graphics data
    STA ($47),Y          ; 91 47 | Update graphics data
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    TAX                  ; AA | Transfer accumulator to X register
    STA ($12),Y          ; 91 12 | Update graphics data
    STA ($45),Y          ; 91 45 | Update graphics data
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    SEC                  ; 38 | Set carry flag
    CPY $A1              ; C4 A1 | Compare Y register (zero page)
    BCC $43              ; 90 43 | Branch if carry clear
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BCC $B0              ; 90 B0 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    SEC                  ; 38 | Set carry flag
    CPY $C1              ; C4 C1 | Compare Y register (zero page)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    SEC                  ; 38 | Set carry flag
    CPY $D1              ; C4 D1 | Compare Y register (zero page)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1BA
; Address: $D1D197
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1BA:
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    CPX #$92             ; E0 92 | Compare X register (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    SEC                  ; 38 | Set carry flag
    CPY $F1              ; C4 F1 | Compare Y register (zero page)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    SEC                  ; 38 | Set carry flag
    CPY $21              ; C4 21 | PPU graphics register access
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    BIT #$8F             ; 89 8F | Test bits in accumulator (immediate)
    ORA ($F2,X)          ; 01 F2 | Logical OR with accumulator ((zero page,X))
    STA $12CF,Y          ; 99 CF 12 | Update graphics data
    BPL $D3              ; 10 D3 | Branch if positive
    ORA ($F2,X)          ; 01 F2 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    LDY $1331            ; AC 31 13 | Load from absolute address into Y register
    JMP $0102            ; 4C 02 01 | Jump to address
    PEA #$97AA           ; F4 AA 97 | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    CPY $41              ; C4 41 | Compare Y register (zero page)
    JMP $0102            ; 4C 02 01 | Jump to address
    TSX                  ; BA | Transfer stack pointer to X register
    SEC                  ; 38 | Set carry flag
    CPY $51              ; C4 51 | Compare Y register (zero page)
    JMP $0102            ; 4C 02 01 | Jump to address
    TYA                  ; 98 | Transfer Y register to accumulator
    SEC                  ; 38 | Set carry flag
    CPY $61              ; C4 61 | Compare Y register (zero page)
    EOR $0102            ; 4D 02 01 | Exclusive OR with accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    SEC                  ; 38 | Set carry flag
    CPY $71              ; C4 71 | Compare Y register (zero page)
    EOR $0102            ; 4D 02 01 | Exclusive OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR $5E00,X          ; 5E 00 5E | Logical shift right (absolute,X)
    LSR $5E00,X          ; 5E 00 5E | Logical shift right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPY #$58             ; C0 58 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    EOR $0000,Y          ; 59 00 00 | Exclusive OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1BB
; Address: $D1D282
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1BB:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1BC
; Address: $D1D338
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1BC:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $F9FF,Y          ; F9 FF F9 | Subtract with carry (absolute,Y)
    SBC $F9FF,Y          ; F9 FF F9 | Subtract with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA $0D00            ; 0D 00 0D | Logical OR with accumulator (absolute)
    ORA $0D00            ; 0D 00 0D | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1BD
; Address: $D1D3D6
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1BD:
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BNE $FF              ; D0 FF | Branch if not equal
    BNE $FF              ; D0 FF | Branch if not equal
    BNE $FF              ; D0 FF | Branch if not equal
    BNE $FF              ; D0 FF | Branch if not equal
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ASL $1C00,X          ; 1E 00 1C | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $FF              ; D0 FF | Branch if not equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    AND $4C00            ; 2D 00 4C | Logical AND with accumulator (absolute)
    CMP ($2E,X)          ; C1 2E | Compare accumulator ((zero page,X))
    CMP ($2F,X)          ; C1 2F | Compare accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    CMP ($30,X)          ; C1 30 | Compare accumulator ((zero page,X))
    CMP ($31,X)          ; C1 31 | Compare accumulator ((zero page,X))
    LDA $C1CB,X          ; BD CB C1 | Read graphics status
    AND $CC              ; 25 CC | Logical AND with accumulator (zero page)
    CMP ($33,X)          ; C1 33 | Compare accumulator ((zero page,X))
    CPY $34C1            ; CC C1 34 | Compare Y register (absolute)
    ADC ($CC),Y          ; 71 CC | Add with carry ((zero page),Y)
    CMP ($35,X)          ; C1 35 | Compare accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    CMP ($36,X)          ; C1 36 | Compare accumulator ((zero page,X))
    STZ $C1CC,X          ; 9E CC C1 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1BE
; Address: $D1D4E4
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1BE:
    CPX #$CC             ; E0 CC | Compare X register (immediate)
    CMP ($38,X)          ; C1 38 | Compare accumulator ((zero page,X))
    STX $C1CC            ; 8E CC C1 | Store X register to absolute address
    AND $EB00,Y          ; 39 00 EB | Logical AND with accumulator (absolute,Y)
    CPY $3AC1            ; CC C1 3A | Compare Y register (absolute)
    SBC ($CC),Y          ; F1 CC | Subtract with carry ((zero page),Y)
    CMP ($3B,X)          ; C1 3B | Compare accumulator ((zero page,X))
    ORA $C1CD,X          ; 1D CD C1 | Logical OR with accumulator (absolute,X)
    STY $CB              ; 84 CB | Store Y register to zero page
    CMP ($3D,X)          ; C1 3D | Compare accumulator ((zero page,X))
    WDM #$CB             ; 42 CB | Reserved instruction
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    NOP                  ; EA | No operation
    CMP $3FC1            ; CD C1 3F | Compare accumulator (absolute)
    BPL $CE              ; 10 CE | Branch if positive
    CMP ($40,X)          ; C1 40 | Compare accumulator ((zero page,X))
    EOR ($CE,X)          ; 41 CE | Exclusive OR with accumulator ((zero page,X))
    CMP ($41,X)          ; C1 41 | Compare accumulator ((zero page,X))
    DEC $42C1            ; CE C1 42 | Hardware register operation
    DEC $43C1            ; CE C1 43 | Decrement (absolute)
    DEC $44C1            ; CE C1 44 | Decrement (absolute)
    CMP ($45,X)          ; C1 45 | Compare accumulator ((zero page,X))
    EOR ($CF,X)          ; 41 CF | Exclusive OR with accumulator ((zero page,X))
    CMP ($46,X)          ; C1 46 | Compare accumulator ((zero page,X))
    BVC $CF              ; 50 CF | Branch if overflow clear
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $21              ; A4 21 | PPU graphics register access
    JMP ($2100)          ; 6C 00 21 | PPU graphics register access
    LDY $21              ; A4 21 | PPU graphics register access
    PLA                  ; 68 | Pull accumulator from stack
    LDY $21              ; A4 21 | PPU graphics register access
    STZ $00              ; 64 00 | Store zero to zero page
    ROR $01              ; 66 01 | Rotate right (zero page)
    STY $21              ; 84 21 | PPU graphics register access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1BF
; Address: $D1D56C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1BF:
    PHP                  ; 08 | Push processor status to stack
    LDY $21              ; A4 21 | PPU graphics register access
    JMP $000200          ; 5C 00 02 00 | Jump to address long
    LDY $21              ; A4 21 | PPU graphics register access
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    BIT $21              ; 24 21 | PPU graphics register access
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LDY $21              ; A4 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1C0
; Address: $D1D58E
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1C0:
    BVC $00              ; 50 00 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $21              ; A4 21 | PPU graphics register access
    JMP $1C00            ; 4C 00 1C | Jump to address
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LDY $21              ; A4 21 | PPU graphics register access
    LDY $21              ; A4 21 | PPU graphics register access
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $21              ; 64 21 | PPU graphics register access
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    LDY $21              ; A4 21 | PPU graphics register access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $21              ; A4 21 | PPU graphics register access
    BMI $00              ; 30 00 | Branch if negative
    LDY $21              ; A4 21 | PPU graphics register access
    BIT $3F00            ; 2C 00 3F | Test bits in accumulator (absolute)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $21              ; A4 21 | PPU graphics register access
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    STZ $00              ; 64 00 | Store zero to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $6400            ; 2D 00 64 | Logical AND with accumulator (absolute)
    ROL $2D00            ; 2E 00 2D | Rotate left (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    AND $6000            ; 2D 00 60 | Logical AND with accumulator (absolute)
    AND $6500,Y          ; 39 00 65 | Logical AND with accumulator (absolute,Y)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    AND $5C00            ; 2D 00 5C | Logical AND with accumulator (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    LDY $2D              ; A4 2D | Load from zero page into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDY $2D              ; A4 2D | Load from zero page into Y register
    LDY $2D              ; A4 2D | Load from zero page into Y register
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1C1
; Address: $D1D63E
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1C1:
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    AND $4C00            ; 2D 00 4C | Logical AND with accumulator (absolute)
    STZ $01              ; 64 01 | Store zero to zero page
    ROL $29              ; 26 29 | Rotate left (zero page)
    JMP $0100            ; 4C 00 01 | Jump to address
    INC                  ; 1A | Increment accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    JMP $3C00            ; 4C 00 3C | Jump to address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA $5800,X          ; 1D 00 58 | Logical OR with accumulator (absolute,X)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $5800,Y          ; 19 00 58 | Logical OR with accumulator (absolute,Y)
    AND $6700,Y          ; 39 00 67 | Logical AND with accumulator (absolute,Y)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    ROL $00              ; 26 00 | Rotate left (zero page)
    LDY $15              ; A4 15 | Load from zero page into Y register
    BVC $00              ; 50 00 | Branch if overflow clear
    LDY $15              ; A4 15 | Load from zero page into Y register
    JMP $4600            ; 4C 00 46 | Jump to address
    LDY $15              ; A4 15 | Load from zero page into Y register
    PHA                  ; 48 | Push accumulator to stack
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDY $15              ; A4 15 | Load from zero page into Y register
    LDY $15              ; A4 15 | Load from zero page into Y register
    RTI                  ; 40 | Return from interrupt
    WDM #$00             ; 42 00 | Reserved instruction
    STX $19              ; 86 19 | Store X register to zero page
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $4000,X          ; 1D 00 40 | Logical OR with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $2800            ; 2D 00 28 | Logical AND with accumulator (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $2400,X          ; 1D 00 24 | Logical OR with accumulator (absolute,X)
    STX $21              ; 86 21 | PPU graphics register access
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ASL $4600,X          ; 1E 00 46 | Arithmetic shift left (absolute,X)
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $2400            ; 2D 00 24 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1C2
; Address: $D1D6EF
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1C2:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    AND $6900,Y          ; 39 00 69 | Logical AND with accumulator (absolute,Y)
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    AND $2400,Y          ; 39 00 24 | Logical AND with accumulator (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $2400,X          ; 3D 00 24 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1C3
; Address: $D1D713
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1C3:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    AND $2800,X          ; 3D 00 28 | Logical AND with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT #$41             ; 89 41 | Test bits in accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BIT $3F00            ; 2C 00 3F | Test bits in accumulator (absolute)
    EOR $01              ; 45 01 | Exclusive OR with accumulator (zero page)
    BIT #$45             ; 89 45 | Test bits in accumulator (immediate)
    BIT $1300            ; 2C 00 13 | Test bits in accumulator (absolute)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    BMI $00              ; 30 00 | Branch if negative
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDA ($45,X)          ; A1 45 | Read graphics status
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    ROL $00              ; 26 00 | Rotate left (zero page)
    LDA ($45,X)          ; A1 45 | Read graphics status
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDA ($45,X)          ; A1 45 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDA ($45,X)          ; A1 45 | Read graphics status
    LDA ($45,X)          ; A1 45 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LDA ($45,X)          ; A1 45 | Read graphics status
    JMP $1C00            ; 4C 00 1C | Jump to address
    LDA ($45,X)          ; A1 45 | Read graphics status
    BVC $00              ; 50 00 | Branch if overflow clear
    LDA ($45,X)          ; A1 45 | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($45,X)          ; A1 45 | Read graphics status
    CLI                  ; 58 | Clear interrupt disable flag
    LDA ($45,X)          ; A1 45 | Read graphics status
    JMP $003600          ; 5C 00 36 00 | Jump to address long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1C5
; Address: $D1D7A6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1C5:
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    JMP $002700          ; 5C 00 27 00 | Jump to address long
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1C7
; Address: $D1D7C3
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1C7:
    AND $6400,X          ; 3D 00 64 | Logical AND with accumulator (absolute,X)
    JMP ($2901)          ; 6C 01 29 | Jump to address (absolute indirect)
    AND $6400,Y          ; 39 00 64 | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    STZ $00              ; 64 00 | Store zero to zero page
    INC                  ; 1A | Increment accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    STZ $00              ; 64 00 | Store zero to zero page
    INC                  ; 1A | Increment accumulator
    AND $6400            ; 2D 00 64 | Logical AND with accumulator (absolute)
    ASL $4600,X          ; 1E 00 46 | Arithmetic shift left (absolute,X)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    STZ $00              ; 64 00 | Store zero to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    INC                  ; 1A | Increment accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    STZ $00              ; 64 00 | Store zero to zero page
    AND $1B00            ; 2D 00 1B | Logical AND with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ORA $6400,X          ; 1D 00 64 | Logical OR with accumulator (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $6000,X          ; 1D 00 60 | Logical OR with accumulator (absolute,X)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ROL $19              ; 26 19 | Rotate left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1C8
; Address: $D1D821
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1C8:
    WDM #$00             ; 42 00 | Reserved instruction
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $5C00,Y          ; 19 00 5C | Logical OR with accumulator (absolute,Y)
    AND $6D00,Y          ; 39 00 6D | Logical AND with accumulator (absolute,Y)
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    JMP $000100          ; 5C 00 01 00 | Jump to address long
    TYA                  ; 98 | Transfer Y register to accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    ROL $2E00            ; 2E 00 2E | Rotate left (absolute)
    LDY $15              ; A4 15 | Load from zero page into Y register
    LDY $15              ; A4 15 | Load from zero page into Y register
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1C9
; Address: $D1D84E
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1C9:
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDY $15              ; A4 15 | Load from zero page into Y register
    JMP $1D00            ; 4C 00 1D | Jump to address
    LDY $15              ; A4 15 | Load from zero page into Y register
    PHA                  ; 48 | Push accumulator to stack
    ASL $4600,X          ; 1E 00 46 | Arithmetic shift left (absolute,X)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    LDY $15              ; A4 15 | Load from zero page into Y register
    RTI                  ; 40 | Return from interrupt
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LDY $15              ; A4 15 | Load from zero page into Y register
    LDY $15              ; A4 15 | Load from zero page into Y register
    SEC                  ; 38 | Set carry flag
    ROR $A401            ; 6E 01 A4 | Rotate right (absolute)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LDY $15              ; A4 15 | Load from zero page into Y register
    BMI $00              ; 30 00 | Branch if negative
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    BIT $0200            ; 2C 00 02 | Test bits in accumulator (absolute)
    STX $19              ; 86 19 | Store X register to zero page
    BIT $0100            ; 2C 00 01 | Test bits in accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    ORA $2800,Y          ; 19 00 28 | Logical OR with accumulator (absolute,Y)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STX $1D              ; 86 1D | Store X register to zero page
    PLP                  ; 28 | Pull processor status from stack
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    AND $5A00            ; 2D 00 5A | Logical AND with accumulator (absolute)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    AND $5600            ; 2D 00 56 | Logical AND with accumulator (absolute)
    AND $1B00            ; 2D 00 1B | Logical AND with accumulator (absolute)
    LDY $2D              ; A4 2D | Load from zero page into Y register
    PHA                  ; 48 | Push accumulator to stack
    LDY $2D              ; A4 2D | Load from zero page into Y register
    LSR $1D00            ; 4E 00 1D | Logical shift right (absolute)
    LDY $2D              ; A4 2D | Load from zero page into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY $2D              ; A4 2D | Load from zero page into Y register
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    EOR $2200            ; 4D 00 22 | Exclusive OR with accumulator (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1CA
; Address: $D1D900
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1CA:
    JSL $000100          ; 22 00 01 00 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1CD
; Address: $D1D912
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1CD:
    JSL $003900          ; 22 00 39 00 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND $2200,X          ; 3D 00 22 | Logical AND with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND $2200,Y          ; 39 00 22 | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1CE
; Address: $D1D92D
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1CE:
    JSL $001C00          ; 22 00 1C 00 | Jump to subroutine long
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    LDA ($35,X)          ; A1 35 | Read graphics status
    ROL $0100            ; 2E 00 01 | Rotate left (absolute)
    LDA ($35,X)          ; A1 35 | Read graphics status
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    LDA ($35,X)          ; A1 35 | Read graphics status
    LDA ($35,X)          ; A1 35 | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $3A00,X          ; 3D 00 3A | Logical AND with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    DEC                  ; 3A | Decrement accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    ASL $5400,X          ; 1E 00 54 | Arithmetic shift left (absolute,X)
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    EOR $3A00            ; 4D 00 3A | Exclusive OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $3E00            ; 4D 00 3E | Exclusive OR with accumulator (absolute)
    AND $1C00            ; 2D 00 1C | Logical AND with accumulator (absolute)
    LDA ($4D,X)          ; A1 4D | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LDA ($4D,X)          ; A1 4D | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    EOR $4A00            ; 4D 00 4A | Exclusive OR with accumulator (absolute)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1CF
; Address: $D1D9C3
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1CF:
    LDA ($4D,X)          ; A1 4D | Read graphics status
    LSR $0200            ; 4E 00 02 | Logical shift right (absolute)
    LDA ($4D,X)          ; A1 4D | Read graphics status
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    ROL $0300,X          ; 3E 00 03 | Rotate left (absolute,X)
    LDA ($35,X)          ; A1 35 | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($35,X)          ; A1 35 | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CLC                  ; 18 | Clear carry flag
    LDA ($35,X)          ; A1 35 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA ($35,X)          ; A1 35 | Read graphics status
    LSR $1E00            ; 4E 00 1E | Logical shift right (absolute)
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    AND #$31             ; 29 31 | Logical AND with accumulator (immediate)
    JMP $1A01            ; 4C 01 1A | Jump to address
    AND $5200            ; 2D 00 52 | Logical AND with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA $5200,X          ; 1D 00 52 | Logical OR with accumulator (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($9A,X)          ; 01 9A | Logical OR with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    INC                  ; 1A | Increment accumulator
    AND $3A00            ; 2D 00 3A | Logical AND with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    AND $7700,Y          ; 39 00 77 | Logical AND with accumulator (absolute,Y)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    DEC                  ; 3A | Decrement accumulator
    ASL $5300,X          ; 1E 00 53 | Arithmetic shift left (absolute,X)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA $3A00,X          ; 1D 00 3A | Logical OR with accumulator (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1D0
; Address: $D1DA78
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1D0:
    ORA $3600,X          ; 1D 00 36 | Logical OR with accumulator (absolute,X)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDY $1D              ; A4 1D | Load from zero page into Y register
    EOR $A401            ; 4D 01 A4 | Exclusive OR with accumulator (absolute)
    ORA $2E00,X          ; 1D 00 2E | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $1D              ; A4 1D | Load from zero page into Y register
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $2F00            ; 2E 00 2F | Rotate left (absolute)
    LDY $1D              ; A4 1D | Load from zero page into Y register
    ROL $00              ; 26 00 | Rotate left (zero page)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDY $1D              ; A4 1D | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1D1
; Address: $D1DAA7
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1D1:
    JSL $003100          ; 22 00 31 00 | Jump to subroutine long
    ORA ($A6,X)          ; 01 A6 | Logical OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    AND $4200,Y          ; 39 00 42 | Hardware register operation
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND $4200,X          ; 3D 00 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    INC                  ; 1A | Increment accumulator
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    WDM #$00             ; 42 00 | Reserved instruction
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    EOR $4200            ; 4D 00 42 | Hardware register operation
    ADC $2601,X          ; 7D 01 26 | Add with carry (absolute,X)
    EOR $4600            ; 4D 00 46 | Exclusive OR with accumulator (absolute)
    LDY $4D              ; A4 4D | Load from zero page into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    LDY $4D              ; A4 4D | Load from zero page into Y register
    LSR $2100            ; 4E 00 21 | PPU graphics register access
    PLA                  ; 68 | Pull accumulator from stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LSR $4400            ; 4E 00 44 | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LSR $1D00            ; 4E 00 1D | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LSR $0300            ; 4E 00 03 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1D2
; Address: $D1DB22
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1D2:
    STX $41              ; 86 41 | Store X register to zero page
    LDY $41              ; A4 41 | Load from zero page into Y register
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    LDY $41              ; A4 41 | Load from zero page into Y register
    PHY                  ; 5A | Push Y register to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    EOR $5A00            ; 4D 00 5A | Exclusive OR with accumulator (absolute)
    BMI $00              ; 30 00 | Branch if negative
    ROL                  ; 2A | Rotate left (accumulator)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $35              ; A4 35 | Load from zero page into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $4A00            ; 2D 00 4A | Logical AND with accumulator (absolute)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STX $29              ; 86 29 | Store X register to zero page
    LSR $2C00            ; 4E 00 2C | Logical shift right (absolute)
    LDY $29              ; A4 29 | Load from zero page into Y register
    BVC $01              ; 50 01 | Branch if overflow clear
    PLA                  ; 68 | Pull accumulator from stack
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    AND $7E00,Y          ; 39 00 7E | Logical AND with accumulator (absolute,Y)
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $5200,X          ; 1D 00 52 | Logical OR with accumulator (absolute,X)
    AND $1C00            ; 2D 00 1C | Logical AND with accumulator (absolute)
    STX $1D              ; 86 1D | Store X register to zero page
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    LDY $1D              ; A4 1D | Load from zero page into Y register
    PHY                  ; 5A | Push Y register to stack
    LDY $1D              ; A4 1D | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1D3
; Address: $D1DBC7
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1D3:
    LSR $3000,X          ; 5E 00 30 | Logical shift right (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROL $0100,X          ; 3E 00 01 | Rotate left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $3E00            ; 2D 00 3E | Logical AND with accumulator (absolute)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    BIT #$2D             ; 89 2D | Test bits in accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    AND $1C00            ; 2D 00 1C | Logical AND with accumulator (absolute)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    DEC                  ; 3A | Decrement accumulator
    ADC $8901,Y          ; 79 01 89 | Add with carry (absolute,Y)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    LDA ($25,X)          ; A1 25 | Read graphics status

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1D4
; Address: $D1DC08
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1D4:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    LDA ($25,X)          ; A1 25 | Read graphics status
    ROL $0100            ; 2E 00 01 | Rotate left (absolute)
    LDA ($25,X)          ; A1 25 | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $2A00,X          ; 1D 00 2A | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BIT #$1D             ; 89 1D | Test bits in accumulator (immediate)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($1D,X)          ; A1 1D | Read graphics status

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1D5
; Address: $D1DC3C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1D5:
    JSL $003000          ; 22 00 30 00 | Jump to subroutine long
    LDX #$35             ; A2 35 | Load immediate value into X register
    ROL $4B00,X          ; 3E 00 4B | Rotate left (absolute,X)
    STZ $35              ; 64 35 | Store zero to zero page
    DEC                  ; 3A | Decrement accumulator
    LDY $35              ; A4 35 | Load from zero page into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $35              ; A4 35 | Load from zero page into Y register
    AND $7A00,Y          ; 39 00 7A | Logical AND with accumulator (absolute,Y)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    ROL $4800            ; 2E 00 48 | Rotate left (absolute)
    LDY $35              ; A4 35 | Load from zero page into Y register
    ROL                  ; 2A | Rotate left (accumulator)
    LDY $35              ; A4 35 | Load from zero page into Y register
    ROL $00              ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1D8
; Address: $D1DC8D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1D8:
    JSL $000100          ; 22 00 01 00 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $2200,X          ; 3D 00 22 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1D9
; Address: $D1DC98
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1D9:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1DA
; Address: $D1DC9F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1DA:
    JSL $003600          ; 22 00 36 00 | Jump to subroutine long
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1DB
; Address: $D1DCA8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1DB:
    JSL $001D00          ; 22 00 1D 00 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1DC
; Address: $D1DCB1
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1DC:
    JSL $002C00          ; 22 00 2C 00 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $2200            ; 4D 00 22 | Exclusive OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    EOR $2600            ; 4D 00 26 | Exclusive OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($4D,X)          ; A1 4D | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    AND $1C00            ; 2D 00 1C | Logical AND with accumulator (absolute)
    LDA ($4D,X)          ; A1 4D | Read graphics status
    ROL $3F00            ; 2E 00 3F | Rotate left (absolute)
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    LDA ($4D,X)          ; A1 4D | Read graphics status
    LDA ($4D,X)          ; A1 4D | Read graphics status
    LDA ($4D,X)          ; A1 4D | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    WDM #$00             ; 42 00 | Reserved instruction
    AND #$49             ; 29 49 | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    INC                  ; 1A | Increment accumulator
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    DEC                  ; 3A | Decrement accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($A6,X)          ; 01 A6 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1DD
; Address: $D1DD28
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1DD:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    LDY $35              ; A4 35 | Load from zero page into Y register
    LSR $3C00            ; 4E 00 3C | Logical shift right (absolute)
    STY $01              ; 84 01 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1DE
; Address: $D1DD35
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1DE:
    LDY $35              ; A4 35 | Load from zero page into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $35              ; A4 35 | Load from zero page into Y register
    LSR $00              ; 46 00 | Logical shift right (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    WDM #$00             ; 42 00 | Reserved instruction
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LDY $35              ; A4 35 | Load from zero page into Y register
    ROL $0E00,X          ; 3E 00 0E | Rotate left (absolute,X)
    LDY $35              ; A4 35 | Load from zero page into Y register
    DEC                  ; 3A | Decrement accumulator
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    AND $3A00,Y          ; 39 00 3A | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $3A00,X          ; 3D 00 3A | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    AND $3E00,X          ; 3D 00 3E | Logical AND with accumulator (absolute,X)
    STA $01              ; 85 01 | Update graphics data
    LDA ($3D,X)          ; A1 3D | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    LDA ($3D,X)          ; A1 3D | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDA ($3D,X)          ; A1 3D | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    BIT #$41             ; 89 41 | Test bits in accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LSR $0300            ; 4E 00 03 | Logical shift right (absolute)
    BIT #$45             ; 89 45 | Test bits in accumulator (immediate)
    LSR $1E00            ; 4E 00 1E | Logical shift right (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1DF
; Address: $D1DDB2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1DF:
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LSR $0100            ; 4E 00 01 | Logical shift right (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1E0
; Address: $D1DDC1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1E0:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    LDY $49              ; A4 49 | Load from zero page into Y register
    LSR $00              ; 46 00 | Logical shift right (zero page)
    STX $01              ; 86 01 | Store X register to zero page
    LDY $49              ; A4 49 | Load from zero page into Y register
    WDM #$00             ; 42 00 | Reserved instruction
    ROL $45              ; 26 45 | Rotate left (zero page)
    WDM #$00             ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1E1
; Address: $D1DDE0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1E1:
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ROL $0100,X          ; 3E 00 01 | Rotate left (absolute,X)
    LDY $45              ; A4 45 | Load from zero page into Y register
    DEC                  ; 3A | Decrement accumulator
    ROL $3000            ; 2E 00 30 | Rotate left (absolute)
    LDY $45              ; A4 45 | Load from zero page into Y register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDY $45              ; A4 45 | Load from zero page into Y register
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ROL $0300            ; 2E 00 03 | Rotate left (absolute)
    LDY $45              ; A4 45 | Load from zero page into Y register
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LDY $45              ; A4 45 | Load from zero page into Y register
    ROL $00              ; 26 00 | Rotate left (zero page)
    LDY $45              ; A4 45 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1E3
; Address: $D1DE2B
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1E3:
    JSL $000200          ; 22 00 02 00 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $2200            ; 4D 00 22 | Exclusive OR with accumulator (absolute)
    ROR $01              ; 66 01 | Rotate right (zero page)
    EOR $2600            ; 4D 00 26 | Exclusive OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($4D,X)          ; A1 4D | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    LDA ($4D,X)          ; A1 4D | Read graphics status
    ROL $3900            ; 2E 00 39 | Rotate left (absolute)
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    EOR $3200            ; 4D 00 32 | Exclusive OR with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    AND #$49             ; 29 49 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND $3A00            ; 2D 00 3A | Logical AND with accumulator (absolute)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    AND $3E00            ; 2D 00 3E | Logical AND with accumulator (absolute)
    AND $8800,Y          ; 39 00 88 | Logical AND with accumulator (absolute,Y)
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    AND $4200            ; 2D 00 42 | Hardware register operation
    LDA ($2D,X)          ; A1 2D | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDA ($2D,X)          ; A1 2D | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1E4
; Address: $D1DE9B
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1E4:
    BIT #$01             ; 89 01 | Test bits in accumulator (immediate)
    AND #$29             ; 29 29 | Logical AND with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LSR $2100            ; 4E 00 21 | PPU graphics register access
    AND #$25             ; 29 25 | Logical AND with accumulator (immediate)
    LSR $1E00            ; 4E 00 1E | Logical shift right (absolute)
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LSR $1900            ; 4E 00 19 | Logical shift right (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY $21              ; A4 21 | PPU graphics register access
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $21              ; A4 21 | PPU graphics register access
    WDM #$00             ; 42 00 | Reserved instruction
    STX $25              ; 86 25 | Store X register to zero page
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $4400,X          ; 3E 00 44 | Rotate left (absolute,X)
    LDY $25              ; A4 25 | Load from zero page into Y register
    DEC                  ; 3A | Decrement accumulator
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDY $25              ; A4 25 | Load from zero page into Y register
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LDY $25              ; A4 25 | Load from zero page into Y register
    LDY $25              ; A4 25 | Load from zero page into Y register
    ROL $0500            ; 2E 00 05 | Rotate left (absolute)
    LSR $29              ; 46 29 | Logical shift right (zero page)
    ROL $3900            ; 2E 00 39 | Rotate left (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    AND $2E00            ; 2D 00 2E | Logical AND with accumulator (absolute)
    WDM #$00             ; 42 00 | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROL $0100            ; 2E 00 01 | Rotate left (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL $2C00            ; 2E 00 2C | Rotate left (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    ROL                  ; 2A | Rotate left (accumulator)
    LDY $35              ; A4 35 | Load from zero page into Y register
    ROL $00              ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1E7
; Address: $D1DF4B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1E7:
    JSL $002D00          ; 22 00 2D 00 | Jump to subroutine long
    ORA $2600,X          ; 1D 00 26 | Logical OR with accumulator (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1E8
; Address: $D1DF54
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1E8:
    JSL $001D00          ; 22 00 1D 00 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    AND $2200            ; 2D 00 22 | Logical AND with accumulator (absolute)
    PHB                  ; 8B | Push data bank register to stack
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1E9
; Address: $D1DF66
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1E9:
    JSL $002700          ; 22 00 27 00 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1EA
; Address: $D1DF6F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1EA:
    JSL $001C00          ; 22 00 1C 00 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1EB
; Address: $D1DF78
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1EB:
    JSL $004400          ; 22 00 44 00 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    ORA $2200,X          ; 1D 00 22 | Logical OR with accumulator (absolute,X)
    ORA ($92,X)          ; 01 92 | Logical OR with accumulator ((zero page,X))
    ORA $2600,X          ; 1D 00 26 | Logical OR with accumulator (absolute,X)
    LDA ($1D,X)          ; A1 1D | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $00              ; 26 00 | Rotate left (zero page)
    LDA ($1D,X)          ; A1 1D | Read graphics status
    ROL $3F00            ; 2E 00 3F | Rotate left (absolute)
    LSR $8901,X          ; 5E 01 89 | Logical shift right (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ROL $0100            ; 2E 00 01 | Rotate left (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $2600            ; 4D 00 26 | Exclusive OR with accumulator (absolute)
    BMI $00              ; 30 00 | Branch if negative
    ROL                  ; 2A | Rotate left (accumulator)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    AND $8F00,Y          ; 39 00 8F | Logical AND with accumulator (absolute,Y)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND $2600,X          ; 3D 00 26 | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    AND $2A00,X          ; 3D 00 2A | Logical AND with accumulator (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LDA ($3D,X)          ; A1 3D | Read graphics status

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1EC
; Address: $D1DFE4
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1EC:
    ROL $0300            ; 2E 00 03 | Rotate left (absolute)
    LDA ($3D,X)          ; A1 3D | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    LDA ($3D,X)          ; A1 3D | Read graphics status
    AND $1D00            ; 2D 00 1D | Logical AND with accumulator (absolute)
    LDA ($3D,X)          ; A1 3D | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    BPL $00              ; 10 00 | Branch if positive
    LDA ($3D,X)          ; A1 3D | Read graphics status
    ROL $0200,X          ; 3E 00 02 | Rotate left (absolute,X)
    LDA ($3D,X)          ; A1 3D | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    LDA ($3D,X)          ; A1 3D | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    AND #$39             ; 29 39 | Logical AND with accumulator (immediate)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    BCC $01              ; 90 01 | Branch if carry clear
    INC                  ; 1A | Increment accumulator
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    INC                  ; 1A | Increment accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    AND $4600            ; 2D 00 46 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1ED
; Address: $D1E040
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1ED:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $25              ; A4 25 | Load from zero page into Y register
    ROL $0200,X          ; 3E 00 02 | Rotate left (absolute,X)
    LDY $25              ; A4 25 | Load from zero page into Y register
    DEC                  ; 3A | Decrement accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    INC                  ; 1A | Increment accumulator
    AND $3A00            ; 2D 00 3A | Logical AND with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1EE
; Address: $D1E08C
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1EE:
    INC                  ; 1A | Increment accumulator
    DEC                  ; 3A | Decrement accumulator
    AND #$35             ; 29 35 | Logical AND with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    LDA ($35,X)          ; A1 35 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    ROL $4100            ; 2E 00 41 | Rotate left (absolute)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROL $0100            ; 2E 00 01 | Rotate left (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $2E00            ; 2D 00 2E | Logical AND with accumulator (absolute)
    JMP $4D00            ; 4C 00 4D | Jump to address
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ROL $0100            ; 2E 00 01 | Rotate left (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $0200            ; 2E 00 02 | Rotate left (absolute)
    STX $25              ; 86 25 | Store X register to zero page
    RTI                  ; 40 | Return from interrupt
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    AND $9100,Y          ; 39 00 91 | Logical AND with accumulator (absolute,Y)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    ORA $2600,X          ; 1D 00 26 | Logical OR with accumulator (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    LDX #$1D             ; A2 1D | Load immediate value into X register
    ROL                  ; 2A | Rotate left (accumulator)
    LDA ($1D,X)          ; A1 1D | Read graphics status
    ROL $0100            ; 2E 00 01 | Rotate left (absolute)
    LDA ($1D,X)          ; A1 1D | Read graphics status

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1EF
; Address: $D1E106
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1EF:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    LDA ($1D,X)          ; A1 1D | Read graphics status
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    LDA ($1D,X)          ; A1 1D | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($1D,X)          ; A1 1D | Read graphics status
    ROL $3C00,X          ; 3E 00 3C | Rotate left (absolute,X)
    STY $A101            ; 8C 01 A1 | Store Y register to absolute address
    ORA $4200,X          ; 1D 00 42 | Hardware register operation
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDA ($1D,X)          ; A1 1D | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA ($1D,X)          ; A1 1D | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA ($1D,X)          ; A1 1D | Read graphics status
    LSR $3600            ; 4E 00 36 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1F0
; Address: $D1E147
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1F0:
    STA $8901            ; 8D 01 89 | Update graphics data
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LSR $0100            ; 4E 00 01 | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    LSR $4200            ; 4E 00 42 | Hardware register operation
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LSR $0300            ; 4E 00 03 | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $4E00            ; 2D 00 4E | Logical AND with accumulator (absolute)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LSR $4100            ; 4E 00 41 | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR $0100            ; 4E 00 01 | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $4E00,Y          ; 39 00 4E | Logical AND with accumulator (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $4E00,X          ; 3D 00 4E | Logical AND with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LSR $0200            ; 4E 00 02 | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LSR $3900            ; 4E 00 39 | Logical shift right (absolute)
    STX $4A01            ; 8E 01 4A | Store X register to absolute address
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LSR $3F00            ; 4E 00 3F | Logical shift right (absolute)
    STZ $01              ; 64 01 | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    STX $4D              ; 86 4D | Store X register to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    EOR $4600            ; 4D 00 46 | Exclusive OR with accumulator (absolute)
    LDY $4D              ; A4 4D | Load from zero page into Y register
    WDM #$00             ; 42 00 | Reserved instruction
    JMP $A601            ; 4C 01 A6 | Jump to address
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LSR $0100            ; 4E 00 01 | Logical shift right (absolute)
    LDY $41              ; A4 41 | Load from zero page into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1F1
; Address: $D1E1EB
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1F1:
    STX $45              ; 86 45 | Store X register to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $45              ; A4 45 | Load from zero page into Y register
    WDM #$00             ; 42 00 | Reserved instruction
    AND $9B00,Y          ; 39 00 9B | Logical AND with accumulator (absolute,Y)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ROL $0100,X          ; 3E 00 01 | Rotate left (absolute,X)
    LDY $45              ; A4 45 | Load from zero page into Y register
    DEC                  ; 3A | Decrement accumulator
    STZ $A401            ; 9C 01 A4 | Store zero to absolute
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LDY $45              ; A4 45 | Load from zero page into Y register
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ROL $41              ; 26 41 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND $3200,X          ; 3D 00 32 | Logical AND with accumulator (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND $3600,X          ; 3D 00 36 | Logical AND with accumulator (absolute,X)
    AND #$39             ; 29 39 | Logical AND with accumulator (immediate)
    AND $3A00,Y          ; 39 00 3A | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND #$35             ; 29 35 | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $0200,X          ; 3E 00 02 | Rotate left (absolute,X)
    LDA ($35,X)          ; A1 35 | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($35,X)          ; A1 35 | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    LDA ($35,X)          ; A1 35 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA ($35,X)          ; A1 35 | Read graphics status
    LSR $2300            ; 4E 00 23 | Logical shift right (absolute)
    LDA ($35,X)          ; A1 35 | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($35,X)          ; A1 35 | Read graphics status
    LDA ($35,X)          ; A1 35 | Read graphics status
    PHY                  ; 5A | Push Y register to stack
    INC                  ; 1A | Increment accumulator
    BIT #$39             ; 89 39 | Test bits in accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1F2
; Address: $D1E2B2
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1F2:
    AND $5E00,Y          ; 39 00 5E | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT #$3D             ; 89 3D | Test bits in accumulator (immediate)
    LSR $2800,X          ; 5E 00 28 | Logical shift right (absolute,X)
    AND $6200,X          ; 3D 00 62 | Logical AND with accumulator (absolute,X)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    BIT #$41             ; 89 41 | Test bits in accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LSR $0100,X          ; 5E 00 01 | Logical shift right (absolute,X)
    STX $49              ; 86 49 | Store X register to zero page
    LSR $1D00,X          ; 5E 00 1D | Logical shift right (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    STX $4D              ; 86 4D | Store X register to zero page
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1F3
; Address: $D1E2FE
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1F3:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    EOR $5600            ; 4D 00 56 | Exclusive OR with accumulator (absolute)
    LDY $4D              ; A4 4D | Load from zero page into Y register
    AND $9D00,Y          ; 39 00 9D | Logical AND with accumulator (absolute,Y)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    EOR $4E00            ; 4D 00 4E | Exclusive OR with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    LDY $4D              ; A4 4D | Load from zero page into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $4D              ; A4 4D | Load from zero page into Y register
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LDY $4D              ; A4 4D | Load from zero page into Y register
    WDM #$00             ; 42 00 | Reserved instruction
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    EOR $3E00            ; 4D 00 3E | Exclusive OR with accumulator (absolute)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDY $4D              ; A4 4D | Load from zero page into Y register
    DEC                  ; 3A | Decrement accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $4D              ; A4 4D | Load from zero page into Y register
    STZ $A401,X          ; 9E 01 A4 | Store zero to absolute,X
    EOR $3200            ; 4D 00 32 | Exclusive OR with accumulator (absolute)
    LDY $4D              ; A4 4D | Load from zero page into Y register
    ROL $1E00            ; 2E 00 1E | Rotate left (absolute)
    BVS $01              ; 70 01 | Branch if overflow set
    LDY $4D              ; A4 4D | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1F4
; Address: $D1E368
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1F4:
    ROL                  ; 2A | Rotate left (accumulator)
    CLC                  ; 18 | Clear carry flag
    LDY $4D              ; A4 4D | Load from zero page into Y register
    ROL $00              ; 26 00 | Rotate left (zero page)
    LDY $4D              ; A4 4D | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1F6
; Address: $D1E383
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1F6:
    JSL $000100          ; 22 00 01 00 | Jump to subroutine long
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ASL $2C00,X          ; 1E 00 2C | Arithmetic shift left (absolute,X)
    ROL $45              ; 26 45 | Rotate left (zero page)
    ASL $0100,X          ; 1E 00 01 | Arithmetic shift left (absolute,X)
    INC                  ; 1A | Increment accumulator
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $3F00,X          ; 1E 00 3F | Arithmetic shift left (absolute,X)
    ROR $1A01            ; 6E 01 1A | Rotate right (absolute)
    AND $1E00,X          ; 3D 00 1E | Logical AND with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $2200,X          ; 3D 00 22 | Logical AND with accumulator (absolute,X)
    AND $9F00,Y          ; 39 00 9F | Logical AND with accumulator (absolute,Y)
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    AND $2200,Y          ; 39 00 22 | Logical AND with accumulator (absolute,Y)
    AND $2600,Y          ; 39 00 26 | Logical AND with accumulator (absolute,Y)
    LDA ($39,X)          ; A1 39 | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND #$35             ; 29 35 | Logical AND with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $7100,X          ; 1E 00 71 | Arithmetic shift left (absolute,X)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROL $2D00            ; 2E 00 2D | Rotate left (absolute)
    ASL $2900,X          ; 1E 00 29 | Arithmetic shift left (absolute,X)
    AND $2E00            ; 2D 00 2E | Logical AND with accumulator (absolute)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ROL $2C00            ; 2E 00 2C | Rotate left (absolute)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($29,X)          ; A1 29 | Read graphics status
    LDA ($29,X)          ; A1 29 | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($29,X)          ; A1 29 | Read graphics status
    ROL $1000,X          ; 3E 00 10 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1F7
; Address: $D1E422
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1F7:
    LDA ($29,X)          ; A1 29 | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LDA ($29,X)          ; A1 29 | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDA ($29,X)          ; A1 29 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $7200,X          ; 1E 00 72 | Arithmetic shift left (absolute,X)
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LSR $0100            ; 4E 00 01 | Logical shift right (absolute)
    LDA ($29,X)          ; A1 29 | Read graphics status
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDA ($29,X)          ; A1 29 | Read graphics status
    LDA ($29,X)          ; A1 29 | Read graphics status
    PHY                  ; 5A | Push Y register to stack
    WDM #$00             ; 42 00 | Reserved instruction
    LDA ($29,X)          ; A1 29 | Read graphics status
    LSR $4500,X          ; 5E 00 45 | Logical shift right (absolute,X)
    AND #$25             ; 29 25 | Logical AND with accumulator (immediate)
    LSR $0100,X          ; 5E 00 01 | Logical shift right (absolute,X)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    LDA ($25,X)          ; A1 25 | Read graphics status
    ROR $00              ; 66 00 | Rotate right (zero page)
    LDA ($01,X)          ; A1 01 | Read graphics status
    AND #$21             ; 29 21 | PPU graphics register access
    ROR $00              ; 66 00 | Rotate right (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $6600,X          ; 1D 00 66 | Logical OR with accumulator (absolute,X)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $6200,X          ; 1D 00 62 | Logical OR with accumulator (absolute,X)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    ROL $19              ; 26 19 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $5E00,Y          ; 19 00 5E | Logical OR with accumulator (absolute,Y)
    ROL $15              ; 26 15 | Rotate left (zero page)
    LSR $1F00,X          ; 5E 00 1F | Logical shift right (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    PHY                  ; 5A | Push Y register to stack
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDY $15              ; A4 15 | Load from zero page into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $15              ; A4 15 | Load from zero page into Y register
    STX $19              ; 86 19 | Store X register to zero page
    PLA                  ; 68 | Pull accumulator from stack
    ORA $4E00,Y          ; 19 00 4E | Logical OR with accumulator (absolute,Y)
    AND $A200,Y          ; 39 00 A2 | Logical AND with accumulator (absolute,Y)
    ORA ($86,X)          ; 01 86 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1F9
; Address: $D1E4ED
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1F9:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    ORA $4A00,X          ; 1D 00 4A | Logical OR with accumulator (absolute,X)
    ASL $7300,X          ; 1E 00 73 | Arithmetic shift left (absolute,X)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    ORA $4600,X          ; 1D 00 46 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $1D              ; A4 1D | Load from zero page into Y register
    WDM #$00             ; 42 00 | Reserved instruction
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ROL $19              ; 26 19 | Rotate left (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $3E00,Y          ; 19 00 3E | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1FA
; Address: $D1E51A
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1FA:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    LDY $19              ; A4 19 | Load from zero page into Y register
    DEC                  ; 3A | Decrement accumulator
    ADC $A401            ; 6D 01 A4 | Add with carry (absolute)
    ORA $3600,Y          ; 19 00 36 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $19              ; A4 19 | Load from zero page into Y register
    STX $1D              ; 86 1D | Store X register to zero page
    AND $1E00            ; 2D 00 1E | Logical AND with accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    ORA $2E00,X          ; 1D 00 2E | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $15              ; A4 15 | Load from zero page into Y register
    ROL                  ; 2A | Rotate left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $2A00,Y          ; 19 00 2A | Logical OR with accumulator (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $2A00,X          ; 1D 00 2A | Logical OR with accumulator (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LSR $21              ; 46 21 | PPU graphics register access
    ROL                  ; 2A | Rotate left (accumulator)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ROL $00              ; 26 00 | Rotate left (zero page)
    LDY $21              ; A4 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1FC
; Address: $D1E584
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1FC:
    JSL $002C00          ; 22 00 2C 00 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ASL $3C00,X          ; 1E 00 3C | Arithmetic shift left (absolute,X)
    ORA ($86,X)          ; 01 86 | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $1800,X          ; 1E 00 18 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1FD
; Address: $D1E59C
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1FD:
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $1E00            ; 2D 00 1E | Logical AND with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ASL $3100,X          ; 1E 00 31 | Arithmetic shift left (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    ORA ($6A,X)          ; 01 6A | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ORA ($9A,X)          ; 01 9A | Logical OR with accumulator ((zero page,X))
    ORA $3A00,Y          ; 19 00 3A | Logical OR with accumulator (absolute,Y)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $3A00,X          ; 1D 00 3A | Logical OR with accumulator (absolute,X)
    LDY $01              ; A4 01 | Load from zero page into Y register
    AND #$1D             ; 29 1D | Logical AND with accumulator (immediate)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDA ($1D,X)          ; A1 1D | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDA ($1D,X)          ; A1 1D | Read graphics status
    ROL $0200            ; 2E 00 02 | Rotate left (absolute)
    LDA ($1D,X)          ; A1 1D | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    LDX #$3D             ; A2 3D | Load immediate value into X register
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    AND $4A00,Y          ; 39 00 4A | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $01              ; A5 01 | Read graphics status
    INC                  ; 1A | Increment accumulator
    AND $4A00            ; 2D 00 4A | Logical AND with accumulator (absolute)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    INC                  ; 1A | Increment accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($6A,X)          ; 01 6A | Logical OR with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROL $00              ; 26 00 | Rotate left (zero page)
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1FE
; Address: $D1E635
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1FE:
    LDX #$31             ; A2 31 | Load immediate value into X register
    ROL                  ; 2A | Rotate left (accumulator)
    AND $1E00            ; 2D 00 1E | Logical AND with accumulator (absolute)
    LDA ($31,X)          ; A1 31 | Read graphics status
    ROL $2400            ; 2E 00 24 | Rotate left (absolute)
    ORA #$35             ; 09 35 | Logical OR with accumulator (immediate)
    ROL $3900            ; 2E 00 39 | Rotate left (absolute)
    LDX $01              ; A6 01 | Load from zero page into X register
    LDA ($35,X)          ; A1 35 | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT #$39             ; 89 39 | Test bits in accumulator (immediate)
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    AND $3A00,Y          ; 39 00 3A | Logical AND with accumulator (absolute,Y)
    LDA ($39,X)          ; A1 39 | Read graphics status
    ROL $0100,X          ; 3E 00 01 | Rotate left (absolute,X)
    BIT #$3D             ; 89 3D | Test bits in accumulator (immediate)
    ROL $2500,X          ; 3E 00 25 | Rotate left (absolute,X)
    AND $4200,X          ; 3D 00 42 | Hardware register operation
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    BIT #$41             ; 89 41 | Test bits in accumulator (immediate)
    WDM #$00             ; 42 00 | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    INC                  ; 1A | Increment accumulator
    BIT #$49             ; 89 49 | Test bits in accumulator (immediate)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT #$4D             ; 89 4D | Test bits in accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $A800,Y          ; 39 00 A8 | Logical AND with accumulator (absolute,Y)
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    EOR $4E00            ; 4D 00 4E | Exclusive OR with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    BIT #$51             ; 89 51 | Test bits in accumulator (immediate)
    LSR $2700            ; 4E 00 27 | Logical shift right (absolute)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    LDA ($51,X)          ; A1 51 | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($51,X)          ; A1 51 | Read graphics status
    PHY                  ; 5A | Push Y register to stack
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDA ($51,X)          ; A1 51 | Read graphics status
    LSR $2700,X          ; 5E 00 27 | Logical shift right (absolute,X)
    AND #$4D             ; 29 4D | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_1FF
; Address: $D1E6FE
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_1FF:
    LSR $0100,X          ; 5E 00 01 | Logical shift right (absolute,X)
    EOR $6200            ; 4D 00 62 | Exclusive OR with accumulator (absolute)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    AND #$49             ; 29 49 | Logical AND with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND #$41             ; 29 41 | Logical AND with accumulator (immediate)
    ROR $00              ; 66 00 | Rotate right (zero page)
    INC                  ; 1A | Increment accumulator
    AND $6600,X          ; 3D 00 66 | Logical AND with accumulator (absolute,X)
    ROL $00              ; 26 00 | Rotate left (zero page)
    INC                  ; 1A | Increment accumulator
    AND $6600,Y          ; 39 00 66 | Logical AND with accumulator (absolute,Y)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ROR $00              ; 66 00 | Rotate right (zero page)
    PLP                  ; 28 | Pull processor status from stack
    INC                  ; 1A | Increment accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROR $00              ; 66 00 | Rotate right (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDY $2D              ; A4 2D | Load from zero page into Y register
    ROL $0200            ; 2E 00 02 | Rotate left (absolute)
    AND $3200            ; 2D 00 32 | Logical AND with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($2D,X)          ; A1 2D | Read graphics status
    AND #$29             ; 29 29 | Logical AND with accumulator (immediate)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    WDM #$00             ; 42 00 | Reserved instruction
    LDA ($29,X)          ; A1 29 | Read graphics status
    ROL $2100,X          ; 3E 00 21 | PPU graphics register access
    AND #$25             ; 29 25 | Logical AND with accumulator (immediate)
    ROL $1000,X          ; 3E 00 10 | Rotate left (absolute,X)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    AND #$21             ; 29 21 | PPU graphics register access
    WDM #$00             ; 42 00 | Reserved instruction
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA $4200,X          ; 1D 00 42 | Hardware register operation
    ORA ($92,X)          ; 01 92 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_200
; Address: $D1E7B9
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_200:
    ORA $4600,X          ; 1D 00 46 | Logical OR with accumulator (absolute,X)
    AND #$19             ; 29 19 | Logical AND with accumulator (immediate)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $4A00,Y          ; 19 00 4A | Logical OR with accumulator (absolute,Y)
    AND #$15             ; 29 15 | Logical AND with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LSR $4100            ; 4E 00 41 | Logical shift right (absolute)
    AND #$11             ; 29 11 | Logical AND with accumulator (immediate)
    LSR $0100            ; 4E 00 01 | Logical shift right (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    LDA ($11,X)          ; A1 11 | Read graphics status
    PHY                  ; 5A | Push Y register to stack
    AND $A900,Y          ; 39 00 A9 | Logical AND with accumulator (absolute,Y)
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    LSR $1C00,X          ; 5E 00 1C | Logical shift right (absolute,X)
    BIT #$15             ; 89 15 | Test bits in accumulator (immediate)
    LSR $0300,X          ; 5E 00 03 | Logical shift right (absolute,X)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    BIT #$19             ; 89 19 | Test bits in accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $6200,X          ; 1D 00 62 | Logical OR with accumulator (absolute,X)
    ORA $6600,X          ; 1D 00 66 | Logical OR with accumulator (absolute,X)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    BIT #$21             ; 89 21 | PPU graphics register access
    ROR $00              ; 66 00 | Rotate right (zero page)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ADC $4A01,Y          ; 79 01 4A | Add with carry (absolute,Y)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ROR $00              ; 66 00 | Rotate right (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    AND $6600            ; 2D 00 66 | Logical AND with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LSR $0400,X          ; 5E 00 04 | Logical shift right (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $31              ; A4 31 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_201
; Address: $D1E87A
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_201:
    ASL $7E00,X          ; 1E 00 7E | Arithmetic shift left (absolute,X)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    STX $39              ; 86 39 | Store X register to zero page
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $5200,X          ; 3D 00 52 | Logical AND with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($45,X)          ; A1 45 | Read graphics status
    PHY                  ; 5A | Push Y register to stack
    CLC                  ; 18 | Clear carry flag
    AND #$41             ; 29 41 | Logical AND with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    PLB                  ; AB | Pull data bank register from stack
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND $5A00,X          ; 3D 00 5A | Logical AND with accumulator (absolute,X)
    AND $5E00,X          ; 3D 00 5E | Logical AND with accumulator (absolute,X)
    AND #$39             ; 29 39 | Logical AND with accumulator (immediate)
    LSR $0300,X          ; 5E 00 03 | Logical shift right (absolute,X)
    INC                  ; 1A | Increment accumulator
    LSR $2100,X          ; 5E 00 21 | PPU graphics register access
    INC                  ; 1A | Increment accumulator
    AND $5600            ; 2D 00 56 | Logical AND with accumulator (absolute)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    AND $5200            ; 2D 00 52 | Logical AND with accumulator (absolute)
    AND $AC00,Y          ; 39 00 AC | Logical AND with accumulator (absolute,Y)
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_202
; Address: $D1E91C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_202:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    ORA $5200,X          ; 1D 00 52 | Logical OR with accumulator (absolute,X)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ORA $5600,X          ; 1D 00 56 | Logical OR with accumulator (absolute,X)
    LDA ($1D,X)          ; A1 1D | Read graphics status
    PHY                  ; 5A | Push Y register to stack
    RTI                  ; 40 | Return from interrupt
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_203
; Address: $D1E93C
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_203:
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    LSR $3F00,X          ; 5E 00 3F | Logical shift right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LSR $4100,X          ; 5E 00 41 | Logical shift right (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $5E00            ; 2D 00 5E | Logical AND with accumulator (absolute)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $2600            ; 2D 00 26 | Logical AND with accumulator (absolute)
    LDX $1A01            ; AE 01 1A | Load from absolute address into X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ROL $00              ; 26 00 | Rotate left (zero page)
    ROL $3100            ; 2E 00 31 | Rotate left (absolute)
    INC                  ; 1A | Increment accumulator
    ORA $2600,X          ; 1D 00 26 | Logical OR with accumulator (absolute,X)
    ORA ($9A,X)          ; 01 9A | Logical OR with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROL $00              ; 26 00 | Rotate left (zero page)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ASL $35              ; 06 35 | Arithmetic shift left (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $2600,Y          ; 39 00 26 | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $2600,X          ; 3D 00 26 | Logical AND with accumulator (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ROL $00              ; 26 00 | Rotate left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_204
; Address: $D1E9C7
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_204:
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $2600            ; 4D 00 26 | Exclusive OR with accumulator (absolute)
    BCS $01              ; B0 01 | Branch if carry set
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL $00              ; 26 00 | Rotate left (zero page)
    LDA ($01),Y          ; B1 01 | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    LDA ($55,X)          ; A1 55 | Read graphics status
    ROL $0100            ; 2E 00 01 | Rotate left (absolute)
    LDA ($55,X)          ; A1 55 | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    LDA ($55,X)          ; A1 55 | Read graphics status
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDA ($55,X)          ; A1 55 | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    LDA ($55,X)          ; A1 55 | Read graphics status
    ROL $4100,X          ; 3E 00 41 | Rotate left (absolute,X)
    LDA ($55,X)          ; A1 55 | Read graphics status
    WDM #$00             ; 42 00 | Reserved instruction
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    STA $01              ; 85 01 | Update graphics data
    LDA #$1D             ; A9 1D | Read graphics status
    BMI $00              ; 30 00 | Branch if negative
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $5200,X          ; 1D 00 52 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $1D              ; A4 1D | Load from zero page into Y register
    LSR $0F00            ; 4E 00 0F | Logical shift right (absolute)
    LDY $1D              ; A4 1D | Load from zero page into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY $1D              ; A4 1D | Load from zero page into Y register
    LSR $00              ; 46 00 | Logical shift right (zero page)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LDY $1D              ; A4 1D | Load from zero page into Y register
    WDM #$00             ; 42 00 | Reserved instruction
    AND $AD00,Y          ; 39 00 AD | Logical AND with accumulator (absolute,Y)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    ORA $3E00,X          ; 1D 00 3E | Logical OR with accumulator (absolute,X)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    STX $21              ; 86 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_205
; Address: $D1EA70
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_205:
    ROL $0300,X          ; 3E 00 03 | Rotate left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $4100,X          ; 3E 00 41 | Rotate left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ROL $1C00,X          ; 3E 00 1C | Rotate left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $3E00            ; 2D 00 3E | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_206
; Address: $D1EA8D
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_206:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROL $2D00,X          ; 3E 00 2D | Rotate left (absolute,X)
    ASL $4800,X          ; 1E 00 48 | Arithmetic shift left (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $31              ; A4 31 | Load from zero page into Y register
    LDY $31              ; A4 31 | Load from zero page into Y register
    LDA $31A401          ; AF 01 A4 31 | Read graphics status
    ROL $0200            ; 2E 00 02 | Rotate left (absolute)
    LDY $31              ; A4 31 | Load from zero page into Y register
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $35              ; A4 35 | Load from zero page into Y register
    ROL $0200,X          ; 3E 00 02 | Rotate left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $3E00,Y          ; 39 00 3E | Logical AND with accumulator (absolute,Y)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $3E00,X          ; 3D 00 3E | Logical AND with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ROL $1C00,X          ; 3E 00 1C | Rotate left (absolute,X)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($41,X)          ; A1 41 | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDA ($41,X)          ; A1 41 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LSR $0200            ; 4E 00 02 | Logical shift right (absolute)
    LDA ($41,X)          ; A1 41 | Read graphics status
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    LDA ($41,X)          ; A1 41 | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($41,X)          ; A1 41 | Read graphics status
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_207
; Address: $D1EB26
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_207:
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ORA #$3D             ; 09 3D | Logical OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND $5A00,Y          ; 39 00 5A | Logical AND with accumulator (absolute,Y)
    AND $B300,Y          ; 39 00 B3 | Logical AND with accumulator (absolute,Y)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND $5A00            ; 2D 00 5A | Logical AND with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    ORA ($98,X)          ; 01 98 | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LDY $29              ; A4 29 | Load from zero page into Y register
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    LDY $29              ; A4 29 | Load from zero page into Y register
    LSR $0100            ; 4E 00 01 | Logical shift right (absolute)
    LDY $29              ; A4 29 | Load from zero page into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    STA ($01,X)          ; 81 01 | Update graphics data
    LDX $45              ; A6 45 | Load from zero page into X register
    PHY                  ; 5A | Push Y register to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $5A00            ; 4D 00 5A | Exclusive OR with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    EOR $5600            ; 4D 00 56 | Exclusive OR with accumulator (absolute)
    LDY $4D              ; A4 4D | Load from zero page into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $4D              ; A4 4D | Load from zero page into Y register
    LSR $3900            ; 4E 00 39 | Logical shift right (absolute)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    EOR $4A00            ; 4D 00 4A | Exclusive OR with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    LDY $4D              ; A4 4D | Load from zero page into Y register
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_208
; Address: $D1EBCC
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_208:
    LDY $4D              ; A4 4D | Load from zero page into Y register
    WDM #$00             ; 42 00 | Reserved instruction
    WDM #$00             ; 42 00 | Reserved instruction
    LDY $4D              ; A4 4D | Load from zero page into Y register
    ROL $2D00,X          ; 3E 00 2D | Rotate left (absolute,X)
    ASL $A400,X          ; 1E 00 A4 | Arithmetic shift left (absolute,X)
    EOR $3A00            ; 4D 00 3A | Exclusive OR with accumulator (absolute)
    LDY $4D              ; A4 4D | Load from zero page into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $4D              ; A4 4D | Load from zero page into Y register
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ROL $49              ; 26 49 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND $3200,X          ; 3D 00 32 | Logical AND with accumulator (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    STY $01              ; 84 01 | Store Y register to zero page
    TXS                  ; 9A | Transfer X register to stack pointer
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    PHY                  ; 5A | Push Y register to stack
    LSR $2000,X          ; 5E 00 20 | Logical shift right (absolute,X)
    LDA ($55,X)          ; A1 55 | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($55,X)          ; A1 55 | Read graphics status
    ROR $00              ; 66 00 | Rotate right (zero page)
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    EOR $6600            ; 4D 00 66 | Exclusive OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ROR $00              ; 66 00 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_209
; Address: $D1EC76
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_209:
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND $6600,X          ; 3D 00 66 | Logical AND with accumulator (absolute,X)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND $6600,Y          ; 39 00 66 | Logical AND with accumulator (absolute,Y)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    INC                  ; 1A | Increment accumulator
    ROR $00              ; 66 00 | Rotate right (zero page)
    INC                  ; 1A | Increment accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ADC $1A01,X          ; 7D 01 1A | Add with carry (absolute,X)
    AND $6600            ; 2D 00 66 | Logical AND with accumulator (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ROR $00              ; 66 00 | Rotate right (zero page)
    AND $1E00            ; 2D 00 1E | Logical AND with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($9A,X)          ; 01 9A | Logical OR with accumulator ((zero page,X))
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    BMI $00              ; 30 00 | Branch if negative
    ROL                  ; 2A | Rotate left (accumulator)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND $7200,X          ; 3D 00 72 | Logical AND with accumulator (absolute,X)
    AND $1E00            ; 2D 00 1E | Logical AND with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    AND $7200,Y          ; 39 00 72 | Logical AND with accumulator (absolute,Y)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROR $4B00            ; 6E 00 4B | Rotate right (absolute)
    LDY $31              ; A4 31 | Load from zero page into Y register
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $1D              ; A4 1D | Load from zero page into Y register
    BMI $00              ; 30 00 | Branch if negative
    TXA                  ; 8A | Transfer X register to accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_20A
; Address: $D1ED11
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_20A:
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $3200            ; 2E 00 32 | Rotate left (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $7200            ; 2D 00 72 | Logical AND with accumulator (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ROR $00              ; 66 00 | Rotate right (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $6600,Y          ; 39 00 66 | Logical AND with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    BRA $01              ; 80 01 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    AND $6200,Y          ; 39 00 62 | Logical AND with accumulator (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY $39              ; A4 39 | Load from zero page into Y register
    LSR $2000,X          ; 5E 00 20 | Logical shift right (absolute,X)
    LDY $39              ; A4 39 | Load from zero page into Y register
    PHY                  ; 5A | Push Y register to stack
    LDY $39              ; A4 39 | Load from zero page into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $01              ; 80 01 | Branch always
    ROL $35              ; 26 35 | Rotate left (zero page)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ASL $8400,X          ; 1E 00 84 | Arithmetic shift left (absolute,X)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND $5600            ; 2D 00 56 | Logical AND with accumulator (absolute)
    AND $B800,Y          ; 39 00 B8 | Logical AND with accumulator (absolute,Y)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $01              ; 80 01 | Branch always
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    LDA ($29,X)          ; A1 29 | Read graphics status
    LSR $2000,X          ; 5E 00 20 | Logical shift right (absolute,X)
    LDA ($29,X)          ; A1 29 | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDA ($29,X)          ; A1 29 | Read graphics status
    ROR $00              ; 66 00 | Rotate right (zero page)
    RTI                  ; 40 | Return from interrupt
    BRA $01              ; 80 01 | Branch always
    BIT #$2D             ; 89 2D | Test bits in accumulator (immediate)
    ROR $00              ; 66 00 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_20B
; Address: $D1EDBB
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_20B:
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $5E00,X          ; 1D 00 5E | Logical OR with accumulator (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $5A00,X          ; 1D 00 5A | Logical OR with accumulator (absolute,X)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LDY $1D              ; A4 1D | Load from zero page into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $1D              ; A4 1D | Load from zero page into Y register
    LDY $1D              ; A4 1D | Load from zero page into Y register
    LSR $4300            ; 4E 00 43 | Logical shift right (absolute)
    STX $21              ; 86 21 | PPU graphics register access
    LSR $2200            ; 4E 00 22 | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    LSR $2600            ; 4E 00 26 | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LSR $1C00            ; 4E 00 1C | Logical shift right (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    RTI                  ; 40 | Return from interrupt
    BRA $01              ; 80 01 | Branch always
    STX $2D              ; 86 2D | Store X register to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    RTI                  ; 40 | Return from interrupt
    BRA $01              ; 80 01 | Branch always
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LSR $3000,X          ; 5E 00 30 | Logical shift right (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LDY $45              ; A4 45 | Load from zero page into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $45              ; A4 45 | Load from zero page into Y register
    LDY $45              ; A4 45 | Load from zero page into Y register
    LSR $4300            ; 4E 00 43 | Logical shift right (absolute)
    ROL $41              ; 26 41 | Rotate left (zero page)
    LSR $2200            ; 4E 00 22 | Logical shift right (absolute)
    INC                  ; 1A | Increment accumulator
    AND $4E00,X          ; 3D 00 4E | Logical AND with accumulator (absolute,X)
    ROL $00              ; 26 00 | Rotate left (zero page)
    INC                  ; 1A | Increment accumulator
    AND $4E00,Y          ; 39 00 4E | Logical AND with accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    AND $4A00,Y          ; 39 00 4A | Logical AND with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_20C
; Address: $D1EE64
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_20C:
    BRA $01              ; 80 01 | Branch always
    ROL $35              ; 26 35 | Rotate left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    RTI                  ; 40 | Return from interrupt
    BRA $01              ; 80 01 | Branch always
    INC                  ; 1A | Increment accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LSR $3000            ; 4E 00 30 | Logical shift right (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDY $31              ; A4 31 | Load from zero page into Y register
    WDM #$00             ; 42 00 | Reserved instruction
    AND $B900,Y          ; 39 00 B9 | Logical AND with accumulator (absolute,Y)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROL $4500,X          ; 3E 00 45 | Rotate left (absolute,X)
    LDY $31              ; A4 31 | Load from zero page into Y register
    DEC                  ; 3A | Decrement accumulator
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    LDY $31              ; A4 31 | Load from zero page into Y register
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    LDY $31              ; A4 31 | Load from zero page into Y register
    LDY $31              ; A4 31 | Load from zero page into Y register
    ROL $0100            ; 2E 00 01 | Rotate left (absolute)
    LDY $31              ; A4 31 | Load from zero page into Y register
    ROL                  ; 2A | Rotate left (accumulator)
    LSR $A601            ; 4E 01 A6 | Logical shift right (absolute)
    LDA $C3              ; A5 C3 | Read graphics status
    CMP ($C5,X)          ; C1 C5 | Compare accumulator ((zero page,X))
    CMP $22              ; C5 22 | Compare accumulator (zero page)
    JMP ($A66A)          ; 6C 6A A6 | Jump to address (absolute indirect)
    CMP ($E7,X)          ; C1 E7 | Compare accumulator ((zero page,X))
    CMP $D6              ; C5 D6 | Compare accumulator (zero page)
    BVS $BE              ; 70 BE | Branch if overflow set
    CMP ($E7,X)          ; C1 E7 | Compare accumulator ((zero page,X))
    CMP $D2              ; C5 D2 | Compare accumulator (zero page)
    CPX $D66F            ; EC 6F D6 | Compare X register (absolute)
    CMP ($E7,X)          ; C1 E7 | Compare accumulator ((zero page,X))
    CMP $0E              ; C5 0E | Compare accumulator (zero page)
    CMP $A571            ; CD 71 A5 | Compare accumulator (absolute)
    CMP ($C6,X)          ; C1 C6 | Compare accumulator ((zero page,X))
    CMP $16              ; C5 16 | Compare accumulator (zero page)
    ORA $A572            ; 0D 72 A5 | Logical OR with accumulator (absolute)
    CMP ($C6,X)          ; C1 C6 | Compare accumulator ((zero page,X))
    CMP $12              ; C5 12 | Compare accumulator (zero page)
    SBC $A571            ; ED 71 A5 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_20D
; Address: $D1EF05
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_20D:
    CMP ($C6,X)          ; C1 C6 | Compare accumulator ((zero page,X))
    CMP $1A              ; C5 1A | Compare accumulator (zero page)
    AND $A572            ; 2D 72 A5 | Logical AND with accumulator (absolute)
    CMP ($C6,X)          ; C1 C6 | Compare accumulator ((zero page,X))
    CMP $72              ; C5 72 | Compare accumulator (zero page)
    CPX $CC6C            ; EC 6C CC | Compare X register (absolute)
    DEX                  ; CA | Decrement X register
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    ADC $CAD3            ; 6D D3 CA | Add with carry (absolute)
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    PLY                  ; 7A | Pull Y register from stack
    BIT $DA6D            ; 2C 6D DA | Test bits in accumulator (absolute)
    DEX                  ; CA | Decrement X register
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    ROR $6D4C,X          ; 7E 4C 6D | Rotate right (absolute,X)
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    JMP ($E86D)          ; 6C 6D E8 | Jump to address (absolute indirect)
    DEX                  ; CA | Decrement X register
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    STX $8C              ; 86 8C | Store X register to zero page
    ADC $CAEF            ; 6D EF CA | Add with carry (absolute)
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    ROL $72CD            ; 2E CD 72 | Rotate left (absolute)
    DEX                  ; CA | Decrement X register
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    SBC $FD72            ; ED 72 FD | Subtract with carry (absolute)
    DEX                  ; CA | Decrement X register
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    ORA $0473            ; 0D 73 04 | Logical OR with accumulator (absolute)
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $1273            ; AD 73 12 | Read graphics status
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    LDY $CC6D            ; AC 6D CC | Load from absolute address into Y register
    DEX                  ; CA | Decrement X register
    CMP ($F5,X)          ; C1 F5 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    STX $6DCC            ; 8E CC 6D | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_20E
; Address: $D1EF79
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_20E:
    DEX                  ; CA | Decrement X register
    CMP ($F5,X)          ; C1 F5 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    CPX $DA6D            ; EC 6D DA | Compare X register (absolute)
    DEX                  ; CA | Decrement X register
    CMP ($F5,X)          ; C1 F5 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    ROR $CAE1            ; 6E E1 CA | Rotate right (absolute)
    CMP ($F5,X)          ; C1 F5 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    TXS                  ; 9A | Transfer X register to stack pointer
    BIT $E86E            ; 2C 6E E8 | Test bits in accumulator (absolute)
    DEX                  ; CA | Decrement X register
    CMP ($F5,X)          ; C1 F5 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    STZ $6E4C,X          ; 9E 4C 6E | Store zero to absolute,X
    DEX                  ; CA | Decrement X register
    CMP ($F5,X)          ; C1 F5 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    DEC                  ; 3A | Decrement accumulator
    AND $F673            ; 2D 73 F6 | Logical AND with accumulator (absolute)
    DEX                  ; CA | Decrement X register
    CMP ($F5,X)          ; C1 F5 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    ROL $734D,X          ; 3E 4D 73 | Rotate left (absolute,X)
    SBC $C1CA,X          ; FD CA C1 | Subtract with carry (absolute,X)
    BRA $C5              ; 80 C5 | Branch always
    WDM #$6D             ; 42 6D | Reserved instruction
    CMP ($F5,X)          ; C1 F5 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    LSR $8D              ; 46 8D | Logical shift right (zero page)
    CMP ($F5,X)          ; C1 F5 | Compare accumulator ((zero page,X))
    BRA $C5              ; 80 C5 | Branch always
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY $EE6B            ; AC 6B EE | Load from absolute address into Y register
    CMP ($6E,X)          ; C1 6E | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    WDM #$6C             ; 42 6C | Reserved instruction
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_20F
; Address: $D1EFD2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_20F:
    REP #$C4             ; C2 C4 | Reset processor status bits
    CMP ($73,X)          ; C1 73 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    STY $A56B            ; 8C 6B A5 | Store Y register to absolute address
    CMP ($BF,X)          ; C1 BF | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    LDX #$6C             ; A2 6C | Load immediate value into X register
    ROR $CAA2            ; 6E A2 CA | Rotate right (absolute)
    CMP ($D6,X)          ; C1 D6 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    LDX $8C              ; A6 8C | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_210
; Address: $D1EFEC
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_210:
    ROR $CAA9            ; 6E A9 CA | Rotate right (absolute)
    CMP ($D6,X)          ; C1 D6 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    TAX                  ; AA | Transfer accumulator to X register
    LDY $B06E            ; AC 6E B0 | Load from absolute address into Y register
    DEX                  ; CA | Decrement X register
    CMP ($D6,X)          ; C1 D6 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    LDX $6ECC            ; AE CC 6E | Load from absolute address into X register
    DEX                  ; CA | Decrement X register
    CMP ($D6,X)          ; C1 D6 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    CPX $BE6E            ; EC 6E BE | Compare X register (absolute)
    DEX                  ; CA | Decrement X register
    CMP ($D6,X)          ; C1 D6 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    CMP $CA              ; C5 CA | Compare accumulator (zero page)
    CMP ($D6,X)          ; C1 D6 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    CLV                  ; B8 | Clear overflow flag
    BIT $A26F            ; 2C 6F A2 | Test bits in accumulator (absolute)
    DEX                  ; CA | Decrement X register
    CMP ($E8,X)          ; C1 E8 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    LDY $6F4C,X          ; BC 4C 6F | Load from absolute,X into Y register
    LDA #$CA             ; A9 CA | Read graphics status
    CMP ($E8,X)          ; C1 E8 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    CPY #$6C             ; C0 6C | Compare Y register (immediate)
    BCS $CA              ; B0 CA | Branch if carry set
    CMP ($E8,X)          ; C1 E8 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    CPY $8C              ; C4 8C | Compare Y register (zero page)
    DEX                  ; CA | Decrement X register
    CMP ($E8,X)          ; C1 E8 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    INY                  ; C8 | Increment Y register
    LDY $BE6F            ; AC 6F BE | Load from absolute address into Y register
    DEX                  ; CA | Decrement X register
    CMP ($E8,X)          ; C1 E8 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    CPY $6FCC            ; CC CC 6F | Compare Y register (absolute)
    CMP $CA              ; C5 CA | Compare accumulator (zero page)
    CMP ($E8,X)          ; C1 E8 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    ROL $6B4C,X          ; 3E 4C 6B | Rotate left (absolute,X)
    LDA $C3              ; A5 C3 | Read graphics status
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_211
; Address: $D1F057
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_211:
    BIT $BA6B            ; 2C 6B BA | Test bits in accumulator (absolute)
    CMP #$C1             ; C9 C1 | Compare accumulator (immediate)
    CMP $4E              ; C5 4E | Compare accumulator (zero page)
    CPY $A56B            ; CC 6B A5 | Compare Y register (absolute)
    CMP ($87,X)          ; C1 87 | Compare accumulator ((zero page,X))
    CMP $52              ; C5 52 | Compare accumulator (zero page)
    CPX $A56B            ; EC 6B A5 | Compare X register (absolute)
    CMP ($9E,X)          ; C1 9E | Compare accumulator ((zero page,X))
    CMP $54              ; C5 54 | Compare accumulator (zero page)
    JMP ($C3A5)          ; 6C A5 C3 | Jump to address (absolute indirect)
    CMP ($B5,X)          ; C1 B5 | Compare accumulator ((zero page,X))
    CMP $58              ; C5 58 | Compare accumulator (zero page)
    BIT $A56C            ; 2C 6C A5 | Test bits in accumulator (absolute)
    CMP ($B5,X)          ; C1 B5 | Compare accumulator ((zero page,X))
    CMP $55              ; C5 55 | Compare accumulator (zero page)
    JMP ($C3A5)          ; 6C A5 C3 | Jump to address (absolute indirect)
    CMP ($B5,X)          ; C1 B5 | Compare accumulator ((zero page,X))
    CMP $59              ; C5 59 | Compare accumulator (zero page)
    BIT $A56C            ; 2C 6C A5 | Test bits in accumulator (absolute)
    CMP ($B5,X)          ; C1 B5 | Compare accumulator ((zero page,X))
    CMP $5E              ; C5 5E | Compare accumulator (zero page)
    JMP $A56C            ; 4C 6C A5 | Jump to address
    CMP ($C4,X)          ; C1 C4 | Compare accumulator ((zero page,X))
    CMP $32              ; C5 32 | Compare accumulator (zero page)
    CPX $A56A            ; EC 6A A5 | Compare X register (absolute)
    CMP ($D3,X)          ; C1 D3 | Compare accumulator ((zero page,X))
    CMP $36              ; C5 36 | Compare accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_212
; Address: $D1F0AA
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_212:
    LDA $C3              ; A5 C3 | Read graphics status
    CMP ($F5,X)          ; C1 F5 | Compare accumulator ((zero page,X))
    CMP $62              ; C5 62 | Compare accumulator (zero page)
    JMP ($A56C)          ; 6C 6C A5 | Jump to address (absolute indirect)
    CMP ($C6,X)          ; C1 C6 | Compare accumulator ((zero page,X))
    CMP $62              ; C5 62 | Compare accumulator (zero page)
    JMP ($A56C)          ; 6C 6C A5 | Jump to address (absolute indirect)
    CMP ($02,X)          ; C1 02 | Compare accumulator ((zero page,X))
    STY $C5              ; 84 C5 | Store Y register to zero page
    JMP ($A56C)          ; 6C 6C A5 | Jump to address (absolute indirect)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STY $C5              ; 84 C5 | Store Y register to zero page
    PHX                  ; DA | Push X register to stack
    BIT $A570            ; 2C 70 A5 | Test bits in accumulator (absolute)
    CMP ($7A,X)          ; C1 7A | Compare accumulator ((zero page,X))
    STY $C5              ; 84 C5 | Store Y register to zero page
    PHX                  ; DA | Push X register to stack
    BIT $A570            ; 2C 70 A5 | Test bits in accumulator (absolute)
    CMP ($B2,X)          ; C1 B2 | Compare accumulator ((zero page,X))
    STY $C5              ; 84 C5 | Store Y register to zero page
    PHX                  ; DA | Push X register to stack
    BIT $A570            ; 2C 70 A5 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_213
; Address: $D1F0E2
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_213:
    CMP ($EA,X)          ; C1 EA | Compare accumulator ((zero page,X))
    STY $C5              ; 84 C5 | Store Y register to zero page
    DEC $704C,X          ; DE 4C 70 | Decrement (absolute,X)
    LDA $C3              ; A5 C3 | Read graphics status
    CMP ($22,X)          ; C1 22 | Compare accumulator ((zero page,X))
    STA $C5              ; 85 C5 | Update graphics data
    DEC $704C,X          ; DE 4C 70 | Decrement (absolute,X)
    LDA $C3              ; A5 C3 | Read graphics status
    CMP ($5E,X)          ; C1 5E | Compare accumulator ((zero page,X))
    STA $C5              ; 85 C5 | Update graphics data
    DEC $704C,X          ; DE 4C 70 | Decrement (absolute,X)
    LDA $C3              ; A5 C3 | Read graphics status
    CMP ($9A,X)          ; C1 9A | Compare accumulator ((zero page,X))
    STA $C5              ; 85 C5 | Update graphics data
    ROR                  ; 6A | Rotate right (accumulator)
    LDY $A56C            ; AC 6C A5 | Load from absolute address into Y register
    CMP ($D6,X)          ; C1 D6 | Compare accumulator ((zero page,X))
    STA $C5              ; 85 C5 | Update graphics data
    ROR                  ; 6A | Rotate right (accumulator)
    LDY $A56C            ; AC 6C A5 | Load from absolute address into Y register
    CMP ($02,X)          ; C1 02 | Compare accumulator ((zero page,X))
    STX $C5              ; 86 C5 | Store X register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $A571            ; AD 71 A5 | Read graphics status
    CMP ($22,X)          ; C1 22 | Compare accumulator ((zero page,X))
    STX $C5              ; 86 C5 | Store X register to zero page
    ASL $8D              ; 06 8D | Arithmetic shift left (zero page)
    ADC ($DC),Y          ; 71 DC | Add with carry ((zero page),Y)
    CPY $C1              ; C4 C1 | Compare Y register (zero page)
    JMP $C586            ; 4C 86 C5 | Jump to address
    ADC $A571            ; 6D 71 A5 | Add with carry (absolute)
    CMP ($72,X)          ; C1 72 | Compare accumulator ((zero page,X))
    STX $C5              ; 86 C5 | Store X register to zero page
    INC $8C              ; E6 8C | Increment (zero page)
    BVS $A2              ; 70 A2 | Branch if overflow set
    DEX                  ; CA | Decrement X register
    CMP ($22,X)          ; C1 22 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    NOP                  ; EA | No operation
    LDY $A970            ; AC 70 A9 | Load from absolute address into Y register
    DEX                  ; CA | Decrement X register
    CMP ($22,X)          ; C1 22 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    INC $70CC            ; EE CC 70 | Increment (absolute)
    BCS $CA              ; B0 CA | Branch if carry set
    CMP ($22,X)          ; C1 22 | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    ROL $8D              ; 26 8D | Rotate left (zero page)
    LDX $C1CA,Y          ; BE CA C1 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_215
; Address: $D1F153
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_215:
    CPX $A270            ; EC 70 A2 | Compare X register (absolute)
    DEX                  ; CA | Decrement X register
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    ADC ($A9),Y          ; 71 A9 | Add with carry ((zero page),Y)
    DEX                  ; CA | Decrement X register
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    PLX                  ; FA | Pull X register from stack
    BIT $B071            ; 2C 71 B0 | Test bits in accumulator (absolute)
    DEX                  ; CA | Decrement X register
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STA ($C5,X)          ; 81 C5 | Update graphics data
    INC $714C,X          ; FE 4C 71 | Increment (absolute,X)
    LDA $C3              ; A5 C3 | Read graphics status
    CMP ($8B,X)          ; C1 8B | Compare accumulator ((zero page,X))
    STX $C5              ; 86 C5 | Store X register to zero page
    ASL $724D,X          ; 1E 4D 72 | Arithmetic shift left (absolute,X)
    LDA $C3              ; A5 C3 | Read graphics status
    CMP ($71,X)          ; C1 71 | Compare accumulator ((zero page,X))
    CMP $66              ; C5 66 | Compare accumulator (zero page)
    STY $A56C            ; 8C 6C A5 | Store Y register to absolute address
    CMP ($C5,X)          ; C1 C5 | Compare accumulator ((zero page,X))
    CMP $3E              ; C5 3E | Compare accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    CMP $59              ; C5 59 | Compare accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    CMP $74              ; C5 74 | Compare accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    CMP $8F              ; C5 8F | Compare accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    CMP $AA              ; C5 AA | Compare accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    CMP $E0              ; C5 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    CMP $FB              ; C5 FB | Compare accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    CMP $16              ; C5 16 | Compare accumulator (zero page)
    BIT #$C5             ; 89 C5 | Test bits in accumulator (immediate)
    AND ($89),Y          ; 31 89 | Logical AND with accumulator ((zero page),Y)
    CMP $4C              ; C5 4C | Compare accumulator (zero page)
    BIT #$C5             ; 89 C5 | Test bits in accumulator (immediate)
    ADC $89              ; 65 89 | Add with carry (zero page)
    CMP $7E              ; C5 7E | Compare accumulator (zero page)
    BIT #$C5             ; 89 C5 | Test bits in accumulator (immediate)
    BIT #$C5             ; 89 C5 | Test bits in accumulator (immediate)
    BCS $89              ; B0 89 | Branch if carry set
    CMP $C9              ; C5 C9 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_216
; Address: $D1F1B6
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_216:
    BIT #$C5             ; 89 C5 | Test bits in accumulator (immediate)
    BIT #$C5             ; 89 C5 | Test bits in accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $30              ; C5 30 | Compare accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $5C              ; C5 5C | Compare accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $88              ; C5 88 | Compare accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $AE              ; C5 AE | Compare accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $D4              ; C5 D4 | Compare accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $F5              ; C5 F5 | Compare accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $04              ; C5 04 | Compare accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    CMP $51              ; C5 51 | Compare accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    CMP $66              ; C5 66 | Compare accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    CMP $E2              ; C5 E2 | Compare accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    CMP $17              ; C5 17 | Compare accumulator (zero page)
    STY $4CC5            ; 8C C5 4C | Store Y register to absolute address
    STY $78C5            ; 8C C5 78 | Store Y register to absolute address
    STY $C3C5            ; 8C C5 C3 | Store Y register to absolute address
    STY $0AC5            ; 8C C5 0A | Store Y register to absolute address
    STA $2BC5            ; 8D C5 2B | Update graphics data
    STA $47C5            ; 8D C5 47 | Update graphics data
    STA $67C5            ; 8D C5 67 | Update graphics data
    STA $00C5            ; 8D C5 00 | Update graphics data
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $110F            ; 0D 0F 11 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $1E1A,Y          ; 19 1A 1E | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_217
; Address: $D1F208
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_217:
    JSR $2221            ; 20 21 22 | Jump to subroutine
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ORA $110F            ; 0D 0F 11 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $1A19,Y          ; 19 19 1A | Logical OR with accumulator (absolute,Y)
    ASL $1A1D,X          ; 1E 1D 1A | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_218
; Address: $D1F220
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_218:
    JSL $201E20          ; 22 20 1E 20 | Jump to subroutine long
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA $0A07,Y          ; 19 07 0A | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_219
; Address: $D1F232
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_219:
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    ORA $0E0E            ; 0D 0E 0E | Logical OR with accumulator (absolute)
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $191A,Y          ; 19 1A 19 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_21B
; Address: $D1F253
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_21B:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    ORA $0E0F            ; 0D 0F 0E | Logical OR with accumulator (absolute)
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    ORA ($13),Y          ; 11 13 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ORA $1619,X          ; 1D 19 16 | Logical OR with accumulator (absolute,X)
    ASL $1B20,X          ; 1E 20 1B | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_21C
; Address: $D1F282
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_21C:
    JSL $050121          ; 22 21 01 05 | Jump to subroutine long
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    ORA ($09),Y          ; 11 09 | Logical OR with accumulator ((zero page),Y)
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    ORA $0D12            ; 0D 12 0D | Logical OR with accumulator (absolute)
    ASL $0E13            ; 0E 13 0E | Arithmetic shift left (absolute)
    ORA $1516,Y          ; 19 16 15 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ORA $1C1E,X          ; 1D 1E 1C | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_21F
; Address: $D1F2BB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_21F:
    JSL $232303          ; 22 03 23 23 | Jump to subroutine long
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_222
; Address: $D1F2CE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_222:
    INC                  ; 1A | Increment accumulator
    ASL $1511,X          ; 1E 11 15 | Arithmetic shift left (absolute,X)
    ORA ($1C),Y          ; 11 1C | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_223
; Address: $D1F2DD
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_223:
    JSR $1600            ; 20 00 16 | Jump to subroutine
    ASL $1918,X          ; 1E 18 19 | Arithmetic shift left (absolute,X)
    ORA $0001,X          ; 1D 01 00 | Logical OR with accumulator (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $F000            ; 2D 00 F0 | Logical AND with accumulator (absolute)
    CPY $C1              ; C4 C1 | Compare Y register (zero page)
    CMP #$C1             ; C9 C1 | Compare accumulator (immediate)
    CMP #$C1             ; C9 C1 | Compare accumulator (immediate)
    PEA #$C1C4           ; F4 C4 C1 | Push effective address to stack
    CMP #$C1             ; C9 C1 | Compare accumulator (immediate)
    EOR $C9              ; 45 C9 | Exclusive OR with accumulator (zero page)
    CMP ($41,X)          ; C1 41 | Compare accumulator ((zero page,X))
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $9B              ; 80 9B | Branch always
    CPX $2CA2            ; EC A2 2C | Compare X register (absolute)
    ADC $91F1,Y          ; 79 F1 91 | Add with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    STZ $3D              ; 64 3D | Store zero to zero page
    XBA                  ; EB | Exchange accumulator bytes
    ROR                  ; 6A | Rotate right (accumulator)
    DEC                  ; 3A | Decrement accumulator
    LDA ($14,X)          ; A1 14 | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $09D9,X          ; 3D D9 09 | Logical AND with accumulator (absolute,X)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BMI $08              ; 30 08 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ORA #$88             ; 09 88 | Logical OR with accumulator (immediate)
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    ORA $80              ; 05 80 | Logical OR with accumulator (zero page)
    BVC $00              ; 50 00 | Branch if overflow clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCC $0B              ; 90 0B | Branch if carry clear
    SBC $2AA2            ; ED A2 2A | Subtract with carry (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    STA ($43,X)          ; 81 43 | Update graphics data

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_224
; Address: $D1F36E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_224:
    ORA $E318,Y          ; 19 18 E3 | Logical OR with accumulator (absolute,Y)
    ORA $71CE            ; 0D CE 71 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $2C01,Y          ; 19 01 2C | Logical OR with accumulator (absolute,Y)
    ROR                  ; 6A | Rotate right (accumulator)
    WDM #$09             ; 42 09 | Reserved instruction
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_225
; Address: $D1F384
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_225:
    JSR $0805            ; 20 05 08 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    ORA #$E8             ; 09 E8 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA $2580,Y          ; 19 80 25 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    LDY #$1B             ; A0 1B | Load immediate value into Y register
    CPY $E6              ; C4 E6 | Compare Y register (zero page)
    LDA                  ; BF 30 46 EA | Read graphics status
    JMP $B9F2            ; 4C F2 B9 | Jump to address
    BIT #$86             ; 89 86 | Test bits in accumulator (immediate)
    STX $1AAA            ; 8E AA 1A | Store X register to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_226
; Address: $D1F3B7
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_226:
    EOR #$0A             ; 49 0A | Exclusive OR with accumulator (immediate)
    LDY $0568            ; AC 68 05 | Load from absolute address into Y register
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA $2580,Y          ; 19 80 25 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    LDY #$1B             ; A0 1B | Load immediate value into Y register
    CPY $E6              ; C4 E6 | Compare Y register (zero page)
    LDA                  ; BF 30 46 EA | Read graphics status
    JMP $B9F2            ; 4C F2 B9 | Jump to address
    BIT #$86             ; 89 86 | Test bits in accumulator (immediate)
    STX $1AAA            ; 8E AA 1A | Store X register to absolute address
    STZ $E000            ; 9C 00 E0 | Game work RAM access
    EOR ($8A),Y          ; 51 8A | Exclusive OR with accumulator ((zero page),Y)
    LDY $0568            ; AC 68 05 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_227
; Address: $D1F3F2
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_227:
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    CPY $02              ; C4 02 | Compare Y register (zero page)
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $E0              ; 05 E0 | Game work RAM access
    LDX #$CF             ; A2 CF | Load immediate value into X register
    CPY $31C8            ; CC C8 31 | Compare Y register (absolute)
    STA ($35),Y          ; 91 35 | Update graphics data
    ROR $ED              ; 66 ED | Rotate right (zero page)
    LDX $DA              ; A6 DA | Load from zero page into X register
    ORA $1F1E,X          ; 1D 1E 1F | Logical OR with accumulator (absolute,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    ORA $5D00,Y          ; 19 00 5D | Logical OR with accumulator (absolute,Y)
    CMP $B40A,Y          ; D9 0A B4 | Compare accumulator (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $48              ; 05 48 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLV                  ; B8 | Clear overflow flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$C4             ; 09 C4 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $E0              ; 05 E0 | Game work RAM access
    LDX #$CF             ; A2 CF | Load immediate value into X register
    CPY $31C8            ; CC C8 31 | Compare Y register (absolute)
    STA ($35),Y          ; 91 35 | Update graphics data
    ROR $ED              ; 66 ED | Rotate right (zero page)
    LDX $DA              ; A6 DA | Load from zero page into X register
    ORA $1F1E,X          ; 1D 1E 1F | Logical OR with accumulator (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    EOR $8AE1,X          ; 5D E1 8A | Exclusive OR with accumulator (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_228
; Address: $D1F45D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_228:
    ORA $48              ; 05 48 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC ($02),Y          ; 71 02 | Add with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $40              ; 05 40 | Logical OR with accumulator (zero page)
    CMP $68A6,Y          ; D9 A6 68 | Compare accumulator (absolute,Y)
    STZ $B2              ; 64 B2 | Store zero to zero page
    SBC $6A96            ; ED 96 6A | Subtract with carry (absolute)
    INC                  ; 1A | Increment accumulator
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_229
; Address: $D1F484
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_229:
    JSR $2221            ; 20 21 22 | Jump to subroutine
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    JMP ($0B59)          ; 6C 59 0B | Jump to address (absolute indirect)
    PLP                  ; 28 | Pull processor status from stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    ADC ($02),Y          ; 71 02 | Add with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $40              ; 05 40 | Logical OR with accumulator (zero page)
    CMP $68A6,Y          ; D9 A6 68 | Compare accumulator (absolute,Y)
    STZ $B2              ; 64 B2 | Store zero to zero page
    SBC $6A96            ; ED 96 6A | Subtract with carry (absolute)
    INC                  ; 1A | Increment accumulator
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_22A
; Address: $D1F4BA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_22A:
    JSR $2221            ; 20 21 22 | Jump to subroutine
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    LSR $00              ; 46 00 | Logical shift right (zero page)
    JMP ($8BA9)          ; 6C A9 8B | Jump to address (absolute indirect)
    PLP                  ; 28 | Pull processor status from stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BMI $08              ; 30 08 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_22B
; Address: $D1F4D5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_22B:
    ADC ($02),Y          ; 71 02 | Add with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $40              ; 05 40 | Logical OR with accumulator (zero page)
    CMP $68A6,Y          ; D9 A6 68 | Compare accumulator (absolute,Y)
    STZ $B2              ; 64 B2 | Store zero to zero page
    SBC $6A96            ; ED 96 6A | Subtract with carry (absolute)
    INC                  ; 1A | Increment accumulator
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_22C
; Address: $D1F4F0
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_22C:
    JSR $2221            ; 20 21 22 | Jump to subroutine
    STZ $4602            ; 9C 02 46 | Store zero to absolute
    JMP ($0BE9)          ; 6C E9 0B | Jump to address (absolute indirect)
    CPY $28              ; C4 28 | Compare Y register (zero page)
    ASL $48              ; 06 48 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC ($02),Y          ; 71 02 | Add with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $40              ; 05 40 | Logical OR with accumulator (zero page)
    CMP $68A6,Y          ; D9 A6 68 | Compare accumulator (absolute,Y)
    STZ $B2              ; 64 B2 | Store zero to zero page
    SBC $6A96            ; ED 96 6A | Subtract with carry (absolute)
    INC                  ; 1A | Increment accumulator
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_22D
; Address: $D1F526
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_22D:
    JSR $2221            ; 20 21 22 | Jump to subroutine
    STA $D702,X          ; 9D 02 D7 | Update graphics data
    LSR $00              ; 46 00 | Logical shift right (zero page)
    JMP ($CC01)          ; 6C 01 CC | Jump to address (absolute indirect)
    CPY $28              ; C4 28 | Compare Y register (zero page)
    ASL $48              ; 06 48 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    ORA #$58             ; 09 58 | Logical OR with accumulator (immediate)
    STZ $7273,X          ; 9E 73 72 | Store zero to absolute,X
    CLC                  ; 18 | Clear carry flag
    STZ $3273,X          ; 9E 73 32 | Store zero to absolute,X
    CLC                  ; 18 | Clear carry flag
    STA                  ; 9F 7B 52 18 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_22E
; Address: $D1F55D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_22E:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $A1              ; 80 A1 | Branch always
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_22F
; Address: $D1F581
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_22F:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDY $1CC0            ; AC C0 1C | Load from absolute address into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_230
; Address: $D1F587
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_230:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDY $B8              ; A4 B8 | Load from zero page into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_231
; Address: $D1F58D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_231:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDX $1D00            ; AE 00 1D | Load from absolute address into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_232
; Address: $D1F593
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_232:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDX $1CF8            ; AE F8 1C | Load from absolute address into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_233
; Address: $D1F599
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_233:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDA $B8              ; A5 B8 | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_234
; Address: $D1F59F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_234:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDX $B8              ; A6 B8 | Load from zero page into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_235
; Address: $D1F5A5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_235:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDA $1CC0            ; AD C0 1C | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_236
; Address: $D1F5AB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_236:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    BEQ $1C              ; F0 1C | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_237
; Address: $D1F5B1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_237:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDA                  ; BF F0 1C 60 | Read graphics status
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDY $1CF0,X          ; BC F0 1C | Load from absolute,X into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_238
; Address: $D1F5BD
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_238:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_239
; Address: $D1F5C3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_239:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDA #$B8             ; A9 B8 | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_23A
; Address: $D1F5C9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_23A:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDA $601D18          ; AF 18 1D 60 | Read graphics status
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    BCS $10              ; B0 10 | Branch if carry set
    ORA $2160,X          ; 1D 60 21 | PPU graphics register access
    PLB                  ; AB | Pull data bank register from stack
    BCS $08              ; B0 08 | Branch if carry set
    ORA $2160,X          ; 1D 60 21 | PPU graphics register access
    PLB                  ; AB | Pull data bank register from stack
    LDX $1CF0,Y          ; BE F0 1C | Load from absolute,Y into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_23B
; Address: $D1F5E1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_23B:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_23C
; Address: $D1F5E7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_23C:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_23D
; Address: $D1F5ED
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_23D:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    BNE $1C              ; D0 1C | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_23E
; Address: $D1F5F3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_23E:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    BNE $1C              ; D0 1C | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_23F
; Address: $D1F5F9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_23F:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    BNE $1C              ; D0 1C | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_240
; Address: $D1F5FF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_240:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    BNE $1C              ; D0 1C | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_241
; Address: $D1F605
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_241:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_242
; Address: $D1F60B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_242:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDA $1CD8,Y          ; B9 D8 1C | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_243
; Address: $D1F611
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_243:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    BNE $1C              ; D0 1C | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_244
; Address: $D1F617
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_244:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    BCS $15              ; B0 15 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_245
; Address: $D1F61D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_245:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_248
; Address: $D1F629
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_248:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_249
; Address: $D1F62F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_249:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    CPY #$15             ; C0 15 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_24A
; Address: $D1F635
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_24A:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDA $1CF0,X          ; BD F0 1C | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_24B
; Address: $D1F63B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_24B:
    AND ($AB,X)          ; 21 AB | Logical AND with accumulator ((zero page,X))
    LDX #$B8             ; A2 B8 | Load immediate value into X register
    DEY                  ; 88 | Decrement Y register
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_24C
; Address: $D1F642
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_24C:
    JSL $1CB8A7          ; 22 A7 B8 1C | Jump to subroutine long
    LDY #$83             ; A0 83 | Load immediate value into Y register
    ASL $B8A8            ; 0E A8 B8 | Arithmetic shift left (absolute)
    INX                  ; E8 | Increment X register
    PLB                  ; AB | Pull data bank register from stack
    LDA ($C8),Y          ; B1 C8 | Read graphics status
    PLP                  ; 28 | Pull processor status from stack
    LDX $18              ; A6 18 | Load from zero page into X register
    INY                  ; C8 | Increment Y register
    BMI $C6              ; 30 C6 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    REP #$00             ; C2 00 | Reset processor status bits
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $42              ; 10 42 | Hardware register operation
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    BVC $C5              ; 50 C5 | Branch if overflow clear
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    BPL $C0              ; 10 C0 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_24E
; Address: $D1F6B5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_24E:
    REP #$00             ; C2 00 | Reset processor status bits
    INC $12FF,X          ; FE FF 12 | Increment (absolute,X)
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_24F
; Address: $D1F6C8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_24F:
    BPL $00              ; 10 00 | Branch if positive
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    BCS $C1              ; B0 C1 | Branch if carry set
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_250
; Address: $D1F6E0
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_250:
    JSR $4220            ; 20 20 42 | Hardware register operation
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    BIT $D0              ; 24 D0 | Test bits in accumulator (zero page)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BNE $40              ; D0 40 | Branch if not equal
    BPL $00              ; 10 00 | Branch if positive
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    BIT $C080            ; 2C 80 C0 | Test bits in accumulator (absolute)
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    BMI $D0              ; 30 D0 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    REP #$00             ; C2 00 | Reset processor status bits
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    SEC                  ; 38 | Set carry flag
    BVC $42              ; 50 42 | Hardware register operation
    BPL $00              ; 10 00 | Branch if positive
    ASL $28              ; 06 28 | Arithmetic shift left (zero page)
    BRA $C2              ; 80 C2 | Branch always
    ASL $28              ; 06 28 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ASL $28              ; 06 28 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_251
; Address: $D1F768
; Size: 119 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_251:
    JSR $00C1            ; 20 C1 00 | Jump to subroutine
    ASL $28              ; 06 28 | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    BEQ $41              ; F0 41 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    ASL $28              ; 06 28 | Arithmetic shift left (zero page)
    JMP $C130            ; 4C 30 C1 | Jump to address
    ASL $28              ; 06 28 | Arithmetic shift left (zero page)
    BVC $90              ; 50 90 | Branch if overflow clear
    WDM #$02             ; 42 02 | Reserved instruction
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $000000          ; 5C 00 00 00 | Jump to address long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ORA ($2D,X)          ; 01 2D | Logical OR with accumulator ((zero page,X))
    ORA ($C8,X)          ; 01 C8 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    PHX                  ; DA | Push X register to stack
    RTI                  ; 40 | Return from interrupt
    CPY $93CD            ; CC CD 93 | Compare Y register (absolute)
    CPY $94CD            ; CC CD 94 | Compare Y register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $95CD            ; CC CD 95 | Compare Y register (absolute)
    CPY $96CD            ; CC CD 96 | Compare Y register (absolute)
    BPL $CD              ; 10 CD | Branch if positive
    CMP $0397            ; CD 97 03 | Compare accumulator (absolute)
    CMP $98CD            ; CD CD 98 | Compare accumulator (absolute)
    STZ $CDCD,X          ; 9E CD CD | Store zero to absolute,X
    STA $B903,Y          ; 99 03 B9 | Update graphics data
    CMP $9ACD            ; CD CD 9A | Compare accumulator (absolute)
    CMP $9BCD            ; CD CD 9B | Compare accumulator (absolute)
    ORA ($CE,X)          ; 01 CE | Logical OR with accumulator ((zero page,X))
    CMP $039C            ; CD 9C 03 | Compare accumulator (absolute)
    DEC $9DCD            ; CE CD 9D | Decrement (absolute)
    DEC $9ECD            ; CE CD 9E | Decrement (absolute)
    DEC $9FCD            ; CE CD 9F | Decrement (absolute)
    STA $CDCE,X          ; 9D CE CD | Update graphics data
    LDY #$03             ; A0 03 | Load immediate value into Y register
    DEC $A1CD            ; CE CD A1 | Decrement (absolute)
    DEC $A2CD            ; CE CD A2 | Decrement (absolute)
    ORA ($CF),Y          ; 11 CF | Logical OR with accumulator ((zero page),Y)
    CMP $03A3            ; CD A3 03 | Compare accumulator (absolute)
    CMP $03A4            ; CD A4 03 | Compare accumulator (absolute)
    CMP $03A5            ; CD A5 03 | Compare accumulator (absolute)
    ADC $CDCF,Y          ; 79 CF CD | Add with carry (absolute,Y)
    LDX $03              ; A6 03 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank22_GraphicsFunction_252
; Address: $D1F84D
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank22_GraphicsFunction_252:
    CMP $03A7            ; CD A7 03 | Compare accumulator (absolute)
    CMP $03A8            ; CD A8 03 | Compare accumulator (absolute)
    CMP $03A9            ; CD A9 03 | Compare accumulator (absolute)
    CMP $03AA            ; CD AA 03 | Compare accumulator (absolute)
    BNE $CD              ; D0 CD | Branch if not equal
    PLB                  ; AB | Pull data bank register from stack
    ROL                  ; 2A | Rotate left (accumulator)
    BNE $CD              ; D0 CD | Branch if not equal
    LDY $D203            ; AC 03 D2 | Load from absolute address into Y register
    BNE $CD              ; D0 CD | Branch if not equal
    LDA $4703            ; AD 03 47 | Read graphics status
    BNE $CD              ; D0 CD | Branch if not equal
    LDX $3303            ; AE 03 33 | Load from absolute address into X register
    CMP $03AF            ; CD AF 03 | Compare accumulator (absolute)
    SBC ($D3),Y          ; F1 D3 | Subtract with carry ((zero page),Y)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    CMP $03B1            ; CD B1 03 | Compare accumulator (absolute)
    CMP $03B2            ; CD B2 03 | Compare accumulator (absolute)
    ADC $CDD4            ; 6D D4 CD | Add with carry (absolute)
    CMP $03B4            ; CD B4 03 | Compare accumulator (absolute)
    CMP $03B5            ; CD B5 03 | Compare accumulator (absolute)
    CMP $03B6            ; CD B6 03 | Compare accumulator (absolute)
    SBC #$D4             ; E9 D4 | Subtract with carry (immediate)
    CMP $03B7            ; CD B7 03 | Compare accumulator (absolute)
    CMP $03B8            ; CD B8 03 | Compare accumulator (absolute)
    EOR $CDD5,X          ; 5D D5 CD | Exclusive OR with accumulator (absolute,X)
    LDA $0A03,Y          ; B9 03 0A | Read graphics status
    CMP $03BA            ; CD BA 03 | Compare accumulator (absolute)
    ROR $CDD5,X          ; 7E D5 CD | Rotate right (absolute,X)
    CMP $03BC            ; CD BC 03 | Compare accumulator (absolute)
    CMP $03BD            ; CD BD 03 | Compare accumulator (absolute)
    SBC $CDD5,Y          ; F9 D5 CD | Subtract with carry (absolute,Y)
