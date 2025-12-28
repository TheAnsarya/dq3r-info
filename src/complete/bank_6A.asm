;==============================================================================
; Dragon Quest III - Bank $6A
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $F50000-$F57FFF
; Instructions: 8447
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_6A"

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_000
; Address: $F58000
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_000:
    ADC $1F72            ; 6D 72 1F | Add with carry (absolute)
    ASL $0101,X          ; 1E 01 01 | Arithmetic shift left (absolute,X)
    BPL $10              ; 10 10 | Branch if positive
    CPY $FFCC            ; CC CC FF | Compare Y register (absolute)
    STA                  ; 9F 0D E0 00 | Update graphics data
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ASL $26              ; 06 26 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    ORA $2650,X          ; 1D 50 26 | Logical OR with accumulator (absolute,X)
    ORA $2700,Y          ; 19 00 27 | Logical OR with accumulator (absolute,Y)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_001
; Address: $F5806D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_001:
    JSR $1080            ; 20 80 10 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    AND ($0D),Y          ; 31 0D | Logical AND with accumulator ((zero page),Y)
    JMP $733F            ; 4C 3F 73 | Jump to address
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ASL $3300            ; 0E 00 33 | Arithmetic shift left (absolute)
    JMP $DF00            ; 4C 00 DF | Jump to address
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    ASL $1336,X          ; 1E 36 13 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_002
; Address: $F580AC
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_002:
    JSR $3C7E            ; 20 7E 3C | Jump to subroutine
    DEC $0000            ; CE 00 00 | Decrement (absolute)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $2F0E,X          ; 1E 0E 2F | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    EOR ($5E,X)          ; 41 5E | Exclusive OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    STA                  ; 9F 30 7E 00 | Update graphics data
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ASL $3000            ; 0E 00 30 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    BIT $08              ; 24 08 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ROL $0C              ; 26 0C | Rotate left (zero page)
    ROL $2C18            ; 2E 18 2C | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_003
; Address: $F5810C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_003:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $0D11            ; 0D 11 0D | Logical OR with accumulator (absolute)
    ADC ($66,X)          ; 61 66 | Add with carry ((zero page,X))
    ASL $1E00            ; 0E 00 1E | Arithmetic shift left (absolute)
    AND $0000,Y          ; 39 00 00 | Logical AND with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_004
; Address: $F58169
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_004:
    JSL $44C218          ; 22 18 C2 44 | Jump to subroutine long
    DEC $3C              ; C6 3C | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag
    TSX                  ; BA | Transfer stack pointer to X register
    SEC                  ; 38 | Set carry flag
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_006
; Address: $F581AD
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_006:
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BRA $E3              ; 80 E3 | Branch always
    CPY $04              ; C4 04 | Compare Y register (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $56              ; 10 56 | Branch if positive
    AND $3765            ; 2D 65 37 | Logical AND with accumulator (absolute)
    CMP $60              ; C5 60 | Compare accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_007
; Address: $F581FB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_007:
    ORA ($5A,X)          ; 01 5A | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    SED                  ; F8 | Set decimal mode flag
    AND ($DF,X)          ; 21 DF | Logical AND with accumulator ((zero page,X))
    ROL $D1              ; 26 D1 | Rotate left (zero page)
    LDX $23              ; A6 23 | Load from zero page into X register
    AND $DE              ; 25 DE | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_008
; Address: $F5820E
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_008:
    PLX                  ; FA | Pull X register from stack
    STY $DE00            ; 8C 00 DE | Store Y register to absolute address
    ASL $8F              ; 06 8F | Arithmetic shift left (zero page)
    STX $DCDC            ; 8E DC DC | Store X register to absolute address
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    BPL $01              ; 10 01 | Branch if positive
    ORA ($0D),Y          ; 11 0D | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($86,X)          ; 01 86 | Logical OR with accumulator ((zero page,X))
    ADC ($42,X)          ; 61 42 | Hardware register operation
    PHP                  ; 08 | Push processor status to stack
    STX $00              ; 86 00 | Store X register to zero page
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    RTI                  ; 40 | Return from interrupt
    BVC $20              ; 50 20 | Branch if overflow clear
    BVS $A0              ; 70 A0 | Branch if overflow set
    BEQ $A0              ; F0 A0 | Branch if equal
    BVS $40              ; 70 40 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    CMP ($29),Y          ; D1 29 | Compare accumulator ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    INC $00B0,X          ; FE B0 00 | Increment (absolute,X)
    BCC $00              ; 90 00 | Branch if carry clear
    BVC $00              ; 50 00 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_009
; Address: $F58278
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_009:
    JSR $E100            ; 20 00 E1 | Jump to subroutine
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BMI $E0              ; 30 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $56              ; 10 56 | Branch if positive
    AND $3765            ; 2D 65 37 | Logical AND with accumulator (absolute)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_00A
; Address: $F582DB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_00A:
    ORA ($5A,X)          ; 01 5A | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    AND $4DFE,Y          ; 39 FE 4D | Logical AND with accumulator (absolute,Y)
    BEQ $03              ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_00B
; Address: $F582E5
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_00B:
    LDY $FC23,X          ; BC 23 FC | Load from absolute,X into Y register
    AND $101C            ; 2D 1C 10 | Logical AND with accumulator (absolute)
    ORA #$1B             ; 09 1B | Logical OR with accumulator (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    BCC $00              ; 90 00 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$50             ; E0 50 | Compare X register (immediate)
    CPX #$56             ; E0 56 | Compare X register (immediate)
    CMP $6625,Y          ; D9 25 66 | Compare accumulator (absolute,Y)
    PHX                  ; DA | Push X register to stack
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_00C
; Address: $F58316
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_00C:
    JSR $2900            ; 20 00 29 | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BMI $44              ; 30 44 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    CPY $EC28            ; CC 28 EC | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    STZ $53              ; 64 53 | Store zero to zero page
    LDY $38              ; A4 38 | Load from zero page into Y register
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $55C4            ; 0D C4 55 | Logical OR with accumulator (absolute)
    CPX #$6B             ; E0 6B | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    TSX                  ; BA | Transfer stack pointer to X register
    TAX                  ; AA | Transfer accumulator to X register
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CPY $8400            ; CC 00 84 | Compare Y register (absolute)
    CPX $FC05            ; EC 05 FC | Compare X register (absolute)
    ORA ($FE),Y          ; 11 FE | Logical OR with accumulator ((zero page),Y)
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_00D
; Address: $F5839C
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_00D:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0211            ; 0D 11 02 | Logical OR with accumulator (absolute)
    ORA $001E            ; 0D 1E 00 | Logical OR with accumulator (absolute)
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ASL $1C00            ; 0E 00 1C | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $1200            ; 0E 00 12 | Arithmetic shift left (absolute)
    LDA #$76             ; A9 76 | Read graphics status
    BRA $7F              ; 80 7F | Branch always
    WDM #$3D             ; 42 3D | Reserved instruction
    EOR ($EF),Y          ; 51 EF | Exclusive OR with accumulator ((zero page),Y)
    ORA ($6F),Y          ; 11 6F | Logical OR with accumulator ((zero page),Y)
    SBC $DB              ; E5 DB | Subtract with carry (zero page)
    BPL $FF              ; 10 FF | Branch if positive
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    EOR $3500,Y          ; 59 00 35 | Exclusive OR with accumulator (absolute,Y)
    TXA                  ; 8A | Transfer X register to accumulator
    NOP                  ; EA | No operation
    INC                  ; 1A | Increment accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    BIT #$F7             ; 89 F7 | Test bits in accumulator (immediate)
    LDA $7E41,X          ; BD 41 7E | Read graphics status
    TXA                  ; 8A | Transfer X register to accumulator
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BMI $00              ; 30 00 | Branch if negative
    PLX                  ; FA | Pull X register from stack
    TXA                  ; 8A | Transfer X register to accumulator
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    ROR $00              ; 66 00 | Rotate right (zero page)
    BMI $88              ; 30 88 | Branch if negative
    BPL $84              ; 10 84 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CMP $F0              ; C5 F0 | Compare accumulator (zero page)
    AND $1321,Y          ; 39 21 13 | Logical AND with accumulator (absolute,Y)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDY $0900,X          ; BC 00 09 | Load from absolute,X into Y register
    ROL $540C            ; 2E 0C 54 | Rotate left (absolute)
    ORA $3F29,X          ; 1D 29 3F | Logical OR with accumulator (absolute,X)
    BRA $F9              ; 80 F9 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_00F
; Address: $F58436
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_00F:
    SEP #$00             ; E2 00 | Set processor status bits
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    ADC $0000            ; 6D 00 00 | Add with carry (absolute)
    BVS $A0              ; 70 A0 | Branch if overflow set
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_010
; Address: $F58444
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_010:
    JSR $0864            ; 20 64 08 | Jump to subroutine
    INC $9950,X          ; FE 50 99 | Increment (absolute,X)
    BIT $3D              ; 24 3D | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BMI $92              ; 30 92 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    STZ $1200            ; 9C 00 12 | Store zero to absolute
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BIT $136B            ; 2C 6B 13 | Test bits in accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    EOR $A553,Y          ; 59 53 A5 | Exclusive OR with accumulator (absolute,Y)
    AND $2200            ; 2D 00 22 | Logical AND with accumulator (absolute)
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDY $CA00            ; AC 00 CA | Load from absolute address into Y register
    LDX $F84C,Y          ; BE 4C F8 | Load from absolute,Y into X register
    STA $446F,Y          ; 99 6F 44 | Update graphics data
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    BEQ $4D              ; F0 4D | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_011
; Address: $F584B8
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_011:
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $4300            ; 0D 00 43 | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    LSR $EC              ; 46 EC | Logical shift right (zero page)
    LDY #$BC             ; A0 BC | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    LDA ($FE,X)          ; A1 FE | Read graphics status
    INC $00E0,X          ; FE E0 00 | Increment (absolute,X)
    LDA ($00),Y          ; B1 00 | Read graphics status
    LSR $0000,X          ; 5E 00 00 | Logical shift right (absolute,X)
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    PEA #$F047           ; F4 47 F0 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    ROL $D9              ; 26 D9 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_012
; Address: $F5850A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_012:
    TXA                  ; 8A | Transfer X register to accumulator
    ADC $E81F,X          ; 7D 1F E8 | Add with carry (absolute,X)
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_013
; Address: $F58516
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_013:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    ORA ($A0,X)          ; 01 A0 | Logical OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    SBC $4803,X          ; FD 03 48 | Subtract with carry (absolute,X)
    INC $6AB5            ; EE B5 6A | Increment (absolute)
    CPY $F3              ; C4 F3 | Compare Y register (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $B0              ; 06 B0 | Arithmetic shift left (zero page)
    BCS $01              ; B0 01 | Branch if carry set
    BNE $01              ; D0 01 | Branch if not equal
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    ASL $13              ; 06 13 | Arithmetic shift left (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    AND ($FE,X)          ; 21 FE | Logical AND with accumulator ((zero page,X))
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    PHY                  ; 5A | Push Y register to stack
    LSR $B70C,X          ; 5E 0C B7 | Logical shift right (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction
    WDM #$00             ; 42 00 | Reserved instruction
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_014
; Address: $F5857C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_014:
    ROR                  ; 6A | Rotate right (accumulator)
    BCS $49              ; B0 49 | Branch if carry set
    CPY $2235            ; CC 35 22 | Compare Y register (absolute)
    DEC $36D8,X          ; DE D8 36 | Decrement (absolute,X)
    EOR $21B7            ; 4D B7 21 | PPU graphics register access
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP $2100,Y          ; D9 00 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_015
; Address: $F58598
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_015:
    JSR $5400            ; 20 00 54 | Jump to subroutine
    BNE $00              ; D0 00 | Branch if not equal
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    JMP $4596            ; 4C 96 45 | Jump to address
    LDA #$DE             ; A9 DE | Read graphics status
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STA $00              ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_016
; Address: $F585B8
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_016:
    STA $9B00            ; 8D 00 9B | Update graphics data
    TSX                  ; BA | Transfer stack pointer to X register
    ROL                  ; 2A | Rotate left (accumulator)
    LDA $D936,Y          ; B9 36 D9 | Read graphics status
    SBC ($81),Y          ; F1 81 | Subtract with carry ((zero page),Y)
    INC $CE21,X          ; FE 21 CE | Increment (absolute,X)
    WDM #$3B             ; 42 3B | Reserved instruction
    ROL                  ; 2A | Rotate left (accumulator)
    CMP $00D6,X          ; DD D6 00 | Compare accumulator (absolute,X)
    BPL $3D              ; 10 3D | Branch if positive
    ROL $D60E,X          ; 3E 0E D6 | Rotate left (absolute,X)
    LDA $B200            ; AD 00 B2 | Read graphics status
    LDA #$3B             ; A9 3B | Read graphics status
    CMP $8037,Y          ; D9 37 80 | Compare accumulator (absolute,Y)
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    BMI $FF              ; 30 FF | Branch if negative
    ROR                  ; 6A | Rotate right (accumulator)
    STA $CE41,X          ; 9D 41 CE | Update graphics data
    BPL $7E              ; 10 7E | Branch if positive
    BVS $F0              ; 70 F0 | Branch if overflow set
    CPX #$8D             ; E0 8D | Compare X register (immediate)
    SBC $BA00,X          ; FD 00 BA | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    BCS $6A              ; B0 6A | Branch if carry set
    BVS $86              ; 70 86 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    BNE $C0              ; D0 C0 | Branch if not equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LSR $D47F            ; 4E 7F D4 | Logical shift right (absolute)
    AND ($8F,X)          ; 21 8F | Logical AND with accumulator ((zero page,X))
    BPL $9F              ; 10 9F | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BRA $FF              ; 80 FF | Branch always
    DEX                  ; CA | Decrement X register
    STA ($00,X)          ; 81 00 | Update graphics data
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_017
; Address: $F58654
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_017:
    SEI                  ; 78 | Set interrupt disable flag
    ROR $00              ; 66 00 | Rotate right (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    STA $00              ; 85 00 | Update graphics data
    ROR $3100            ; 6E 00 31 | Rotate right (absolute)
    BMI $F8              ; 30 F8 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    BRA $F0              ; 80 F0 | Branch always
    BRA $F0              ; 80 F0 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_018
; Address: $F58669
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_018:
    BEQ $40              ; F0 40 | Branch if equal
    BNE $C0              ; D0 C0 | Branch if not equal
    BNE $80              ; D0 80 | Branch if not equal
    BCS $48              ; B0 48 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $00              ; 50 00 | Branch if overflow clear
    BVC $00              ; 50 00 | Branch if overflow clear
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    ASL $632B,X          ; 1E 2B 63 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    BRA $38              ; 80 38 | Branch always
    BVS $64              ; 70 64 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $7235            ; EC 35 72 | Compare X register (absolute)
    SBC $FD06,X          ; FD 06 FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_019
; Address: $F586C9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_019:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    BRA $02              ; 80 02 | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    ORA $00C0,Y          ; 19 C0 00 | Logical OR with accumulator (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    CPY $0600            ; CC 00 06 | Compare Y register (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_01B
; Address: $F58706
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_01B:
    JSR $0088            ; 20 88 00 | Jump to subroutine
    ADC $0200,Y          ; 79 00 02 | Add with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    BVC $6F              ; 50 6F | Branch if overflow clear
    ORA $96E6,Y          ; 19 E6 96 | Logical OR with accumulator (absolute,Y)
    ADC $D32A,Y          ; 79 2A D3 | Add with carry (absolute,Y)
    ROL $42              ; 26 42 | Hardware register operation
    JMP ($CB02)          ; 6C 02 CB | Jump to address (absolute indirect)
    ASL $AB              ; 06 AB | Arithmetic shift left (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_01C
; Address: $F58734
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_01C:
    JSR $D400            ; 20 00 D4 | Jump to subroutine
    INX                  ; E8 | Increment X register
    LDY $CD00            ; AC 00 CD | Load from absolute address into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    REP #$3F             ; C2 3F | Reset processor status bits
    RTI                  ; 40 | Return from interrupt
    DEC $2F              ; C6 2F | Decrement (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BIT $1800            ; 2C 00 18 | Test bits in accumulator (absolute)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    LDA                  ; BF 00 29 00 | Read graphics status
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    INC $DC32            ; EE 32 DC | Increment (absolute)
    JMP $CC20AE          ; 5C AE 20 CC | Jump to address long
    RTI                  ; 40 | Return from interrupt
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    LSR $02              ; 46 02 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    STY $8200            ; 8C 00 82 | Store Y register to absolute address
    CPY $A000            ; CC 00 A0 | Compare Y register (absolute)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEX                  ; CA | Decrement X register
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_01D
; Address: $F58789
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_01D:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    BRA $14              ; 80 14 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_01E
; Address: $F58798
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_01E:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    JMP $8601            ; 4C 01 86 | Jump to address
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BMI $46              ; 30 46 | Branch if negative
    SEP #$CB             ; E2 CB | Set processor status bits
    CPY #$06             ; C0 06 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_01F
; Address: $F587C7
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_01F:
    JSR $5000            ; 20 00 50 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVC $EF              ; 50 EF | Branch if overflow clear
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    CMP $DF38            ; CD 38 DF | Compare accumulator (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA ($EF),Y          ; B1 EF | Read graphics status
    SBC $8873            ; ED 73 88 | Subtract with carry (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    STA ($00),Y          ; 91 00 | Update graphics data
    WDM #$00             ; 42 00 | Reserved instruction
    JMP $1000            ; 4C 00 10 | Jump to address
    BEQ $80              ; F0 80 | Branch if equal
    BVS $80              ; 70 80 | Branch if overflow set
    ADC ($80),Y          ; 71 80 | Add with carry ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    STA ($E7,X)          ; 81 E7 | Update graphics data
    BCC $00              ; 90 00 | Branch if carry clear
    BVC $00              ; 50 00 | Branch if overflow clear
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    REP #$00             ; C2 00 | Reset processor status bits
    REP #$00             ; C2 00 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_020
; Address: $F5883E
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_020:
    STZ $00              ; 64 00 | Store zero to zero page
    STY $14              ; 84 14 | Store Y register to zero page
    STA                  ; 9F E4 FC 51 | Update graphics data
    ASL $1DC9            ; 0E C9 1D | Arithmetic shift left (absolute)
    JMP $41E89B          ; 5C 9B E8 41 | Jump to address long
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    AND $9E0C            ; 2D 0C 9E | Logical AND with accumulator (absolute)
    ASL $3330            ; 0E 30 33 | Arithmetic shift left (absolute)
    LDY $92CC            ; AC CC 92 | Load from absolute address into Y register
    STZ $BB24,X          ; 9E 24 BB | Store zero to absolute,X
    CLC                  ; 18 | Clear carry flag
    EOR #$54             ; 49 54 | Exclusive OR with accumulator (immediate)
    STA $8B6C,X          ; 9D 6C 8B | Update graphics data
    RTI                  ; 40 | Return from interrupt
    STA $3300CF          ; 8F CF 00 33 | Update graphics data
    ADC $00              ; 65 00 | Add with carry (zero page)
    JMP $B700            ; 4C 00 B7 | Jump to address
    ROR                  ; 6A | Rotate right (accumulator)
    PHX                  ; DA | Push X register to stack
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF 38 00 00 | Read graphics status
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_022
; Address: $F588A0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_022:
    WDM #$7F             ; 42 7F | Reserved instruction
    STY $33FD            ; 8C FD 33 | Store Y register to absolute address
    INY                  ; C8 | Increment Y register
    AND ($DF,X)          ; 21 DF | Logical AND with accumulator ((zero page,X))
    SBC #$17             ; E9 17 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_023
; Address: $F588AC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_023:
    JSR $98DF            ; 20 DF 98 | Jump to subroutine
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    INY                  ; C8 | Increment Y register
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    STZ $00              ; 64 00 | Store zero to zero page
    BRA $07              ; 80 07 | Branch always
    STY $85D6            ; 8C D6 85 | Store Y register to absolute address
    LDA #$DE             ; A9 DE | Read graphics status
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_024
; Address: $F588D4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_024:
    STA $00              ; 85 00 | Update graphics data
    EOR $5B00            ; 4D 00 5B | Exclusive OR with accumulator (absolute)
    PLY                  ; 7A | Pull Y register from stack
    BVS $00              ; 70 00 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_025
; Address: $F588EE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_025:
    JSR $0004            ; 20 04 00 | Jump to subroutine
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BRA $E0              ; 80 E0 | Game work RAM access
    ASL $C7              ; 06 C7 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ASL $26              ; 06 26 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    ORA $2650,X          ; 1D 50 26 | Logical OR with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_026
; Address: $F58912
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_026:
    RTI                  ; 40 | Return from interrupt
    ORA $2700,Y          ; 19 00 27 | Logical OR with accumulator (absolute,Y)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_027
; Address: $F58920
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_027:
    JSR $6070            ; 20 70 60 | Jump to subroutine
    STX $99BE            ; 8E BE 99 | Store X register to absolute address
    INY                  ; C8 | Increment Y register
    CMP $F750,Y          ; D9 50 F7 | Compare accumulator (absolute,Y)
    ROL $00              ; 26 00 | Rotate left (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    ROR $00              ; 66 00 | Rotate right (zero page)
    LDA $00D800          ; AF 00 D8 00 | Read graphics status
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    BRA $60              ; 80 60 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_028
; Address: $F5894D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_028:
    BVS $00              ; 70 00 | Branch if overflow set
    BVC $00              ; 50 00 | Branch if overflow clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_029
; Address: $F5895A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_029:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BCC $00              ; 90 00 | Branch if carry clear
    BCS $00              ; B0 00 | Branch if carry set
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    AND #$76             ; 29 76 | Logical AND with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $1200,X          ; 1E 00 12 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_02A
; Address: $F58978
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_02A:
    JSL $003A00          ; 22 00 3A 00 | Jump to subroutine long
    ADC $6FDD            ; 6D DD 6F | Add with carry (absolute)
    AND $A0DF            ; 2D DF A0 | Logical AND with accumulator (absolute)
    ADC $55AA            ; 6D AA 55 | Add with carry (absolute)
    STZ $C121,X          ; 9E 21 C1 | Store zero to absolute,X
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_02C
; Address: $F58992
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_02C:
    JSR $1200            ; 20 00 12 | Jump to subroutine
    ADC #$00             ; 69 00 | Add with carry (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $8100,X          ; 1E 00 81 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_02D
; Address: $F589A2
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_02D:
    JSR $21EF            ; 20 EF 21 | PPU graphics register access
    SBC $12              ; E5 12 | Subtract with carry (zero page)
    INY                  ; C8 | Increment Y register
    JMP $417F            ; 4C 7F 41 | Jump to address
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    EOR $5E00,X          ; 5D 00 5E | Exclusive OR with accumulator (absolute,X)
    LDY $1600            ; AC 00 16 | Load from absolute address into Y register
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    AND ($1D,X)          ; 21 1D | Logical AND with accumulator ((zero page,X))
    STX $FF              ; 86 FF | Store X register to zero page
    ROL                  ; 2A | Rotate left (accumulator)
    CMP $079F,X          ; DD 9F 07 | Compare accumulator (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    DEY                  ; 88 | Decrement Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    EOR $B200,Y          ; 59 00 B2 | Exclusive OR with accumulator (absolute,Y)
    ROR $7F98,X          ; 7E 98 7F | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    PEA #$FA1F           ; F4 1F FA | Push effective address to stack
    ORA $E2              ; 05 E2 | Logical OR with accumulator (zero page)
    ORA $2A              ; 05 2A | Logical OR with accumulator (zero page)
    SBC $FE71            ; ED 71 FE | Subtract with carry (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $26              ; 70 26 | Branch if overflow set
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BRA $70              ; 80 70 | Branch always
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    LDY $30              ; A4 30 | Load from zero page into Y register
    DEX                  ; CA | Decrement X register
    BVC $A6              ; 50 A6 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    BNE $20              ; D0 20 | Branch if not equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_02E
; Address: $F58A12
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_02E:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    LSR $00              ; 46 00 | Logical shift right (zero page)
    STX $00              ; 86 00 | Store X register to zero page
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    WDM #$FF             ; 42 FF | Reserved instruction

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_02F
; Address: $F58A26
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_02F:
    DEC $2F              ; C6 2F | Decrement (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BIT $1800            ; 2C 00 18 | Test bits in accumulator (absolute)
    BIT $BF00            ; 2C 00 BF | Test bits in accumulator (absolute)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    AND ($A0),Y          ; 31 A0 | Logical AND with accumulator ((zero page),Y)
    INX                  ; E8 | Increment X register
    LDA #$FF             ; A9 FF | Read graphics status
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ADC $00              ; 65 00 | Add with carry (zero page)
    BNE $14              ; D0 14 | Branch if not equal
    INY                  ; C8 | Increment Y register
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    BVC $BC              ; 50 BC | Branch if overflow clear
    BRA $74              ; 80 74 | Branch always
    BPL $F4              ; 10 F4 | Branch if positive
    SBC $00EC,Y          ; F9 EC 00 | Subtract with carry (absolute,Y)
    CPX $00              ; E4 00 | Compare X register (zero page)
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    BEQ $D0              ; F0 D0 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_030
; Address: $F58AC0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_030:
    CLC                  ; 18 | Clear carry flag
    DEC $D654            ; CE 54 D6 | Decrement (absolute)
    ADC $66E5            ; 6D E5 66 | Add with carry (absolute)
    CPX $EB              ; E4 EB | Compare X register (zero page)
    STA $9891            ; 8D 91 98 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_031
; Address: $F58AD2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_031:
    PLB                  ; AB | Pull data bank register from stack
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ROR $00              ; 66 00 | Rotate right (zero page)
    STY $8C00            ; 8C 00 8C | Store Y register to absolute address
    BNE $A7              ; D0 A7 | Branch if not equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_032
; Address: $F58AE2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_032:
    JSR $2653            ; 20 53 26 | Jump to subroutine
    LDY $F8D9            ; AC D9 F8 | Load from absolute address into Y register
    STA $07ED,Y          ; 99 ED 07 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    INC $8F03,X          ; FE 03 8F | Increment (absolute,X)
    STX $DCDE            ; 8E DE DC | Store X register to absolute address
    STA ($00,X)          ; 81 00 | Update graphics data
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_033
; Address: $F58B04
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_033:
    JSR $D068            ; 20 68 D0 | Jump to subroutine
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    BMI $F8              ; 30 F8 | Branch if negative
    BPL $B8              ; 10 B8 | Branch if positive
    BMI $B8              ; 30 B8 | Branch if negative
    SEC                  ; 38 | Set carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    BNE $00              ; D0 00 | Branch if not equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $6710,Y          ; 19 10 67 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_034
; Address: $F58B26
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_034:
    JSR $0088            ; 20 88 00 | Jump to subroutine
    ADC $0200,Y          ; 79 00 02 | Add with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    STA $06F9,X          ; 9D F9 06 | Update graphics data
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    AND $99D6            ; 2D D6 99 | Logical AND with accumulator (absolute)
    ROL $6C42            ; 2E 42 6C | Rotate left (absolute)
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ROL $00              ; 26 00 | Rotate left (zero page)
    BNE $00              ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_035
; Address: $F58B58
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_035:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY $CD00            ; AC 00 CD | Load from absolute address into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEC $9877            ; CE 77 98 | Decrement (absolute)
    ORA $F4DE,Y          ; 19 DE F4 | Logical OR with accumulator (absolute,Y)
    LSR $39              ; 46 39 | Logical shift right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_036
; Address: $F58B6C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_036:
    PHP                  ; 08 | Push processor status to stack
    BIT $1800            ; 2C 00 18 | Test bits in accumulator (absolute)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_037
; Address: $F58B72
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_037:
    JSL $00E600          ; 22 00 E6 00 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    INC $5CAB,X          ; FE AB 5C | Increment (absolute,X)
    LDX $C462            ; AE 62 C4 | Load from absolute address into X register
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    LSR $02              ; 46 02 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    LDY #$00             ; A0 00 | Load immediate value into Y register
    DEY                  ; 88 | Decrement Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    REP #$3F             ; C2 3F | Reset processor status bits
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_038
; Address: $F58BA9
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_038:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    BRA $04              ; 80 04 | Branch always
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    SBC $78              ; E5 78 | Subtract with carry (zero page)
    CPY $8601            ; CC 01 86 | Compare Y register (absolute)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    STX $00              ; 86 00 | Store X register to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ORA ($99,X)          ; 01 99 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_039
; Address: $F58BE9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_039:
    JSR $387F            ; 20 7F 38 | Jump to subroutine
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    STA $8000,Y          ; 99 00 80 | Update graphics data
    SBC $20              ; E5 20 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_03A
; Address: $F58BF9
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_03A:
    CLI                  ; 58 | Clear interrupt disable flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    LDA $BFB1,Y          ; B9 B1 BF | Read graphics status
    LDX $40FF            ; AE FF 40 | Load from absolute address into X register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    LDA ($4E),Y          ; B1 4E | Read graphics status
    LDX $4051            ; AE 51 40 | Load from absolute address into X register
    LDA                  ; BF 00 C0 00 | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    EOR ($BF),Y          ; 51 BF | Exclusive OR with accumulator ((zero page),Y)
    CPY $3B              ; C4 3B | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_03B
; Address: $F58C44
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_03B:
    JSR $291F            ; 20 1F 29 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BVS $EF              ; 70 EF | Branch if overflow set
    TXA                  ; 8A | Transfer X register to accumulator
    SBC $FF10,X          ; FD 10 FF | Subtract with carry (absolute,X)
    REP #$00             ; C2 00 | Reset processor status bits
    ORA $1500            ; 0D 00 15 | Logical OR with accumulator (absolute)
    LDX #$00             ; A2 00 | Load immediate value into X register
    ORA $C3FF,X          ; 1D FF C3 | Logical OR with accumulator (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    LDA #$BE             ; A9 BE | Read graphics status
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STA ($FE,X)          ; 81 FE | Update graphics data
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    SEP #$00             ; E2 00 | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    LDA $4200            ; AD 00 42 | Hardware register operation
    CLV                  ; B8 | Clear overflow flag
    BVS $64              ; 70 64 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CPY $88              ; C4 88 | Compare Y register (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    SEP #$78             ; E2 78 | Set processor status bits
    STZ $0890            ; 9C 90 08 | Store zero to absolute
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    JMP $000400          ; 5C 00 04 00 | Jump to address long
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_03C
; Address: $F58CA1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_03C:
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $47              ; F0 47 | Branch if equal
    BEQ $0E              ; F0 0E | Branch if equal
    SBC $DD22,Y          ; F9 22 DD | Subtract with carry (absolute,Y)
    STA $EC1D78          ; 8F 78 1D EC | Update graphics data
    DEC                  ; 3A | Decrement accumulator
    CMP $0094            ; CD 94 00 | Compare accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_03D
; Address: $F58CB6
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_03D:
    JSR $9401            ; 20 01 94 | Jump to subroutine
    ORA ($52,X)          ; 01 52 | Logical OR with accumulator ((zero page,X))
    LDX #$00             ; A2 00 | Load immediate value into X register
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    EOR #$B3             ; 49 B3 | Exclusive OR with accumulator (immediate)
    CPX $6EB7            ; EC B7 6E | Compare X register (absolute)
    PLX                  ; FA | Pull X register from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $B0              ; 06 B0 | Arithmetic shift left (zero page)
    BCS $00              ; B0 00 | Branch if carry set
    BNE $21              ; D0 21 | PPU graphics register access
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PLP                  ; 28 | Pull processor status from stack
    BPL $38              ; 10 38 | Branch if positive
    BNE $F8              ; D0 F8 | Branch if not equal
    BCS $E0              ; B0 E0 | Game work RAM access
    BCC $E0              ; 90 E0 | Game work RAM access
    BVC $A4              ; 50 A4 | Branch if overflow clear
    BMI $4A              ; 30 4A | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    ROL $14              ; 26 14 | Rotate left (zero page)
    BVS $E8              ; 70 E8 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    DEC $00              ; C6 00 | Decrement (zero page)
    STX $00              ; 86 00 | Store X register to zero page
    DEY                  ; 88 | Decrement Y register
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_03E
; Address: $F58D06
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_03E:
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_03F
; Address: $F58D17
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_03F:
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    DEC $0704,X          ; DE 04 07 | Decrement (absolute,X)
    ORA $0005,X          ; 1D 05 00 | Logical OR with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_040
; Address: $F58D35
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_040:
    PHX                  ; DA | Push X register to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STZ $05              ; 64 05 | Store zero to zero page
    INC                  ; 1A | Increment accumulator
    AND ($36),Y          ; 31 36 | Logical AND with accumulator ((zero page),Y)
    WDM #$7F             ; 42 7F | Reserved instruction
    STY $8BF5            ; 8C F5 8B | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    BMI $00              ; 30 00 | Branch if negative
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    JMP ($3600)          ; 6C 00 36 | Jump to address (absolute indirect)
    JMP $8576            ; 4C 76 85 | Jump to address
    ADC #$DE             ; 69 DE | Add with carry (immediate)
    STA $00              ; 85 00 | Update graphics data
    STA $00              ; 85 00 | Update graphics data
    EOR $BB00            ; 4D 00 BB | Exclusive OR with accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator
    ORA $0D11            ; 0D 11 0D | Logical OR with accumulator (absolute)
    ADC ($66,X)          ; 61 66 | Add with carry ((zero page,X))
    AND $00FE,Y          ; 39 FE 00 | Logical AND with accumulator (absolute,Y)
    ASL $1E00            ; 0E 00 1E | Arithmetic shift left (absolute)
    AND $8200,Y          ; 39 00 82 | Logical AND with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BNE $3F              ; D0 3F | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    ORA ($9E,X)          ; 01 9E | Logical OR with accumulator ((zero page,X))
    ASL $11              ; 06 11 | Arithmetic shift left (zero page)
    ORA $091F            ; 0D 1F 09 | Logical OR with accumulator (absolute)
    ASL $1E09,X          ; 1E 09 1E | Arithmetic shift left (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    PHP                  ; 08 | Push processor status to stack
    AND $877A            ; 2D 7A 87 | Logical AND with accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_041
; Address: $F58E06
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_041:
    ADC $269B            ; 6D 9B 26 | Add with carry (absolute)
    LDX #$5F             ; A2 5F | Load immediate value into X register
    INC                  ; 1A | Increment accumulator
    ORA ($EF),Y          ; 11 EF | Logical OR with accumulator ((zero page),Y)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    LDA ($00,X)          ; A1 00 | Read graphics status
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($01,X)          ; 81 01 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    NOP                  ; EA | No operation
    SBC $FD06,X          ; FD 06 FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_042
; Address: $F58E49
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_042:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    BRA $04              ; 80 04 | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    SBC $DF20,X          ; FD 20 DF | Subtract with carry (absolute,X)
    ORA $00C0,Y          ; 19 C0 00 | Logical OR with accumulator (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDX $E2              ; A6 E2 | Load from zero page into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_044
; Address: $F58E87
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_044:
    JSR $5000            ; 20 00 50 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    CPX $F868            ; EC 68 F8 | Compare X register (absolute)
    BVS $F8              ; 70 F8 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_046
; Address: $F58EAA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_046:
    SEC                  ; 38 | Set carry flag
    BPL $1E              ; 10 1E | Branch if positive
    ASL $68              ; 06 68 | Arithmetic shift left (zero page)
    BVS $88              ; 70 88 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_048
; Address: $F58EB6
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_048:
    JSR $20D0            ; 20 D0 20 | Jump to subroutine
    BVC $10              ; 50 10 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    ASL $5906,X          ; 1E 06 59 | Arithmetic shift left (absolute,X)
    ROL $3118,X          ; 3E 18 31 | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    REP #$3F             ; C2 3F | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    ASL $00FF            ; 0E FF 00 | Arithmetic shift left (absolute)
    DEC $1800            ; CE 00 18 | Decrement (absolute)
    PHP                  ; 08 | Push processor status to stack
    BIT $1800            ; 2C 00 18 | Test bits in accumulator (absolute)
    BIT $B700            ; 2C 00 B7 | Test bits in accumulator (absolute)
    LDA ($00),Y          ; B1 00 | Read graphics status
    DEC $0000            ; CE 00 00 | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    INC $DD32            ; EE 32 DD | Increment (absolute)
    LDA $20C620          ; AF 20 C6 20 | Read graphics status
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    LSR $02              ; 46 02 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    STA $8900            ; 8D 00 89 | Update graphics data
    STX $00              ; 86 00 | Store X register to zero page
    BRA $00              ; 80 00 | Branch always
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    EOR $02F0            ; 4D F0 02 | Exclusive OR with accumulator (absolute)
    LDA $FC23,X          ; BD 23 FC | Read graphics status
    ORA $307C            ; 0D 7C 30 | Logical OR with accumulator (absolute)
    AND #$1B             ; 29 1B | Logical AND with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BCC $00              ; 90 00 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    BCC $00              ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_049
; Address: $F58F3C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_049:
    WDM #$00             ; 42 00 | Reserved instruction
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    BMI $E0              ; 30 E0 | Game work RAM access
    BPL $E1              ; 10 E1 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    CMP $E7              ; C5 E7 | Compare accumulator (zero page)
    LDX $F84C,Y          ; BE 4C F8 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_04A
; Address: $F58F50
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_04A:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    EOR $1700            ; 4D 00 17 | Exclusive OR with accumulator (absolute)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BPL $80              ; 10 80 | Branch if positive
    BPL $60              ; 10 60 | Branch if positive
    BVS $70              ; 70 70 | Branch if overflow set
    CPX $A3              ; E4 A3 | Compare X register (zero page)
    LDY $0000,X          ; BC 00 00 | Load from absolute,X into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ORA $2D0A,X          ; 1D 0A 2D | Logical OR with accumulator (absolute,X)
    ORA ($3E),Y          ; 11 3E | Logical OR with accumulator ((zero page),Y)
    ROL $DF14,X          ; 3E 14 DF | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_04B
; Address: $F58FA1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_04B:
    XBA                  ; EB | Exchange accumulator bytes
    ROL                  ; 2A | Rotate left (accumulator)
    LDX #$5F             ; A2 5F | Load immediate value into X register
    EOR ($BF,X)          ; 41 BF | Exclusive OR with accumulator ((zero page,X))
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    LDX $A551            ; AE 51 A5 | Load from absolute address into X register
    PHY                  ; 5A | Push Y register to stack
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    DEX                  ; CA | Decrement X register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDX $EF89,Y          ; BE 89 EF | Load from absolute,Y into X register
    ADC #$DE             ; 69 DE | Add with carry (immediate)
    STX $00              ; 86 00 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_04C
; Address: $F58FD2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_04C:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ORA $0300,X          ; 1D 00 03 | Logical OR with accumulator (absolute,X)
    BRA $E0              ; 80 E0 | Game work RAM access
    ASL $C7              ; 06 C7 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    ASL $1336,X          ; 1E 36 13 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_04D
; Address: $F58FEC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_04D:
    JSR $3C7E            ; 20 7E 3C | Jump to subroutine
    DEC $0060            ; CE 60 00 | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    STX $81A6            ; 8E A6 81 | Store X register to absolute address
    CMP $F750,Y          ; D9 50 F7 | Compare accumulator (absolute,Y)
    ROL $DF              ; 26 DF | Rotate left (zero page)
    ROL $D0              ; 26 D0 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_04E
; Address: $F5900E
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_04E:
    JSR $0053            ; 20 53 00 | Jump to subroutine
    BVS $00              ; 70 00 | Branch if overflow set
    ROR $AF00,X          ; 7E 00 AF | Rotate right (absolute,X)
    CMP $5600,Y          ; D9 00 56 | Compare accumulator (absolute,Y)
    ASL $8F              ; 06 8F | Arithmetic shift left (zero page)
    STX $DCDE            ; 8E DE DC | Store X register to absolute address
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ROR $791E,X          ; 7E 1E 79 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ASL $3861,X          ; 1E 61 38 | Arithmetic shift left (absolute,X)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    BVS $FE              ; 70 FE | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    ASL $8704,X          ; 1E 04 87 | Arithmetic shift left (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STZ $0000,X          ; 9E 00 00 | Store zero to absolute,X
    ADC ($70),Y          ; 71 70 | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    INC $04              ; E6 04 | Increment (zero page)
    INC                  ; 1A | Increment accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STZ $0000,X          ; 9E 00 00 | Store zero to absolute,X
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_04F
; Address: $F5908B
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_04F:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $2505,X          ; 1D 05 25 | Logical OR with accumulator (absolute,X)
    LSR $2B              ; 46 2B | Logical shift right (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $716C,Y          ; 19 6C 71 | Logical OR with accumulator (absolute,Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    AND $7500,Y          ; 39 00 75 | Logical AND with accumulator (absolute,Y)
    INC $00              ; E6 00 | Increment (zero page)
    STX $6E00            ; 8E 00 6E | Store X register to absolute address
    BCC $DF              ; 90 DF | Branch if carry clear
    LDA $1E97,X          ; BD 97 1E | Read graphics status
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    BCS $FE              ; B0 FE | Branch if carry set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $00              ; 26 00 | Rotate left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $446F,Y          ; 99 6F 44 | Update graphics data
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_050
; Address: $F590F4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_050:
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $0300            ; 0D 00 03 | Logical OR with accumulator (absolute)
    ROR $4C              ; 66 4C | Rotate right (zero page)
    JMP $FFAB            ; 4C AB FF | Jump to address
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    BPL $67              ; 10 67 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_051
; Address: $F59126
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_051:
    JSR $0088            ; 20 88 00 | Jump to subroutine
    ADC $0200,Y          ; 79 00 02 | Add with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    PEA #$7A83           ; F4 83 7A | Push effective address to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_052
; Address: $F59146
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_052:
    AND #$D2             ; 29 D2 | Logical AND with accumulator (immediate)
    STA $422E,X          ; 9D 2E 42 | Hardware register operation
    JMP ($CB02)          ; 6C 02 CB | Jump to address (absolute indirect)
    ASL $AA              ; 06 AA | Arithmetic shift left (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    BIT $D400            ; 2C 00 D4 | Test bits in accumulator (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY $CD00            ; AC 00 CD | Load from absolute address into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    SEC                  ; 38 | Set carry flag
    AND $DE              ; 25 DE | Logical AND with accumulator (zero page)
    INX                  ; E8 | Increment X register
    BMI $1E              ; 30 1E | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BIT $1800            ; 2C 00 18 | Test bits in accumulator (absolute)
    STX $00              ; 86 00 | Store X register to zero page
    PHX                  ; DA | Push X register to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    INC $5CB2            ; EE B2 5C | Increment (absolute)
    JMP $CC20AE          ; 5C AE 20 CC | Jump to address long
    RTI                  ; 40 | Return from interrupt
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    LSR $02              ; 46 02 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $8200            ; 4C 00 82 | Jump to address
    CPY $A000            ; CC 00 A0 | Compare Y register (absolute)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CMP $5E              ; C5 5E | Compare accumulator (zero page)
    SBC $69              ; E5 69 | Subtract with carry (zero page)
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    TSX                  ; BA | Transfer stack pointer to X register
    PLB                  ; AB | Pull data bank register from stack
    INC                  ; 1A | Increment accumulator
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CPY $8C00            ; CC 00 8C | Compare Y register (absolute)
    ROL $DF              ; 26 DF | Rotate left (zero page)
    LDY $F8D9            ; AC D9 F8 | Load from absolute address into Y register
    STA $07EC,Y          ; 99 EC 07 | Update graphics data
    SBC $FE13,Y          ; F9 13 FE | Subtract with carry (absolute,Y)
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_053
; Address: $F591D0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_053:
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($20,X)          ; E1 20 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_054
; Address: $F591E3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_054:
    JSL $F322E3          ; 22 E3 22 F3 | Jump to subroutine long
    ADC $3119,Y          ; 79 19 31 | Add with carry (absolute,Y)
    ORA ($5C),Y          ; 11 5C | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_055
; Address: $F591F0
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_055:
    JSR $22DF            ; 20 DF 22 | Jump to subroutine
    CMP $DD22,X          ; DD 22 DD | Compare accumulator (absolute,X)
    CMP $6619            ; CD 19 66 | Compare accumulator (absolute)
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    AND ($70,X)          ; 21 70 | Logical AND with accumulator ((zero page,X))
    STA $27188F          ; 8F 8F 18 27 | Update graphics data
    AND $4221,X          ; 3D 21 42 | Hardware register operation
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    STA $40E070          ; 8F 70 E0 40 | Update graphics data
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    BRA $D8              ; 80 D8 | Branch always
    BRA $98              ; 80 98 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_056
; Address: $F59238
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_056:
    BRA $70              ; 80 70 | Branch always
    BRA $58              ; 80 58 | Branch always
    BRA $58              ; 80 58 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA $051F            ; 0D 1F 05 | Logical OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY $67              ; C4 67 | Compare Y register (zero page)
    BIT $18EF            ; 2C EF 18 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_057
; Address: $F59268
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_057:
    ROL $3F              ; 26 3F | Rotate left (zero page)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    ADC $005C            ; 6D 5C 00 | Add with carry (absolute)
    STA $1200,Y          ; 99 00 12 | Update graphics data
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    STA ($00),Y          ; 91 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_059
; Address: $F59284
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_059:
    JSR $60E8            ; 20 E8 60 | Jump to subroutine
    INX                  ; E8 | Increment X register
    BRA $B8              ; 80 B8 | Branch always
    BEQ $80              ; F0 80 | Branch if equal
    BVS $80              ; 70 80 | Branch if overflow set
    BVS $14              ; 70 14 | Branch if overflow set
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    BCC $00              ; 90 00 | Branch if carry clear
    BVC $00              ; 50 00 | Branch if overflow clear
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_05A
; Address: $F592A4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_05A:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_05B
; Address: $F592B5
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_05B:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT #$BF             ; 89 BF | Test bits in accumulator (immediate)
    EOR $917F,Y          ; 59 7F 91 | Exclusive OR with accumulator (absolute,Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPX $FB44            ; EC 44 FB | Compare X register (absolute)
    AND ($BE),Y          ; 31 BE | Logical AND with accumulator ((zero page),Y)
    WDM #$00             ; 42 00 | Reserved instruction
    PHY                  ; 5A | Push Y register to stack
    STA ($00,X)          ; 81 00 | Update graphics data
    DEX                  ; CA | Decrement X register
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $47              ; F0 47 | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ADC $E81F,X          ; 7D 1F E8 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_05D
; Address: $F59316
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_05D:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    SBC $4C03,Y          ; F9 03 4C | Subtract with carry (absolute,Y)
    INC $6AB5            ; EE B5 6A | Increment (absolute)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BCS $00              ; B0 00 | Branch if carry set
    BCS $01              ; B0 01 | Branch if carry set
    BNE $21              ; D0 21 | PPU graphics register access
    INX                  ; E8 | Increment X register
    SBC ($40,X)          ; E1 40 | Subtract with carry ((zero page,X))
    BMI $73              ; 30 73 | Branch if negative
    ROR $1F0C,X          ; 7E 0C 1F | Rotate right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA ($30,X)          ; A1 30 | Read graphics status
    CPY $4D32            ; CC 32 4D | Compare Y register (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF B4 BC 20 | Read graphics status
    CPX $8000            ; EC 00 80 | Compare X register (absolute)
    SEC                  ; 38 | Set carry flag
    BEQ $40              ; F0 40 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_05E
; Address: $F59372
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_05E:
    JSR $00DC            ; 20 DC 00 | Jump to subroutine
    CPX $8000            ; EC 00 80 | Compare X register (absolute)
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    BCS $00              ; B0 00 | Branch if carry set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_05F
; Address: $F593A2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_05F:
    JSL $672367          ; 22 67 23 67 | Jump to subroutine long
    BPL $77              ; 10 77 | Branch if positive
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    WDM #$DD             ; 42 DD | Reserved instruction
    EOR ($DF,X)          ; 41 DF | Exclusive OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    EOR $5800,X          ; 5D 00 58 | Exclusive OR with accumulator (absolute,X)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    WDM #$00             ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_060
; Address: $F593BC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_060:
    LDA ($00),Y          ; B1 00 | Read graphics status
    LDY $5800            ; AC 00 58 | Load from absolute address into Y register
    STA ($7F,X)          ; 81 7F | Update graphics data
    CLC                  ; 18 | Clear carry flag
    BNE $F6              ; D0 F6 | Branch if not equal
    BCC $FE              ; 90 FE | Branch if carry clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_061
; Address: $F593CA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_061:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    BRA $FC              ; 80 FC | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_062
; Address: $F593D8
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_062:
    JSL $004400          ; 22 00 44 00 | Jump to subroutine long
    STZ $00              ; 64 00 | Store zero to zero page
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    AND ($0D),Y          ; 31 0D | Logical AND with accumulator ((zero page),Y)
    JMP $733F            ; 4C 3F 73 | Jump to address
    LDY #$60             ; A0 60 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    ASL $3300            ; 0E 00 33 | Arithmetic shift left (absolute)
    JMP $DF00            ; 4C 00 DF | Jump to address
    RTI                  ; 40 | Return from interrupt
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    INC $DF4E            ; EE 4E DF | Increment (absolute)
    CMP $A83B,Y          ; D9 3B A8 | Compare accumulator (absolute,Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY $B100            ; CC 00 B1 | Compare Y register (absolute)
    ROL $00              ; 26 00 | Rotate left (zero page)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    BCS $00              ; B0 00 | Branch if carry set
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    STZ $40              ; 64 40 | Store zero to zero page
    INY                  ; C8 | Increment Y register
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_063
; Address: $F59452
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_063:
    BRA $70              ; 80 70 | Branch always
    BCS $00              ; B0 00 | Branch if carry set
    BVS $40              ; 70 40 | Branch if overflow set
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY $80              ; A4 80 | Load from zero page into Y register
    PHA                  ; 48 | Push accumulator to stack
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_064
; Address: $F59465
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_064:
    ADC $D32A,Y          ; 79 2A D3 | Add with carry (absolute,Y)
    ROL $42              ; 26 42 | Hardware register operation
    JMP ($CB02)          ; 6C 02 CB | Jump to address (absolute indirect)
    ASL $A3              ; 06 A3 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_065
; Address: $F59474
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_065:
    JSR $D400            ; 20 00 D4 | Jump to subroutine
    INX                  ; E8 | Increment X register
    LDY $CD00            ; AC 00 CD | Load from absolute address into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $0D11            ; 0D 11 0D | Logical OR with accumulator (absolute)
    ADC ($66,X)          ; 61 66 | Add with carry ((zero page,X))
    ASL $1E00            ; 0E 00 1E | Arithmetic shift left (absolute)
    LDA $0000,Y          ; B9 00 00 | Read graphics status
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    NOP                  ; EA | No operation
    SBC $FD06,X          ; FD 06 FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_066
; Address: $F594C9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_066:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    BRA $04              ; 80 04 | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_067
; Address: $F594E2
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_067:
    JSR $19DF            ; 20 DF 19 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $4600            ; 2C 00 46 | Test bits in accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    EOR $3B              ; 45 3B | Exclusive OR with accumulator (zero page)
    JMP $C413            ; 4C 13 C4 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_068
; Address: $F59514
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_068:
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    AND $7A00            ; 2D 00 7A | Logical AND with accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    CPY $BF8C            ; CC 8C BF | Compare Y register (absolute)
    CMP ($A1),Y          ; D1 A1 | Compare accumulator ((zero page),Y)
    PEA #$6B0B           ; F4 0B 6B | Push effective address to stack
    SBC $FC03,Y          ; F9 03 FC | Subtract with carry (absolute,Y)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_069
; Address: $F59532
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_069:
    RTI                  ; 40 | Return from interrupt
    LDX $0F80            ; AE 80 0F | Load from absolute address into X register
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    EOR $3B              ; 45 3B | Exclusive OR with accumulator (zero page)
    JMP $C413            ; 4C 13 C4 | Jump to address
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    AND $7A00            ; 2D 00 7A | Logical AND with accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    AND #$F7             ; 29 F7 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    STA ($DF),Y          ; 91 DF | Update graphics data
    PHA                  ; 48 | Push accumulator to stack
    ADC $0084            ; 6D 84 00 | Add with carry (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    STZ $00              ; 64 00 | Store zero to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    BVC $AC              ; 50 AC | Branch if overflow clear
    BRA $79              ; 80 79 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_06A
; Address: $F595A7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_06A:
    SBC $F960,Y          ; F9 60 F9 | Subtract with carry (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    STA ($F7,X)          ; 81 F7 | Update graphics data
    LDY $00              ; A4 00 | Load from zero page into Y register
    ORA $0900,Y          ; 19 00 09 | Logical OR with accumulator (absolute,Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA $67EC            ; 0D EC 67 | Logical OR with accumulator (absolute)
    INC $9D51,X          ; FE 51 9D | Increment (absolute,X)
    STZ $EBCA            ; 9C CA EB | Store zero to absolute
    STA $50C9            ; 8D C9 50 | Update graphics data
    CMP $3EE7,Y          ; D9 E7 3E | Compare accumulator (absolute,Y)
    STZ $6F06,X          ; 9E 06 6F | Store zero to absolute,X
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDX $BE4E            ; AE 4E BE | Load from absolute address into X register
    JMP $4FA0            ; 4C A0 4F | Jump to address
    RTI                  ; 40 | Return from interrupt
    EOR $11BF            ; 4D BF 11 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_06B
; Address: $F595EC
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_06B:
    BNE $33              ; D0 33 | Branch if not equal
    LDA ($00),Y          ; B1 00 | Read graphics status
    SBC $5F0C            ; ED 0C 5F | Subtract with carry (absolute)
    LDA $12B8,X          ; BD B8 12 | Read graphics status
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CPY #$E0             ; C0 E0 | Game work RAM access
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BCC $40              ; 90 40 | Branch if carry clear
    BNE $40              ; D0 40 | Branch if not equal
    BNE $A0              ; D0 A0 | Branch if not equal
    BVS $40              ; 70 40 | Branch if overflow set
    BEQ $20              ; F0 20 | Branch if equal
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_06C
; Address: $F59614
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_06C:
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    BCS $00              ; B0 00 | Branch if carry set
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPY $9C08            ; CC 08 9C | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BVS $20              ; 70 20 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPY $08              ; C4 08 | Compare Y register (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_06D
; Address: $F59636
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_06D:
    JSR $0050            ; 20 50 00 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    INC $F04D,X          ; FE 4D F0 | Increment (absolute,X)
    LDA $FC63,X          ; BD 63 FC | Read graphics status
    LDA $507C            ; AD 7C 50 | Read graphics status
    BIT $5B29            ; 2C 29 5B | Test bits in accumulator (absolute)
    BCC $00              ; 90 00 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    BCC $00              ; 90 00 | Branch if carry clear
    CPY #$40             ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_06E
; Address: $F59663
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_06E:
    JSR $9080            ; 20 80 90 | Jump to subroutine
    BEQ $20              ; F0 20 | Branch if equal
    DEC $19E2            ; CE E2 19 | Decrement (absolute)
    DEY                  ; 88 | Decrement Y register
    STA $0000,Y          ; 99 00 00 | Update graphics data
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_06F
; Address: $F59676
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_06F:
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_070
; Address: $F5967C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_070:
    SEP #$00             ; E2 00 | Set processor status bits
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_071
; Address: $F5968D
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_071:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA $67D4,X          ; 1D D4 67 | Logical OR with accumulator (absolute,X)
    CPX $67              ; E4 67 | Compare X register (zero page)
    CPX $6F              ; E4 6F | Compare X register (zero page)
    CPY $D8D3            ; CC D3 D8 | Compare Y register (absolute)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    TAX                  ; AA | Transfer accumulator to X register
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CPY $8400            ; CC 00 84 | Compare Y register (absolute)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    SBC $FE03,X          ; FD 03 FE | Subtract with carry (absolute,X)
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ASL $1F08,X          ; 1E 08 1F | Arithmetic shift left (absolute,X)
    LDA                  ; BF 10 3E CB | Read graphics status
    ASL $1000            ; 0E 00 10 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    ADC #$00             ; 69 00 | Add with carry (immediate)
    STA $ED6F,X          ; 9D 6F ED | Update graphics data

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_072
; Address: $F59704
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_072:
    JSR $82DF            ; 20 DF 82 | Jump to subroutine
    EOR $45CA            ; 4D CA 45 | Exclusive OR with accumulator (absolute)
    NOP                  ; EA | No operation
    PHX                  ; DA | Push X register to stack
    ADC ($B3,X)          ; 61 B3 | Add with carry ((zero page,X))
    LSR $0060,X          ; 5E 60 00 | Logical shift right (absolute,X)
    AND $3500,Y          ; 39 00 35 | Logical AND with accumulator (absolute,Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $FB68,Y          ; F9 68 FB | Subtract with carry (absolute,Y)
    STZ $FF              ; 64 FF | Store zero to zero page
    INC $7E53,X          ; FE 53 7E | Increment (absolute,X)
    EOR #$76             ; 49 76 | Exclusive OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    STY $00              ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_073
; Address: $F5973C
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_073:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STY $0500            ; 8C 00 05 | Store Y register to absolute address
    BEQ $47              ; F0 47 | Branch if equal
    PEA #$FD0B           ; F4 0B FD | Push effective address to stack
    CLD                  ; D8 | Clear decimal mode flag
    STA $197C            ; 8D 7C 19 | Update graphics data
    DEC                  ; 3A | Decrement accumulator
    CMP $00DA            ; CD DA 00 | Compare accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BNE $2F              ; D0 2F | Branch if not equal
    ASL $07FD            ; 0E FD 07 | Arithmetic shift left (absolute)
    PLX                  ; FA | Pull X register from stack
    ORA $12              ; 05 12 | Logical OR with accumulator (zero page)
    ORA $D6              ; 05 D6 | Logical OR with accumulator (zero page)
    STA $25FC,Y          ; 99 FC 25 | Update graphics data
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_075
; Address: $F59780
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_075:
    JSR $80C0            ; 20 C0 80 | Jump to subroutine
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    CPX #$50             ; E0 50 | Compare X register (immediate)
    LDY $30              ; A4 30 | Load from zero page into Y register
    DEX                  ; CA | Decrement X register
    BVC $A6              ; 50 A6 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    BVC $40              ; 50 40 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_076
; Address: $F59792
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_076:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LSR $00              ; 46 00 | Logical shift right (zero page)
    STX $00              ; 86 00 | Store X register to zero page
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $3203            ; 0E 03 32 | Arithmetic shift left (absolute)
    ORA $96C1,Y          ; 19 C1 96 | Logical OR with accumulator (absolute,Y)
    STY $AC              ; 84 AC | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    BPL $01              ; 10 01 | Branch if positive
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $3E00            ; 0D 00 3E | Logical OR with accumulator (absolute)
    STA ($FF,X)          ; 81 FF | Update graphics data
    BMI $37              ; 30 37 | Branch if negative
    LSR $67              ; 46 67 | Logical shift right (zero page)
    BCS $BF              ; B0 BF | Branch if carry set
    ASL $1FC0            ; 0E C0 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_077
; Address: $F597F2
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_077:
    CPY $9900            ; CC 00 99 | Compare Y register (absolute)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    CPX $00              ; E4 00 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    SBC $F83E,X          ; FD 3E F8 | Subtract with carry (absolute,X)
    CPX $43              ; E4 43 | Compare X register (zero page)
    ADC ($E3,X)          ; 61 E3 | Add with carry ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY $1C00,X          ; BC 00 1C | Load from absolute,X into Y register
    BMI $00              ; 30 00 | Branch if negative
    BRA $C7              ; 80 C7 | Branch always
    DEC $88              ; C6 88 | Decrement (zero page)
    STA $9BB1            ; 8D B1 9B | Update graphics data
    WDM #$F3             ; 42 F3 | Reserved instruction
    JMP ($C4FF)          ; 6C FF C4 | Jump to address (absolute indirect)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    ROR $4C00            ; 6E 00 4C | Rotate right (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $47              ; F0 47 | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    TXA                  ; 8A | Transfer X register to accumulator
    ADC $E91E,X          ; 7D 1E E9 | Add with carry (absolute,X)
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_078
; Address: $F59876
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_078:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    ORA ($A0,X)          ; 01 A0 | Logical OR with accumulator ((zero page,X))
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    SBC $FC07,Y          ; F9 07 FC | Subtract with carry (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA ($AE),Y          ; B1 AE | Read graphics status
    PEA #$F48F           ; F4 8F F4 | Push effective address to stack
    CMP $01              ; C5 01 | Compare accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCS $01              ; B0 01 | Branch if carry set
    BEQ $01              ; F0 01 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_079
; Address: $F5989D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_079:
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BPL $67              ; 10 67 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_07A
; Address: $F598A6
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_07A:
    JSR $0088            ; 20 88 00 | Jump to subroutine
    ADC $0200,Y          ; 79 00 02 | Add with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    STX $04EB            ; 8E EB 04 | Store X register to absolute address
    XBA                  ; EB | Exchange accumulator bytes
    STA $2D76,Y          ; 99 76 2D | Update graphics data
    STA $422E,Y          ; 99 2E 42 | Hardware register operation
    JMP ($CB02)          ; 6C 02 CB | Jump to address (absolute indirect)
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ROL $00              ; 26 00 | Rotate left (zero page)
    BNE $00              ; D0 00 | Branch if not equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY $CD00            ; AC 00 CD | Load from absolute address into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    ADC $D4CA            ; 6D CA D4 | Add with carry (absolute)
    LSR $39              ; 46 39 | Logical shift right (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    BIT $1800            ; 2C 00 18 | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    LDY $545F            ; AC 5F 54 | Load from absolute address into Y register
    LDA $00F740          ; AF 40 F7 00 | Read graphics status
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    LSR $02              ; 46 02 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    LDY $00              ; A4 00 | Load from zero page into Y register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PLX                  ; FA | Pull X register from stack
    SBC $AD16,X          ; FD 16 AD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_07B
; Address: $F59929
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_07B:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    BRA $04              ; 80 04 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_07C
; Address: $F59932
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_07C:
    CPY $00              ; C4 00 | Compare Y register (zero page)
    LDA #$00             ; A9 00 | Read graphics status
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    LSR $C000            ; 4E 00 C0 | Logical shift right (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $0D04            ; 0D 04 0D | Logical OR with accumulator (absolute)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA $041F            ; 0D 1F 04 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    ORA $919F            ; 0D 9F 91 | Logical OR with accumulator (absolute)
    STA $BFB2,X          ; 9D B2 BF | Update graphics data

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_07D
; Address: $F5998A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_07D:
    JSR $623F            ; 20 3F 62 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    SBC $00CC            ; ED CC 00 | Subtract with carry (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_07E
; Address: $F59998
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_07E:
    PHA                  ; 48 | Push accumulator to stack
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    CPY $54FF            ; CC FF 54 | Compare Y register (absolute)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_07F
; Address: $F599A8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_07F:
    JSR $40FC            ; 20 FC 40 | Jump to subroutine
    CLV                  ; B8 | Clear overflow flag
    BRA $70              ; 80 70 | Branch always
    BRA $70              ; 80 70 | Branch always
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    LDY $00              ; A4 00 | Load from zero page into Y register
    CPY $00              ; C4 00 | Compare Y register (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $00              ; 50 00 | Branch if overflow clear
    BVC $00              ; 50 00 | Branch if overflow clear
    BVS $FD              ; 70 FD | Branch if overflow set
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_081
; Address: $F599CC
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_081:
    BRA $C0              ; 80 C0 | Branch always
    BRA $02              ; 80 02 | Branch always
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA $30              ; 05 30 | Logical OR with accumulator (zero page)
    ORA $00C0,Y          ; 19 C0 00 | Logical OR with accumulator (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $CE00            ; 2C 00 CE | Test bits in accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_082
; Address: $F59A0A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_082:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_083
; Address: $F59A1B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_083:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_084
; Address: $F59A28
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_084:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_085
; Address: $F59A39
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_085:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $20              ; F0 20 | Branch if equal
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BVS $20              ; 70 20 | Branch if overflow set
    BNE $10              ; D0 10 | Branch if not equal
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_087
; Address: $F59A7D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_087:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_088
; Address: $F59AB8
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_088:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BVS $00              ; 70 00 | Branch if overflow set
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $BFA9            ; 6D A9 BF | Add with carry (absolute)
    CMP $10FF,Y          ; D9 FF 10 | Compare accumulator (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    SBC $FB44            ; ED 44 FB | Subtract with carry (absolute)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    SBC $4200            ; ED 00 42 | Hardware register operation
    PHY                  ; 5A | Push Y register to stack
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_089
; Address: $F59B6E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_089:
    BMI $00              ; 30 00 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_08A
; Address: $F59B7F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_08A:
    BMI $01              ; 30 01 | Branch if negative
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_08B
; Address: $F59BE2
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_08B:
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $62FF40          ; 8F 40 FF 62 | Update graphics data
    ADC $3F29,X          ; 7D 29 3F | Add with carry (absolute,X)
    CMP $00FF,Y          ; D9 FF 00 | Compare accumulator (absolute,Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    STA $C200            ; 8D 00 C2 | Update graphics data
    PHY                  ; 5A | Push Y register to stack
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_08C
; Address: $F59C20
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_08C:
    JSR $2088            ; 20 88 20 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    BRA $88              ; 80 88 | Branch always
    BCS $38              ; B0 38 | Branch if carry set
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BMI $C7              ; 30 C7 | Branch if negative
    PEA #$F38D           ; F4 8D F3 | Push effective address to stack
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $2100            ; 0D 00 21 | PPU graphics register access
    SBC $FF02,Y          ; F9 02 FF | Subtract with carry (absolute,Y)
    STY $02F7            ; 8C F7 02 | Store Y register to absolute address
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    BVC $EF              ; 50 EF | Branch if overflow clear
    SBC $00DA            ; ED DA 00 | Subtract with carry (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CMP $3600,Y          ; D9 00 36 | Compare accumulator (absolute,Y)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ADC $0000            ; 6D 00 00 | Add with carry (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BVS $20              ; 70 20 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_08D
; Address: $F59CA4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_08D:
    JSR $8088            ; 20 88 80 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    BCS $38              ; B0 38 | Branch if carry set
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BMI $C0              ; 30 C0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_08E
; Address: $F59CAF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_08E:
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_08F
; Address: $F59CBE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_08F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BPL $40              ; 10 40 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $60              ; 10 60 | Branch if positive
    BVS $C0              ; 70 C0 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BCC $00              ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_090
; Address: $F59CFE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_090:
    JSR $5600            ; 20 00 56 | Jump to subroutine
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ADC $D32A,Y          ; 79 2A D3 | Add with carry (absolute,Y)
    ROL $42              ; 26 42 | Hardware register operation
    JMP ($CB02)          ; 6C 02 CB | Jump to address (absolute indirect)
    ASL $A1              ; 06 A1 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_091
; Address: $F59D14
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_091:
    JSR $D400            ; 20 00 D4 | Jump to subroutine
    INX                  ; E8 | Increment X register
    LDY $CD00            ; AC 00 CD | Load from absolute address into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    DEY                  ; 88 | Decrement Y register
    BPL $00              ; 10 00 | Branch if positive
    SBC ($C3),Y          ; F1 C3 | Subtract with carry ((zero page),Y)
    ROL $9EC4,X          ; 3E C4 9E | Rotate left (absolute,X)
    EOR ($5F,X)          ; 41 5F | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_092
; Address: $F59D4F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_092:
    ADC $000E            ; 6D 0E 00 | Add with carry (absolute)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    LDX #$00             ; A2 00 | Load immediate value into X register
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $C0              ; 80 C0 | Branch always
    DEC $30              ; C6 30 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_093
; Address: $F59D65
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_093:
    BIT #$25             ; 89 25 | Test bits in accumulator (immediate)
    ADC $E543,X          ; 7D 43 E5 | Add with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    DEC                  ; 3A | Decrement accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    DEC $00              ; C6 00 | Decrement (zero page)
    DEX                  ; CA | Decrement X register
    SEC                  ; 38 | Set carry flag
    ORA $6500,X          ; 1D 00 65 | Logical OR with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always
    LDY $C634,X          ; BC 34 C6 | Load from absolute,X into Y register
    STZ $06              ; 64 06 | Store zero to zero page
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    AND $E788,Y          ; 39 88 E7 | Logical AND with accumulator (absolute,Y)
    BPL $02              ; 10 02 | Branch if positive
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STZ $26F2            ; 9C F2 26 | Store zero to absolute
    CPY #$B1             ; C0 B1 | Compare Y register (immediate)
    STX $9E              ; 86 9E | Store X register to zero page
    STZ $7E              ; 64 7E | Store zero to zero page
    BVC $1E              ; 50 1E | Branch if overflow clear
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    BIT $426B            ; 2C 6B 42 | Hardware register operation
    ORA $0E00,X          ; 1D 00 0E | Logical OR with accumulator (absolute,X)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    STA ($00,X)          ; 81 00 | Update graphics data
    DEC $00              ; C6 00 | Decrement (zero page)
    BCC $00              ; 90 00 | Branch if carry clear
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BEQ $30              ; F0 30 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    INC $3A              ; E6 3A | Increment (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_094
; Address: $F59DFC
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_094:
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0338            ; 0E 38 03 | Arithmetic shift left (absolute)
    ORA $0410,Y          ; 19 10 04 | Logical OR with accumulator (absolute,Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVS $80              ; 70 80 | Branch if overflow set
    BEQ $2C              ; F0 2C | Branch if equal
    SEP #$82             ; E2 82 | Set processor status bits
    SBC ($49,X)          ; E1 49 | Subtract with carry ((zero page,X))
    ADC $3EA6,Y          ; 79 A6 3E | Add with carry (absolute,Y)
    ROL $2E28,X          ; 3E 28 2E | Rotate left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    STZ $5F00,X          ; 9E 00 5F | Store zero to absolute,X
    LDX $00              ; A6 00 | Load from zero page into X register
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BVS $40              ; 70 40 | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_095
; Address: $F59E9A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_095:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_096
; Address: $F59EA4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_096:
    JSR $8200            ; 20 00 82 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BVS $20              ; 70 20 | Branch if overflow set
    ROR $0808,X          ; 7E 08 08 | Rotate right (absolute,X)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_097
; Address: $F59EB5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_097:
    JSR $8200            ; 20 00 82 | Jump to subroutine
    BRA $20              ; 80 20 | Branch always
    BVC $08              ; 50 08 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ASL $000F            ; 0E 0F 00 | Arithmetic shift left (absolute)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $0071            ; 0E 71 00 | Arithmetic shift left (absolute)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $0D00            ; 0D 00 0D | Logical OR with accumulator (absolute)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA $041F            ; 0D 1F 04 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_098
; Address: $F59EFA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_098:
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    ADC $E623,Y          ; 79 23 E6 | Add with carry (absolute,Y)
    STA                  ; 9F 89 8D 83 | Update graphics data
    PHB                  ; 8B | Push data bank register to stack
    RTI                  ; 40 | Return from interrupt
    DEC $E5              ; C6 E5 | Decrement (zero page)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_099
; Address: $F59F1A
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_099:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    SBC $FDCA,X          ; FD CA FD | Subtract with carry (absolute,X)
    SBC $EC69,X          ; FD 69 EC | Subtract with carry (absolute,X)
    BPL $BC              ; 10 BC | Branch if positive
    BVC $F8              ; 50 F8 | Branch if overflow clear
    BRA $78              ; 80 78 | Branch always
    BRA $70              ; 80 70 | Branch always
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    BVC $00              ; 50 00 | Branch if overflow clear
    STA $8F              ; 85 8F | Update graphics data
    SBC $E11C,X          ; FD 1C E1 | Subtract with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BMI $38              ; 30 38 | Branch if negative
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    WDM #$FD             ; 42 FD | Reserved instruction
    SBC $FF30,X          ; FD 30 FF | Subtract with carry (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    LDA $F851,X          ; BD 51 F8 | Read graphics status
    BRA $78              ; 80 78 | Branch always
    BRA $70              ; 80 70 | Branch always
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    BVC $00              ; 50 00 | Branch if overflow clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $30E1,X          ; 1E E1 30 | Arithmetic shift left (absolute,X)
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_09A
; Address: $F59FB8
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_09A:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $06              ; 64 06 | Store zero to zero page
    CLC                  ; 18 | Clear carry flag
    BMI $38              ; 30 38 | Branch if negative
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    INC $FD              ; E6 FD | Increment (zero page)
    INC                  ; 1A | Increment accumulator
    SBC $F755,X          ; FD 55 F7 | Subtract with carry (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    ROR $F9              ; 66 F9 | Rotate right (zero page)
    STY $79              ; 84 79 | Store Y register to zero page
    STA ($78,X)          ; 81 78 | Update graphics data
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_09B
; Address: $F59FF8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_09B:
    JSL $008000          ; 22 00 80 00 | Jump to subroutine long
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    CPX $38              ; E4 38 | Compare X register (zero page)
    STZ $0B02,X          ; 9E 02 0B | Store zero to absolute,X
    TXA                  ; 8A | Transfer X register to accumulator
    PLX                  ; FA | Pull X register from stack
    ORA $36F7            ; 0D F7 36 | Logical OR with accumulator (absolute)
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_09C
; Address: $F5A018
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_09C:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC $64              ; C6 64 | Decrement (zero page)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    BMI $38              ; 30 38 | Branch if negative
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_09D
; Address: $F5A04A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_09D:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $00BF,X          ; 3D BF 00 | Logical AND with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_09F
; Address: $F5A067
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_09F:
    BVS $60              ; 70 60 | Branch if overflow set
    BVS $40              ; 70 40 | Branch if overflow set
    BVS $A0              ; 70 A0 | Branch if overflow set
    BCS $60              ; B0 60 | Branch if carry set
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    BVC $00              ; 50 00 | Branch if overflow clear
    BCC $00              ; 90 00 | Branch if carry clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    INC $1FC2            ; EE C2 1F | Increment (absolute)
    STY $0F              ; 84 0F | Store Y register to zero page
    NOP                  ; EA | No operation
    AND ($FE),Y          ; 31 FE | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    LDY #$30             ; A0 30 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0A0
; Address: $F5A0C3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0A0:
    BVS $60              ; 70 60 | Branch if overflow set
    BVS $28              ; 70 28 | Branch if overflow set
    ASL $08F8,X          ; 1E F8 08 | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ROL $8E              ; 26 8E | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0A1
; Address: $F5A0DE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0A1:
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0A2
; Address: $F5A12F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0A2:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    JMP $0000            ; 4C 00 00 | Jump to address
    ASL $1100            ; 0E 00 11 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0A3
; Address: $F5A165
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0A3:
    JSR $221A            ; 20 1A 22 | Jump to subroutine
    ORA $2543,Y          ; 19 43 25 | Logical OR with accumulator (absolute,Y)
    AND $0A7B,X          ; 3D 7B 0A | Logical AND with accumulator (absolute,X)
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    ORA $3C00,X          ; 1D 00 3C | Logical OR with accumulator (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    RTI                  ; 40 | Return from interrupt
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ADC $D32A,Y          ; 79 2A D3 | Add with carry (absolute,Y)
    ROL $42              ; 26 42 | Hardware register operation
    JMP ($CB02)          ; 6C 02 CB | Jump to address (absolute indirect)
    ASL $A0              ; 06 A0 | Arithmetic shift left (zero page)
    WDM #$00             ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0A4
; Address: $F5A1D4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0A4:
    JSR $D400            ; 20 00 D4 | Jump to subroutine
    INX                  ; E8 | Increment X register
    LDY $CD00            ; AC 00 CD | Load from absolute address into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0A5
; Address: $F5A1E1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0A5:
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    BIT $1BF4            ; 2C F4 1B | Test bits in accumulator (absolute)
    AND ($FD,X)          ; 21 FD | Logical AND with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    LDA ($BE),Y          ; B1 BE | Read graphics status
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0A6
; Address: $F5A1F6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0A6:
    JSR $CA00            ; 20 00 CA | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($81,X)          ; 21 81 | Logical AND with accumulator ((zero page,X))
    STA ($C3,X)          ; 81 C3 | Update graphics data
    STA ($03,X)          ; 81 03 | Update graphics data
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0A7
; Address: $F5A218
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0A7:
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ASL $EE              ; 06 EE | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BCC $BA              ; 90 BA | Branch if carry clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0A8
; Address: $F5A249
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0A8:
    JSR $474F            ; 20 4F 47 | Jump to subroutine
    DEC $385F,X          ; DE 5F 38 | Decrement (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($C7,X)          ; 01 C7 | Logical OR with accumulator ((zero page,X))
    BRA $37              ; 80 37 | Branch always
    BMI $F7              ; 30 F7 | Branch if negative
    STA $87FE            ; 8D FE 87 | Update graphics data
    INC $DF62,X          ; FE 62 DF | Increment (absolute,X)
    DEC $0046,X          ; DE 46 00 | Decrement (absolute,X)
    SBC $00              ; E5 00 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0A9
; Address: $F5A278
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0A9:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    STA ($00),Y          ; 91 00 | Update graphics data
    BVC $00              ; 50 00 | Branch if overflow clear
    BMI $83              ; 30 83 | Branch if negative
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STX $8F6A            ; 8E 6A 8F | Store X register to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    STA $6C9B15          ; 8F 15 9B 6C | Update graphics data
    ADC ($02),Y          ; 71 02 | Add with carry ((zero page),Y)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0AA
; Address: $F5A298
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0AA:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BPL $0E              ; 10 0E | Branch if positive
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    STA ($FF),Y          ; 91 FF | Update graphics data
    JMP $00B7            ; 4C B7 00 | Jump to address
    INC $ED15,X          ; FE 15 ED | Increment (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    LSR $3100            ; 4E 00 31 | Logical shift right (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    STA $D7994D          ; 8F 4D 99 D7 | Update graphics data
    AND ($FC),Y          ; 31 FC | Logical AND with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    LDY $7E22,X          ; BC 22 7E | Load from absolute,X into Y register
    SBC #$09             ; E9 09 | Subtract with carry (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0AB
; Address: $F5A2DC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0AB:
    JSR $5000            ; 20 00 50 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0AC
; Address: $F5A2EB
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0AC:
    JSR $C080            ; 20 80 C0 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BMI $7E              ; 30 7E | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    STY $4F              ; 84 4F | Store Y register to zero page
    EOR $334C,X          ; 5D 4C 33 | Exclusive OR with accumulator (absolute,X)
    STX $FF              ; 86 FF | Store X register to zero page
    SBC $7D00,X          ; FD 00 7D | Subtract with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    CPX #$20             ; E0 20 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0AD
; Address: $F5A365
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0AD:
    JMP $4270            ; 4C 70 42 | Hardware register operation
    LDY $86              ; A4 86 | Load from zero page into Y register
    PLA                  ; 68 | Pull accumulator from stack
    ADC $FD88            ; 6D 88 FD | Add with carry (absolute)
    ROR $7F              ; 66 7F | Rotate right (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    LDX $7A00,Y          ; BE 00 7A | Load from absolute,Y into X register
    BRA $00              ; 80 00 | Branch always
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    BPL $67              ; 10 67 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0AE
; Address: $F5A386
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0AE:
    JSR $0088            ; 20 88 00 | Jump to subroutine
    ADC $0200,Y          ; 79 00 02 | Add with carry (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    STA ($EE),Y          ; 91 EE | Update graphics data
    ADC $D32A,Y          ; 79 2A D3 | Add with carry (absolute,Y)
    INC $E2              ; E6 E2 | Increment (zero page)
    PHB                  ; 8B | Push data bank register to stack
    BCS $00              ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0AF
; Address: $F5A3B4
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0AF:
    JSR $D400            ; 20 00 D4 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    STZ $ED00            ; 9C 00 ED | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    DEC $2F              ; C6 2F | Decrement (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BIT $1800            ; 2C 00 18 | Test bits in accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LDA                  ; BF 00 29 00 | Read graphics status
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    EOR ($EE),Y          ; 51 EE | Exclusive OR with accumulator ((zero page),Y)
    JMP $CC20AE          ; 5C AE 20 CC | Jump to address long
    RTI                  ; 40 | Return from interrupt
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    LSR $02              ; 46 02 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    STY $8200            ; 8C 00 82 | Store Y register to absolute address
    CPY $A000            ; CC 00 A0 | Compare Y register (absolute)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LSR $9F08            ; 4E 08 9F | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0B0
; Address: $F5A406
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0B0:
    AND ($9F),Y          ; 31 9F | Logical AND with accumulator ((zero page),Y)
    ADC $5893,X          ; 7D 93 58 | Add with carry (absolute,X)
    BMI $79              ; 30 79 | Branch if negative
    BMI $17              ; 30 17 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    BMI $00              ; 30 00 | Branch if negative
    STY $287F            ; 8C 7F 28 | Store Y register to absolute address
    BRA $FF              ; 80 FF | Branch always
    ORA $06F2            ; 0D F2 06 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BVC $00              ; 50 00 | Branch if overflow clear
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0B2
; Address: $F5A442
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0B2:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $0224            ; 0D 24 02 | Logical OR with accumulator (absolute)
    ROL $34              ; 26 34 | Rotate left (zero page)
    ORA $0D5D,Y          ; 19 5D 0D | Logical OR with accumulator (absolute,Y)
    LDA                  ; BF 00 00 03 | Read graphics status
    ORA $1B00            ; 0D 00 1B | Logical OR with accumulator (absolute)
    ORA $2800,Y          ; 19 00 28 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0B3
; Address: $F5A47C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0B3:
    JSL $004000          ; 22 00 40 00 | Jump to subroutine long
    PEA #$EB9D           ; F4 9D EB | Push effective address to stack
    BCS $18              ; B0 18 | Branch if carry set
    CMP #$CF             ; C9 CF | Compare accumulator (immediate)
    ORA $A05F,Y          ; 19 5F A0 | Logical OR with accumulator (absolute,Y)
    BCC $00              ; 90 00 | Branch if carry clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    LDX $E745,Y          ; BE 45 E7 | Load from absolute,Y into X register
    LDA #$DE             ; A9 DE | Read graphics status
    STA $00              ; 85 00 | Update graphics data
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $8300            ; 8D 00 83 | Update graphics data
    TSX                  ; BA | Transfer stack pointer to X register
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0B4
; Address: $F5A4C4
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0B4:
    ROL                  ; 2A | Rotate left (accumulator)
    LDA $D936,Y          ; B9 36 D9 | Read graphics status
    SBC ($81),Y          ; F1 81 | Subtract with carry ((zero page),Y)
    INC $F708,X          ; FE 08 F7 | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    CMP $00E0,X          ; DD E0 00 | Compare accumulator (absolute,X)
    ADC $D600            ; 6D 00 D6 | Add with carry (absolute)
    BPL $3D              ; 10 3D | Branch if positive
    ROL $B20E,X          ; 3E 0E B2 | Rotate left (absolute,X)
    STA $31F7,Y          ; 99 F7 31 | Update graphics data
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    BRA $1F              ; 80 1F | Branch always
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    WDM #$FD             ; 42 FD | Reserved instruction
    EOR ($CE,X)          ; 41 CE | Exclusive OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP ($D600)          ; 6C 00 D6 | Jump to address (absolute indirect)
    BPL $7D              ; 10 7D | Branch if positive
    BVS $F2              ; 70 F2 | Branch if overflow set
    CPX #$8D             ; E0 8D | Compare X register (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    BCS $6A              ; B0 6A | Branch if carry set
    BVS $86              ; 70 86 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    BNE $C0              ; D0 C0 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $1D              ; 06 1D | Arithmetic shift left (zero page)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA $0012            ; 0D 12 00 | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0B5
; Address: $F5A54C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0B5:
    BVC $00              ; 50 00 | Branch if overflow clear
    BNE $00              ; D0 00 | Branch if not equal
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0B6
; Address: $F5A557
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0B6:
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0B7
; Address: $F5A55D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0B7:
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $0F              ; F0 0F | Branch if equal
    JMP $1B7B0C          ; 5C 0C 7B 1B | Jump to address long
    ASL $66              ; 06 66 | Arithmetic shift left (zero page)
    BIT $F3              ; 24 F3 | Test bits in accumulator (zero page)
    BMI $F3              ; 30 F3 | Branch if negative
    STZ $06              ; 64 06 | Store zero to zero page
    ADC $5A24,Y          ; 79 24 5A | Add with carry (absolute,Y)
    BMI $CF              ; 30 CF | Branch if negative
    SBC $0088,X          ; FD 88 00 | Subtract with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0B8
; Address: $F5A587
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0B8:
    JSR $0033            ; 20 33 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STY $9C00            ; 8C 00 9C | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    CPX #$C0             ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0B9
; Address: $F5A595
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0B9:
    JSR $D620            ; 20 20 D6 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STY $9408            ; 8C 08 94 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0BA
; Address: $F5A5A4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0BA:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BEQ $60              ; F0 60 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0BB
; Address: $F5A5B5
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0BB:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BCC $00              ; 90 00 | Branch if carry clear
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BMI $0C              ; 30 0C | Branch if negative
    SEC                  ; 38 | Set carry flag
    ASL $1B4F            ; 0E 4F 1B | Arithmetic shift left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    BEQ $20              ; F0 20 | Branch if equal
    ROL $1F98            ; 2E 98 1F | Rotate left (absolute)
    INC $A763,X          ; FE 63 A7 | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    STZ $9F79,X          ; 9E 79 9F | Store zero to absolute,X
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    JMP ($9C00)          ; 6C 00 9C | Jump to address (absolute indirect)
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0BD
; Address: $F5A60B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0BD:
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0BE
; Address: $F5A61A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0BE:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA $1C09,Y          ; 19 09 1C | Logical OR with accumulator (absolute,Y)
    ASL $0302            ; 0E 02 03 | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ORA $0300            ; 0D 00 03 | Logical OR with accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $18              ; 90 18 | Branch if carry clear
    BPL $30              ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0BF
; Address: $F5A645
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0BF:
    JSR $40F0            ; 20 F0 40 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCC $68              ; 90 68 | Branch if carry clear
    BPL $E8              ; 10 E8 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0C0
; Address: $F5A654
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0C0:
    JSR $40D0            ; 20 D0 40 | Jump to subroutine
    BCS $00              ; B0 00 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $2F06,X          ; 1E 06 2F | Arithmetic shift left (absolute,X)
    BVS $20              ; 70 20 | Branch if overflow set
    ADC #$20             ; 69 20 | Add with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    LDY $130C,X          ; BC 0C 13 | Load from absolute,X into Y register
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0C1
; Address: $F5A678
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0C1:
    JSR $2050            ; 20 50 20 | Jump to subroutine
    EOR $2718,Y          ; 59 18 27 | Exclusive OR with accumulator (absolute,Y)
    BCC $3C              ; 90 3C | Branch if carry clear
    BMI $78              ; 30 78 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0C2
; Address: $F5A690
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0C2:
    BCC $6C              ; 90 6C | Branch if carry clear
    BMI $CC              ; 30 CC | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0C3
; Address: $F5A6A0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0C3:
    BVS $30              ; 70 30 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    BPL $38              ; 10 38 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0C5
; Address: $F5A6B0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0C5:
    BMI $40              ; 30 40 | Branch if negative
    BPL $28              ; 10 28 | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0C6
; Address: $F5A6BD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0C6:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $41              ; 80 41 | Branch always
    CMP ($37,X)          ; C1 37 | Compare accumulator ((zero page,X))
    ORA $087F            ; 0D 7F 08 | Logical OR with accumulator (absolute)
    ROL $0800,X          ; 3E 00 08 | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0C7
; Address: $F5A6DC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0C7:
    JSR $1800            ; 20 00 18 | Jump to subroutine
    STA                  ; 9F 14 FF 40 | Update graphics data
    BVS $7F              ; 70 7F | Branch if overflow set
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0C8
; Address: $F5A6F2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0C8:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0C9
; Address: $F5A708
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0C9:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0CA
; Address: $F5A712
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0CA:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA #$1C             ; 09 1C | Logical OR with accumulator (immediate)
    ORA #$1C             ; 09 1C | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $1300            ; 0D 00 13 | Logical OR with accumulator (absolute)
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    LDA $3F              ; A5 3F | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    REP #$00             ; C2 00 | Reset processor status bits
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $40              ; 10 40 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BNE $18              ; D0 18 | Branch if not equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0CB
; Address: $F5A76C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0CB:
    BCS $38              ; B0 38 | Branch if carry set
    BCS $38              ; B0 38 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0CC
; Address: $F5A791
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0CC:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0CD
; Address: $F5A7A0
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0CD:
    BRA $00              ; 80 00 | Branch always
    ASL $0300,X          ; 1E 00 03 | Arithmetic shift left (absolute,X)
    STA ($00,X)          ; 81 00 | Update graphics data
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    ASL $0300,X          ; 1E 00 03 | Arithmetic shift left (absolute,X)
    STA ($00,X)          ; 81 00 | Update graphics data
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ASL $007F,X          ; 1E 7F 00 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FD             ; E0 FD | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $E000,X          ; FD 00 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BCS $00              ; B0 00 | Branch if carry set
    ROR $FF7F,X          ; 7E 7F FF | Rotate right (absolute,X)
    BCS $00              ; B0 00 | Branch if carry set
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0CE
; Address: $F5A84B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0CE:
    BRA $60              ; 80 60 | Branch always
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0D0
; Address: $F5A85F
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0D0:
    BEQ $C0              ; F0 C0 | Branch if equal
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    BVS $00              ; 70 00 | Branch if overflow set
    ORA $0700            ; 0D 00 07 | Logical OR with accumulator (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$7F             ; 09 7F | Logical OR with accumulator (immediate)
    BCS $FF              ; B0 FF | Branch if carry set
    ORA ($7F),Y          ; 11 7F | Logical OR with accumulator ((zero page),Y)
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    REP #$1F             ; C2 1F | Reset processor status bits
    PHY                  ; 5A | Push Y register to stack
    STA ($00),Y          ; 91 00 | Update graphics data
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    SEP #$00             ; E2 00 | Set processor status bits
    CMP $F000,X          ; DD 00 F0 | Compare accumulator (absolute,X)
    CPX $00              ; E4 00 | Compare X register (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    STZ $FC22            ; 9C 22 FC | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CPX $00              ; E4 00 | Compare X register (zero page)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    BRA $00              ; 80 00 | Branch always
    BNE $98              ; D0 98 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0D2
; Address: $F5A910
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0D2:
    PLA                  ; 68 | Pull accumulator from stack
    BCC $00              ; 90 00 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0D3
; Address: $F5A920
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0D3:
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0D4
; Address: $F5A937
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0D4:
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL $0400,X          ; 1E 00 04 | Arithmetic shift left (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ASL $0400,X          ; 1E 00 04 | Arithmetic shift left (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    INC $FC70,X          ; FE 70 FC | Increment (absolute,X)
    INC $7000,X          ; FE 00 70 | Increment (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    INC $7000,X          ; FE 00 70 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    ORA $0701,Y          ; 19 01 07 | Logical OR with accumulator (absolute,Y)
    ORA $0700,Y          ; 19 00 07 | Logical OR with accumulator (absolute,Y)
    BEQ $FF              ; F0 FF | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    INX                  ; E8 | Increment X register
    INC $F8C0,X          ; FE C0 F8 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    ORA #$48             ; 09 48 | Logical OR with accumulator (immediate)
    EOR ($88,X)          ; 41 88 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0D5
; Address: $F5A9EE
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0D5:
    JSL $00003F          ; 22 3F 00 00 | Jump to subroutine long
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BPL $73              ; 10 73 | Branch if positive
    CPY $867C            ; CC 7C 86 | Compare Y register (absolute)
    STX $0769            ; 8E 69 07 | Store X register to absolute address
    JMP ($000B)          ; 6C 0B 00 | Jump to address (absolute indirect)
    BVS $00              ; 70 00 | Branch if overflow set
    STY $8300            ; 8C 00 83 | Store Y register to absolute address
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BVS $40              ; 70 40 | Branch if overflow set
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    STY $8C38            ; 8C 38 8C | Store Y register to absolute address
    BVC $C4              ; 50 C4 | Branch if overflow clear
    BCS $00              ; B0 00 | Branch if carry set
    CPX $00              ; E4 00 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0D6
; Address: $F5AA4F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0D6:
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    ORA $081F            ; 0D 1F 08 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($09),Y          ; 11 09 | Logical OR with accumulator ((zero page),Y)
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    BPL $07              ; 10 07 | Branch if positive
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ADC $61EE,X          ; 7D EE 61 | Add with carry (absolute,X)
    STZ $F04E,X          ; 9E 4E F0 | Store zero to absolute,X
    BPL $E0              ; 10 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0D7
; Address: $F5AA89
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0D7:
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0D8
; Address: $F5AACD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0D8:
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0D9
; Address: $F5AADD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0D9:
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0DB
; Address: $F5AB02
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0DB:
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    CMP ($EF,X)          ; C1 EF | Compare accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $C800,X          ; FE 00 C8 | Increment (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    PLY                  ; 7A | Pull Y register from stack
    INC $C800,X          ; FE 00 C8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0DC
; Address: $F5AB57
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0DC:
    BMI $00              ; 30 00 | Branch if negative
    PLY                  ; 7A | Pull Y register from stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CMP $22DD,Y          ; D9 DD 22 | Compare accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0DD
; Address: $F5AB86
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0DD:
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    ASL $0CC0,X          ; 1E C0 0C | Arithmetic shift left (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    BMI $04              ; 30 04 | Branch if negative
    ROL $00              ; 26 00 | Rotate left (zero page)
    INY                  ; C8 | Increment Y register
    STY $00              ; 84 00 | Store Y register to zero page
    PEA #$FC00           ; F4 00 FC | Push effective address to stack
    BIT $548B            ; 2C 8B 54 | Test bits in accumulator (absolute)
    REP #$34             ; C2 34 | Reset processor status bits
    CPY #$0C             ; C0 0C | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0DE
; Address: $F5ABA9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0DE:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    TSX                  ; BA | Transfer stack pointer to X register
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0DF
; Address: $F5ABB8
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0DF:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BVC $C4              ; 50 C4 | Branch if overflow clear
    BMI $74              ; 30 74 | Branch if negative
    SEC                  ; 38 | Set carry flag
    LDY $4C00,X          ; BC 00 4C | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    AND ($BF),Y          ; 31 BF | Logical AND with accumulator ((zero page),Y)
    STA $7B              ; 85 7B | Update graphics data
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $42              ; 26 42 | Hardware register operation
    JMP ($CB02)          ; 6C 02 CB | Jump to address (absolute indirect)
    ASL $16              ; 06 16 | Arithmetic shift left (zero page)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    LDY $CD00            ; AC 00 CD | Load from absolute address into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0E0
; Address: $F5AC22
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0E0:
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    STZ $00              ; 64 00 | Store zero to zero page
    BRA $00              ; 80 00 | Branch always
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $00              ; 64 00 | Store zero to zero page
    BRA $00              ; 80 00 | Branch always
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0E2
; Address: $F5ACD9
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0E2:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0E3
; Address: $F5AD36
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0E3:
    ASL $1C00,X          ; 1E 00 1C | Arithmetic shift left (absolute,X)
    ORA $0700,Y          ; 19 00 07 | Logical OR with accumulator (absolute,Y)
    BRA $9C              ; 80 9C | Branch always
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $20              ; 80 20 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0E5
; Address: $F5AD56
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0E5:
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0E6
; Address: $F5AD6C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0E6:
    JSR $D1B1            ; 20 B1 D1 | Jump to subroutine
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    ORA $0F02            ; 0D 02 0F | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    BIT $66              ; 24 66 | Test bits in accumulator (zero page)
    AND $E7              ; 25 E7 | Logical AND with accumulator (zero page)
    ORA $0A7E,Y          ; 19 7E 0A | Logical OR with accumulator (absolute,Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    AND $5B00            ; 2D 00 5B | Logical AND with accumulator (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    STY $00              ; 84 00 | Store Y register to zero page
    ORA $0100            ; 0D 00 01 | Logical OR with accumulator (absolute)
    ORA $0100            ; 0D 00 01 | Logical OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0E7
; Address: $F5ADCC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0E7:
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $0000,Y          ; F9 00 00 | Subtract with carry (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SBC $0000,Y          ; F9 00 00 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0E8
; Address: $F5ADE7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0E8:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    BRA $20              ; 80 20 | Branch always
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0E9
; Address: $F5ADF7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0E9:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    ROL $0100,X          ; 3E 00 01 | Rotate left (absolute,X)
    ROL $0100,X          ; 3E 00 01 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0EA
; Address: $F5AE27
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0EA:
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$20             ; E0 20 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0EB
; Address: $F5AE47
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0EB:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0EC
; Address: $F5AE57
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0EC:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    BEQ $00              ; F0 00 | Branch if equal
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    ASL $0702,X          ; 1E 02 07 | Arithmetic shift left (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ASL $0700,X          ; 1E 00 07 | Arithmetic shift left (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$30             ; A0 30 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0ED
; Address: $F5AF22
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0ED:
    JSR $2030            ; 20 30 20 | Jump to subroutine
    BMI $40              ; 30 40 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    BPL $67              ; 10 67 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0EF
; Address: $F5AF49
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0EF:
    ADC $0200,Y          ; 79 00 02 | Add with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    EOR $8D              ; 45 8D | Exclusive OR with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA                  ; BF 0E FF 00 | Read graphics status
    DEC $1800            ; CE 00 18 | Decrement (absolute)
    PHP                  ; 08 | Push processor status to stack
    BIT $1800            ; 2C 00 18 | Test bits in accumulator (absolute)
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDA ($00),Y          ; B1 00 | Read graphics status
    DEC $0000            ; CE 00 00 | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    INC $DD32            ; EE 32 DD | Increment (absolute)
    LDA $20C620          ; AF 20 C6 20 | Read graphics status
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    LSR $02              ; 46 02 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    STA $8900            ; 8D 00 89 | Update graphics data
    STX $00              ; 86 00 | Store X register to zero page
    BRA $00              ; 80 00 | Branch always
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STZ $0F00            ; 9C 00 0F | Store zero to absolute
    ASL $00FF,X          ; 1E FF 00 | Arithmetic shift left (absolute,X)
    STZ $0F00            ; 9C 00 0F | Store zero to absolute
    ASL $C000,X          ; 1E 00 C0 | Arithmetic shift left (absolute,X)
    BRA $F8              ; 80 F8 | Branch always
    BEQ $FE              ; F0 FE | Branch if equal
    BMI $FF              ; 30 FF | Branch if negative
    CPY #$E0             ; C0 E0 | Game work RAM access
    ASL $C000,X          ; 1E 00 C0 | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEC $1F03            ; CE 03 1F | Decrement (absolute)
    CPX #$80             ; E0 80 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0F0
; Address: $F5B02A
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0F0:
    BRA $FF              ; 80 FF | Branch always
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    DEC $1F00            ; CE 00 1F | Decrement (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BEQ $20              ; F0 20 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    CPX #$78             ; E0 78 | Compare X register (immediate)
    INC $1800,X          ; FE 00 18 | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $0F02,X          ; FE 02 0F | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BRA $E6              ; 80 E6 | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    INC $00              ; E6 00 | Increment (zero page)
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ROL $4F2D,X          ; 3E 2D 4F | Rotate left (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    LDA #$BF             ; A9 BF | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    BCS $00              ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0F1
; Address: $F5B0DC
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0F1:
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    WDM #$00             ; 42 00 | Reserved instruction
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BMI $C0              ; 30 C0 | Branch if negative
    INY                  ; C8 | Increment Y register
    EOR $8D              ; 45 8D | Exclusive OR with accumulator (zero page)
    ADC $0000,X          ; 7D 00 00 | Add with carry (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $05              ; E6 05 | Increment (zero page)
    ADC #$DE             ; 69 DE | Add with carry (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $FB00,X          ; 1D 00 FB | Logical OR with accumulator (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    STY $00              ; 84 00 | Store Y register to zero page
    JMP $429B            ; 4C 9B 42 | Hardware register operation
    PHP                  ; 08 | Push processor status to stack
    WDM #$7E             ; 42 7E | Reserved instruction
    ADC $F688,X          ; 7D 88 F6 | Add with carry (absolute,X)
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    CPX $00              ; E4 00 | Compare X register (zero page)
    STA ($00,X)          ; 81 00 | Update graphics data
    BRA $00              ; 80 00 | Branch always
    TSX                  ; BA | Transfer stack pointer to X register
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ASL $8F              ; 06 8F | Arithmetic shift left (zero page)
    STA $C4D30A          ; 8F 0A D3 C4 | Update graphics data
    INC $05              ; E6 05 | Increment (zero page)
    ADC #$DE             ; 69 DE | Add with carry (immediate)
    STA $00              ; 85 00 | Update graphics data
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    CMP $3B00,X          ; DD 00 3B | Compare accumulator (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BRA $E7              ; 80 E7 | Branch always
    STA ($80,X)          ; 81 80 | Update graphics data
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0F2
; Address: $F5B193
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0F2:
    STA ($00,X)          ; 81 00 | Update graphics data
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $CC00,X          ; FE 00 CC | Increment (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    SBC $6000,X          ; FD 00 60 | Subtract with carry (absolute,X)
    INC $CC00,X          ; FE 00 CC | Increment (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    SBC $6000,X          ; FD 00 60 | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0F4
; Address: $F5B20B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0F4:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0F6
; Address: $F5B21B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0F6:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    BPL $67              ; 10 67 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0F7
; Address: $F5B286
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0F7:
    JSR $0088            ; 20 88 00 | Jump to subroutine
    ADC $0200,Y          ; 79 00 02 | Add with carry (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0F8
; Address: $F5B29A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0F8:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    CMP $09FF,Y          ; D9 FF 09 | Compare accumulator (absolute,Y)
    ADC $D32A,Y          ; 79 2A D3 | Add with carry (absolute,Y)
    ROL $42              ; 26 42 | Hardware register operation
    JMP ($CB02)          ; 6C 02 CB | Jump to address (absolute indirect)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0F9
; Address: $F5B2B4
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0F9:
    JSR $D400            ; 20 00 D4 | Jump to subroutine
    INX                  ; E8 | Increment X register
    LDY $CD00            ; AC 00 CD | Load from absolute address into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    REP #$3F             ; C2 3F | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    ASL $00FF            ; 0E FF 00 | Arithmetic shift left (absolute)
    DEC $1800            ; CE 00 18 | Decrement (absolute)
    PHP                  ; 08 | Push processor status to stack
    BIT $1800            ; 2C 00 18 | Test bits in accumulator (absolute)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BIT $B700            ; 2C 00 B7 | Test bits in accumulator (absolute)
    LDA ($00),Y          ; B1 00 | Read graphics status
    DEC $0000            ; CE 00 00 | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    TAY                  ; A8 | Transfer accumulator to Y register
    REP #$3F             ; C2 3F | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    ASL $00FF            ; 0E FF 00 | Arithmetic shift left (absolute)
    DEC $1800            ; CE 00 18 | Decrement (absolute)
    PHP                  ; 08 | Push processor status to stack
    BIT $1800            ; 2C 00 18 | Test bits in accumulator (absolute)
    BIT $B700            ; 2C 00 B7 | Test bits in accumulator (absolute)
    LDA ($00),Y          ; B1 00 | Read graphics status
    DEC $0000            ; CE 00 00 | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    ORA $EF1F,X          ; 1D 1F EF | Logical OR with accumulator (absolute,X)
    INC $F001,X          ; FE 01 F0 | Increment (absolute,X)
    BRA $C0              ; 80 C0 | Branch always
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    BRA $40              ; 80 40 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0FA
; Address: $F5B37C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0FA:
    JSR $00D0            ; 20 D0 00 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0FB
; Address: $F5B39E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0FB:
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    STA $000000          ; 8F 00 00 00 | Update graphics data
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BPL $17              ; 10 17 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0FC
; Address: $F5B3CC
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0FC:
    JSL $084625          ; 22 25 46 08 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    CLI                  ; 58 | Clear interrupt disable flag
    AND ($07),Y          ; 31 07 | Logical AND with accumulator ((zero page),Y)
    ORA $E2FF,Y          ; 19 FF E2 | Logical OR with accumulator (absolute,Y)
    LDA $5796            ; AD 96 57 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SEP #$9F             ; E2 9F | Set processor status bits
    EOR $2CF3,Y          ; 59 F3 2C | Exclusive OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    INC $FFEE,X          ; FE EE FF | Increment (absolute,X)
    ROR $BBF6,X          ; 7E F6 BB | Rotate right (absolute,X)
    PEA #$B737           ; F4 37 B7 | Push effective address to stack
    CPY #$BE             ; C0 BE | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ROL $DED9,X          ; 3E D9 DE | Rotate left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    BCC $80              ; 90 80 | Branch if carry clear
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    BMI $80              ; 30 80 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0FD
; Address: $F5B43F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0FD:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $080F88          ; 8F 88 0F 08 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0FE
; Address: $F5B46D
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0FE:
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BNE $2D              ; D0 2D | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    ADC ($68),Y          ; 71 68 | Add with carry ((zero page),Y)
    PEA #$96E8           ; F4 E8 96 | Push effective address to stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BPL $FF              ; 10 FF | Branch if positive
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $66              ; 80 66 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_0FF
; Address: $F5B4B5
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_0FF:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BMI $13              ; 30 13 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1703            ; 0D 03 17 | Logical OR with accumulator (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $F8FF            ; EE FF F8 | Increment (absolute)
    INC $2FCF,X          ; FE CF 2F | Increment (absolute,X)
    ROL $3F01,X          ; 3E 01 3F | Rotate left (absolute,X)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    INC $18E7            ; EE E7 18 | Increment (absolute)
    SBC $0012,X          ; FD 12 00 | Subtract with carry (absolute,X)
    BEQ $FC              ; F0 FC | Branch if equal
    INC $FF              ; E6 FF | Increment (zero page)
    BVS $3B              ; 70 3B | Branch if overflow set
    SBC $DEFF,X          ; FD FF DE | Subtract with carry (absolute,X)
    BEQ $0C              ; F0 0C | Branch if equal
    BEQ $EF              ; F0 EF | Branch if equal
    LDA                  ; BF 46 EF 10 | Read graphics status
    ORA #$F9             ; 09 F9 | Logical OR with accumulator (immediate)
    DEC $FE              ; C6 FE | Decrement (zero page)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_100
; Address: $F5B528
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_100:
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BEQ $30              ; F0 30 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_101
; Address: $F5B53A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_101:
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    BPL $01              ; 10 01 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_103
; Address: $F5B54C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_103:
    JSR $2006            ; 20 06 20 | Jump to subroutine
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $0E07            ; 0E 07 0E | Arithmetic shift left (absolute)
    ASL $180F,X          ; 1E 0F 18 | Arithmetic shift left (absolute,X)
    ORA $1E0F,Y          ; 19 0F 1E | Logical OR with accumulator (absolute,Y)
    BEQ $FF              ; F0 FF | Branch if equal
    STA $FEFCFF          ; 8F FF FC FE | Update graphics data
    SBC ($C7,X)          ; E1 C7 | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_104
; Address: $F5B571
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_104:
    BVS $7F              ; 70 7F | Branch if overflow set
    STA $7FBC7F          ; 8F 7F BC 7F | Update graphics data
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF C0 | Read graphics status
    LDA                  ; BF 40 8D 02 | Read graphics status
    BIT #$12             ; 89 12 | Test bits in accumulator (immediate)
    STA $08              ; 85 08 | Update graphics data
    BRA $1B              ; 80 1B | Branch always
    BRA $16              ; 80 16 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BVS $3F              ; 70 3F | Branch if overflow set
    STZ $3F              ; 64 3F | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    STZ $3F              ; 64 3F | Store zero to zero page
    ADC #$1E             ; 69 1E | Add with carry (immediate)
    PLB                  ; AB | Pull data bank register from stack
    CPY $1B0C            ; CC 0C 1B | Compare Y register (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $2F              ; 30 2F | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_106
; Address: $F5B5B3
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_106:
    ORA $33EC,Y          ; 19 EC 33 | Logical OR with accumulator (absolute,Y)
    CLD                  ; D8 | Clear decimal mode flag
    ROR $B0              ; 66 B0 | Rotate right (zero page)
    DEC $D820            ; CE 20 D8 | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    BRA $60              ; 80 60 | Branch always
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SBC $F800,X          ; FD 00 F8 | Subtract with carry (absolute,X)
    INC $E000,X          ; FE 00 E0 | Game work RAM access
    SBC $C800,Y          ; F9 00 C8 | Subtract with carry (absolute,Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_107
; Address: $F5B5F3
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_107:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ASL $0603            ; 0E 03 06 | Arithmetic shift left (absolute)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    PLA                  ; 68 | Pull accumulator from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BCC $E8              ; 90 E8 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BCC $FF              ; 90 FF | Branch if carry clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_108
; Address: $F5B660
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_108:
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    LSR $01              ; 46 01 | Logical shift right (zero page)
    RTI                  ; 40 | Return from interrupt
    ORA $0241            ; 0D 41 02 | Logical OR with accumulator (absolute)
    WDM #$0D             ; 42 0D | Reserved instruction
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_109
; Address: $F5B68C
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_109:
    JSR $2003            ; 20 03 20 | Jump to subroutine
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BMI $0F              ; 30 0F | Branch if negative
    ORA $7787,Y          ; 19 87 77 | Logical OR with accumulator (absolute,Y)
    STA $3123,X          ; 9D 23 31 | Update graphics data
    EOR #$07             ; 49 07 | Exclusive OR with accumulator (immediate)
    ORA $379C,X          ; 1D 9C 37 | Logical OR with accumulator (absolute,X)
    BMI $FE              ; 30 FE | Branch if negative
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    STX $FF              ; 86 FF | Store X register to zero page
    CLC                  ; 18 | Clear carry flag
    BCS $CE              ; B0 CE | Branch if carry set
    SBC $ED1D            ; ED 1D ED | Subtract with carry (absolute)
    LDA $FF9F,X          ; BD 9F FF | Read graphics status
    INC $EFFE,X          ; FE FE EF | Increment (absolute,X)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    INC $E001,X          ; FE 01 E0 | Game work RAM access
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    INY                  ; C8 | Increment Y register
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $D8              ; F0 D8 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    CPX #$18             ; E0 18 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_10A
; Address: $F5B6F2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_10A:
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BCS $00              ; B0 00 | Branch if carry set
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_10B
; Address: $F5B700
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_10B:
    JSR $2006            ; 20 06 20 | Jump to subroutine
    ROL $06              ; 26 06 | Rotate left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $1F0E,Y          ; 19 0E 1F | Logical OR with accumulator (absolute,Y)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ASL $0B00            ; 0E 00 0B | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BCC $7C              ; 90 7C | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    LDA $B000,X          ; BD 00 B0 | Read graphics status
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_10D
; Address: $F5B742
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_10D:
    JSR $1100            ; 20 00 11 | Jump to subroutine
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ORA #$1E             ; 09 1E | Logical OR with accumulator (immediate)
    ORA $1E09            ; 0D 09 1E | Logical OR with accumulator (absolute)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    INC $19              ; E6 19 | Increment (zero page)
    INC $7D01,X          ; FE 01 7D | Increment (absolute,X)
    LDA                  ; BF 80 00 E0 | Read graphics status
    STX $9B04            ; 8E 04 9B | Store X register to absolute address
    ORA $8000,Y          ; 19 00 80 | Logical OR with accumulator (absolute,Y)
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    SEP #$00             ; E2 00 | Set processor status bits
    SEP #$C6             ; E2 C6 | Set processor status bits
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF 40 F1 06 | Read graphics status
    CMP $7470,Y          ; D9 70 74 | Compare accumulator (absolute,Y)
    ORA $8C99,Y          ; 19 99 8C | Logical OR with accumulator (absolute,Y)
    JMP $3800            ; 4C 00 38 | Jump to address

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_10E
; Address: $F5B792
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_10E:
    JSR $0058            ; 20 58 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ASL $FF06            ; 0E 06 FF | Arithmetic shift left (absolute)
    CMP $048F,Y          ; D9 8F 04 | Compare accumulator (absolute,Y)
    INC $80              ; E6 80 | Increment (zero page)
    CPY #$90             ; C0 90 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_10F
; Address: $F5B7A2
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_10F:
    SED                  ; F8 | Set decimal mode flag
    DEC $3C0C            ; CE 0C 3C | Decrement (absolute)
    SED                  ; F8 | Set decimal mode flag
    BIT $9468            ; 2C 68 94 | Test bits in accumulator (absolute)
    BNE $00              ; D0 00 | Branch if not equal
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    BVS $A8              ; 70 A8 | Branch if overflow set
    BCC $F8              ; 90 F8 | Branch if carry clear
    BVC $70              ; 50 70 | Branch if overflow clear
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    STA $00              ; 85 00 | Update graphics data
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_110
; Address: $F5B7E7
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_110:
    PHP                  ; 08 | Push processor status to stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    BNE $28              ; D0 28 | Branch if not equal
    BEQ $00              ; F0 00 | Branch if equal
    PLY                  ; 7A | Pull Y register from stack
    PHP                  ; 08 | Push processor status to stack
    ORA $1E09            ; 0D 09 1E | Logical OR with accumulator (absolute)
    ADC ($0E),Y          ; 71 0E | Add with carry ((zero page),Y)
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    INC $19              ; E6 19 | Increment (zero page)
    LDA                  ; BF 80 00 10 | Read graphics status
    STX $1B04            ; 8E 04 1B | Store X register to absolute address
    ORA $8000,Y          ; 19 00 80 | Logical OR with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEP #$C6             ; E2 C6 | Set processor status bits
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF 40 FF 00 | Read graphics status
    INC $F900,X          ; FE 00 F9 | Increment (absolute,X)
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_111
; Address: $F5B832
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_111:
    JSR $0058            ; 20 58 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    BCC $00              ; 90 00 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    DEC $7C0C            ; CE 0C 7C | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_112
; Address: $F5B84B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_112:
    SEI                  ; 78 | Set interrupt disable flag
    CPY $14C8            ; CC C8 14 | Compare Y register (absolute)
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $68              ; F0 68 | Branch if equal
    BCC $F8              ; 90 F8 | Branch if carry clear
    BMI $F0              ; 30 F0 | Branch if negative
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_113
; Address: $F5B860
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_113:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ORA $1E09            ; 0D 09 1E | Logical OR with accumulator (absolute)
    CPY #$79             ; C0 79 | Compare Y register (immediate)
    ASL $E0              ; 06 E0 | Game work RAM access
    INC $19              ; E6 19 | Increment (zero page)
    INC $7D01,X          ; FE 01 7D | Increment (absolute,X)
    LDA                  ; BF 80 C0 3A | Read graphics status
    INC $BB04            ; EE 04 BB | Increment (absolute)
    STA $8000,Y          ; 99 00 80 | Update graphics data
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    SEP #$00             ; E2 00 | Set processor status bits
    SEP #$C6             ; E2 C6 | Set processor status bits
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF 40 F1 06 | Read graphics status
    CMP $7470,Y          ; D9 70 74 | Compare accumulator (absolute,Y)
    ORA $8C99,Y          ; 19 99 8C | Logical OR with accumulator (absolute,Y)
    JMP $7800            ; 4C 00 78 | Jump to address

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_114
; Address: $F5B8B2
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_114:
    JSR $0058            ; 20 58 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ASL $FF06            ; 0E 06 FF | Arithmetic shift left (absolute)
    CMP $048F,Y          ; D9 8F 04 | Compare accumulator (absolute,Y)
    INC $80              ; E6 80 | Increment (zero page)
    CPY #$27             ; C0 27 | Compare Y register (immediate)
    EOR ($05,X)          ; 41 05 | Exclusive OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    ASL $5E              ; 06 5E | Arithmetic shift left (zero page)
    ORA #$44             ; 09 44 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA $1E08,Y          ; 19 08 1E | Logical OR with accumulator (absolute,Y)
    ASL $1F1D            ; 0E 1D 1F | Arithmetic shift left (absolute)
    DEC                  ; 3A | Decrement accumulator
    AND ($09),Y          ; 31 09 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_116
; Address: $F5B8E8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_116:
    BVS $73              ; 70 73 | Branch if overflow set
    JMP $805448          ; 5C 48 54 80 | Jump to address long
    LDX $00              ; A6 00 | Load from zero page into X register
    BNE $37              ; D0 37 | Branch if not equal
    CPY $A07F            ; CC 7F A0 | Compare Y register (absolute)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_117
; Address: $F5B903
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_117:
    JSL $CF099E          ; 22 9E 09 CF | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $41              ; 05 41 | Logical OR with accumulator (zero page)
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA #$2B             ; 09 2B | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_118
; Address: $F5B917
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_118:
    BMI $3A              ; 30 3A | Branch if negative
    BVS $1C              ; 70 1C | Branch if overflow set
    AND $380E,Y          ; 39 0E 38 | Logical AND with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_119
; Address: $F5B923
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_119:
    AND ($1F),Y          ; 31 1F | Logical AND with accumulator ((zero page),Y)
    STA $4D0584          ; 8F 84 05 4D | Update graphics data
    ROL $4B88            ; 2E 88 4B | Rotate left (absolute)
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_11A
; Address: $F5B930
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_11A:
    JSR $11DB            ; 20 DB 11 | Jump to subroutine
    INC $F18E            ; EE 8E F1 | Increment (absolute)
    CMP ($7E,X)          ; C1 7E | Compare accumulator ((zero page,X))
    ROR $902F,X          ; 7E 2F 90 | Rotate right (absolute,X)
    BIT $8E              ; 24 8E | Test bits in accumulator (zero page)
    ROL $6E4E            ; 2E 4E 6E | Rotate left (absolute)
    DEC $E6              ; C6 E6 | Decrement (zero page)
    ASL $B6              ; 06 B6 | Arithmetic shift left (zero page)
    AND ($E0),Y          ; 31 E0 | Game work RAM access
    ADC ($A0),Y          ; 71 A0 | Add with carry ((zero page),Y)
    CMP $D900,Y          ; D9 00 D9 | Compare accumulator (absolute,Y)
    BVC $D8              ; 50 D8 | Branch if overflow clear
    BVC $E8              ; 50 E8 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_11B
; Address: $F5B95B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_11B:
    JSR $20EC            ; 20 EC 20 | Jump to subroutine
    CPY $D860            ; CC 60 D8 | Compare Y register (absolute)
    BEQ $48              ; F0 48 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_11C
; Address: $F5B964
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_11C:
    BVC $60              ; 50 60 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    BVC $40              ; 50 40 | Branch if overflow clear
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    STY $30              ; 84 30 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_11D
; Address: $F5B971
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_11D:
    JSR $30A0            ; 20 A0 30 | Jump to subroutine
    LDY #$20             ; A0 20 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_11E
; Address: $F5B97C
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_11E:
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    ASL $7F0F            ; 0E 0F 7F | Arithmetic shift left (absolute)
    ROR $FFFE,X          ; 7E FE FF | Rotate right (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    ASL $7C01            ; 0E 01 7C | Arithmetic shift left (absolute)
    SEP #$1D             ; E2 1D | Set processor status bits
    BPL $E7              ; 10 E7 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA $0C0F            ; 0D 0F 0C | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    BRA $E0              ; 80 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_11F
; Address: $F5BA07
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_11F:
    STZ $E2FC            ; 9C FC E2 | Store zero to absolute
    ADC $CFFF,X          ; 7D FF CF | Add with carry (absolute,X)
    ADC $0000,Y          ; 79 00 00 | Add with carry (absolute,Y)
    BRA $E0              ; 80 E0 | Game work RAM access
    INC $FFE1,X          ; FE E1 FF | Increment (absolute,X)
    INC $FECF,X          ; FE CF FE | Increment (absolute,X)
    ADC $0000,Y          ; 79 00 00 | Add with carry (absolute,Y)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $0C0F            ; 0D 0F 0C | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $1807,X          ; 1D 07 18 | Logical OR with accumulator (absolute,X)
    BMI $3F              ; 30 3F | Branch if negative
    WDM #$00             ; 42 00 | Reserved instruction
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_120
; Address: $F5BA46
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_120:
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FF              ; E6 FF | Increment (zero page)
    STA $FFFF,X          ; 9D FF FF | Update graphics data
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_121
; Address: $F5BA57
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_121:
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    STZ $FFFE            ; 9C FE FF | Store zero to absolute
    INC $2811,X          ; FE 11 28 | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0615            ; 0E 15 06 | Arithmetic shift left (absolute)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_122
; Address: $F5BA83
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_122:
    JSR $0E0E            ; 20 0E 0E | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    EOR ($7E,X)          ; 41 7E | Exclusive OR with accumulator ((zero page,X))
    ROR $00F1            ; 6E F1 00 | Rotate right (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $97              ; 10 97 | Branch if positive
    AND $762C            ; 2D 2C 76 | Logical AND with accumulator (absolute)
    BVS $58              ; 70 58 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA                  ; 9F 68 BE 49 | Update graphics data
    BVS $88              ; 70 88 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    STA ($19,X)          ; 81 19 | Update graphics data
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    ASL $0708            ; 0E 08 07 | Arithmetic shift left (absolute)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    BPL $52              ; 10 52 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    SBC #$F0             ; E9 F0 | Subtract with carry (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    STX $00              ; 86 00 | Store X register to zero page
    BEQ $EC              ; F0 EC | Branch if equal
    RTI                  ; 40 | Return from interrupt
    WDM #$76             ; 42 76 | Reserved instruction
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_124
; Address: $F5BB1B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_124:
    STY $F0              ; 84 F0 | Store Y register to zero page
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $1118,Y          ; 19 18 11 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROL $17              ; 26 17 | Rotate left (zero page)
    BIT $7F1F            ; 2C 1F 7F | Test bits in accumulator (absolute)
    BEQ $3F              ; F0 3F | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_125
; Address: $F5BB47
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_125:
    JSR $203F            ; 20 3F 20 | Jump to subroutine
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    LDY #$78             ; A0 78 | Load immediate value into Y register
    CPY $38              ; C4 38 | Compare Y register (zero page)
    BPL $EE              ; 10 EE | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_126
; Address: $F5BB56
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_126:
    JSR $A0C7            ; 20 C7 A0 | Jump to subroutine
    CMP ($A0),Y          ; D1 A0 | Compare accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$50             ; A0 50 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BRA $FF              ; 80 FF | Branch always
    BRA $1B              ; 80 1B | Branch always
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA $1E19            ; 0D 19 1E | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    AND $0F01            ; 2D 01 0F | Logical AND with accumulator (absolute)
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    BMI $1F              ; 30 1F | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_127
; Address: $F5BBB5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_127:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    BIT $13              ; 24 13 | Test bits in accumulator (zero page)
    ASL $0121,X          ; 1E 21 01 | Arithmetic shift left (absolute,X)
    ADC ($7F,X)          ; 61 7F | Add with carry ((zero page,X))
    STA ($81,X)          ; 81 81 | Update graphics data

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_128
; Address: $F5BBCA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_128:
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    DEC $FE              ; C6 FE | Decrement (zero page)
    INC $FF0F,X          ; FE 0F FF | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_129
; Address: $F5BBD4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_129:
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA $817E            ; 0D 7E 81 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_12A
; Address: $F5BBEA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_12A:
    BVS $73              ; 70 73 | Branch if overflow set
    STA                  ; 9F 1F 1F 60 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BCC $6F              ; 90 6F | Branch if carry clear
    STZ $8679            ; 9C 79 86 | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_12B
; Address: $F5BC03
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_12B:
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    SBC ($C3,X)          ; E1 C3 | Subtract with carry ((zero page,X))
    CPY $FCFC            ; CC FC FC | Compare Y register (absolute)
    INC $FFCF,X          ; FE CF FF | Increment (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    PEA #$FC3B           ; F4 3B FC | Push effective address to stack
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    LDA                  ; BF 5C DF 23 | Read graphics status
    BRA $80              ; 80 80 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BEQ $B0              ; F0 B0 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_12C
; Address: $F5BC5A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_12C:
    LDY #$50             ; A0 50 | Load immediate value into Y register
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPX #$98             ; E0 98 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_12E
; Address: $F5BC68
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_12E:
    JSR $2006            ; 20 06 20 | Jump to subroutine
    BPL $03              ; 10 03 | Branch if positive
    BPL $01              ; 10 01 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    AND $180F,Y          ; 39 0F 18 | Logical AND with accumulator (absolute,Y)
    ORA $190F,Y          ; 19 0F 19 | Logical OR with accumulator (absolute,Y)
    ASL $30BF            ; 0E BF 30 | Arithmetic shift left (absolute)
    BNE $9F              ; D0 9F | Branch if not equal
    BVC $1F              ; 50 1F | Branch if overflow clear
    BNE $1F              ; D0 1F | Branch if not equal
    BNE $1F              ; D0 1F | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_12F
; Address: $F5BC8D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_12F:
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $48              ; F0 48 | Branch if equal
    BNE $2C              ; D0 2C | Branch if not equal
    BNE $28              ; D0 28 | Branch if not equal
    BNE $20              ; D0 20 | Branch if not equal
    BNE $28              ; D0 28 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    LDY $E8              ; A4 E8 | Load from zero page into Y register
    INX                  ; E8 | Increment X register
    BCC $E0              ; 90 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_130
; Address: $F5BCB7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_130:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_132
; Address: $F5BCC8
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_132:
    JSR $1001            ; 20 01 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL $0F03,X          ; 1E 03 0F | Arithmetic shift left (absolute,X)
    ORA $1BDB            ; 0D DB 1B | Logical OR with accumulator (absolute)
    LDA                  ; BF 80 3A 3A | Read graphics status
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BIT $80              ; 24 80 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    DEC                  ; 3A | Decrement accumulator
    CMP $C0              ; C5 C0 | Compare accumulator (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX $B7              ; E4 B7 | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_133
; Address: $F5BD04
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_133:
    STX $06              ; 86 06 | Store X register to zero page
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_134
; Address: $F5BD0C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_134:
    JSR $2401            ; 20 01 24 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_135
; Address: $F5BD13
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_135:
    BPL $06              ; 10 06 | Branch if positive
    ADC $7F18,Y          ; 79 18 7F | Add with carry (absolute,Y)
    AND $3F0F,X          ; 3D 0F 3F | Logical AND with accumulator (absolute,X)
    ASL $1B07,X          ; 1E 07 1B | Arithmetic shift left (absolute,X)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_136
; Address: $F5BD36
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_136:
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    BRA $FF              ; 80 FF | Branch always
    CPY $EF7F            ; CC 7F EF | Compare Y register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SBC ($7E),Y          ; F1 7E | Subtract with carry ((zero page),Y)
    ROR $78F1,X          ; 7E F1 78 | Rotate right (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BMI $F7              ; 30 F7 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_137
; Address: $F5BD5D
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_137:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BEQ $10              ; F0 10 | Branch if equal
    BPL $F0              ; 10 F0 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $0C              ; F0 0C | Branch if equal
    BEQ $0C              ; F0 0C | Branch if equal
    BEQ $0C              ; F0 0C | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    INC $19              ; E6 19 | Increment (zero page)
    LDA                  ; BF 80 00 E0 | Read graphics status
    STX $9B04            ; 8E 04 9B | Store X register to absolute address
    ORA $8000,Y          ; 19 00 80 | Logical OR with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEP #$08             ; E2 08 | Set processor status bits
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_138
; Address: $F5BDD0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_138:
    INX                  ; E8 | Increment X register
    BCC $68              ; 90 68 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    ORA $1E09            ; 0D 09 1E | Logical OR with accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_139
; Address: $F5BE20
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_139:
    JSR $1F00            ; 20 00 1F | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    INX                  ; E8 | Increment X register
    STY $FC08            ; 8C 08 FC | Store Y register to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BCC $00              ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_13A
; Address: $F5BE99
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_13A:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BVS $78              ; 70 78 | Branch if overflow set
    STZ $731D            ; 9C 1D 73 | Store zero to absolute
    CPY $31D3            ; CC D3 31 | Compare Y register (absolute)
    DEC $1AE4            ; CE E4 1A | Decrement (absolute)
    BCC $68              ; 90 68 | Branch if carry clear
    EOR ($A0,X)          ; 41 A0 | Exclusive OR with accumulator ((zero page,X))
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    SEP #$7F             ; E2 7F | Set processor status bits
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_13B
; Address: $F5BEB5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_13B:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    BEQ $1E              ; F0 1E | Branch if equal
    CPY #$78             ; C0 78 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    BMI $08              ; 30 08 | Branch if negative
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    BRA $10              ; 80 10 | Branch always
    BRA $10              ; 80 10 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_13C
; Address: $F5BECC
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_13C:
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    LDA                  ; BF C1 FF 77 | Read graphics status
    AND $87FF,Y          ; 39 FF 87 | Logical AND with accumulator (absolute,Y)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    BRA $FE              ; 80 FE | Branch always
    INC $FE3F,X          ; FE 3F FE | Increment (absolute,X)
    INC $FE39,X          ; FE 39 FE | Increment (absolute,X)
    BEQ $F7              ; F0 F7 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    CMP ($36,X)          ; C1 36 | Compare accumulator ((zero page,X))
    BMI $CF              ; 30 CF | Branch if negative
    BRA $7D              ; 80 7D | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    BRA $F7              ; 80 F7 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $18              ; F0 18 | Branch if equal
    BPL $38              ; 10 38 | Branch if positive
    BEQ $B0              ; F0 B0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_13D
; Address: $F5BF48
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_13D:
    BMI $A0              ; 30 A0 | Branch if negative
    BVC $C0              ; 50 C0 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_13E
; Address: $F5BF4D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_13E:
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    BVC $E0              ; 50 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPY #$20             ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_13F
; Address: $F5BF5C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_13F:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $18              ; 80 18 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_140
; Address: $F5BF64
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_140:
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $0D0D            ; 0E 0D 0D | Arithmetic shift left (absolute)
    ASL $0D0C            ; 0E 0C 0D | Arithmetic shift left (absolute)
    ASL $0F0E            ; 0E 0E 0F | Arithmetic shift left (absolute)
    ORA $070C,X          ; 1D 0C 07 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $0F              ; 10 0F | Branch if positive
    ORA #$17             ; 09 17 | Logical OR with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    ORA #$0C             ; 09 0C | Logical OR with accumulator (immediate)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    ASL $7E              ; 06 7E | Arithmetic shift left (zero page)
    INC $EFFE,X          ; FE FE EF | Increment (absolute,X)
    BMI $FE              ; 30 FE | Branch if negative
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    STA $3A              ; 85 3A | Update graphics data
    CMP $EF              ; C5 EF | Compare accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    CPX #$3C             ; E0 3C | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    AND $1CE0,Y          ; 39 E0 1C | Logical AND with accumulator (absolute,Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_141
; Address: $F5C000
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_141:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_142
; Address: $F5C04A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_142:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_144
; Address: $F5C060
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_144:
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BPL $02              ; 10 02 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $0F03            ; 0D 03 0F | Logical OR with accumulator (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    CLC                  ; 18 | Clear carry flag
    DEX                  ; CA | Decrement X register
    SEC                  ; 38 | Set carry flag
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ROL $4707,X          ; 3E 07 47 | Rotate left (absolute,X)
    ORA ($B9,X)          ; 01 B9 | Logical OR with accumulator ((zero page,X))
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ASL $4078,X          ; 1E 78 40 | Arithmetic shift left (absolute,X)
    INC $87B8,X          ; FE B8 87 | Increment (absolute,X)
    STY $03              ; 84 03 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_145
; Address: $F5C0E6
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_145:
    RTI                  ; 40 | Return from interrupt
    BVC $A0              ; 50 A0 | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    BNE $D4              ; D0 D4 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    JMP ($2A28)          ; 6C 28 2A | Jump to address (absolute indirect)
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BVC $00              ; 50 00 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    BCC $00              ; 90 00 | Branch if carry clear
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    EOR $A000,Y          ; 59 00 A0 | Exclusive OR with accumulator (absolute,Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_146
; Address: $F5C118
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_146:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BEQ $D0              ; F0 D0 | Branch if equal
    BIT $162E            ; 2C 2E 16 | Test bits in accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_149
; Address: $F5C132
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_149:
    JSR $D000            ; 20 00 D0 | Jump to subroutine
    INX                  ; E8 | Increment X register
    BRA $E5              ; 80 E5 | Branch always
    CPY #$65             ; C0 65 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ADC $DF40            ; 6D 40 DF | Add with carry (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    JMP $000000          ; 5C 00 00 00 | Jump to address long
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BMI $34              ; 30 34 | Branch if negative
    CPY $F4CE            ; CC CE F4 | Compare Y register (absolute)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEX                  ; CA | Decrement X register
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    CPY $00              ; C4 00 | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    BMI $00              ; 30 00 | Branch if negative
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX $80              ; E4 80 | Compare X register (zero page)
    CPY #$F7             ; C0 F7 | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    LSR $5C00,X          ; 5E 00 5C | Logical shift right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $3C0E,X          ; 1E 0E 3C | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    SEP #$E2             ; E2 E2 | Set processor status bits
    ORA $0C99,Y          ; 19 99 0C | Logical OR with accumulator (absolute,Y)
    DEC $E706            ; CE 06 E7 | Decrement (absolute)
    ASL $37              ; 06 37 | Arithmetic shift left (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    ORA $E600,X          ; 1D 00 E6 | Logical OR with accumulator (absolute,X)
    BRA $F3              ; 80 F3 | Branch always
    REP #$39             ; C2 39 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_14A
; Address: $F5C1DB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_14A:
    AND ($19,X)          ; 21 19 | Logical AND with accumulator ((zero page,X))
    ORA ($0C),Y          ; 11 0C | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_14B
; Address: $F5C1ED
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_14B:
    JSR $6040            ; 20 40 60 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ROL $5C00,X          ; 3E 00 5C | Rotate left (absolute,X)
    ASL $1C0E,X          ; 1E 0E 1C | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR $037E,X          ; 7E 7E 03 | Rotate right (absolute,X)
    INC $1F00,X          ; FE 00 1F | Increment (absolute,X)
    INC $8100,X          ; FE 00 81 | Increment (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ASL $0303,X          ; 1E 03 03 | Arithmetic shift left (absolute,X)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_14C
; Address: $F5C246
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_14C:
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    BNE $D8              ; D0 D8 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_14D
; Address: $F5C24B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_14D:
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_14E
; Address: $F5C258
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_14E:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    BEQ $90              ; F0 90 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_150
; Address: $F5C261
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_150:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA $0101            ; 0D 01 01 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    BIT $26              ; 24 26 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_151
; Address: $F5C282
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_151:
    BIT $26              ; 24 26 | Test bits in accumulator (zero page)
    LSR $40              ; 46 40 | Logical shift right (zero page)
    CPY #$D4             ; C0 D4 | Compare Y register (immediate)
    CPY #$E4             ; C0 E4 | Compare Y register (immediate)
    BRA $A4              ; 80 A4 | Branch always
    DEY                  ; 88 | Decrement Y register
    LDY $00D8            ; AC D8 00 | Load from absolute address into Y register
    CLD                  ; D8 | Clear decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    LDY $3810,X          ; BC 10 38 | Load from absolute,X into Y register
    BPL $38              ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_152
; Address: $F5C29B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_152:
    JSR $2078            ; 20 78 20 | Jump to subroutine
    BVS $20              ; 70 20 | Branch if overflow set
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $0D01            ; 0D 01 0D | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA #$40             ; 09 40 | Logical OR with accumulator (immediate)
    EOR ($80),Y          ; 51 80 | Exclusive OR with accumulator ((zero page),Y)
    LDX #$80             ; A2 80 | Load immediate value into X register
    LDY $00              ; A4 00 | Load from zero page into Y register
    BPL $58              ; 10 58 | Branch if positive
    BPL $18              ; 10 18 | Branch if positive
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    INC $BE08,X          ; FE 08 BE | Increment (absolute,X)
    BPL $7C              ; 10 7C | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_153
; Address: $F5C2D5
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_153:
    JSR $2078            ; 20 78 20 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $D4              ; 10 D4 | Branch if positive
    BMI $BD              ; 30 BD | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_154
; Address: $F5C305
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_154:
    SBC #$64             ; E9 64 | Subtract with carry (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    ROR                  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_155
; Address: $F5C30A
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_155:
    BMI $36              ; 30 36 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    DEC $9E8C            ; CE 8C 9E | Decrement (absolute)
    DEY                  ; 88 | Decrement Y register
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY $F804            ; CC 04 F8 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $10              ; 30 10 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    ASL $0F08            ; 0E 08 0F | Arithmetic shift left (absolute)
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $10              ; 30 10 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_156
; Address: $F5C3C0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_156:
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ASL $0600            ; 0E 00 06 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    TAX                  ; AA | Transfer accumulator to X register
    CPY $D5              ; C4 D5 | Compare Y register (zero page)
    CPX $E5              ; E4 E5 | Compare X register (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_157
; Address: $F5C3F1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_157:
    JSR $103A            ; 20 3A 10 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    STX $02              ; 86 02 | Store X register to zero page
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_158
; Address: $F5C420
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_158:
    RTI                  ; 40 | Return from interrupt
    BVC $00              ; 50 00 | Branch if overflow clear
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_159
; Address: $F5C44C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_159:
    JSR $40A4            ; 20 A4 40 | Jump to subroutine
    PHX                  ; DA | Push X register to stack
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_15A
; Address: $F5C487
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_15A:
    JSR $A000            ; 20 00 A0 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $0006,X          ; 1E 06 00 | Arithmetic shift left (absolute,X)
    ASL $3E              ; 06 3E | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 07 FF 3F | Read graphics status
    BEQ $F0              ; F0 F0 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BNE $00              ; D0 00 | Branch if not equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_15C
; Address: $F5C502
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_15C:
    JSR $20AE            ; 20 AE 20 | Jump to subroutine
    ROR $6C20            ; 6E 20 6C | Rotate right (absolute)
    JMP $00B800          ; 5C 00 B8 00 | Jump to address long
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$3C             ; E0 3C | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    JMP $0C1C0C          ; 5C 0C 1C 0C | Jump to address long
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BVS $30              ; 70 30 | Branch if overflow set
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    ORA $1B08            ; 0D 08 1B | Logical OR with accumulator (absolute)
    LSR $7800,X          ; 5E 00 78 | Logical shift right (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $3806,X          ; 1E 06 38 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ROL $5C00            ; 2E 00 5C | Rotate left (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $10              ; 30 10 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    DEC                  ; 3A | Decrement accumulator
    AND $677F,X          ; 3D 7F 67 | Logical AND with accumulator (absolute,X)
    DEC $83FF,X          ; DE FF 83 | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_15D
; Address: $F5C5AE
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_15D:
    LDA                  ; BF D8 00 18 | Read graphics status
    INC                  ; 1A | Increment accumulator
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $837F,X          ; 1E 7F 83 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    DEC $FF              ; C6 FF | Decrement (zero page)
    AND $FFFF,X          ; 3D FF FF | Logical AND with accumulator (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $FE              ; 80 FE | Branch always
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA $0F0C            ; 0D 0C 0F | Logical OR with accumulator (absolute)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $1807,Y          ; 19 07 18 | Logical OR with accumulator (absolute,Y)
    ASL $CDFF,X          ; 1E FF CD | Arithmetic shift left (absolute,X)
    ORA $FFFF,Y          ; 19 FF FF | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $7EE1,X          ; 1E E1 7E | Arithmetic shift left (absolute,X)
    STA $3FFE            ; 8D FE 3F | Update graphics data
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    ORA $FEFF,Y          ; 19 FF FE | Logical OR with accumulator (absolute,Y)
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1807            ; 0D 07 18 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    BMI $02              ; 30 02 | Branch if negative
    AND $1E01,X          ; 3D 01 1E | Logical AND with accumulator (absolute,X)
    ROL $FFFF,X          ; 3E FF FF | Rotate left (absolute,X)
    SBC $837F,X          ; FD 7F 83 | Subtract with carry (absolute,X)
    INC $FE06,X          ; FE 06 FE | Increment (absolute,X)
    INC $CFCF,X          ; FE CF CF | Increment (absolute,X)
    ROL $7EC1,X          ; 3E C1 7E | Rotate left (absolute,X)
    LDA                  ; BF FE F3 FE | Read graphics status
    SBC $03FC,X          ; FD FC 03 | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA $4E              ; 05 4E | Logical OR with accumulator (zero page)
    LDA ($CF),Y          ; B1 CF | Read graphics status

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_15E
; Address: $F5C65F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_15E:
    BMI $00              ; 30 00 | Branch if negative
    ORA $1F1F,Y          ; 19 1F 1F | Logical OR with accumulator (absolute,Y)
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    AND ($02),Y          ; 31 02 | Logical AND with accumulator ((zero page),Y)
    AND $0E11,X          ; 3D 11 0E | Logical AND with accumulator (absolute,X)
    ASL $0C00,X          ; 1E 00 0C | Arithmetic shift left (absolute,X)
    ROL $FDFF,X          ; 3E FF FD | Rotate left (absolute,X)
    INC $FE86,X          ; FE 86 FE | Increment (absolute,X)
    INC $CFCF,X          ; FE CF CF | Increment (absolute,X)
    ROL $FEC1,X          ; 3E C1 FE | Rotate left (absolute,X)
    ADC $FBFC,X          ; 7D FC FB | Add with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    STA $4E              ; 85 4E | Update graphics data
    LDA ($CF),Y          ; B1 CF | Read graphics status
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_15F
; Address: $F5C69F
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_15F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ASL $0106            ; 0E 06 01 | Arithmetic shift left (absolute)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    BRA $9F              ; 80 9F | Branch always
    LDA                  ; BF 3F 7D 01 | Read graphics status
    BRA $7F              ; 80 7F | Branch always
    CPX #$C7             ; E0 C7 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 9F 61 3F | Update graphics data
    CMP ($83,X)          ; C1 83 | Compare accumulator ((zero page,X))
    STZ $FCFC            ; 9C FC FC | Store zero to absolute
    INC $FF9F,X          ; FE 9F FF | Increment (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CPX $7B              ; E4 7B | Compare X register (zero page)
    BNE $1F              ; D0 1F | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $0F              ; 30 0F | Branch if negative
    BMI $0F              ; 30 0F | Branch if negative
    BMI $03              ; 30 03 | Branch if negative
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_160
; Address: $F5C73B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_160:
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    AND $877B,Y          ; 39 7B 87 | Logical AND with accumulator (absolute,Y)
    STX $7E              ; 86 7E | Store X register to zero page
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    PLX                  ; FA | Pull X register from stack
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    ORA ($3B,X)          ; 01 3B | Logical OR with accumulator ((zero page,X))
    CPY $00              ; C4 00 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_161
; Address: $F5C75D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_161:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA $0500            ; 0D 00 05 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_162
; Address: $F5C793
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_162:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_163
; Address: $F5C7D1
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_163:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL $036E            ; 0E 6E 03 | Arithmetic shift left (absolute)
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    ASL $0E00,X          ; 1E 00 0E | Arithmetic shift left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ASL $0F1C,X          ; 1E 1C 0F | Arithmetic shift left (absolute,X)
    ASL $0607            ; 0E 07 06 | Arithmetic shift left (absolute)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BVC $20              ; 50 20 | Branch if overflow clear
    BMI $80              ; 30 80 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    BCC $B8              ; 90 B8 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_165
; Address: $F5C81E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_165:
    BCS $20              ; B0 20 | Branch if carry set
    ASL $386E            ; 0E 6E 38 | Arithmetic shift left (absolute)
    CLV                  ; B8 | Clear overflow flag
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_166
; Address: $F5C84A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_166:
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_167
; Address: $F5C860
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_167:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    CPY $C0              ; C4 C0 | Compare Y register (zero page)
    LDA                  ; BF 00 FF 00 | Read graphics status
    STZ $FF00            ; 9C 00 FF | Store zero to absolute
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0F02            ; 0E 02 0F | Arithmetic shift left (absolute)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    JMP ($9F00)          ; 6C 00 9F | Jump to address (absolute indirect)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    DEX                  ; CA | Decrement X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_168
; Address: $F5C8FF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_168:
    SBC $0001,Y          ; F9 01 00 | Subtract with carry (absolute,Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_169
; Address: $F5C91B
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_169:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA #$0C             ; 09 0C | Logical OR with accumulator (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROR $1F00,X          ; 7E 00 1F | Rotate right (absolute,X)
    ASL $0303,X          ; 1E 03 03 | Arithmetic shift left (absolute,X)
    BRA $99              ; 80 99 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_16A
; Address: $F5C9C2
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_16A:
    JSR $00EC            ; 20 EC 00 | Jump to subroutine
    AND $1F00,X          ; 3D 00 1F | Logical AND with accumulator (absolute,X)
    ROR $DF18,X          ; 7E 18 DF | Rotate right (absolute,X)
    CPY $F6FF            ; CC FF F6 | Compare Y register (absolute)
    ORA $0E0E,X          ; 1D 0E 0E | Logical OR with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_16B
; Address: $F5C9FA
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_16B:
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    JMP ($9F00)          ; 6C 00 9F | Jump to address (absolute indirect)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEX                  ; CA | Decrement X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_16C
; Address: $F5CA79
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_16C:
    SBC $3FFF,Y          ; F9 FF 3F | Subtract with carry (absolute,Y)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$0C             ; 09 0C | Logical OR with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0F02            ; 0E 02 0F | Arithmetic shift left (absolute)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    JMP ($0000)          ; 6C 00 00 | Jump to address (absolute indirect)
    TXS                  ; 9A | Transfer X register to stack pointer
    DEX                  ; CA | Decrement X register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_16D
; Address: $F5CB46
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_16D:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $E000,X          ; FD 00 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $E0FD,X          ; FD FD E0 | Game work RAM access
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BCS $00              ; B0 00 | Branch if carry set
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    BCS $B0              ; B0 B0 | Branch if carry set
    ROR $FF7E,X          ; 7E 7E FF | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_16E
; Address: $F5CBAA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_16E:
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_170
; Address: $F5CBBA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_170:
    BRA $80              ; 80 80 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    STA                  ; 9F 00 06 00 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_171
; Address: $F5CBF3
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_171:
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    BPL $08              ; 10 08 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($51),Y          ; 11 51 | Logical OR with accumulator ((zero page),Y)
    ROL $66              ; 26 66 | Rotate left (zero page)
    LDA $BB38,X          ; BD 38 BB | Read graphics status
    LSR $3800            ; 4E 00 38 | Logical shift right (absolute)
    ROL $1900            ; 2E 00 19 | Rotate left (absolute)
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BRA $BC              ; 80 BC | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$DC             ; C0 DC | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_172
; Address: $F5CC35
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_172:
    JSR $8080            ; 20 80 80 | Jump to subroutine
    ASL $0400,X          ; 1E 00 04 | Arithmetic shift left (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ASL $041E,X          ; 1E 1E 04 | Arithmetic shift left (absolute,X)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    INC $7000,X          ; FE 00 70 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_173
; Address: $F5CC70
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_173:
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    INC $70FE,X          ; FE FE 70 | Increment (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    ORA $0700,Y          ; 19 00 07 | Logical OR with accumulator (absolute,Y)
    ORA $0719,Y          ; 19 19 07 | Logical OR with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $F8FE,X          ; FE FE F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    INC $C800,X          ; FE 00 C8 | Increment (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    PLY                  ; 7A | Pull Y register from stack
    INC $C8FE,X          ; FE FE C8 | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    BMI $30              ; 30 30 | Branch if negative
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    ORA $0100            ; 0D 00 01 | Logical OR with accumulator (absolute)
    ORA $010D            ; 0D 0D 01 | Logical OR with accumulator (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SBC $0000,Y          ; F9 00 00 | Subtract with carry (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SBC $00F9,Y          ; F9 F9 00 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_174
; Address: $F5CD86
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_174:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_175
; Address: $F5CD96
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_175:
    JSR $7020            ; 20 20 70 | Jump to subroutine
    BVS $80              ; 70 80 | Branch if overflow set
    BRA $FE              ; 80 FE | Branch always
    INC $F8F8,X          ; FE F8 F8 | Increment (absolute,X)
    ROL $0100,X          ; 3E 00 01 | Rotate left (absolute,X)
    ROL $013E,X          ; 3E 3E 01 | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_176
; Address: $F5CDCA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_176:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_177
; Address: $F5CDE6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_177:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_178
; Address: $F5CDF6
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_178:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STZ $0F00            ; 9C 00 0F | Store zero to absolute
    STZ $0F9C            ; 9C 9C 0F | Store zero to absolute
    ASL $C000,X          ; 1E 00 C0 | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $C01E,X          ; 1E 1E C0 | Arithmetic shift left (absolute,X)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEC $1F00            ; CE 00 1F | Decrement (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    DEC $1FCE            ; CE CE 1F | Decrement (absolute)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $1800,X          ; FE 00 18 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_179
; Address: $F5CEBC
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_179:
    CPX #$E0             ; E0 E0 | Game work RAM access
    INC $07FE,X          ; FE FE 07 | Increment (absolute,X)
    STA ($00,X)          ; 81 00 | Update graphics data
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STA ($81,X)          ; 81 81 | Update graphics data
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INC $CC00,X          ; FE 00 CC | Increment (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    SBC $6000,X          ; FD 00 60 | Subtract with carry (absolute,X)
    INC $CCFE,X          ; FE FE CC | Increment (absolute,X)
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    BVS $70              ; 70 70 | Branch if overflow set
    SBC $60FD,X          ; FD FD 60 | Subtract with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_17A
; Address: $F5CF42
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_17A:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_17C
; Address: $F5CF6A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_17C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_17F
; Address: $F5CF7A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_17F:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_180
; Address: $F5CFE6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_180:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_181
; Address: $F5D00C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_181:
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BMI $30              ; 30 30 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_183
; Address: $F5D01C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_183:
    BPL $10              ; 10 10 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_186
; Address: $F5D044
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_186:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    INC $00              ; E6 00 | Increment (zero page)
    BRA $00              ; 80 00 | Branch always
    INC $E6              ; E6 E6 | Increment (zero page)
    BRA $80              ; 80 80 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $001E,X          ; 1E 1E 00 | Arithmetic shift left (absolute,X)
    STZ $00              ; 64 00 | Store zero to zero page
    BRA $00              ; 80 00 | Branch always
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $64              ; 64 64 | Store zero to zero page
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_187
; Address: $F5D0D8
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_187:
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $F0              ; F0 F0 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BMI $30              ; 30 30 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $001D,X          ; 1D 1D 00 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_189
; Address: $F5D198
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_189:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    ASL $0700,X          ; 1E 00 07 | Arithmetic shift left (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ASL $071E,X          ; 1E 1E 07 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_18A
; Address: $F5D1F6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_18A:
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BVS $70              ; 70 70 | Branch if overflow set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1004            ; 0E 04 10 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_18B
; Address: $F5D24B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_18B:
    ORA ($73),Y          ; 11 73 | Logical OR with accumulator ((zero page),Y)
    EOR ($34),Y          ; 51 34 | Exclusive OR with accumulator ((zero page),Y)
    BVS $00              ; 70 00 | Branch if overflow set
    ADC ($60),Y          ; 71 60 | Add with carry ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_18C
; Address: $F5D25C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_18C:
    JSR $0A88            ; 20 88 0A | Jump to subroutine
    STA ($00,X)          ; 81 00 | Update graphics data
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_18D
; Address: $F5D27B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_18D:
    JSR $2040            ; 20 40 20 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $3A0E            ; 0D 0E 3A | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $50              ; 70 50 | Branch if overflow set
    AND ($71,X)          ; 21 71 | Logical AND with accumulator ((zero page,X))
    LDY $7422            ; AC 22 74 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_18E
; Address: $F5D2AF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_18E:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BVS $70              ; 70 70 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_18F
; Address: $F5D2B8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_18F:
    JSR $0089            ; 20 89 00 | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_190
; Address: $F5D2CF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_190:
    RTI                  ; 40 | Return from interrupt
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BPL $C0              ; 10 C0 | Branch if positive
    BPL $40              ; 10 40 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_191
; Address: $F5D2E6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_191:
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    TSX                  ; BA | Transfer stack pointer to X register
    JMP $100A61          ; 5C 61 0A 10 | Jump to address long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_192
; Address: $F5D2FA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_192:
    JSR $1400            ; 20 00 14 | Jump to subroutine
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $50              ; 70 50 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_194
; Address: $F5D309
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_194:
    JSR $21B9            ; 20 B9 21 | PPU graphics register access
    LDY $0441            ; AC 41 04 | Load from absolute address into Y register
    BVS $70              ; 70 70 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_195
; Address: $F5D314
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_195:
    JSR $2088            ; 20 88 20 | Jump to subroutine
    BIT #$40             ; 89 40 | Test bits in accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    WDM #$10             ; 42 10 | Reserved instruction
    BMI $88              ; 30 88 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $90              ; F0 90 | Branch if equal
    BNE $F0              ; D0 F0 | Branch if not equal
    BPL $50              ; 10 50 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_196
; Address: $F5D32E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_196:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    BVS $70              ; 70 70 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_197
; Address: $F5D337
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_197:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $28              ; 80 28 | Branch always
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    BRA $48              ; 80 48 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    BPL $A1              ; 10 A1 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    BVC $24              ; 50 24 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    BPL $20              ; 10 20 | Branch if positive
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ORA #$26             ; 09 26 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $90              ; F0 90 | Branch if equal
    ORA ($2B),Y          ; 11 2B | Logical OR with accumulator ((zero page),Y)
    DEC $24              ; C6 24 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_199
; Address: $F5D373
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_199:
    ASL $0904            ; 0E 04 09 | Arithmetic shift left (absolute)
    ROL $08              ; 26 08 | Rotate left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    INY                  ; C8 | Increment Y register
    CMP $E102,Y          ; D9 02 E1 | Compare accumulator (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    STX $0E              ; 86 0E | Store X register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0408            ; 0E 08 04 | Arithmetic shift left (absolute)
    ASL $1809            ; 0E 09 18 | Arithmetic shift left (absolute)
    ASL $0810            ; 0E 10 08 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $0410            ; 0D 10 04 | Logical OR with accumulator (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $11              ; 10 11 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_19A
; Address: $F5D3DB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_19A:
    JSR $2512            ; 20 12 25 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    BVS $28              ; 70 28 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_19D
; Address: $F5D3EC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_19D:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    BRA $57              ; 80 57 | Branch always
    DEY                  ; 88 | Decrement Y register
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    STY $02              ; 84 02 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    BIT $88              ; 24 88 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    INC $A001,X          ; FE 01 A0 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $88              ; B0 88 | Branch if carry set
    BMI $1C              ; 30 1C | Branch if negative
    BPL $5C              ; 10 5C | Branch if positive
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_19E
; Address: $F5D40E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_19E:
    CLV                  ; B8 | Clear overflow flag
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_19F
; Address: $F5D41C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_19F:
    JSR $1080            ; 20 80 10 | Jump to subroutine
    BVS $5B              ; 70 5B | Branch if overflow set
    TAY                  ; A8 | Transfer accumulator to Y register
    BVS $6C              ; 70 6C | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    ASL $1470            ; 0E 70 14 | Arithmetic shift left (absolute)
    JMP ($7260)          ; 6C 60 72 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1A0
; Address: $F5D42F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1A0:
    JSR $8024            ; 20 24 80 | Jump to subroutine
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    AND ($31,X)          ; 21 31 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1A1
; Address: $F5D43B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1A1:
    BRA $10              ; 80 10 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $20              ; 50 20 | Branch if overflow clear
    BVC $20              ; 50 20 | Branch if overflow clear
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1A2
; Address: $F5D446
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1A2:
    JSL $030001          ; 22 01 00 03 | Jump to subroutine long
    ASL $89              ; 06 89 | Arithmetic shift left (zero page)
    PHB                  ; 8B | Push data bank register to stack
    BIT $5883            ; 2C 83 58 | Test bits in accumulator (absolute)
    STY $70              ; 84 70 | Store Y register to zero page
    STY $38C5            ; 8C C5 38 | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BCS $58              ; B0 58 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    INC                  ; 1A | Increment accumulator
    ASL $2C1C            ; 0E 1C 2C | Arithmetic shift left (absolute)
    JMP $000008          ; 5C 08 00 00 | Jump to address long
    CLC                  ; 18 | Clear carry flag
    BPL $04              ; 10 04 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    BPL $00              ; 10 00 | Branch if positive
    BRA $08              ; 80 08 | Branch always
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BPL $72              ; 10 72 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1A3
; Address: $F5D48A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1A3:
    CPY #$44             ; C0 44 | Compare Y register (immediate)
    CPX $A440            ; EC 40 A4 | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BMI $21              ; 30 21 | PPU graphics register access
    WDM #$70             ; 42 70 | Reserved instruction
    STA ($40,X)          ; 81 40 | Update graphics data
    BRA $2B              ; 80 2B | Branch always
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    STY $70              ; 84 70 | Store Y register to zero page
    STY $38C4            ; 8C C4 38 | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $9C              ; 10 9C | Branch if positive
    BMI $0E              ; 30 0E | Branch if negative
    PHX                  ; DA | Push X register to stack
    ASL $CE              ; 06 CE | Arithmetic shift left (zero page)
    ASL $2E84,X          ; 1E 84 2E | Arithmetic shift left (absolute,X)
    ROL $8004            ; 2E 04 80 | Rotate left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    LDY $024C            ; AC 4C 02 | Load from absolute address into Y register
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)
    BMI $01              ; 30 01 | Branch if negative
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1A5
; Address: $F5D4E1
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1A5:
    JSR $0024            ; 20 24 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    EOR ($3D),Y          ; 51 3D | Exclusive OR with accumulator ((zero page),Y)
    LDA ($71,X)          ; A1 71 | Read graphics status
    STA ($61,X)          ; 81 61 | Update graphics data
    STA ($21,X)          ; 81 21 | PPU graphics register access
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    LSR $1C10            ; 4E 10 1C | Logical shift right (absolute)
    PHP                  ; 08 | Push processor status to stack
    AND $3E04,Y          ; 39 04 3E | Logical AND with accumulator (absolute,Y)
    ORA $825E            ; 0D 5E 82 | Logical OR with accumulator (absolute)
    CPY $F002            ; CC 02 F0 | Compare Y register (absolute)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    CPX #$DA             ; E0 DA | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    LDY #$20             ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1A6
; Address: $F5D519
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1A6:
    BPL $0C              ; 10 0C | Branch if positive
    SEC                  ; 38 | Set carry flag
    BVS $80              ; 70 80 | Branch if overflow set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1A8
; Address: $F5D546
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1A8:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    CLV                  ; B8 | Clear overflow flag
    BPL $82              ; 10 82 | Branch if positive
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ADC $A800,X          ; 7D 00 A8 | Add with carry (absolute,X)
    EOR $4C              ; 45 4C | Exclusive OR with accumulator (zero page)
    LDA ($00,X)          ; A1 00 | Read graphics status
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1A9
; Address: $F5D56C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1A9:
    JSR $2080            ; 20 80 20 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BPL $D0              ; 10 D0 | Branch if positive
    AND $3910,Y          ; 39 10 39 | Logical AND with accumulator (absolute,Y)
    BPL $29              ; 10 29 | Branch if positive
    BPL $11              ; 10 11 | Branch if positive
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    BRA $21              ; 80 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1AA
; Address: $F5D5A4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1AA:
    JSR $0081            ; 20 81 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $0650            ; 0E 50 06 | Arithmetic shift left (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    EOR ($2C),Y          ; 51 2C | Exclusive OR with accumulator ((zero page),Y)
    ADC $A804,Y          ; 79 04 A8 | Add with carry (absolute,Y)
    EOR $4C              ; 45 4C | Exclusive OR with accumulator (zero page)
    LDA ($55,X)          ; A1 55 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1AB
; Address: $F5D5C0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1AB:
    CLV                  ; B8 | Clear overflow flag
    BPL $A8              ; 10 A8 | Branch if positive
    BPL $90              ; 10 90 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1AC
; Address: $F5D5CE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1AC:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BCC $0C              ; 90 0C | Branch if carry clear
    ADC ($20),Y          ; 71 20 | Add with carry ((zero page),Y)
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $21              ; 80 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1AD
; Address: $F5D604
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1AD:
    JSR $0081            ; 20 81 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ASL $0650            ; 0E 50 06 | Arithmetic shift left (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    EOR ($2C),Y          ; 51 2C | Exclusive OR with accumulator ((zero page),Y)
    ADC $A804,Y          ; 79 04 A8 | Add with carry (absolute,Y)
    EOR $4C              ; 45 4C | Exclusive OR with accumulator (zero page)
    LDA ($55,X)          ; A1 55 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1AE
; Address: $F5D62E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1AE:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BCC $0C              ; 90 0C | Branch if carry clear
    WDM #$00             ; 42 00 | Reserved instruction
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1AF
; Address: $F5D660
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1AF:
    LSR                  ; 4A | Logical shift right (accumulator)
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1B0
; Address: $F5D66E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1B0:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BCC $0C              ; 90 0C | Branch if carry clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $3500            ; 0E 00 35 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1B2
; Address: $F5D6A5
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1B2:
    JSR $4280            ; 20 80 42 | Hardware register operation
    BRA $44              ; 80 44 | Branch always
    STY $04              ; 84 04 | Store Y register to zero page
    BCC $00              ; 90 00 | Branch if carry clear
    ROL $0211            ; 2E 11 02 | Rotate left (absolute)
    AND #$14             ; 29 14 | Logical AND with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ADC ($0A),Y          ; 71 0A | Add with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    PLB                  ; AB | Pull data bank register from stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $40              ; 10 40 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1B6
; Address: $F5D6D2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1B6:
    JSR $A0C0            ; 20 C0 A0 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $10              ; 80 10 | Branch always
    BCC $0C              ; 90 0C | Branch if carry clear
    BMI $08              ; 30 08 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1B7
; Address: $F5D6E4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1B7:
    BPL $44              ; 10 44 | Branch if positive
    STY $20              ; 84 20 | Store Y register to zero page
    WDM #$10             ; 42 10 | Reserved instruction

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1B8
; Address: $F5D6EA
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1B8:
    JSR $1C0C            ; 20 0C 1C | Jump to subroutine
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $49              ; 06 49 | Arithmetic shift left (zero page)
    BRA $23              ; 80 23 | Branch always
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BPL $40              ; 10 40 | Branch if positive
    WDM #$02             ; 42 02 | Reserved instruction
    CMP $2A              ; C5 2A | Compare accumulator (zero page)
    AND #$83             ; 29 83 | Logical AND with accumulator (immediate)
    BIT $1CA1            ; 2C A1 1C | Test bits in accumulator (absolute)
    DEY                  ; 88 | Decrement Y register
    BMI $30              ; 30 30 | Branch if negative
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1B9
; Address: $F5D720
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1B9:
    JSR $1844            ; 20 44 18 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    ASL $B0              ; 06 B0 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    CPX #$05             ; E0 05 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDX #$82             ; A2 82 | Load immediate value into X register
    JMP $308A            ; 4C 8A 30 | Jump to address
    PHA                  ; 48 | Push accumulator to stack
    BRA $00              ; 80 00 | Branch always
    BMI $08              ; 30 08 | Branch if negative
    ADC ($14,X)          ; 61 14 | Add with carry ((zero page,X))
    WDM #$82             ; 42 82 | Reserved instruction

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1BA
; Address: $F5D747
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1BA:
    JSR $1042            ; 20 42 10 | Jump to subroutine
    BMI $0C              ; 30 0C | Branch if negative
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR $16              ; 45 16 | Exclusive OR with accumulator (zero page)
    BRA $21              ; 80 21 | PPU graphics register access
    BRA $51              ; 80 51 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    WDM #$00             ; 42 00 | Reserved instruction
    WDM #$02             ; 42 02 | Reserved instruction
    LSR $04              ; 46 04 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1BB
; Address: $F5D76D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1BB:
    BRA $CF              ; 80 CF | Branch always
    DEC $29              ; C6 29 | Decrement (zero page)
    INC $B911            ; EE 11 B9 | Increment (absolute)
    LDA ($0C),Y          ; B1 0C | Read graphics status
    LDA ($18,X)          ; A1 18 | Read graphics status
    BPL $E0              ; 10 E0 | Game work RAM access
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1BD
; Address: $F5D784
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1BD:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1BE
; Address: $F5D78C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1BE:
    BEQ $00              ; F0 00 | Branch if equal
    INY                  ; C8 | Increment Y register
    CPX #$05             ; E0 05 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    JMP $3044            ; 4C 44 30 | Jump to address
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $08              ; 30 08 | Branch if negative
    WDM #$82             ; 42 82 | Reserved instruction

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1BF
; Address: $F5D7A7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1BF:
    JSR $1042            ; 20 42 10 | Jump to subroutine
    BMI $0C              ; 30 0C | Branch if negative
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    ORA #$46             ; 09 46 | Logical OR with accumulator (immediate)
    BRA $21              ; 80 21 | PPU graphics register access
    BRA $51              ; 80 51 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1C0
; Address: $F5D7C0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1C0:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    STY $00              ; 84 00 | Store Y register to zero page
    LSR $02              ; 46 02 | Logical shift right (zero page)
    BRA $CF              ; 80 CF | Branch always
    STA $20DF50          ; 8F 50 DF 20 | Update graphics data
    ORA #$B3             ; 09 B3 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDA ($18,X)          ; A1 18 | Read graphics status
    BPL $E0              ; 10 E0 | Game work RAM access
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1C2
; Address: $F5D7E4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1C2:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1C3
; Address: $F5D7EC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1C3:
    BEQ $00              ; F0 00 | Branch if equal
    INY                  ; C8 | Increment Y register
    CPX #$05             ; E0 05 | Compare X register (immediate)
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    CPY $3044            ; CC 44 30 | Compare Y register (absolute)
    BCC $00              ; 90 00 | Branch if carry clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1C4
; Address: $F5D80B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1C4:
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    AND ($EE,X)          ; 21 EE | Logical AND with accumulator ((zero page,X))
    LDY $00              ; A4 00 | Load from zero page into Y register
    ADC #$02             ; 69 02 | Add with carry (immediate)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1C7
; Address: $F5D84B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1C7:
    JSR $E090            ; 20 90 E0 | Game work RAM access
    BPL $80              ; 10 80 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BVC $00              ; 50 00 | Branch if overflow clear
    BRA $50              ; 80 50 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1C8
; Address: $F5D86D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1C8:
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1C9
; Address: $F5D88B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1C9:
    BVC $36              ; 50 36 | Branch if overflow clear
    BVS $36              ; 70 36 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1CB
; Address: $F5D89A
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1CB:
    LDX $09              ; A6 09 | Load from zero page into X register
    STX $7A01            ; 8E 01 7A | Store X register to absolute address
    STA ($00,X)          ; 81 00 | Update graphics data
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BIT $17              ; 24 17 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1CC
; Address: $F5D932
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1CC:
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    BPL $56              ; 10 56 | Branch if positive
    ORA ($A8,X)          ; 01 A8 | Logical OR with accumulator ((zero page,X))
    STX $04              ; 86 04 | Store X register to zero page
    STX $9040            ; 8E 40 90 | Store X register to absolute address
    RTI                  ; 40 | Return from interrupt
    BRA $43              ; 80 43 | Branch always
    BRA $4C              ; 80 4C | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    PLP                  ; 28 | Pull processor status from stack
    BRA $11              ; 80 11 | Branch always
    RTI                  ; 40 | Return from interrupt
    ORA ($60),Y          ; 11 60 | Logical OR with accumulator ((zero page),Y)
    BCS $00              ; B0 00 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1CD
; Address: $F5D960
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1CD:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    WDM #$47             ; 42 47 | Reserved instruction
    AND ($60,X)          ; 21 60 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $24              ; 80 24 | Branch always
    REP #$14             ; C2 14 | Reset processor status bits
    RTI                  ; 40 | Return from interrupt
    BRA $3B              ; 80 3B | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $02              ; 80 02 | Branch always
    BPL $36              ; 10 36 | Branch if positive
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    STA ($40,X)          ; 81 40 | Update graphics data
    BIT #$D1             ; 89 D1 | Test bits in accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    DEC $39              ; C6 39 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1CE
; Address: $F5D9D8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1CE:
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    BRA $E0              ; 80 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1CF
; Address: $F5D9F1
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1CF:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    EOR ($83,X)          ; 41 83 | Exclusive OR with accumulator ((zero page,X))
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    STA ($42,X)          ; 81 42 | Hardware register operation
    BIT $82              ; 24 82 | Test bits in accumulator (zero page)
    BIT $42              ; 24 42 | Hardware register operation
    BIT $0C              ; 24 0C | Test bits in accumulator (zero page)
    LDY #$BC             ; A0 BC | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    DEC $39              ; C6 39 | Decrement (zero page)
    SBC $0012            ; ED 12 00 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1D1
; Address: $F5DA47
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1D1:
    JMP ($2C68)          ; 6C 68 2C | Jump to address (absolute indirect)
    PHP                  ; 08 | Push processor status to stack
    JMP $0800            ; 4C 00 08 | Jump to address
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCC $80              ; 90 80 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    BCS $02              ; B0 02 | Branch if carry set
    PEA #$B802           ; F4 02 B8 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $10              ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1D2
; Address: $F5DA68
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1D2:
    JSR $0030            ; 20 30 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    BMI $30              ; 30 30 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    BMI $48              ; 30 48 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1D3
; Address: $F5DA76
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1D3:
    JSR $0848            ; 20 48 08 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1D4
; Address: $F5DA7E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1D4:
    BMI $48              ; 30 48 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $10              ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1D5
; Address: $F5DA88
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1D5:
    JSR $0030            ; 20 30 00 | Jump to subroutine
    BMI $30              ; 30 30 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1D6
; Address: $F5DA9A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1D6:
    JSR $005C            ; 20 5C 00 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BMI $08              ; 30 08 | Branch if negative
    BPL $30              ; 10 30 | Branch if positive
    BPL $20              ; 10 20 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BMI $44              ; 30 44 | Branch if negative
    BMI $44              ; 30 44 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    BMI $30              ; 30 30 | Branch if negative
    BMI $10              ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1D7
; Address: $F5DAC4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1D7:
    JSR $0030            ; 20 30 00 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BMI $48              ; 30 48 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1D8
; Address: $F5DAD2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1D8:
    JSR $0848            ; 20 48 08 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BMI $48              ; 30 48 | Branch if negative
    BMI $48              ; 30 48 | Branch if negative
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1D9
; Address: $F5DAE2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1D9:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    AND ($80,X)          ; 21 80 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $42              ; 80 42 | Hardware register operation
    STY $04              ; 84 04 | Store Y register to zero page
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $02              ; 30 02 | Branch if negative
    ORA $100E,X          ; 1D 0E 10 | Logical OR with accumulator (absolute,X)
    ORA #$71             ; 09 71 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    PLB                  ; AB | Pull data bank register from stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $20              ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1DB
; Address: $F5DB08
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1DB:
    JSR $2040            ; 20 40 20 | Jump to subroutine
    BRA $20              ; 80 20 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1DD
; Address: $F5DB12
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1DD:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $10              ; 80 10 | Branch always
    BCC $0C              ; 90 0C | Branch if carry clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $3204            ; 0E 04 32 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1DF
; Address: $F5DB45
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1DF:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    BIT $6213            ; 2C 13 62 | Test bits in accumulator (absolute)
    BVC $67              ; 50 67 | Branch if overflow clear
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $00              ; 10 00 | Branch if positive
    BVS $00              ; 70 00 | Branch if overflow set
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1E3
; Address: $F5DB76
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1E3:
    JSR $00C0            ; 20 C0 00 | Jump to subroutine
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1E5
; Address: $F5DB85
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1E5:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BRA $1F              ; 80 1F | Branch always
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1E6
; Address: $F5DB96
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1E6:
    SEC                  ; 38 | Set carry flag
    BIT $6213            ; 2C 13 62 | Test bits in accumulator (absolute)
    BVC $67              ; 50 67 | Branch if overflow clear
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    BNE $00              ; D0 00 | Branch if not equal
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1E8
; Address: $F5DBAC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1E8:
    JSR $2040            ; 20 40 20 | Jump to subroutine
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1E9
; Address: $F5DBB5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1E9:
    JSR $C020            ; 20 20 C0 | Jump to subroutine
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1EA
; Address: $F5DBC0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1EA:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    LSR $02              ; 46 02 | Logical shift right (zero page)
    BRA $CF              ; 80 CF | Branch always
    STA $20DF50          ; 8F 50 DF 20 | Update graphics data
    TAX                  ; AA | Transfer accumulator to X register
    ORA ($A9),Y          ; 11 A9 | Logical OR with accumulator ((zero page),Y)
    BPL $10              ; 10 10 | Branch if positive
    CPX #$4F             ; E0 4F | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BMI $08              ; 30 08 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1EC
; Address: $F5DBE7
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1EC:
    JSR $1042            ; 20 42 10 | Jump to subroutine
    BMI $0C              ; 30 0C | Branch if negative
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    STY $21              ; 84 21 | PPU graphics register access
    BRA $51              ; 80 51 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $08              ; 80 08 | Branch always
    PHP                  ; 08 | Push processor status to stack
    STX $02              ; 86 02 | Store X register to zero page
    BRA $CF              ; 80 CF | Branch always
    LDY #$37             ; A0 37 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    NOP                  ; EA | No operation
    ORA ($69),Y          ; 11 69 | Logical OR with accumulator ((zero page),Y)
    BPL $10              ; 10 10 | Branch if positive
    CPX #$4F             ; E0 4F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1EE
; Address: $F5DC24
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1EE:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1EF
; Address: $F5DC2C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1EF:
    BEQ $00              ; F0 00 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$05             ; E0 05 | Compare X register (immediate)
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    CPY $3044            ; CC 44 30 | Compare Y register (absolute)
    BCC $00              ; 90 00 | Branch if carry clear
    AND $3810,Y          ; 39 10 38 | Logical AND with accumulator (absolute,Y)
    BPL $28              ; 10 28 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1F0
; Address: $F5DC64
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1F0:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    BVC $00              ; 50 00 | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    BPL $28              ; 10 28 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1F2
; Address: $F5DCC6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1F2:
    JSR $2172            ; 20 72 21 | PPU graphics register access
    BVS $13              ; 70 13 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    ASL $A8              ; 06 A8 | Arithmetic shift left (zero page)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1F3
; Address: $F5DCDB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1F3:
    STY $8024            ; 8C 24 80 | Store Y register to absolute address
    BIT $82              ; 24 82 | Test bits in accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    BRA $90              ; 80 90 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $4C              ; B0 4C | Branch if carry set
    BNE $00              ; D0 00 | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    BVS $20              ; 70 20 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1F4
; Address: $F5DCFB
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1F4:
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1F5
; Address: $F5DCFF
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1F5:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    INC $0010            ; EE 10 00 | Increment (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1F6
; Address: $F5DD4F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1F6:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    EOR ($86,X)          ; 41 86 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $28              ; 10 28 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    AND $10              ; 25 10 | Logical AND with accumulator (zero page)
    EOR $21              ; 45 21 | PPU graphics register access
    DEC $18              ; C6 18 | Decrement (zero page)
    BCC $60              ; 90 60 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1F9
; Address: $F5DD87
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1F9:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1FC
; Address: $F5DD9B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1FC:
    JSR $26C0            ; 20 C0 26 | Jump to subroutine
    DEC $29              ; C6 29 | Decrement (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $20              ; 10 20 | Branch if positive
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    BIT $1C              ; 24 1C | Test bits in accumulator (zero page)
    BCC $60              ; 90 60 | Branch if carry clear
    BMI $30              ; 30 30 | Branch if negative
    BMI $60              ; 30 60 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1FD
; Address: $F5DDEB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1FD:
    BVC $00              ; 50 00 | Branch if overflow clear
    BMI $00              ; 30 00 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    BPL $88              ; 10 88 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_1FE
; Address: $F5DDFA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_1FE:
    JSR $E088            ; 20 88 E0 | Game work RAM access
    BPL $C0              ; 10 C0 | Branch if positive
    ROL $0E              ; 26 0E | Rotate left (zero page)
    ORA $050A            ; 0D 0A 05 | Logical OR with accumulator (absolute)
    ASL $0401            ; 0E 01 04 | Arithmetic shift left (absolute)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $0410            ; 0D 10 04 | Logical OR with accumulator (absolute)
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_200
; Address: $F5DE19
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_200:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    ADC ($2D),Y          ; 71 2D | Add with carry ((zero page),Y)
    AND ($73,X)          ; 21 73 | Logical AND with accumulator ((zero page,X))
    AND ($52,X)          ; 21 52 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_203
; Address: $F5DE3A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_203:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $DC              ; 10 DC | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_204
; Address: $F5DE45
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_204:
    BRA $F8              ; 80 F8 | Branch always
    BNE $A8              ; D0 A8 | Branch if not equal
    BVC $D0              ; 50 D0 | Branch if overflow clear
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_205
; Address: $F5DE51
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_205:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    BVC $20              ; 50 20 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_207
; Address: $F5DE84
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_207:
    JSR $0081            ; 20 81 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    STA $50AE50          ; 8F 50 AE 50 | Update graphics data
    ASL $58              ; 06 58 | Arithmetic shift left (zero page)
    EOR ($2C),Y          ; 51 2C | Exclusive OR with accumulator ((zero page),Y)
    ADC $A804,Y          ; 79 04 A8 | Add with carry (absolute,Y)
    EOR $4C              ; 45 4C | Exclusive OR with accumulator (zero page)
    LDA ($55,X)          ; A1 55 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_208
; Address: $F5DEAE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_208:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BCC $0C              ; 90 0C | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_209
; Address: $F5DEC2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_209:
    ROL $6F              ; 26 6F | Rotate left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BPL $01              ; 10 01 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_20A
; Address: $F5DED1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_20A:
    STZ $8010            ; 9C 10 80 | Store zero to absolute
    BRA $0C              ; 80 0C | Branch always
    BVS $0E              ; 70 0E | Branch if overflow set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($33),Y          ; 11 33 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_20B
; Address: $F5DEE5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_20B:
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    STA $00C686          ; 8F 86 C6 00 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY $F100            ; CC 00 F1 | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_20C
; Address: $F5DEF7
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_20C:
    BPL $29              ; 10 29 | Branch if positive
    BPL $E7              ; 10 E7 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BCS $0F              ; B0 0F | Branch if carry set
    BVS $06              ; 70 06 | Branch if overflow set
    DEX                  ; CA | Decrement X register
    CPX $843A            ; EC 3A 84 | Compare X register (absolute)
    CPY $8406            ; CC 06 84 | Compare Y register (absolute)
    ASL $2E04,X          ; 1E 04 2E | Arithmetic shift left (absolute,X)
    BIT $11              ; 24 11 | Test bits in accumulator (zero page)
    CPY $01              ; C4 01 | Compare Y register (zero page)
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BPL $C0              ; 10 C0 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_20D
; Address: $F5DF19
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_20D:
    JSR $4080            ; 20 80 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_20E
; Address: $F5DF22
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_20E:
    ROR $0F              ; 66 0F | Rotate right (zero page)
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    BPL $01              ; 10 01 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    STZ $8070            ; 9C 70 80 | Store zero to absolute
    BRA $5C              ; 80 5C | Branch always
    BRA $0E              ; 80 0E | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_20F
; Address: $F5DF3D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_20F:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $C0              ; 06 C0 | Arithmetic shift left (zero page)
    INC $2A              ; E6 2A | Increment (zero page)
    STZ $04FA            ; 9C FA 04 | Store zero to absolute
    STY $0416            ; 8C 16 04 | Store Y register to absolute address
    ROL $4E04            ; 2E 04 4E | Rotate left (absolute)
    ROL $19              ; 26 19 | Rotate left (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    ORA ($C8),Y          ; 11 C8 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_210
; Address: $F5DF59
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_210:
    JSR $4080            ; 20 80 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    WDM #$00             ; 42 00 | Reserved instruction
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_211
; Address: $F5DFA0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_211:
    LSR                  ; 4A | Logical shift right (accumulator)
    BRA $00              ; 80 00 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $E0              ; 10 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $A6              ; 10 A6 | Branch if positive
    LDX $49              ; A6 49 | Load from zero page into X register
    AND ($73,X)          ; 21 73 | Logical AND with accumulator ((zero page,X))
    BPL $21              ; 10 21 | PPU graphics register access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $D4              ; D0 D4 | Branch if not equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_212
; Address: $F5E035
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_212:
    JSR $008C            ; 20 8C 00 | Jump to subroutine
    LSR $0380            ; 4E 80 03 | Logical shift right (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_213
; Address: $F5E03D
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_213:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    ROL $03              ; 26 03 | Rotate left (zero page)
    STX $CF87            ; 8E 87 CF | Store X register to absolute address
    STX $C6              ; 86 C6 | Store X register to zero page
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CMP $6100,Y          ; D9 00 61 | Compare accumulator (absolute,Y)
    BPL $20              ; 10 20 | Branch if positive
    BPL $29              ; 10 29 | Branch if positive
    BPL $E7              ; 10 E7 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BCS $0F              ; B0 0F | Branch if carry set
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_215
; Address: $F5E086
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_215:
    JSR $0081            ; 20 81 00 | Jump to subroutine
    BPL $EE              ; 10 EE | Branch if positive
    BPL $8F              ; 10 8F | Branch if positive
    BVC $AE              ; 50 AE | Branch if overflow clear
    BVC $06              ; 50 06 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_216
; Address: $F5E097
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_216:
    CLI                  ; 58 | Clear interrupt disable flag
    EOR ($2C),Y          ; 51 2C | Exclusive OR with accumulator ((zero page),Y)
    ADC $A804,Y          ; 79 04 A8 | Add with carry (absolute,Y)
    EOR $4C              ; 45 4C | Exclusive OR with accumulator (zero page)
    LDA ($00,X)          ; A1 00 | Read graphics status
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_217
; Address: $F5E0AC
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_217:
    JSR $2080            ; 20 80 20 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BPL $D0              ; 10 D0 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $3508            ; 0E 08 35 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_219
; Address: $F5E0E6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_219:
    JSR $0081            ; 20 81 00 | Jump to subroutine
    BPL $EF              ; 10 EF | Branch if positive
    BPL $8F              ; 10 8F | Branch if positive
    BVC $AE              ; 50 AE | Branch if overflow clear
    BVC $06              ; 50 06 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    EOR ($2C),Y          ; 51 2C | Exclusive OR with accumulator ((zero page),Y)
    ADC $A804,Y          ; 79 04 A8 | Add with carry (absolute,Y)
    EOR $4C              ; 45 4C | Exclusive OR with accumulator (zero page)
    LDA ($80,X)          ; A1 80 | Read graphics status
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_21B
; Address: $F5E10E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_21B:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $18              ; 80 18 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_21D
; Address: $F5E124
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_21D:
    BPL $44              ; 10 44 | Branch if positive
    BRA $40              ; 80 40 | Branch always
    BMI $60              ; 30 60 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    AND $4A              ; 25 4A | Logical AND with accumulator (zero page)
    BCC $2B              ; 90 2B | Branch if carry clear
    BRA $27              ; 80 27 | Branch always
    CLC                  ; 18 | Clear carry flag
    EOR #$04             ; 49 04 | Exclusive OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    CMP $2A              ; C5 2A | Compare accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    REP #$2D             ; C2 2D | Reset processor status bits
    LDA $18              ; A5 18 | Read graphics status
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_21F
; Address: $F5E15F
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_21F:
    JSR $4400            ; 20 00 44 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    ORA ($E0),Y          ; 11 E0 | Game work RAM access
    SBC ($12,X)          ; E1 12 | Subtract with carry ((zero page,X))
    CPX $30CA            ; EC CA 30 | Compare X register (absolute)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BMI $30              ; 30 30 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    CPX #$E0             ; E0 E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_220
; Address: $F5E1C5
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_220:
    PHA                  ; 48 | Push accumulator to stack
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    BNE $10              ; D0 10 | Branch if not equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BPL $F0              ; 10 F0 | Branch if positive
    BIT $3600            ; 2C 00 36 | Test bits in accumulator (absolute)
    ORA $3600            ; 0D 00 36 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    BMI $3B              ; 30 3B | Branch if negative
    LSR $7C4F,X          ; 5E 4F 7C | Logical shift right (absolute,X)
    ROR $7F7E,X          ; 7E 7E 7F | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $0500            ; 0D 00 05 | Logical OR with accumulator (absolute)
    BPL $2D              ; 10 2D | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    LSR $1A43,X          ; 5E 43 1A | Logical shift right (absolute,X)
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_221
; Address: $F5E259
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_221:
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $0500            ; 0D 00 05 | Logical OR with accumulator (absolute)
    BRA $90              ; 80 90 | Branch always
    EOR $185C            ; 4D 5C 18 | Exclusive OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    LSR $1A43,X          ; 5E 43 1A | Logical shift right (absolute,X)
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ORA ($8E,X)          ; 01 8E | Logical OR with accumulator ((zero page,X))
    STA ($4C,X)          ; 81 4C | Update graphics data
    CLC                  ; 18 | Clear carry flag
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $0500            ; 0D 00 05 | Logical OR with accumulator (absolute)
    BPL $0D              ; 10 0D | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    LSR $1A43,X          ; 5E 43 1A | Logical shift right (absolute,X)
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    STA $95B5,X          ; 9D B5 95 | Update graphics data
    STA $435B8F          ; 8F 8F 5B 43 | Update graphics data
    ROL $1D05,X          ; 3E 05 1D | Rotate left (absolute,X)
    STA $956A,X          ; 9D 6A 95 | Update graphics data
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_222
; Address: $F5E2F6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_222:
    STA $7D43F1          ; 8F F1 43 7D | Update graphics data
    JMP $1D003E          ; 5C 3E 00 1D | Jump to address long
    BRA $E2              ; 80 E2 | Branch always
    BRA $6A              ; 80 6A | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_223
; Address: $F5E305
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_223:
    JSR $404D            ; 20 4D 40 | Jump to subroutine
    LDA $A0              ; A5 A0 | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_224
; Address: $F5E30B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_224:
    BVS $2D              ; 70 2D | Branch if overflow set
    PEA #$E262           ; F4 62 E2 | Push effective address to stack
    DEC $BAE3,X          ; DE E3 BA | Decrement (absolute,X)
    SBC $5E              ; E5 5E | Subtract with carry (zero page)
    SBC ($0E,X)          ; E1 0E | Subtract with carry ((zero page,X))
    ADC ($2C,X)          ; 61 2C | Add with carry ((zero page,X))
    LSR $01              ; 46 01 | Logical shift right (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_225
; Address: $F5E325
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_225:
    ORA $222A,Y          ; 19 2A 22 | Logical OR with accumulator (absolute,Y)
    ADC ($44),Y          ; 71 44 | Add with carry ((zero page),Y)
    BVS $46              ; 70 46 | Branch if overflow set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $220F,Y          ; 19 0F 22 | Logical OR with accumulator (absolute,Y)
    LSR $79              ; 46 79 | Logical shift right (zero page)
    ORA $C93C,Y          ; 19 3C C9 | Logical OR with accumulator (absolute,Y)
    ROL $331F            ; 2E 1F 33 | Rotate left (absolute)
    BIT $F1FE            ; 2C FE F1 | Test bits in accumulator (absolute)
    STX $DBF9            ; 8E F9 DB | Store X register to absolute address
    PLY                  ; 7A | Pull Y register from stack
    LSR $00              ; 46 00 | Logical shift right (zero page)
    REP #$C0             ; C2 C0 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_226
; Address: $F5E358
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_226:
    JSR $F060            ; 20 60 F0 | Jump to subroutine
    BPL $F8              ; 10 F8 | Branch if positive
    PLY                  ; 7A | Pull Y register from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $09BC,Y          ; 19 BC 09 | Logical OR with accumulator (absolute,Y)
    ROL $331F            ; 2E 1F 33 | Rotate left (absolute)
    LDY $717E            ; AC 7E 71 | Load from absolute address into Y register
    ASL $1779            ; 0E 79 17 | Arithmetic shift left (absolute)
    STZ $4683,X          ; 9E 83 46 | Store zero to absolute,X
    BRA $42              ; 80 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BVS $90              ; 70 90 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BRA $9E              ; 80 9E | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA $09BC,Y          ; 99 BC 09 | Update graphics data
    LDA                  ; BF 2E 1F 33 | Read graphics status
    LDY $717E            ; AC 7E 71 | Load from absolute address into Y register
    ASL $1779            ; 0E 79 17 | Arithmetic shift left (absolute)
    STZ $4643,X          ; 9E 43 46 | Store zero to absolute,X
    BRA $C2              ; 80 C2 | Branch always
    BRA $44              ; 80 44 | Branch always
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_227
; Address: $F5E3DA
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_227:
    BVS $90              ; 70 90 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BRA $9E              ; 80 9E | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BEQ $F0              ; F0 F0 | Branch if equal
    BNE $10              ; D0 10 | Branch if not equal
    BRA $10              ; 80 10 | Branch always
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    BEQ $00              ; F0 00 | Branch if equal
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $0106            ; 0D 06 01 | Logical OR with accumulator (absolute)
    ROL $1C3F,X          ; 3E 3F 1C | Rotate left (absolute,X)
    ORA $D90A            ; 0D 0A D9 | Logical OR with accumulator (absolute)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    INC $B3DF            ; EE DF B3 | Increment (absolute)
    LDY $F1FE            ; AC FE F1 | Load from absolute address into Y register
    ASL $7BF9            ; 0E F9 7B | Arithmetic shift left (absolute)
    PLX                  ; FA | Pull X register from stack
    EOR $C07C            ; 4D 7C C0 | Exclusive OR with accumulator (absolute)
    CPY #$44             ; C0 44 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BPL $F8              ; 10 F8 | Branch if positive
    PLX                  ; FA | Pull X register from stack
    LSR $42              ; 46 42 | Hardware register operation
    WDM #$26             ; 42 26 | Reserved instruction
    ROL $1C              ; 26 1C | Rotate left (zero page)
    LSR $7D              ; 46 7D | Logical shift right (zero page)
    WDM #$7E             ; 42 7E | Reserved instruction
    ROL $3E              ; 26 3E | Rotate left (zero page)
    CPY $275C            ; CC 5C 27 | Compare Y register (absolute)
    ORA #$27             ; 09 27 | Logical OR with accumulator (immediate)
    JMP $906FA3          ; 5C A3 6F 90 | Jump to address long
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_228
; Address: $F5E496
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_228:
    JSR $2010            ; 20 10 20 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    STZ $27              ; 64 27 | Store zero to zero page
    ORA #$27             ; 09 27 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_22A
; Address: $F5E4B6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_22A:
    JSR $2010            ; 20 10 20 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR $FC62            ; 4E 62 FC | Logical shift right (absolute)
    CPX $C4              ; E4 C4 | Compare X register (zero page)
    CPY $68              ; C4 68 | Compare Y register (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_22B
; Address: $F5E4EB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_22B:
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    DEC $DE62            ; CE 62 DE | Decrement (absolute)
    CPX $7C              ; E4 7C | Compare X register (zero page)
    CPY $7C              ; C4 7C | Compare Y register (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_22C
; Address: $F5E50F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_22C:
    JSR $0006            ; 20 06 00 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND #$F7             ; 29 F7 | Logical AND with accumulator (immediate)
    STZ $6B              ; 64 6B | Store zero to zero page
    LDY $4F03            ; AC 03 4F | Load from absolute address into Y register
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    BRA $D7              ; 80 D7 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_22D
; Address: $F5E533
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_22D:
    JSL $6800F0          ; 22 F0 00 68 | Jump to subroutine long
    LDY $4FC4            ; AC C4 4F | Load from absolute address into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    INC $FBC9,X          ; FE C9 FB | Increment (absolute,X)
    ROL $D6              ; 26 D6 | Rotate left (zero page)
    SBC ($35,X)          ; E1 35 | Subtract with carry ((zero page,X))
    CPY #$F2             ; C0 F2 | Compare Y register (immediate)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_22F
; Address: $F5E551
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_22F:
    ORA ($EB,X)          ; 01 EB | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_231
; Address: $F5E572
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_231:
    BRA $80              ; 80 80 | Branch always
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $0307            ; 0E 07 03 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_232
; Address: $F5E5A2
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_232:
    JSR $2361            ; 20 61 23 | Jump to subroutine
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEP #$DF             ; E2 DF | Set processor status bits
    INY                  ; C8 | Increment Y register
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $1E              ; 10 1E | Branch if positive
    ASL $1F1E,X          ; 1E 1E 1F | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_233
; Address: $F5E62F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_233:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BPL $0F              ; 10 0F | Branch if positive
    ASL $1F0F,X          ; 1E 0F 1F | Arithmetic shift left (absolute,X)
    ORA $1F20,X          ; 1D 20 1F | Logical OR with accumulator (absolute,X)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_234
; Address: $F5E64C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_234:
    JSR $60A0            ; 20 A0 60 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_235
; Address: $F5E686
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_235:
    PHY                  ; 5A | Push Y register to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $00008F          ; 8F 8F 00 00 | Update graphics data
    BMI $00              ; 30 00 | Branch if negative
    LSR                  ; 4A | Logical shift right (accumulator)
    BMI $95              ; 30 95 | Branch if negative
    STA $203CF1          ; 8F F1 3C 20 | Update graphics data
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_236
; Address: $F5E6A3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_236:
    JSR $2028            ; 20 28 20 | Jump to subroutine
    BPL $16              ; 10 16 | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_238
; Address: $F5E6B4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_238:
    JSR $103F            ; 20 3F 10 | Jump to subroutine
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_239
; Address: $F5E6C3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_239:
    BVS $60              ; 70 60 | Branch if overflow set
    BVS $20              ; 70 20 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    BPL $40              ; 10 40 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_23A
; Address: $F5E6CC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_23A:
    BRA $C0              ; 80 C0 | Branch always
    BRA $F0              ; 80 F0 | Branch always
    BVS $80              ; 70 80 | Branch if overflow set
    BVS $80              ; 70 80 | Branch if overflow set
    BMI $C0              ; 30 C0 | Branch if negative
    BPL $E0              ; 10 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_23B
; Address: $F5E6DB
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_23B:
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $0F06            ; 0E 06 0F | Arithmetic shift left (absolute)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $A0              ; 80 A0 | Branch always
    BEQ $50              ; F0 50 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BVC $F8              ; 50 F8 | Branch if overflow clear
    BEQ $D8              ; F0 D8 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_23C
; Address: $F5E70C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_23C:
    JSR $C0D0            ; 20 D0 C0 | Jump to subroutine
    BMI $20              ; 30 20 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BRA $18              ; 80 18 | Branch always
    BCC $18              ; 90 18 | Branch if carry clear
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_23D
; Address: $F5E725
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_23D:
    ROL $1D05,X          ; 3E 05 1D | Rotate left (absolute,X)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $5C63,X          ; 7D 63 5C | Add with carry (absolute,X)
    ROL $1D00,X          ; 3E 00 1D | Rotate left (absolute,X)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ROL $1F              ; 26 1F | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $90              ; 80 90 | Branch always
    CPX #$48             ; E0 48 | Compare X register (immediate)
    BEQ $64              ; F0 64 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $1D22,X          ; 1E 22 1D | Arithmetic shift left (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY $78              ; C4 78 | Compare Y register (zero page)
    CLV                  ; B8 | Clear overflow flag
    PLP                  ; 28 | Pull processor status from stack
    BNE $30              ; D0 30 | Branch if not equal
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    BIT $3700            ; 2C 00 37 | Test bits in accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_23F
; Address: $F5E7F6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_23F:
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    ADC $7F7D,X          ; 7D 7D 7F | Add with carry (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_240
; Address: $F5E81E
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_240:
    BEQ $F0              ; F0 F0 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BIT $3600            ; 2C 00 36 | Test bits in accumulator (absolute)
    ORA $3600            ; 0D 00 36 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    BMI $30              ; 30 30 | Branch if negative
    ROR $7F7E,X          ; 7E 7E 7F | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $14              ; 10 14 | Branch if positive
    BPL $14              ; 10 14 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_241
; Address: $F5E8A8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_241:
    JSR $2028            ; 20 28 20 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_242
; Address: $F5E8AD
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_242:
    BVS $60              ; 70 60 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BPL $28              ; 10 28 | Branch if positive
    BPL $70              ; 10 70 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BVS $40              ; 70 40 | Branch if overflow set
    BMI $30              ; 30 30 | Branch if negative
    BEQ $0A              ; F0 0A | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    ROL $003E,X          ; 3E 3E 00 | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY $F4FC            ; CC FC F4 | Compare Y register (absolute)
    INC $3E00,X          ; FE 00 3E | Increment (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    DEC $3C0C            ; CE 0C 3C | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_243
; Address: $F5E926
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_243:
    BMI $F0              ; 30 F0 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ROR $FC7F,X          ; 7E 7F FC | Rotate right (absolute,X)
    INC $FEF2,X          ; FE F2 FE | Increment (absolute,X)
    CPY $38FC            ; CC FC 38 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $13              ; 10 13 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_245
; Address: $F5E968
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_245:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_248
; Address: $F5E973
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_248:
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_249
; Address: $F5E982
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_249:
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL $1408            ; 0E 08 14 | Arithmetic shift left (absolute)
    BPL $1C              ; 10 1C | Branch if positive
    BPL $1E              ; 10 1E | Branch if positive
    BPL $0E              ; 10 0E | Branch if positive
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BPL $E0              ; 10 E0 | Game work RAM access
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_24A
; Address: $F5E9A3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_24A:
    JSR $3030            ; 20 30 30 | Jump to subroutine
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVC $D0              ; 50 D0 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_24C
; Address: $F5E9B2
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_24C:
    JSR $30E0            ; 20 E0 30 | Jump to subroutine
    BNE $70              ; D0 70 | Branch if not equal
    BCC $70              ; 90 70 | Branch if carry clear
    BCC $70              ; 90 70 | Branch if carry clear
    BNE $D0              ; D0 D0 | Branch if not equal
    BVS $D0              ; 70 D0 | Branch if overflow set
    BCS $00              ; B0 00 | Branch if carry set
    BPL $10              ; 10 10 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    ASL $3C0E            ; 0E 0E 3C | Arithmetic shift left (absolute)
    INC $FCF8,X          ; FE F8 FC | Increment (absolute,X)
    BVS $78              ; 70 78 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    BVS $00              ; 70 00 | Branch if overflow set
    INX                  ; E8 | Increment X register
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BVS $70              ; 70 70 | Branch if overflow set
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0003,X          ; 1E 03 00 | Arithmetic shift left (absolute,X)
    ASL $1700            ; 0E 00 17 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_24D
; Address: $F5EA4B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_24D:
    RTI                  ; 40 | Return from interrupt
    BNE $10              ; D0 10 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    ASL $170E            ; 0E 0E 17 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_24E
; Address: $F5EA5B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_24E:
    LDY #$50             ; A0 50 | Load immediate value into Y register
    CPX #$78             ; E0 78 | Compare X register (immediate)
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    ROR $3C              ; 66 3C | Rotate right (zero page)
    PHY                  ; 5A | Push Y register to stack
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BPL $1F              ; 10 1F | Branch if positive
    BPL $16              ; 10 16 | Branch if positive
    BPL $09              ; 10 09 | Branch if positive
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_24F
; Address: $F5EA8B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_24F:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $17              ; 10 17 | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BNE $90              ; D0 90 | Branch if not equal
    LDY #$20             ; A0 20 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BCC $F0              ; 90 F0 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_250
; Address: $F5EAB2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_250:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BPL $10              ; 10 10 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $00              ; B0 00 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_251
; Address: $F5EAEB
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_251:
    BRA $00              ; 80 00 | Branch always
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_252
; Address: $F5EB52
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_252:
    ASL $1F01,X          ; 1E 01 1F | Arithmetic shift left (absolute,X)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BNE $00              ; D0 00 | Branch if not equal
    BMI $00              ; 30 00 | Branch if negative
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_254
; Address: $F5EB6D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_254:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    BNE $78              ; D0 78 | Branch if not equal
    BRA $F8              ; 80 F8 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_256
; Address: $F5EB7D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_256:
    RTI                  ; 40 | Return from interrupt
    BPL $3F              ; 10 3F | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_257
; Address: $F5EBE5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_257:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_258
; Address: $F5EBEA
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_258:
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BNE $F0              ; D0 F0 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    ORA ($3E),Y          ; 11 3E | Logical OR with accumulator ((zero page),Y)
    ORA $2E3F,Y          ; 19 3F 2E | Logical OR with accumulator (absolute,Y)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_259
; Address: $F5EC20
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_259:
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    BCC $70              ; 90 70 | Branch if carry clear
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_25A
; Address: $F5EC33
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_25A:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    LSR $0043,X          ; 5E 43 00 | Logical shift right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BIT $4600            ; 2C 00 46 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $462C            ; 2C 2C 46 | Test bits in accumulator (absolute)
    LSR $7A              ; 46 7A | Logical shift right (zero page)
    REP #$00             ; C2 00 | Reset processor status bits
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ROL $DFDE,X          ; 3E DE DF | Rotate left (absolute,X)
    ORA ($1B),Y          ; 11 1B | Logical OR with accumulator ((zero page),Y)
    BPL $B1              ; 10 B1 | Branch if positive
    ROL $DF00,X          ; 3E 00 DF | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_25B
; Address: $F5ECB3
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_25B:
    JSR $C03F            ; 20 3F C0 | Jump to subroutine
    BIT $56              ; 24 56 | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    LDA ($4E),Y          ; B1 4E | Read graphics status
    ROR $817E,X          ; 7E 7E 81 | Rotate right (absolute,X)
    STA ($99,X)          ; 81 99 | Update graphics data
    STA ($DB,X)          ; 81 DB | Update graphics data
    ROR $3C7E,X          ; 7E 7E 3C | Rotate right (absolute,X)
    ROR $8100,X          ; 7E 00 81 | Rotate right (absolute,X)
    ROR $7E81,X          ; 7E 81 7E | Rotate right (absolute,X)
    ROR $3C00,X          ; 7E 00 3C | Rotate right (absolute,X)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    WDM #$3C             ; 42 3C | Reserved instruction
    STA $997E,Y          ; 99 7E 99 | Update graphics data
    ROR $3C42,X          ; 7E 42 3C | Rotate right (absolute,X)
    ROR $FF7E,X          ; 7E 7E FF | Rotate right (absolute,X)
    ROR $3CFF,X          ; 7E FF 3C | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    ROR $66FF,X          ; 7E FF 66 | Rotate right (absolute,X)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_25C
; Address: $F5ED20
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_25C:
    ORA $0500            ; 0D 00 05 | Logical OR with accumulator (absolute)
    ORA $030C            ; 0D 0C 03 | Logical OR with accumulator (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BCS $00              ; B0 00 | Branch if carry set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BCS $30              ; B0 30 | Branch if carry set
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    BRA $20              ; 80 20 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$78             ; A0 78 | Load immediate value into Y register
    BRA $70              ; 80 70 | Branch always
    BRA $30              ; 80 30 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_25D
; Address: $F5ED5B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_25D:
    RTI                  ; 40 | Return from interrupt
    ROR $6600,X          ; 7E 00 66 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ROR $18              ; 66 18 | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_25F
; Address: $F5EDC8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_25F:
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $7A0E            ; 0D 0E 7A | Logical OR with accumulator (absolute)
    ADC $8F76,X          ; 7D 76 8F | Add with carry (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BMI $D0              ; 30 D0 | Branch if negative
    INY                  ; C8 | Increment Y register
    CLV                  ; B8 | Clear overflow flag
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_262
; Address: $F5EE2C
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_262:
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    STZ $431B            ; 9C 1B 43 | Store zero to absolute
    TAY                  ; A8 | Transfer accumulator to Y register
    DEC $7CA9            ; CE A9 7C | Decrement (absolute)
    INC $601E            ; EE 1E 60 | Increment (absolute)
    LDY $00              ; A4 00 | Load from zero page into Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    BMI $10              ; 30 10 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    LDA $38C8            ; AD C8 38 | Read graphics status
    PLX                  ; FA | Pull X register from stack
    DEC $CD              ; C6 CD | Decrement (zero page)
    CPY $3C03            ; CC 03 3C | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    BRA $A0              ; 80 A0 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_263
; Address: $F5EEC2
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_263:
    BMI $F0              ; 30 F0 | Branch if negative
    STY $02FC            ; 8C FC 02 | Store Y register to absolute address
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ASL $00E0,X          ; 1E E0 00 | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $1108            ; 0E 08 11 | Arithmetic shift left (absolute)
    AND ($22),Y          ; 31 22 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_264
; Address: $F5EEF6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_264:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA $7A0E            ; 0D 0E 7A | Logical OR with accumulator (absolute)
    ADC $8F76,X          ; 7D 76 8F | Add with carry (absolute,X)
    STA $5E43,X          ; 9D 43 5E | Update graphics data
    AND ($F2,X)          ; 21 F2 | Logical AND with accumulator ((zero page,X))
    AND $FF20            ; 2D 20 FF | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_265
; Address: $F5EF19
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_265:
    JSR $80FF            ; 20 FF 80 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BMI $D0              ; 30 D0 | Branch if negative
    INY                  ; C8 | Increment Y register
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator
    INX                  ; E8 | Increment X register
    LDY $BC              ; A4 BC | Load from zero page into Y register
    STZ $C294            ; 9C 94 C2 | Store zero to absolute
    DEC $0080            ; CE 80 00 | Decrement (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDY $9C40,X          ; BC 40 9C | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_266
; Address: $F5EF3D
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_266:
    JSR $10CE            ; 20 CE 10 | Jump to subroutine
    AND $1EC6,X          ; 3D C6 1E | Logical AND with accumulator (absolute,X)
    INX                  ; E8 | Increment X register
    ORA ($FC),Y          ; 11 FC | Logical OR with accumulator ((zero page),Y)
    AND ($E2),Y          ; 31 E2 | Logical AND with accumulator ((zero page),Y)
    LSR $3233            ; 4E 33 32 | Logical shift right (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA $F80770          ; 8F 70 07 F8 | Update graphics data
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    STA $5E43,X          ; 9D 43 5E | Update graphics data
    AND ($F2,X)          ; 21 F2 | Logical AND with accumulator ((zero page,X))
    AND $FF20            ; 2D 20 FF | Logical AND with accumulator (absolute)
    EOR $B3FF,X          ; 5D FF B3 | Exclusive OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    ROL $FF2F            ; 2E 2F FF | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_267
; Address: $F5EF71
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_267:
    JSR $80FF            ; 20 FF 80 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    BNE $98              ; D0 98 | Branch if not equal
    INX                  ; E8 | Increment X register
    LDY $BC              ; A4 BC | Load from zero page into Y register
    STZ $C294            ; 9C 94 C2 | Store zero to absolute
    DEC $CD4B            ; CE 4B CD | Decrement (absolute)
    LSR $C6              ; 46 C6 | Logical shift right (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_268
; Address: $F5EF8D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_268:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $F8              ; 80 F8 | Branch always
    LDY $9C40,X          ; BC 40 9C | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_269
; Address: $F5EF95
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_269:
    JSR $10CE            ; 20 CE 10 | Jump to subroutine
    DEC $00              ; C6 00 | Decrement (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    DEC                  ; 3A | Decrement accumulator
    DEC $0D              ; C6 0D | Decrement (zero page)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    PEA #$C80C           ; F4 0C C8 | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BMI $F0              ; 30 F0 | Branch if negative
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    WDM #$39             ; 42 39 | Reserved instruction
    CMP #$2A             ; C9 2A | Compare accumulator (immediate)
    AND $CDD7            ; 2D D7 CD | Logical AND with accumulator (absolute)
    LDY #$50             ; A0 50 | Load immediate value into Y register
    LDY $015F            ; AC 5F 01 | Load from absolute address into Y register
    STA $F80774          ; 8F 74 07 F8 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BVC $A2              ; 50 A2 | Branch if overflow clear
    BVS $F1              ; 70 F1 | Branch if overflow set
    STX $ACCF            ; 8E CF AC | Store X register to absolute address
    LDA $DC6F69          ; AF 69 6F DC | Read graphics status
    BVS $70              ; 70 70 | Branch if overflow set
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    BMI $AF              ; 30 AF | Branch if negative
    BVC $6F              ; 50 6F | Branch if overflow clear
    BCC $FC              ; 90 FC | Branch if carry clear
    BVS $8C              ; 70 8C | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_26A
; Address: $F5F045
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_26A:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    LSR $3233            ; 4E 33 32 | Logical shift right (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    DEC $36              ; C6 36 | Decrement (zero page)
    LDA $55              ; A5 55 | Read graphics status
    PLB                  ; AB | Pull data bank register from stack
    ORA $9D              ; 05 9D | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    STA $F80770          ; 8F 70 07 F8 | Update graphics data
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $0DF1            ; 0E F1 0D | Arithmetic shift left (absolute)
    LDY $61              ; A4 61 | Load from zero page into Y register
    EOR $B3FF,X          ; 5D FF B3 | Exclusive OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    ASL $CE0F            ; 0E 0F CE | Arithmetic shift left (absolute)
    LDY $61AF            ; AC AF 61 | Load from absolute address into Y register
    SEI                  ; 78 | Set interrupt disable flag
    BNE $CF              ; D0 CF | Branch if not equal
    BMI $AF              ; 30 AF | Branch if negative
    BVC $77              ; 50 77 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    STY $4B              ; 84 4B | Store Y register to zero page
    CMP $C646            ; CD 46 C6 | Compare accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    DEC $00              ; C6 00 | Decrement (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $C6              ; 80 C6 | Branch always
    LDA $55              ; A5 55 | Read graphics status
    PLB                  ; AB | Pull data bank register from stack
    ORA $9D              ; 05 9D | Logical OR with accumulator (zero page)
    ORA $7245,Y          ; 19 45 72 | Logical OR with accumulator (absolute,Y)
    NOP                  ; EA | No operation
    LDA $0EEBCE          ; AF CE EB 0E | Read graphics status
    SBC ($0D),Y          ; F1 0D | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_26B
; Address: $F5F0D5
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_26B:
    LDY $61              ; A4 61 | Load from zero page into Y register
    LDA ($02,X)          ; A1 02 | Read graphics status
    ASL $1103            ; 0E 03 11 | Arithmetic shift left (absolute)
    ORA ($31),Y          ; 11 31 | Logical OR with accumulator ((zero page),Y)
    ORA ($CE),Y          ; 11 CE | Logical OR with accumulator ((zero page),Y)
    LDY $61AF            ; AC AF 61 | Load from absolute address into Y register
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX $CF              ; E4 CF | Compare X register (zero page)
    BMI $AF              ; 30 AF | Branch if negative
    BVC $77              ; 50 77 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    STY $7C              ; 84 7C | Store Y register to zero page
    BMI $CE              ; 30 CE | Branch if negative
    STY $B8              ; 84 B8 | Store Y register to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_26C
; Address: $F5F140
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_26C:
    JSR $10E0            ; 20 E0 10 | Jump to subroutine
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    STZ $00E4            ; 9C E4 00 | Store zero to absolute
    STZ $421A            ; 9C 1A 42 | Hardware register operation
    ADC ($97),Y          ; 71 97 | Add with carry ((zero page),Y)
    SBC $CDAB            ; ED AB CD | Subtract with carry (absolute)
    PLB                  ; AB | Pull data bank register from stack
    ADC $90F3,X          ; 7D F3 90 | Add with carry (absolute,X)
    JMP $6024C4          ; 5C C4 24 60 | Jump to address long
    LDY $00              ; A4 00 | Load from zero page into Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    BMI $10              ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_26D
; Address: $F5F17C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_26D:
    JSL $001800          ; 22 00 18 00 | Jump to subroutine long
    BVS $00              ; 70 00 | Branch if overflow set
    ASL $350E            ; 0E 0E 35 | Arithmetic shift left (absolute)
    EOR $0060,X          ; 5D 60 00 | Exclusive OR with accumulator (absolute,X)
    ASL $3F00            ; 0E 00 3F | Arithmetic shift left (absolute)
    STZ $4018            ; 9C 18 40 | Store zero to absolute
    INC $CAAA            ; EE AA CA | Increment (absolute)
    LDX $F47C            ; AE 7C F4 | Load from absolute address into X register
    BCC $50              ; 90 50 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_26F
; Address: $F5F1D2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_26F:
    LDY $00              ; A4 00 | Load from zero page into Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    BMI $10              ; 30 10 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    ORA $7045,Y          ; 19 45 70 | Logical OR with accumulator (absolute,Y)
    BCC $EA              ; 90 EA | Branch if carry clear
    LDX $EACE            ; AE CE EA | Load from absolute address into X register
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_270
; Address: $F5F1EA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_270:
    JSR $90F8            ; 20 F8 90 | Jump to subroutine
    BVC $88              ; 50 88 | Branch if overflow clear
    PLA                  ; 68 | Pull accumulator from stack
    LDA ($02,X)          ; A1 02 | Read graphics status
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $30              ; 10 30 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BPL $08              ; 10 08 | Branch if positive
    BMI $30              ; 30 30 | Branch if negative
    BMI $CE              ; 30 CE | Branch if negative
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_271
; Address: $F5F222
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_271:
    JSL $5796FB          ; 22 FB 96 57 | Jump to subroutine long
    STX $CE6F            ; 8E 6F CE | Store X register to absolute address
    DEC $DC3F,X          ; DE 3F DC | Decrement (absolute,X)
    LDA                  ; BF FD CF 01 | Read graphics status
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF FF 2E F2 | Read graphics status
    PLX                  ; FA | Pull X register from stack
    ROL $35F2,X          ; 3E F2 35 | Rotate left (absolute,X)
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    CMP $E0E0            ; CD E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    STX $A6F2            ; 8E F2 A6 | Store X register to absolute address
    PLX                  ; FA | Pull X register from stack
    DEC $85F2,X          ; DE F2 85 | Decrement (absolute,X)
    LDA ($FF,X)          ; A1 FF | Read graphics status
    CMP $FB              ; C5 FB | Compare accumulator (zero page)
    LDA ($EF),Y          ; B1 EF | Read graphics status
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_272
; Address: $F5F283
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_272:
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BMI $F0              ; 30 F0 | Branch if negative
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BNE $30              ; D0 30 | Branch if not equal
    BNE $30              ; D0 30 | Branch if not equal
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BMI $F0              ; 30 F0 | Branch if negative
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BNE $30              ; D0 30 | Branch if not equal
    BNE $B0              ; D0 B0 | Branch if not equal
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC $FF8F,X          ; FD 8F FF | Subtract with carry (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FAFA,X          ; FE FA FA | Increment (absolute,X)
    SBC $D5F9,Y          ; F9 F9 D5 | Subtract with carry (absolute,Y)
    ROR $FEFF,X          ; 7E FF FE | Rotate right (absolute,X)
    INC $FEF9,X          ; FE F9 FE | Increment (absolute,X)
    CMP $D6FA,X          ; DD FA D6 | Compare accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    PLY                  ; 7A | Pull Y register from stack
    BNE $2C              ; D0 2C | Branch if not equal
    BNE $E4              ; D0 E4 | Branch if not equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_273
; Address: $F5F321
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_273:
    INC $BE96,X          ; FE 96 BE | Increment (absolute,X)
    PHX                  ; DA | Push X register to stack
    INC $F4E0,X          ; FE E0 F4 | Increment (absolute,X)
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    BCC $F0              ; 90 F0 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    CPX #$20             ; E0 20 | Compare X register (immediate)
    LDY #$81             ; A0 81 | Load immediate value into Y register
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $0A              ; 80 0A | Branch always
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ROR $6A6E            ; 6E 6E 6A | Rotate right (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    AND #$29             ; 29 29 | Logical AND with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STA ($00),Y          ; 91 00 | Update graphics data
    TAX                  ; AA | Transfer accumulator to X register
    CPX $C700            ; EC 00 C7 | Compare X register (absolute)
    INC $FE9A,X          ; FE 9A FE | Increment (absolute,X)
    LDY #$F4             ; A0 F4 | Load immediate value into Y register
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    BCC $F0              ; 90 F0 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    CPX #$20             ; E0 20 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $10              ; 10 10 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_274
; Address: $F5F38B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_274:
    BVS $F6              ; 70 F6 | Branch if overflow set
    CMP $003F,Y          ; D9 3F 00 | Compare accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_275
; Address: $F5F3AF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_275:
    SEI                  ; 78 | Set interrupt disable flag
    AND $6434,Y          ; 39 34 64 | Logical AND with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    PLB                  ; AB | Pull data bank register from stack
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BPL $00              ; 10 00 | Branch if positive
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$60             ; A0 60 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_276
; Address: $F5F3EE
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_276:
    BNE $30              ; D0 30 | Branch if not equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $11              ; 10 11 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $F5              ; 80 F5 | Branch always
    INC $D301            ; EE 01 D3 | Increment (absolute)
    STA ($01,X)          ; 81 01 | Update graphics data
    BRA $80              ; 80 80 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_277
; Address: $F5F430
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_277:
    BVS $00              ; 70 00 | Branch if overflow set
    BVC $20              ; 50 20 | Branch if overflow clear
    LDY #$40             ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_278
; Address: $F5F436
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_278:
    JSR $60C0            ; 20 C0 60 | Jump to subroutine
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_27A
; Address: $F5F442
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_27A:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $11              ; 10 11 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $D301            ; EE 01 D3 | Increment (absolute)
    STA ($01,X)          ; 81 01 | Update graphics data
    ASL $07F9            ; 0E F9 07 | Arithmetic shift left (absolute)
    INC $1F01,X          ; FE 01 1F | Increment (absolute,X)
    CPX #$87             ; E0 87 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_27C
; Address: $F5F48A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_27C:
    BNE $30              ; D0 30 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    CPY $FB3F            ; CC 3F FB | Compare Y register (absolute)
    LDY #$27             ; A0 27 | Load immediate value into Y register
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $60              ; 80 60 | Branch always
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CPY $623C            ; CC 3C 62 | Compare Y register (absolute)
    STZ $CF31,X          ; 9E 31 CF | Store zero to absolute,X
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($9C,X)          ; 01 9C | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_27D
; Address: $F5F504
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_27D:
    JSR $F8E0            ; 20 E0 F8 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    PEA #$02BC           ; F4 BC 02 | Push effective address to stack
    STZ $EE03            ; 9C 03 EE | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPX #$18             ; E0 18 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FF41,X          ; FE 41 FF | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_27E
; Address: $F5F520
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_27E:
    JMP $FEE2BC          ; 5C BC E2 FE | Jump to address long
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_281
; Address: $F5F555
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_281:
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    BEQ $D0              ; F0 D0 | Branch if equal
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    BMI $00              ; 30 00 | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BRA $FF              ; 80 FF | Branch always
    REP #$FF             ; C2 FF | Reset processor status bits
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $FF40,X          ; FD 40 FF | Subtract with carry (absolute,X)
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_282
; Address: $F5F5C2
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_282:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_283
; Address: $F5F608
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_283:
    BPL $F0              ; 10 F0 | Branch if positive
    BVC $B0              ; 50 B0 | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    CLV                  ; B8 | Clear overflow flag
    PLP                  ; 28 | Pull processor status from stack
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $1FD4            ; 2C D4 1F | Test bits in accumulator (absolute)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    STA $F80770          ; 8F 70 07 F8 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    SBC $FA04,X          ; FD 04 FA | Subtract with carry (absolute,X)
    LDY $1A6E            ; AC 6E 1A | Load from absolute address into Y register
    STZ $1C14,X          ; 9E 14 1C | Store zero to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_285
; Address: $F5F651
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_285:
    STY $F3              ; 84 F3 | Store Y register to zero page
    INC $9E11            ; EE 11 9E | Increment (absolute)
    ADC ($1C,X)          ; 61 1C | Add with carry ((zero page,X))
    SEP #$60             ; E2 60 | Set processor status bits
    STZ $F000            ; 9C 00 F0 | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_286
; Address: $F5F661
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_286:
    BRA $00              ; 80 00 | Branch always
    CPX #$33             ; E0 33 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $7D              ; 80 7D | Branch always
    STA ($7D,X)          ; 81 7D | Update graphics data
    BRA $7D              ; 80 7D | Branch always
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    DEC $65FE            ; CE FE 65 | Decrement (absolute)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    INY                  ; C8 | Increment Y register
    BRA $80              ; 80 80 | Branch always
    CPX $3A              ; E4 3A | Compare X register (zero page)
    PLX                  ; FA | Pull X register from stack
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_287
; Address: $F5F6AE
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_287:
    JSR $0038            ; 20 38 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($BC,X)          ; 01 BC | Logical OR with accumulator ((zero page,X))
    WDM #$38             ; 42 38 | Reserved instruction
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    ADC ($FE),Y          ; 71 FE | Add with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_288
; Address: $F5F6E6
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_288:
    JSL $FF30FF          ; 22 FF 30 FF | Jump to subroutine long
    INC $FF7A,X          ; FE 7A FF | Increment (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_28A
; Address: $F5F707
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_28A:
    JSR $B050            ; 20 50 B0 | Jump to subroutine
    BPL $F0              ; 10 F0 | Branch if positive
    BCS $70              ; B0 70 | Branch if carry set
    BVC $B0              ; 50 B0 | Branch if overflow clear
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC $FDFF,Y          ; F9 FF FD | Subtract with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    ROL $0FFF,X          ; 3E FF 0F | Rotate left (absolute,X)
    STA $84FF            ; 8D FF 84 | Update graphics data
    STA $FF              ; 85 FF | Update graphics data
    STX $FF              ; 86 FF | Store X register to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY $CC34            ; CC 34 CC | Compare Y register (absolute)
    INC                  ; 1A | Increment accumulator
    INC $8A              ; E6 8A | Increment (zero page)
    INC $F709            ; EE 09 F7 | Increment (absolute)
    LDA $DB              ; A5 DB | Read graphics status
    CPY $A034            ; CC 34 A0 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_28B
; Address: $F5F783
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_28B:
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $4612            ; 9C 12 46 | Store zero to absolute
    NOP                  ; EA | No operation
    LDX $AACE            ; AE CE AA | Load from absolute address into X register
    PLX                  ; FA | Pull X register from stack
    INC $B248,X          ; FE 48 B2 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_28C
; Address: $F5F798
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_28C:
    TAY                  ; A8 | Transfer accumulator to Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    BMI $10              ; 30 10 | Branch if negative
    SEC                  ; 38 | Set carry flag
    ROL $FF00,X          ; 3E 00 FF | Rotate left (absolute,X)
    ROR $F800,X          ; 7E 00 F8 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ROL $FF3E,X          ; 3E 3E FF | Rotate left (absolute,X)
    ROR $F87E,X          ; 7E 7E F8 | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CMP $3E              ; C5 3E | Compare accumulator (zero page)
    CMP $3E              ; C5 3E | Compare accumulator (zero page)
    INC $1C              ; E6 1C | Increment (zero page)
    DEC $9B3C            ; CE 3C 9B | Decrement (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    LDA ($72),Y          ; B1 72 | Read graphics status
    LDY #$61             ; A0 61 | Load immediate value into Y register
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 03 63 C8 | Read graphics status
    PLP                  ; 28 | Pull processor status from stack
    PLY                  ; 7A | Pull Y register from stack
    STA $FF0FF2          ; 8F F2 0F FF | Update graphics data
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STZ $17E8            ; 9C E8 17 | Store zero to absolute
    ORA #$FB             ; 09 FB | Logical OR with accumulator (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $78              ; 80 78 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_28D
; Address: $F5F83C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_28D:
    BRA $40              ; 80 40 | Branch always
    BRA $FD              ; 80 FD | Branch always
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    INC $D1FE,X          ; FE FE D1 | Increment (absolute,X)
    CMP ($D8),Y          ; D1 D8 | Compare accumulator ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    CMP $D1FA,X          ; DD FA D1 | Compare accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ROR $27D0,X          ; 7E D0 27 | Rotate right (absolute,X)
    BNE $EC              ; D0 EC | Branch if not equal
    LDA                  ; BF B2 BF BA | Read graphics status
    LDA                  ; BF BB BF 7B | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_28E
; Address: $F5F86E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_28E:
    SBC $F5              ; E5 F5 | Subtract with carry (zero page)
    BRA $C0              ; 80 C0 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $F0              ; 50 F0 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_28F
; Address: $F5F883
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_28F:
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    SBC $8FFE            ; ED FE 8F | Subtract with carry (absolute)
    ORA $58FF            ; 0D FF 58 | Logical OR with accumulator (absolute)
    LSR $F6FF,X          ; 5E FF F6 | Logical shift right (absolute,X)
    LDA                  ; BF BF AF AF | Read graphics status
    DEX                  ; CA | Decrement X register
    DEC $FCF8            ; CE F8 FC | Decrement (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_290
; Address: $F5F8D6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_290:
    BCS $F8              ; B0 F8 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    BEQ $E0              ; F0 E0 | Game work RAM access
    BCS $50              ; B0 50 | Branch if carry set
    LDY #$31             ; A0 31 | Load immediate value into Y register
    BRA $0A              ; 80 0A | Branch always
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    INC $FED6,X          ; FE D6 FE | Increment (absolute,X)
    CPX $E868            ; EC 68 E8 | Compare X register (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_291
; Address: $F5F8ED
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_291:
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    PEA #$E828           ; F4 28 E8 | Push effective address to stack
    BRA $60              ; 80 60 | Branch always
    BNE $30              ; D0 30 | Branch if not equal
    BNE $30              ; D0 30 | Branch if not equal
    BNE $20              ; D0 20 | Branch if not equal
    BEQ $80              ; F0 80 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $1F0E            ; 0E 0E 1F | Arithmetic shift left (absolute)
    LSR $46              ; 46 46 | Logical shift right (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    LDY #$60             ; A0 60 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $B5DB            ; 2C DB B5 | Test bits in accumulator (absolute)
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    CPY #$0F             ; C0 0F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_292
; Address: $F5F997
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_292:
    BVS $00              ; 70 00 | Branch if overflow set
    STA ($81,X)          ; 81 81 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $FB00,X          ; 7E 00 FB | Rotate right (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $01              ; E5 01 | Subtract with carry (zero page)
    BCC $90              ; 90 90 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_294
; Address: $F5F9D6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_294:
    JSR $60C0            ; 20 C0 60 | Jump to subroutine
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_296
; Address: $F5F9E0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_296:
    INC $E8FE,X          ; FE FE E8 | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA $BFFE            ; AD FE BF | Read graphics status
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    PLX                  ; FA | Pull X register from stack
    ORA ($C7,X)          ; 01 C7 | Logical OR with accumulator ((zero page,X))
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    LSR $9494,X          ; 5E 94 94 | Logical shift right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    BMI $C0              ; 30 C0 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    BMI $00              ; 30 00 | Branch if negative
    LDA ($00,X)          ; A1 00 | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_297
; Address: $F5FA14
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_297:
    TAX                  ; AA | Transfer accumulator to X register
    RTI                  ; 40 | Return from interrupt
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_298
; Address: $F5FA20
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_298:
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    BVC $00              ; 50 00 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_299
; Address: $F5FA34
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_299:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BRA $40              ; 80 40 | Branch always
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BMI $48              ; 30 48 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    BMI $04              ; 30 04 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BRA $80              ; 80 80 | Branch always
    BRA $40              ; 80 40 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCC $60              ; 90 60 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_29A
; Address: $F5FB1B
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_29A:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $1C21,X          ; 1E 21 1C | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BMI $C8              ; 30 C8 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CPX #$10             ; E0 10 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    INC $F8FE,X          ; FE FE F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PEA #$6400           ; F4 00 64 | Push effective address to stack
    ROR $3A32,X          ; 7E 32 3A | Rotate right (absolute,X)
    BMI $3C              ; 30 3C | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    STA ($00,X)          ; 81 00 | Update graphics data
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    REP #$00             ; C2 00 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $00FF,X          ; 1E FF 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_29B
; Address: $F5FBC0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_29B:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    BCS $F0              ; B0 F0 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_29C
; Address: $F5FBE3
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_29C:
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    BEQ $FC              ; F0 FC | Branch if equal
    PLX                  ; FA | Pull X register from stack
    INC $FFF9,X          ; FE F9 FF | Increment (absolute,X)
    SBC $FCFF,Y          ; F9 FF FC | Subtract with carry (absolute,Y)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    BMI $31              ; 30 31 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    AND $3300,Y          ; 39 00 33 | Logical AND with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    BRA $64              ; 80 64 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX $E400            ; EC 00 E4 | Compare X register (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BRA $40              ; 80 40 | Branch always
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    ASL $0E11            ; 0E 11 0E | Arithmetic shift left (absolute)
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_29E
; Address: $F5FCA9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_29E:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $1010,X          ; FE 10 10 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_29F
; Address: $F5FCC4
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_29F:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    CPX $F800            ; EC 00 F8 | Compare X register (absolute)
    BNE $00              ; D0 00 | Branch if not equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    SBC $FDFC,X          ; FD FC FD | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SBC $F0FA,Y          ; F9 FA F0 | Subtract with carry (absolute,Y)
    CPY $FC              ; C4 FC | Compare Y register (zero page)
    PEA #$6CFC           ; F4 FC 6C | Push effective address to stack
    STZ $0CFC            ; 9C FC 0C | Store zero to absolute
    PEA #$E40C           ; F4 0C E4 | Push effective address to stack
    INX                  ; E8 | Increment X register
    BPL $C8              ; 10 C8 | Branch if positive
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_2A0
; Address: $F5FD81
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_2A0:
    JSR $641B            ; 20 1B 64 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    DEC $39              ; C6 39 | Decrement (zero page)
    ADC $FD02,X          ; 7D 02 FD | Add with carry (absolute,X)
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$77             ; C0 77 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    STY $7B              ; 84 7B | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_2A1
; Address: $F5FDE9
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_2A1:
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    CPX #$30             ; E0 30 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    BMI $FF              ; 30 FF | Branch if negative
    INC $FA00,X          ; FE 00 FA | Increment (absolute,X)
    BIT $3E              ; 24 3E | Test bits in accumulator (zero page)
    LDX $FEDA,Y          ; BE DA FE | Load from absolute,Y into X register
    CPX #$F4             ; E0 F4 | Compare X register (immediate)
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    BCC $F0              ; 90 F0 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    CPX #$20             ; E0 20 | Compare X register (immediate)
    LDY #$C1             ; A0 C1 | Load immediate value into Y register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $D1D0,Y          ; 59 D0 D1 | Exclusive OR with accumulator (absolute,Y)
    EOR $694C            ; 4D 4C 69 | Exclusive OR with accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    LDA #$A8             ; A9 A8 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDX $01              ; A6 01 | Load from zero page into X register
    ROL $B301            ; 2E 01 B3 | Rotate left (absolute)
    ORA ($97,X)          ; 01 97 | Logical OR with accumulator ((zero page,X))
    ORA ($57,X)          ; 01 57 | Logical OR with accumulator ((zero page,X))
    ORA ($AB,X)          ; 01 AB | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 00 C8 28 | Read graphics status
    INY                  ; C8 | Increment Y register
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$14             ; E0 14 | Compare X register (immediate)
    CPX #$14             ; E0 14 | Compare X register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_2A2
; Address: $F5FE7F
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_2A2:
    LDY #$FD             ; A0 FD | Load immediate value into Y register
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FAFA,X          ; FE FA FA | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BNE $D0              ; D0 D0 | Branch if not equal
    BNE $D0              ; D0 D0 | Branch if not equal
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BNE $F8              ; D0 F8 | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    BNE $00              ; D0 00 | Branch if not equal
    BNE $C0              ; D0 C0 | Branch if not equal
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BRA $40              ; 80 40 | Branch always
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ASL $0C11            ; 0E 11 0C | Arithmetic shift left (absolute)
    BMI $33              ; 30 33 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_2A3
; Address: $F5FF27
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_2A3:
    CPX #$04             ; E0 04 | Compare X register (immediate)
    DEX                  ; CA | Decrement X register
    DEC $F431            ; CE 31 F4 | Decrement (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEY                  ; 88 | Decrement Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    DEC $FF00            ; CE 00 FF | Decrement (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    CLD                  ; D8 | Clear decimal mode flag
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_2A4
; Address: $F5FF61
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_2A4:
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $F000,X          ; FE 00 F0 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    PEA #$F700           ; F4 00 F7 | Push effective address to stack
    BNE $00              ; D0 00 | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_2A5
; Address: $F5FFA5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_2A5:
    JSR $C010            ; 20 10 C0 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    BPL $D0              ; 10 D0 | Branch if positive

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_2A6
; Address: $F5FFB5
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_2A6:
    JSR $D030            ; 20 30 D0 | Jump to subroutine
    CPX #$E0             ; E0 E0 | Game work RAM access
    WDM #$42             ; 42 42 | Hardware register operation
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA $F500,X          ; BD 00 F5 | Read graphics status
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $00              ; F0 00 | Branch if equal
    LDY #$40             ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6A_GraphicsFunction_2A7
; Address: $F5FFF4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6A_GraphicsFunction_2A7:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
