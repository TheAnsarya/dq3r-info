;==============================================================================
; Dragon Quest III - Bank $42
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $E10000-$E17FFF
; Instructions: 8120
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_42"

;------------------------------------------------------------------------------
; Bank42_DmaFunction_000
; Address: $E18000
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_000:
    EOR ($9E,X)          ; 41 9E | Exclusive OR with accumulator ((zero page,X))
    ORA $19E6,Y          ; 19 E6 19 | Logical OR with accumulator (absolute,Y)
    ROR $59              ; 66 59 | Rotate right (zero page)
    ROL $19              ; 26 19 | Rotate left (zero page)
    ROR $19              ; 66 19 | Rotate right (zero page)
    ROL $09              ; 26 09 | Rotate left (zero page)
    ORA #$56             ; 09 56 | Logical OR with accumulator (immediate)
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    LDX $00              ; A6 00 | Load from zero page into X register
    LDX $00              ; A6 00 | Load from zero page into X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    LDX $00              ; A6 00 | Load from zero page into X register
    ORA #$96             ; 09 96 | Logical OR with accumulator (immediate)
    ROL $C13E,X          ; 3E 3E C1 | Rotate left (absolute,X)
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    ORA $0B20,X          ; 1D 20 0B | Logical OR with accumulator (absolute,X)
    BPL $04              ; 10 04 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    AND ($02),Y          ; 31 02 | Logical AND with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    INC $F607,X          ; FE 07 F6 | Increment (absolute,X)
    ORA #$ED             ; 09 ED | Logical OR with accumulator (immediate)
    DEC $1727,X          ; DE 27 17 | Decrement (absolute,X)
    ORA $1F81            ; 0D 81 1F | Logical OR with accumulator (absolute)
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    AND $9E00            ; 2D 00 9E | Logical AND with accumulator (absolute)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    REP #$FF             ; C2 FF | Reset processor status bits
    STY $FD              ; 84 FD | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    INC $CAF9,X          ; FE F9 CA | Increment (absolute,X)
    STY $0802            ; 8C 02 08 | Store Y register to absolute address
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $FD              ; 80 FD | Branch always
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_002
; Address: $E180BA
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_002:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ASL $74A7,X          ; 1E A7 74 | Arithmetic shift left (absolute,X)
    STA $308F78          ; 8F 78 8F 30 | Store accumulator to absolute long address
    LSR $7B00,X          ; 5E 00 7B | Logical shift right (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    STX $40              ; 86 40 | Store X register to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $01              ; 50 01 | Branch if overflow clear
    JMP $7000            ; 4C 00 70 | Jump to address
    ASL $F7              ; 06 F7 | Arithmetic shift left (zero page)
    BPL $FF              ; 10 FF | Branch if positive
    LDY $0000,X          ; BC 00 00 | Load from absolute,X into Y register
    PHP                  ; 08 | Push processor status to stack
    BIT $5310            ; 2C 10 53 | Test bits in accumulator (absolute)
    LDY $0000,X          ; BC 00 00 | Load from absolute,X into Y register
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_003
; Address: $E18121
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_003:
    JSR $213E            ; 20 3E 21 | PPU graphics register access
    AND $2D26,Y          ; 39 26 2D | Logical AND with accumulator (absolute,Y)
    BIT $3733            ; 2C 33 37 | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $28              ; 05 28 | Logical OR with accumulator (zero page)
    ASL $1800,X          ; 1E 00 18 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BMI $C0              ; 30 C0 | Branch if negative
    BEQ $03              ; F0 03 | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($98,X)          ; 01 98 | Logical OR with accumulator ((zero page,X))
    ORA #$D0             ; 09 D0 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    AND $0758,Y          ; 39 58 07 | Logical AND with accumulator (absolute,Y)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA $00A6,Y          ; 19 A6 00 | Logical OR with accumulator (absolute,Y)
    LDX $00              ; A6 00 | Load from zero page into X register
    LDX $00              ; A6 00 | Load from zero page into X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    LDX $00              ; A6 00 | Load from zero page into X register
    ASL $98              ; 06 98 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_004
; Address: $E18189
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_004:
    XBA                  ; EB | Exchange accumulator bytes
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ADC ($66),Y          ; 71 66 | Add with carry ((zero page),Y)
    STA $00FF,Y          ; 99 FF 00 | Store accumulator to absolute,Y
    ROR $00              ; 66 00 | Rotate right (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC ($1F),Y          ; F1 1F | Subtract with carry ((zero page),Y)
    SEP #$3F             ; E2 3F | Set processor status bits
    BRA $7B              ; 80 7B | Branch always
    CPX $F000            ; EC 00 F0 | Compare X register (absolute)
    BRA $00              ; 80 00 | Branch always
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    SEP #$00             ; E2 00 | Set processor status bits
    BPL $70              ; 10 70 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BPL $FF              ; 10 FF | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    STA                  ; 9F 60 FF FF | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank42_DmaFunction_005
; Address: $E1824A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_005:
    JSR $FFFF            ; 20 FF FF | Jump to subroutine
    ORA $FFFF            ; 0D FF FF | Logical OR with accumulator (absolute)
    PEA #$FEFF           ; F4 FF FE | Push effective address to stack
    INC $F0E0,X          ; FE E0 F0 | Increment (absolute,X)
    CPY $B8C0            ; CC C0 B8 | Compare Y register (absolute)
    DEY                  ; 88 | Decrement Y register
    INC $F001,X          ; FE 01 F0 | Increment (absolute,X)
    REP #$31             ; C2 31 | Reset processor status bits
    BIT #$46             ; 89 46 | Test bits in accumulator (immediate)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    BRA $01              ; 80 01 | Branch always
    BRA $03              ; 80 03 | Branch always
    STY $631C            ; 8C 1C 63 | Store Y register to absolute address
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPY #$23             ; C0 23 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    JMP $272863          ; 5C 63 28 27 | Jump to address long
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_006
; Address: $E1830F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_006:
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_007
; Address: $E18324
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_007:
    BVS $8F              ; 70 8F | Branch if overflow set
    INC $19              ; E6 19 | Increment (zero page)
    BRA $3F              ; 80 3F | Branch always
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $C7              ; F0 C7 | Branch if equal
    SEC                  ; 38 | Set carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    ORA $1882,Y          ; 19 82 18 | Logical OR with accumulator (absolute,Y)
    CMP ($40,X)          ; C1 40 | Compare accumulator ((zero page,X))
    LDA $2459,Y          ; B9 59 24 | Load from absolute,Y into accumulator
    ORA $0906,Y          ; 19 06 09 | Logical OR with accumulator (absolute,Y)
    EOR ($1A,X)          ; 41 1A | Exclusive OR with accumulator ((zero page,X))
    LDX $00              ; A6 00 | Load from zero page into X register
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    LDX $00              ; A6 00 | Load from zero page into X register
    LDX $00              ; A6 00 | Load from zero page into X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    ASL $0598            ; 0E 98 05 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    CMP #$76             ; C9 76 | Compare accumulator (immediate)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    INC $00              ; E6 00 | Increment (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CMP $FFFF,Y          ; D9 FF FF | Compare accumulator (absolute,Y)
    BPL $FF              ; 10 FF | Branch if positive
    INY                  ; C8 | Increment Y register
    INC $FFF0,X          ; FE F0 FF | Increment (absolute,X)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    LDA                  ; BF FF FF C2 | Load from absolute long,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    ADC $FFFF,X          ; 7D FF FF | Add with carry (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    BEQ $FE              ; F0 FE | Branch if equal
    LDY #$FC             ; A0 FC | Load immediate value into Y register
    BRA $F8              ; 80 F8 | Branch always
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank42_DmaFunction_008
; Address: $E18432
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_008:
    INC $FD01,X          ; FE 01 FD | Increment (absolute,X)
    SBC $FB02,X          ; FD 02 FB | Subtract with carry (absolute,X)
    ORA $05FA            ; 0D FA 05 | Logical OR with accumulator (absolute)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    SEC                  ; 38 | Set carry flag
    AND $7744,Y          ; 39 44 77 | Logical AND with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_009
; Address: $E1844E
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_009:
    JSR $6127            ; 20 27 61 | Jump to subroutine
    STZ $3AC5,X          ; 9E C5 3A | Store zero to absolute,X
    STA $3B62,X          ; 9D 62 3B | Store accumulator to absolute,X
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPY $77              ; C4 77 | Compare Y register (zero page)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BCC $80              ; 90 80 | Branch if carry clear
    LDA ($31),Y          ; B1 31 | Load from (zero page),Y into accumulator
    JMP $AC0C8C          ; 5C 8C 0C AC | Jump to address long
    BIT $0888            ; 2C 88 08 | Test bits in accumulator (absolute)
    CPX $04              ; E4 04 | Compare X register (zero page)
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    JMP $5C4639          ; 5C 39 46 5C | Jump to address long
    JMP $116E23          ; 5C 23 6E 11 | Jump to address long
    ROR $1611            ; 6E 11 16 | Rotate right (absolute)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    LDA                  ; BF BF DF DF | Load from absolute long,X into accumulator
    EOR ($5F,X)          ; 41 5F | Exclusive OR with accumulator ((zero page,X))
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 DF 20 | Load from absolute long,X into accumulator
    LDY #$47             ; A0 47 | Load immediate value into Y register
    CLV                  ; B8 | Clear overflow flag
    BEQ $FF              ; F0 FF | Branch if equal
    ADC $CABF,Y          ; 79 BF CA | Add with carry (absolute,Y)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    STX $31              ; 86 31 | Store X register to zero page
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    CPX #$F5             ; E0 F5 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BCS $4F              ; B0 4F | Branch if carry set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$15             ; E0 15 | Compare X register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_00A
; Address: $E184D8
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_00A:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    ROR $7E41,X          ; 7E 41 7E | Rotate right (absolute,X)
    EOR ($7F,X)          ; 41 7F | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    LDX $7F76            ; AE 76 7F | Load from absolute address into X register
    STA ($DE,X)          ; 81 DE | Store accumulator to (zero page,X)
    AND ($14,X)          ; 21 14 | Logical AND with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    DEC $39              ; C6 39 | Decrement (zero page)
    DEY                  ; 88 | Decrement Y register
    DEC $00              ; C6 00 | Decrement (zero page)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BRA $FC              ; 80 FC | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    STY $40              ; 84 40 | Store Y register to zero page
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    SEP #$1D             ; E2 1D | Set processor status bits
    PLX                  ; FA | Pull X register from stack
    ORA $FB              ; 05 FB | Logical OR with accumulator (zero page)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STA $3C42            ; 8D 42 3C | Store accumulator to absolute address
    ADC $0082,X          ; 7D 82 00 | Add with carry (absolute,X)
    BMI $30              ; 30 30 | Branch if negative
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_00B
; Address: $E18571
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_00B:
    STA                  ; 9F 70 8F 70 | Store accumulator to absolute long,X
    STA $38C738          ; 8F 38 C7 38 | Store accumulator to absolute long address
    STZ $C463            ; 9C 63 C4 | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_00C
; Address: $E1857F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_00C:
    STA                  ; 9F 14 F4 2C | Store accumulator to absolute long,X
    CPX $CA0A            ; EC 0A CA | Compare X register (absolute)
    JMP $8000DC          ; 5C DC 00 80 | Jump to address long
    BCC $90              ; 90 90 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank42_DmaFunction_00E
; Address: $E18593
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_00E:
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($DC),Y          ; 11 DC | Logical OR with accumulator ((zero page),Y)
    LDA $A346,Y          ; B9 46 A3 | Load from absolute,Y into accumulator
    JMP $0F7986          ; 5C 86 79 0F | Jump to address long
    AND $0625,X          ; 3D 25 06 | Logical AND with accumulator (absolute,X)
    BRA $0F              ; 80 0F | Branch always
    BEQ $5F              ; F0 5F | Branch if equal
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDY #$DF             ; A0 DF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_00F
; Address: $E185B7
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_00F:
    JSR $7C83            ; 20 83 7C | Jump to subroutine
    LDA $42              ; A5 42 | Hardware register operation
    DEC                  ; 3A | Decrement accumulator
    CMP ($BE,X)          ; C1 BE | Compare accumulator ((zero page,X))
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    CMP $04              ; C5 04 | Compare accumulator (zero page)
    AND ($DA,X)          ; 21 DA | Logical AND with accumulator ((zero page,X))
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    STZ $9B              ; 64 9B | Store zero to zero page
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set

;------------------------------------------------------------------------------
; Bank42_DmaFunction_010
; Address: $E185D0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_010:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank42_DmaFunction_011
; Address: $E18601
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_011:
    JSR $203F            ; 20 3F 20 | Jump to subroutine
    BMI $2F              ; 30 2F | Branch if negative
    BMI $3F              ; 30 3F | Branch if negative

;------------------------------------------------------------------------------
; Bank42_DmaFunction_012
; Address: $E1860D
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_012:
    JSR $332C            ; 20 2C 33 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BMI $CF              ; 30 CF | Branch if negative
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$5F             ; E0 5F | Compare X register (immediate)
    LDY #$CF             ; A0 CF | Load immediate value into Y register
    BMI $4F              ; 30 4F | Branch if negative
    BCS $E0              ; B0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    WDM #$43             ; 42 43 | Reserved instruction
    STA ($20,X)          ; 81 20 | Store accumulator to (zero page,X)
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_013
; Address: $E18689
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_013:
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    CMP ($14,X)          ; C1 14 | Compare accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 1F E0 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_014
; Address: $E1869B
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_014:
    JSR $E31C            ; 20 1C E3 | Jump to subroutine
    BCC $80              ; 90 80 | Branch if carry clear
    LSR $40              ; 46 40 | Logical shift right (zero page)
    BRA $80              ; 80 80 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    BRA $8A              ; 80 8A | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    TAY                  ; A8 | Transfer accumulator to Y register
    INY                  ; C8 | Increment Y register
    AND ($F0),Y          ; 31 F0 | Logical AND with accumulator ((zero page),Y)
    STZ $FE61,X          ; 9E 61 FE | Store zero to absolute,X
    ORA ($AB,X)          ; 01 AB | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    STA $029D,X          ; 9D 9D 02 | Store accumulator to absolute,X
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    STY $F00F            ; 8C 0F F0 | Store Y register to absolute address
    LDA $5A              ; A5 5A | Load from zero page into accumulator
    AND $FEC6,Y          ; 39 C6 FE | Logical AND with accumulator (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $C000,X          ; FE 00 C0 | Increment (absolute,X)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    STA ($05,X)          ; 81 05 | Store accumulator to (zero page,X)
    STA $8B              ; 85 8B | Store accumulator to zero page
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    SBC $FB02,X          ; FD 02 FB | Subtract with carry (absolute,X)
    CPY $C7              ; C4 C7 | Compare Y register (zero page)
    SEC                  ; 38 | Set carry flag
    INC $31CF,X          ; FE CF 31 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    DEC $39              ; C6 39 | Decrement (zero page)
    REP #$3D             ; C2 3D | Reset processor status bits
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_015
; Address: $E18718
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_015:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    LDA $E715FA          ; AF FA 15 E7 | Load from absolute long address into accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEC $0031            ; CE 31 00 | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    BPL $E8              ; 10 E8 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA #$56             ; 09 56 | Logical OR with accumulator (immediate)
    INC $00              ; E6 00 | Increment (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDX $00              ; A6 00 | Load from zero page into X register
    BPL $EF              ; 10 EF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $0707,X          ; FE 07 07 | Increment (absolute,X)
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    INC $EE01,X          ; FE 01 EE | Increment (absolute,X)
    ORA ($D7),Y          ; 11 D7 | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    SBC $1F12            ; ED 12 1F | Subtract with carry (absolute)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 80 9F 83 | Load from absolute long,X into accumulator
    LDA                  ; BF C1 DF 3F | Load from absolute long,X into accumulator
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    INC $E01F,X          ; FE 1F E0 | Game work RAM access
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA $3EF2            ; 0D F2 3E | Logical OR with accumulator (absolute)
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_016
; Address: $E18800
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_016:
    STZ $1C61,X          ; 9E 61 1C | Store zero to absolute,X
    CLC                  ; 18 | Clear carry flag
    SBC $FB04            ; ED 04 FB | Subtract with carry (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FE              ; 80 FE | Branch always
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 1C DC 0F | Store accumulator to absolute long,X
    STA $FE00FF          ; 8F FF 00 FE | Store accumulator to absolute long address
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BEQ $8F              ; F0 8F | Branch if equal
    BVS $07              ; 70 07 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL $BF80,X          ; 1E 80 BF | Arithmetic shift left (absolute,X)
    BRA $BE              ; 80 BE | Branch always
    CMP ($D9,X)          ; C1 D9 | Compare accumulator ((zero page,X))
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $01              ; 80 01 | Branch always
    INC $F807,X          ; FE 07 F8 | Increment (absolute,X)
    EOR ($5D,X)          ; 41 5D | Exclusive OR with accumulator ((zero page,X))
    CPY #$DE             ; C0 DE | Compare Y register (immediate)
    LDY $FE              ; A4 FE | Load from zero page into Y register
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    BEQ $F8              ; F0 F8 | Branch if equal
    ASL $071E,X          ; 1E 1E 07 | Arithmetic shift left (absolute,X)
    SBC $EC12            ; ED 12 EC | Subtract with carry (absolute)
    INC $FD01,X          ; FE 01 FD | Increment (absolute,X)
    SBC ($EF,X)          ; E1 EF | Subtract with carry ((zero page,X))
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    BVS $77              ; 70 77 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    LDA $FB18,Y          ; B9 18 FB | Load from absolute,Y into accumulator
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    BMI $CF              ; 30 CF | Branch if negative

;------------------------------------------------------------------------------
; Bank42_DmaFunction_017
; Address: $E188DA
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_017:
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    ASL $1904            ; 0E 04 19 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $03              ; 24 03 | Test bits in accumulator (zero page)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BRA $03              ; 80 03 | Branch always
    RTI                  ; 40 | Return from interrupt
    STA $00004F          ; 8F 4F 00 00 | Store accumulator to absolute long address
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BNE $70              ; D0 70 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $C0              ; F0 C0 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    BRA $FF              ; 80 FF | Branch always
    DEC $71AF,X          ; DE AF 71 | Decrement (absolute,X)
    DEC $FC01,X          ; DE 01 FC | Decrement (absolute,X)
    AND #$C3             ; 29 C3 | Logical AND with accumulator (immediate)
    AND ($8C,X)          ; 21 8C | Logical AND with accumulator ((zero page,X))
    LDA                  ; BF 27 98 DF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_018
; Address: $E18969
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_018:
    JSR $C43B            ; 20 3B C4 | Jump to subroutine
    STZ $D22D            ; 9C 2D D2 | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 00 3B 00 | Store accumulator to absolute long,X
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BRA $3F              ; 80 3F | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_019
; Address: $E189E4
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_019:
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SBC $7D7C,X          ; FD 7C 7D | Subtract with carry (absolute,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    BMI $CF              ; 30 CF | Branch if negative
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BVS $38              ; 70 38 | Branch if overflow set
    BNE $7A              ; D0 7A | Branch if not equal
    BNE $7F              ; D0 7F | Branch if not equal
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    PHA                  ; 48 | Push accumulator to stack
    ASL $AB              ; 06 AB | Arithmetic shift left (zero page)
    LDA $FF5F1F          ; AF 1F 5F FF | Load from absolute long address into accumulator
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    INC $FCFD,X          ; FE FD FC | Increment (absolute,X)
    INC $FAFC,X          ; FE FC FA | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BEQ $E8              ; F0 E8 | Branch if equal
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    INC $7C01,X          ; FE 01 7C | Increment (absolute,X)
    PEA #$FA00           ; F4 00 FA | Push effective address to stack
    SBC $5300,X          ; FD 00 53 | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_01A
; Address: $E18A79
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_01A:
    JSR $104A            ; 20 4A 10 | Jump to subroutine
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    PHB                  ; 8B | Push data bank register to stack
    STA                  ; 9F 60 3E C1 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank42_DmaFunction_01B
; Address: $E18AA7
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_01B:
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    STA $FB07F8          ; 8F F8 07 FB | Store accumulator to absolute long address
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STY $9C73            ; 8C 73 9C | Store Y register to absolute address
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    CMP #$66             ; C9 66 | Compare accumulator (immediate)
    STA $0080,Y          ; 99 80 00 | Store accumulator to absolute,Y
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROL $FF00,X          ; 3E 00 FF | Rotate left (absolute,X)
    ROL $FF3E,X          ; 3E 3E FF | Rotate left (absolute,X)
    LDA                  ; BF 80 7F 80 | Load from absolute long,X into accumulator
    LDA                  ; BF BF 7E 7E | Load from absolute long,X into accumulator
    ROR $F708,X          ; 7E 08 F7 | Rotate right (absolute,X)
    ORA $3BED,X          ; 1D ED 3B | Logical OR with accumulator (absolute,X)
    REP #$D0             ; C2 D0 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank42_DmaFunction_01C
; Address: $E18B7B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_01C:
    JSR $2088            ; 20 88 20 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BCS $FF              ; B0 FF | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA $1DE4,Y          ; 19 E4 1D | Logical OR with accumulator (absolute,Y)
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    BRA $6F              ; 80 6F | Branch always
    BRA $E6              ; 80 E6 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$F9             ; E0 F9 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_01D
; Address: $E18BB0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_01D:
    BEQ $E2              ; F0 E2 | Branch if equal
    CPX #$C7             ; E0 C7 | Compare X register (immediate)
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BCC $40              ; 90 40 | Branch if carry clear
    ORA $0C20,Y          ; 19 20 0C | Logical OR with accumulator (absolute,Y)
    CPX #$06             ; E0 06 | Compare X register (immediate)
    BRA $06              ; 80 06 | Branch always
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    BVS $C8              ; 70 C8 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_01F
; Address: $E18BCA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_01F:
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_020
; Address: $E18BD2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_020:
    STY $38              ; 84 38 | Store Y register to zero page
    PLA                  ; 68 | Pull accumulator from stack
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_021
; Address: $E18BDA
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_021:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ROL $003E,X          ; 3E 3E 00 | Rotate left (absolute,X)
    ASL $BE00            ; 0E 00 BE | Arithmetic shift left (absolute)
    BRA $3E              ; 80 3E | Branch always
    ADC $7D82,X          ; 7D 82 7D | Add with carry (absolute,X)
    ASL $BE0E            ; 0E 0E BE | Arithmetic shift left (absolute)
    LDX $3E3E,Y          ; BE 3E 3E | Load from absolute,Y into X register
    SBC $FF7D,X          ; FD 7D FF | Subtract with carry (absolute,X)
    ADC $0000,X          ; 7D 00 00 | Add with carry (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $FD02,X          ; 1E 02 FD | Arithmetic shift left (absolute,X)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $FF1C,X          ; 1E 1C FF | Arithmetic shift left (absolute,X)
    INC $F9FC,X          ; FE FC F9 | Increment (absolute,X)
    SBC $F9FD,Y          ; F9 FD F9 | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF C0 BF 00 | Load from absolute long,X into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $EF              ; 10 EF | Branch if positive
    LDA                  ; BF 3F BF 3F | Load from absolute long,X into accumulator
    SBC $F3FC,X          ; FD FC F3 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $E1F1,Y          ; F9 F1 E1 | Subtract with carry (absolute,Y)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $F907,X          ; FD 07 F9 | Subtract with carry (absolute,X)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    SBC $FDFD,X          ; FD FD FD | Subtract with carry (absolute,X)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SBC $7B81,Y          ; F9 81 7B | Subtract with carry (absolute,Y)
    ORA #$EE             ; 09 EE | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_022
; Address: $E18CE6
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_022:
    ORA $D6              ; 05 D6 | Logical OR with accumulator (zero page)
    LDA $3DC3,X          ; BD C3 3D | Load from absolute,X into accumulator
    INC $7997            ; EE 97 79 | Increment (absolute)
    BEQ $F0              ; F0 F0 | Branch if equal
    INX                  ; E8 | Increment X register
    SBC ($C4),Y          ; F1 C4 | Subtract with carry ((zero page),Y)
    SBC #$80             ; E9 80 | Subtract with carry (immediate)
    BRA $09              ; 80 09 | Branch always
    INC $DE7E            ; EE 7E DE | Increment (absolute)
    DEC $BCFF,X          ; DE FF BC | Decrement (absolute,X)
    LDY $7CFE,X          ; BC FE 7C | Load from absolute,X into Y register
    INC $F878,X          ; FE 78 F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_023
; Address: $E18D12
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_023:
    JSR $0081            ; 20 81 00 | Jump to subroutine
    AND ($03,X)          ; 21 03 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($42,X)          ; 01 42 | Hardware register operation
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    BRA $03              ; 80 03 | Branch always
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $07              ; 10 07 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    INC $FA0C,X          ; FE 0C FA | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SBC $FA00,X          ; FD 00 FA | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    SBC #$30             ; E9 30 | Subtract with carry (immediate)
    PEA #$F419           ; F4 19 F4 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    ASL $06EC            ; 0E EC 06 | Arithmetic shift left (absolute)
    BEQ $04              ; F0 04 | Branch if equal
    BEQ $04              ; F0 04 | Branch if equal
    BVS $08              ; 70 08 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_024
; Address: $E18D51
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_024:
    ASL $31              ; 06 31 | Arithmetic shift left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    STY $08              ; 84 08 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_025
; Address: $E18D80
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_025:
    CMP ($FD,X)          ; C1 FD | Compare accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BMI $FF              ; 30 FF | Branch if negative
    BPL $FF              ; 10 FF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 DF 60 | Load from absolute long,X into accumulator
    STA $8F8F8F          ; 8F 8F 8F 8F | Store accumulator to absolute long address
    STA $419EDE          ; 8F DE 9E 41 | Store accumulator to absolute long address
    LDX $BE41,Y          ; BE 41 BE | Load from absolute,Y into X register
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STX $79              ; 86 79 | Store X register to zero page
    LDA                  ; BF BE BF BE | Load from absolute long,X into accumulator
    ROL $3CBD,X          ; 3E BD 3C | Rotate left (absolute,X)
    INC $FC7C,X          ; FE 7C FC | Increment (absolute,X)
    ADC $8279,Y          ; 79 79 82 | Add with carry (absolute,Y)
    ADC $7986,X          ; 7D 86 79 | Add with carry (absolute,X)
    STY $7B              ; 84 7B | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ADC $7979,X          ; 7D 79 79 | Add with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC ($06),Y          ; F1 06 | Subtract with carry ((zero page),Y)
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_026
; Address: $E18E2C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_026:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    SBC $FCF8,Y          ; F9 F8 FC | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    BEQ $F0              ; F0 F0 | Branch if equal
    STA                  ; 9F 9F FF FF | Store accumulator to absolute long,X
    BMI $FF              ; 30 FF | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$FF             ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_027
; Address: $E18E4C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_027:
    JSR $31DF            ; 20 DF 31 | Jump to subroutine
    DEC $03B3            ; CE B3 03 | Decrement (absolute)
    STA                  ; 9F 07 CF 0F | Store accumulator to absolute long,X
    DEC $CACE,X          ; DE CE CA | Decrement (absolute,X)
    REP #$18             ; C2 18 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank42_DmaFunction_029
; Address: $E18E73
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_029:
    XBA                  ; EB | Exchange accumulator bytes
    CPY $D9              ; C4 D9 | Compare Y register (zero page)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    ASL $0FF0            ; 0E F0 0F | Arithmetic shift left (absolute)
    BEQ $BF              ; F0 BF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDX $FF01,Y          ; BE 01 FF | Load from absolute,Y into X register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SBC ($F4),Y          ; F1 F4 | Subtract with carry ((zero page),Y)
    BEQ $BA              ; F0 BA | Branch if equal
    BRA $23              ; 80 23 | Branch always
    RTI                  ; 40 | Return from interrupt
    STA ($80,X)          ; 81 80 | Store accumulator to (zero page,X)
    INY                  ; C8 | Increment Y register
    CMP #$7D             ; C9 7D | Compare accumulator (immediate)
    AND $1B2F,X          ; 3D 2F 1B | Logical AND with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_02A
; Address: $E18EB2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_02A:
    JSR $00D2            ; 20 D2 00 | Jump to subroutine
    PEA #$6400           ; F4 00 64 | Push effective address to stack
    PHA                  ; 48 | Push accumulator to stack
    BRA $50              ; 80 50 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank42_DmaFunction_02B
; Address: $E18EBF
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_02B:
    JSR $FCF8            ; 20 F8 FC | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_02D
; Address: $E18EEC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_02D:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_030
; Address: $E18F05
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_030:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BCS $40              ; B0 40 | Branch if carry set
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank42_DmaFunction_032
; Address: $E18F40
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_032:
    JSR $40BF            ; 20 BF 40 | Jump to subroutine
    LDA                  ; BF 40 9E E0 | Load from absolute long,X into accumulator
    ASL $1EE0,X          ; 1E E0 1E | Arithmetic shift left (absolute,X)
    BRA $3E              ; 80 3E | Branch always
    BRA $3E              ; 80 3E | Branch always
    AND $DEBE,X          ; 3D BE DE | Logical AND with accumulator (absolute,X)
    STZ $9E9E,X          ; 9E 9E 9E | Store zero to absolute,X
    LDA                  ; BF 1E 1F 5E | Load from absolute long,X into accumulator
    LDX $BC7F,Y          ; BE 7F BC | Load from absolute,Y into X register
    ADC $7D3D,X          ; 7D 3D 7D | Add with carry (absolute,X)
    ADC $F904,Y          ; 79 04 F9 | Add with carry (absolute,Y)
    SBC $F904,Y          ; F9 04 F9 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ADC $F9FB,Y          ; 79 FB F9 | Add with carry (absolute,Y)
    SBC $F9FB,Y          ; F9 FB F9 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_034
; Address: $E18F8E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_034:
    JSR $F7DF            ; 20 DF F7 | Jump to subroutine
    INC $E700,X          ; FE 00 E7 | Increment (absolute,X)
    BIT $54FF            ; 2C FF 54 | Test bits in accumulator (absolute)
    LDA                  ; BF DA 3F FF | Load from absolute long,X into accumulator
    SBC $D8C0,X          ; FD C0 D8 | Subtract with carry (absolute,X)
    CPX $B480            ; EC 80 B4 | Compare X register (absolute)
    BRA $1A              ; 80 1A | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_035
; Address: $E18FC4
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_035:
    JSR $C0DF            ; 20 DF C0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    STA $81              ; 85 81 | Store accumulator to zero page
    CPX $80              ; E4 80 | Compare X register (zero page)
    STA                  ; 9F FF 3F 7E | Store accumulator to absolute long,X
    ROL $7C3F,X          ; 3E 3F 7C | Rotate left (absolute,X)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ROR $FEFE,X          ; 7E FE FE | Rotate right (absolute,X)
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    EOR ($B6,X)          ; 41 B6 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_036
; Address: $E19003
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_036:
    STA ($77),Y          ; 91 77 | Store accumulator to (zero page),Y
    PHB                  ; 8B | Push data bank register to stack
    LDX $DE07,Y          ; BE 07 DE | Load from absolute,Y into X register
    ASL $DD              ; 06 DD | Arithmetic shift left (zero page)
    ADC $B61D,X          ; 7D 1D B6 | Add with carry (absolute,X)
    BCC $82              ; 90 82 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    STY $00              ; 84 00 | Store Y register to zero page
    EOR #$01             ; 49 01 | Exclusive OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_037
; Address: $E19031
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_037:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $A0              ; 80 A0 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    BPL $1F              ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_03A
; Address: $E1905D
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_03A:
    RTI                  ; 40 | Return from interrupt
    LDX $4041,Y          ; BE 41 40 | Load from absolute,Y into X register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    ASL $030E            ; 0E 0E 03 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_03B
; Address: $E19096
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_03B:
    SED                  ; F8 | Set decimal mode flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    LDY $DD1C,X          ; BC 1C DD | Load from absolute,X into Y register
    ASL $076E            ; 0E 6E 07 | Arithmetic shift left (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    ROR $BC3C,X          ; 7E 3C BC | Rotate right (absolute,X)
    CMP $2F0E            ; CD 0E 2F | Compare accumulator (absolute)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    BEQ $F1              ; F0 F1 | Branch if equal
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 24 DB 00 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF CD CD DD | Load from absolute long,X into accumulator
    CMP $DEDE,X          ; DD DE DE | Compare accumulator (absolute,X)
    INC $6BFE            ; EE FE 6B | Increment (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_03C
; Address: $E190EC
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_03C:
    EOR ($71),Y          ; 51 71 | Exclusive OR with accumulator ((zero page),Y)
    EOR #$59             ; 49 59 | Exclusive OR with accumulator (immediate)
    ADC $7986,Y          ; 79 86 79 | Add with carry (absolute,Y)
    STX $7C              ; 86 7C | Store X register to zero page
    BIT $3ED3            ; 2C D3 3E | Test bits in accumulator (absolute)
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA $CF0700          ; 8F 00 07 CF | Store accumulator to absolute long address
    EOR #$45             ; 49 45 | Exclusive OR with accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    SBC $FD06,X          ; FD 06 FD | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $FDFD,X          ; FD FD FD | Subtract with carry (absolute,X)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    SBC $FFF9,X          ; FD F9 FF | Subtract with carry (absolute,X)
    BEQ $E3              ; F0 E3 | Branch if equal
    CPX $F9              ; E4 F9 | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SBC $08FC,X          ; FD FC 08 | Subtract with carry (absolute,X)
    LDA                  ; BF DF BE 6D | Load from absolute long,X into accumulator
    LDA                  ; BF FC 9E 00 | Load from absolute long,X into accumulator
    ADC $9200            ; 6D 00 92 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_03D
; Address: $E1916C
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_03D:
    STZ $0D7F            ; 9C 7F 0D | Store zero to absolute
    SBC $DFDF,X          ; FD DF DF | Subtract with carry (absolute,X)
    LDA                  ; BF BF BF BF | Load from absolute long,X into accumulator
    AND $E002            ; 2D 02 E0 | Game work RAM access
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $F906,X          ; FD 06 F9 | Subtract with carry (absolute,X)
    STX $79              ; 86 79 | Store X register to zero page
    STZ $CEF9,X          ; 9E F9 CE | Store zero to absolute,X
    ASL $FFFF            ; 0E FF FF | Arithmetic shift left (absolute)
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    SBC $7DFD,X          ; FD FD 7D | Subtract with carry (absolute,X)
    ADC $797D,Y          ; 79 7D 79 | Add with carry (absolute,Y)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $0CF1            ; 0E F1 0C | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    SBC $F9FD,Y          ; F9 FD F9 | Subtract with carry (absolute,Y)
    SBC ($F7),Y          ; F1 F7 | Subtract with carry ((zero page),Y)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $1D              ; E4 1D | Compare X register (zero page)
    INC $1C              ; E6 1C | Increment (zero page)
    SBC $F9FC,X          ; FD FC F9 | Subtract with carry (absolute,X)
    INC $FAF8,X          ; FE F8 FA | Increment (absolute,X)
    BEQ $EB              ; F0 EB | Branch if equal
    CPX #$E5             ; E0 E5 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$E4             ; E0 E4 | Compare X register (immediate)
    CPX #$3B             ; E0 3B | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$04             ; E0 04 | Compare X register (immediate)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BIT $83              ; 24 83 | Test bits in accumulator (zero page)
    BRA $10              ; 80 10 | Branch always
    BRA $00              ; 80 00 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $FF              ; 90 FF | Branch if carry clear
    INC $1EFE,X          ; FE FE 1E | Increment (absolute,X)
    SEP #$E3             ; E2 E3 | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_03E
; Address: $E19218
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_03E:
    JSR $1CC1            ; 20 C1 1C | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BRA $02              ; 80 02 | Branch always
    BRA $02              ; 80 02 | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_03F
; Address: $E1922B
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_03F:
    BRA $02              ; 80 02 | Branch always
    BRA $3E              ; 80 3E | Branch always
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CMP ($7E,X)          ; C1 7E | Compare accumulator ((zero page,X))
    STA ($7C,X)          ; 81 7C | Store accumulator to (zero page,X)
    SEI                  ; 78 | Set interrupt disable flag
    STY $7D              ; 84 7D | Store Y register to zero page
    ADC $FFFF,X          ; 7D FF FF | Add with carry (absolute,X)
    STA ($A1,X)          ; 81 A1 | Store accumulator to (zero page,X)
    BRA $9E              ; 80 9E | Branch always
    CPX #$E2             ; E0 E2 | Compare X register (immediate)
    BMI $81              ; 30 81 | Branch if negative
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    AND $9E9E,X          ; 3D 9E 9E | Logical AND with accumulator (absolute,X)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    INC $E6              ; E6 E6 | Increment (zero page)
    ROR $7C7E,X          ; 7E 7E 7C | Rotate right (absolute,X)
    BRA $83              ; 80 83 | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_040
; Address: $E19284
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_040:
    PLA                  ; 68 | Pull accumulator from stack
    ROR                  ; 6A | Rotate right (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    EOR $474D            ; 4D 4D 47 | Exclusive OR with accumulator (absolute)
    DEC $BFBF,X          ; DE BF BF | Decrement (absolute,X)
    ADC #$F9             ; 69 F9 | Add with carry (immediate)
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$37             ; C0 37 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    STY $00FF            ; 8C FF 00 | Store Y register to absolute address
    LDA                  ; BF 40 FE 01 | Load from absolute long,X into accumulator
    BCC $00              ; 90 00 | Branch if carry clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY $78F2            ; CC F2 78 | Compare Y register (absolute)
    CPX $30              ; E4 30 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_041
; Address: $E192E9
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_041:
    PEA #$7C00           ; F4 00 7C | Push effective address to stack
    BEQ $F2              ; F0 F2 | Branch if equal
    BEQ $FA              ; F0 FA | Branch if equal
    BMI $6C              ; 30 6C | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    STZ $00              ; 64 00 | Store zero to zero page
    ORA #$7F             ; 09 7F | Logical OR with accumulator (immediate)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    INC $F702            ; EE 02 F7 | Increment (absolute)
    BIT $11              ; 24 11 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    DEC $4EFD,X          ; DE FD 4E | Decrement (absolute,X)
    AND $DE21,X          ; 3D 21 DE | Logical AND with accumulator (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    AND $0080            ; 2D 80 00 | Logical AND with accumulator (absolute)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_042
; Address: $E19362
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_042:
    JSR $3A7D            ; 20 7D 3A | Jump to subroutine
    SBC $BB19,X          ; FD 19 BB | Subtract with carry (absolute,X)
    EOR $3E00,X          ; 5D 00 3E | Exclusive OR with accumulator (absolute,X)
    ADC $3D7D,X          ; 7D 7D 3D | Add with carry (absolute,X)
    STA                  ; 9F BD 05 9B | Store accumulator to absolute long,X
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    BMI $01              ; 30 01 | Branch if negative
    ASL $0FE1,X          ; 1E E1 0F | Arithmetic shift left (absolute,X)
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE),Y          ; 11 FE | Logical OR with accumulator ((zero page),Y)
    STY $12FF            ; 8C FF 12 | Store Y register to absolute address
    BPL $EA              ; 10 EA | Branch if positive
    REP #$C0             ; C2 C0 | Reset processor status bits
    CMP #$C0             ; C9 C0 | Compare accumulator (immediate)
    STY $80              ; 84 80 | Store Y register to zero page
    BPL $00              ; 10 00 | Branch if positive
    STA $0F00,X          ; 9D 00 0F | Store accumulator to absolute,X
    TXA                  ; 8A | Transfer X register to accumulator
    DEC $FC5F,X          ; DE 5F FC | Decrement (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BCC $00              ; 90 00 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BRA $20              ; 80 20 | Branch always
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_043
; Address: $E193E1
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_043:
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    CPX #$04             ; E0 04 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    SEC                  ; 38 | Set carry flag
    CPY $18              ; C4 18 | Compare Y register (zero page)
    CPX $08              ; E4 08 | Compare X register (zero page)
    PEA #$F800           ; F4 00 F8 | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $F3              ; 80 F3 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $071E,X          ; 1E 1E 07 | Arithmetic shift left (absolute,X)
    ASL $F7              ; 06 F7 | Arithmetic shift left (zero page)
    CMP $F7              ; C5 F7 | Compare accumulator (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    SEP #$1D             ; E2 1D | Set processor status bits
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_045
; Address: $E19424
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_045:
    BEQ $F6              ; F0 F6 | Branch if equal
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    PHY                  ; 5A | Push Y register to stack
    PHP                  ; 08 | Push processor status to stack
    ROR                  ; 6A | Rotate right (accumulator)
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    LDA $7887            ; AD 87 78 | Load from absolute address into accumulator
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SEP #$1D             ; E2 1D | Set processor status bits
    BMI $CF              ; 30 CF | Branch if negative
    BNE $2F              ; D0 2F | Branch if not equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BCC $6F              ; 90 6F | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    ORA $1CCF            ; 0D CF 1C | Logical OR with accumulator (absolute)
    ORA $FCEC,X          ; 1D EC FC | Logical OR with accumulator (absolute,X)
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    SBC ($E3,X)          ; E1 E3 | Subtract with carry ((zero page,X))
    SBC ($F9,X)          ; E1 F9 | Subtract with carry ((zero page,X))
    ADC $2F7F,Y          ; 79 7F 2F | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_046
; Address: $E19451
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_046:
    SEI                  ; 78 | Set interrupt disable flag
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    BCC $63              ; 90 63 | Branch if carry clear
    STZ $C639            ; 9C 39 C6 | Store zero to absolute
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$36             ; E0 36 | Compare X register (immediate)
    ASL $E6              ; 06 E6 | Arithmetic shift left (zero page)
    STX $BECE            ; 8E CE BE | Store X register to absolute address
    LDX $F8F8,Y          ; BE F8 F8 | Load from absolute,Y into X register
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    STA                  ; 9F 3C C3 FC | Store accumulator to absolute long,X
    CLV                  ; B8 | Clear overflow flag
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    INC $F9E1,X          ; FE E1 F9 | Increment (absolute,X)
    BEQ $F8              ; F0 F8 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BEQ $FC              ; F0 FC | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    INC $F901,X          ; FE 01 F9 | Increment (absolute,X)
    ASL $F7              ; 06 F7 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SBC $FC02,X          ; FD 02 FC | Subtract with carry (absolute,X)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    STA $732170          ; 8F 70 21 73 | Store accumulator to absolute long address
    LDY #$FD             ; A0 FD | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_048
; Address: $E194AC
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_048:
    JSR $20F9            ; 20 F9 20 | Jump to subroutine
    INC $8C73,X          ; FE 73 8C | Increment (absolute,X)
    SBC $FE02,X          ; FD 02 FE | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BIT #$F9             ; 89 F9 | Test bits in accumulator (immediate)
    ASL $72              ; 06 72 | Arithmetic shift left (zero page)
    STA $FFFF            ; 8D FF FF | Store accumulator to absolute address
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $7F              ; F0 7F | Branch if equal
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_049
; Address: $E19508
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_049:
    JSR $101F            ; 20 1F 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    STA $009F00          ; 8F 00 9F 00 | Store accumulator to absolute long address
    LDA                  ; BF 00 7F 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_04A
; Address: $E19520
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_04A:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $1E              ; 80 1E | Branch always
    ORA $0EDF,Y          ; 19 DF 0E | Logical OR with accumulator (absolute,Y)
    INC $EF8F            ; EE 8F EF | Increment (absolute)
    CPY $F7              ; C4 F7 | Compare Y register (zero page)
    STX $8571            ; 8E 71 85 | Store X register to absolute address
    PLY                  ; 7A | Pull Y register from stack
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    STY $B5              ; 84 B5 | Store Y register to zero page
    BRA $B9              ; 80 B9 | Branch always
    CPY #$EE             ; C0 EE | Compare Y register (immediate)
    BRA $9D              ; 80 9D | Branch always
    CPY $DF              ; C4 DF | Compare Y register (zero page)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    DEC $B631            ; CE 31 B6 | Decrement (absolute)
    EOR #$5B             ; 49 5B | Exclusive OR with accumulator (immediate)
    STY $FD              ; 84 FD | Store Y register to zero page
    LDA $3EBE3E          ; AF 3E BE 3E | Load from absolute long address into accumulator
    LDX $5E1E,Y          ; BE 1E 5E | Load from absolute,Y into X register
    STX $46AE            ; 8E AE 46 | Store X register to absolute address
    DEC $C0              ; C6 C0 | Decrement (zero page)
    STX $9C71            ; 8E 71 9C | Store X register to absolute address
    BRA $7F              ; 80 7F | Branch always
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    PEA #$F5C5           ; F4 C5 F5 | Push effective address to stack
    PEA #$E8C8           ; F4 C8 E8 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_04C
; Address: $E195D5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_04C:
    BPL $EF              ; 10 EF | Branch if positive
    BPL $F7              ; 10 F7 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    BPL $20              ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_04D
; Address: $E195E2
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_04D:
    JSR $28FF            ; 20 FF 28 | Jump to subroutine
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDY $26FF            ; AC FF 26 | Load from absolute address into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC $FC06,Y          ; F9 06 FC | Subtract with carry (absolute,Y)
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    BPL $07              ; 10 07 | Branch if positive
    LDA                  ; BF 1F BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 0F BF 03 | Load from absolute long,X into accumulator
    BRA $7F              ; 80 7F | Branch always
    BRA $9F              ; 80 9F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_04E
; Address: $E19616
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_04E:
    LDA                  ; BF 40 87 78 | Load from absolute long,X into accumulator
    LDA                  ; BF 40 3F C0 | Load from absolute long,X into accumulator
    BRA $03              ; 80 03 | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_04F
; Address: $E19642
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_04F:
    JSL $ECC833          ; 22 33 C8 EC | Jump to subroutine long
    CPY $9890            ; CC 90 98 | Compare Y register (absolute)
    SBC $FBCB,X          ; FD CB FB | Subtract with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_050
; Address: $E19661
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_050:
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BMI $19              ; 30 19 | Branch if negative
    ORA $2F8F,Y          ; 19 8F 2F | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 40 DF 20 | Load from absolute long,X into accumulator
    BPL $F7              ; 10 F7 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_052
; Address: $E1968C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_052:
    JSR $10A0            ; 20 A0 10 | Jump to subroutine
    BNE $FF              ; D0 FF | Branch if not equal
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_054
; Address: $E196A6
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_054:
    ORA $0BCD            ; 0D CD 0B | Logical OR with accumulator (absolute)
    PHB                  ; 8B | Push data bank register to stack
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ASL $1EF1,X          ; 1E F1 1E | Arithmetic shift left (absolute,X)
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL $FEFE,X          ; 1E FE FE | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $87              ; 80 87 | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    INC $C03F,X          ; FE 3F C0 | Increment (absolute,X)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    STA                  ; 9F 80 C0 07 | Store accumulator to absolute long,X
    BNE $FF              ; D0 FF | Branch if not equal
    LDY #$FF             ; A0 FF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_055
; Address: $E1972C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_055:
    JSR $0FBF            ; 20 BF 0F | Jump to subroutine
    STA $CF609F          ; 8F 9F 60 CF | Store accumulator to absolute long address
    BMI $EF              ; 30 EF | Branch if negative
    BPL $DF              ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_056
; Address: $E19737
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_056:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    LDA                  ; BF 40 A1 5E | Load from absolute long,X into accumulator
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    INC $A500            ; EE 00 A5 | Increment (absolute)
    STA ($CB,X)          ; 81 CB | Store accumulator to (zero page,X)
    LSR $E080            ; 4E 80 E0 | Game work RAM access
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROR $10EF            ; 6E EF 10 | Rotate right (absolute)
    INC $A511            ; EE 11 A5 | Increment (absolute)
    PHY                  ; 5A | Push Y register to stack
    DEC $E031            ; CE 31 E0 | Game work RAM access
    CPX $EE13            ; EC 13 EE | Compare X register (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_059
; Address: $E197B8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_059:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    AND $133F,Y          ; 39 3F 13 | Logical AND with accumulator (absolute,Y)
    ADC $817D,X          ; 7D 7D 81 | Add with carry (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($E0,X)          ; 81 E0 | Game work RAM access
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $FEB2            ; EE B2 FE | Increment (absolute)
    ADC ($71,X)          ; 61 71 | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_05A
; Address: $E197ED
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_05A:
    BVS $C0              ; 70 C0 | Branch if overflow set
    SEP #$EE             ; E2 EE | Set processor status bits
    BPL $DE              ; 10 DE | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_05B
; Address: $E197F3
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_05B:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BPL $DF              ; 10 DF | Branch if positive
    STX $9EFE            ; 8E FE 9E | Store X register to absolute address
    INC $F878,X          ; FE 78 F8 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    BPL $F3              ; 10 F3 | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    LDY #$E0             ; A0 E0 | Game work RAM access
    BPL $F0              ; 10 F0 | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $00              ; 10 00 | Branch if positive
    LDA                  ; BF 00 BF 88 | Load from absolute long,X into accumulator
    LDA                  ; BF 88 BB 08 | Load from absolute long,X into accumulator
    DEY                  ; 88 | Decrement Y register
    XBA                  ; EB | Exchange accumulator bytes
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 40 A7 58 | Load from absolute long,X into accumulator
    PLB                  ; AB | Pull data bank register from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    BMI $BE              ; 30 BE | Branch if negative
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_05C
; Address: $E19883
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_05C:
    INC $FE40,X          ; FE 40 FE | Increment (absolute,X)
    SBC $FB00,X          ; FD 00 FB | Subtract with carry (absolute,X)
    ORA ($C7,X)          ; 01 C7 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F FF FE 01 | Store accumulator to absolute long,X
    DEC $39              ; C6 39 | Decrement (zero page)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 9D 62 09 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_05D
; Address: $E198E2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_05D:
    JSL $F8C03C          ; 22 3C C0 F8 | Jump to subroutine long
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_05F
; Address: $E19934
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_05F:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_061
; Address: $E19940
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_061:
    BPL $D7              ; 10 D7 | Branch if positive
    BEQ $F7              ; F0 F7 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    AND $0E3F,X          ; 3D 3F 0E | Logical AND with accumulator (absolute,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPY $03              ; C4 03 | Compare Y register (zero page)
    CMP ($DD,X)          ; C1 DD | Compare accumulator ((zero page,X))
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    SBC $FE02,X          ; FD 02 FE | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_062
; Address: $E1999D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_062:
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_064
; Address: $E199D1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_064:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_065
; Address: $E199F9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_065:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_068
; Address: $E19A0D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_068:
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_06C
; Address: $E19A1C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_06C:
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_06D
; Address: $E19A27
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_06D:
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $70              ; 80 70 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank42_DmaFunction_06E
; Address: $E19A8E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_06E:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $380E            ; 0E 0E 38 | Arithmetic shift left (absolute)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_070
; Address: $E19AB2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_070:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_071
; Address: $E19AFB
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_071:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    INC $F0FF,X          ; FE FF F0 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    INC $FCF8,X          ; FE F8 FC | Increment (absolute,X)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_072
; Address: $E19BA0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_072:
    JSR $1010            ; 20 10 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $30              ; 30 30 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $030E            ; 0E 0E 03 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_073
; Address: $E19BDB
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_073:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $83              ; 80 83 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_074
; Address: $E19C27
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_074:
    ROR $F0C0,X          ; 7E C0 F0 | Rotate right (absolute,X)
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $F000,X          ; 7E 00 F0 | Rotate right (absolute,X)
    BRA $07              ; 80 07 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $FE              ; 70 FE | Branch if overflow set
    ASL $84              ; 06 84 | Arithmetic shift left (zero page)
    BVS $70              ; 70 70 | Branch if overflow set
    STY $84              ; 84 84 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank42_DmaFunction_075
; Address: $E19C83
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_075:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_076
; Address: $E19CCD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_076:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_078
; Address: $E19D1F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_078:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    BRA $C2              ; 80 C2 | Branch always
    CPY $66              ; C4 66 | Compare Y register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_079
; Address: $E19D46
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_079:
    STZ $68              ; 64 68 | Store zero to zero page
    PHA                  ; 48 | Push accumulator to stack
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_07A
; Address: $E19D50
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_07A:
    RTI                  ; 40 | Return from interrupt
    DEC $00              ; C6 00 | Decrement (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    JMP ($7800)          ; 6C 00 78 | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_07B
; Address: $E19D80
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_07B:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    CLC                  ; 18 | Clear carry flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $81              ; 80 81 | Branch always
    STA $00FF10          ; 8F 10 FF 00 | Store accumulator to absolute long address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $81              ; 80 81 | Branch always
    STA $00FF10          ; 8F 10 FF 00 | Store accumulator to absolute long address
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank42_DmaFunction_07C
; Address: $E19E6A
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_07C:
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_07D
; Address: $E19EE1
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_07D:
    BVS $C0              ; 70 C0 | Branch if overflow set
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    INC $F000,X          ; FE 00 F0 | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $40              ; 80 40 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $40              ; 80 40 | Branch always
    CLC                  ; 18 | Clear carry flag
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_081
; Address: $E19FEC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_081:
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_085
; Address: $E19FFD
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_085:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $7E78            ; 0E 78 7E | Arithmetic shift left (absolute)
    BEQ $F8              ; F0 F8 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $FE80            ; 0E 80 FE | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$C0             ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_086
; Address: $E1A1EB
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_086:
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    SED                  ; F8 | Set decimal mode flag
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_087
; Address: $E1A242
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_087:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_088
; Address: $E1A26B
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_088:
    JSR $403F            ; 20 3F 40 | Jump to subroutine
    BEQ $08              ; F0 08 | Branch if equal
    INC $FF02,X          ; FE 02 FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $1D01            ; 0E 01 1D | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1D00            ; 0E 00 1D | Arithmetic shift left (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_08A
; Address: $E1A2CC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_08A:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_08B
; Address: $E1A2DD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_08B:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_08F
; Address: $E1A326
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_08F:
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $FC04,X          ; FE 04 FC | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BPL $F0              ; 10 F0 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_090
; Address: $E1A396
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_090:
    JSR $103F            ; 20 3F 10 | Jump to subroutine
    BPL $1F              ; 10 1F | Branch if positive
    RTI                  ; 40 | Return from interrupt
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $8080,X          ; FE 80 80 | Increment (absolute,X)
    BRA $40              ; 80 40 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_091
; Address: $E1A400
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_091:
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    ORA #$11             ; 09 11 | Logical OR with accumulator (immediate)
    ORA #$11             ; 09 11 | Logical OR with accumulator (immediate)
    ORA $1801,Y          ; 19 01 18 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $1900,Y          ; 19 00 19 | Logical OR with accumulator (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $18              ; 10 18 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_093
; Address: $E1A47C
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_093:
    JSR $003F            ; 20 3F 00 | Jump to subroutine
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$04             ; E0 04 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_09C
; Address: $E1A4EA
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_09C:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_09E
; Address: $E1A4FA
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_09E:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    ADC $FF              ; 65 FF | Add with carry (zero page)
    ADC $79              ; 65 79 | Add with carry (zero page)
    JMP ($5C78)          ; 6C 78 5C | Jump to address (absolute indirect)
    SED                  ; F8 | Set decimal mode flag
    JMP $98FF9A          ; 5C 9A FF 98 | Jump to address long
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $FB              ; 90 FB | Branch if carry clear
    CPX $83              ; E4 83 | Compare X register (zero page)
    CPX $1F              ; E4 1F | Compare X register (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_09F
; Address: $E1A60C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_09F:
    STY $5003            ; 8C 03 50 | Store Y register to absolute address
    LDA                  ; BF 7F FC 04 | Load from absolute long,X into accumulator
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)
    INC $0402,X          ; FE 02 04 | Increment (absolute,X)
    CPX $2E              ; E4 2E | Compare X register (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    SED                  ; F8 | Set decimal mode flag
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    DEC $86BC            ; CE BC 86 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0A0
; Address: $E1A648
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0A0:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $40              ; 30 40 | Branch if negative
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $70              ; 70 70 | Branch if overflow set
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    BVS $80              ; 70 80 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0A1
; Address: $E1A6C1
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0A1:
    JSR $4043            ; 20 43 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ROR $7D41,X          ; 7E 41 7D | Rotate right (absolute,X)
    WDM #$7B             ; 42 7B | Reserved instruction
    PHA                  ; 48 | Push accumulator to stack
    ROR $7C3F,X          ; 7E 3F 7C | Rotate right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ROL $F870,X          ; 3E 70 F8 | Rotate left (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $60              ; 80 60 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0A2
; Address: $E1A6E7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0A2:
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0A3
; Address: $E1A6EC
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0A3:
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF DF 1F DF | Load from absolute long,X into accumulator
    LDA                  ; BF 0F 3F 0F | Load from absolute long,X into accumulator
    LDX $FF              ; A6 FF | Load from zero page into X register
    INC $FF              ; E6 FF | Increment (zero page)
    INC $BF              ; E6 BF | Increment (zero page)
    LDX $A7              ; A6 A7 | Load from zero page into X register
    LDX $3E              ; A6 3E | Load from zero page into X register
    INC $0E              ; E6 0E | Increment (zero page)
    INC $FF59,X          ; FE 59 FF | Increment (absolute,X)
    ORA $19FF,Y          ; 19 FF 19 | Logical OR with accumulator (absolute,Y)
    EOR $59FF,Y          ; 59 FF 59 | Exclusive OR with accumulator (absolute,Y)
    CMP $F9FF,Y          ; D9 FF F9 | Compare accumulator (absolute,Y)
    SBC $0FFF,X          ; FD FF 0F | Subtract with carry (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $B8              ; F0 B8 | Branch if equal
    BNE $7A              ; D0 7A | Branch if not equal
    BNE $7F              ; D0 7F | Branch if not equal
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    ASL $AB              ; 06 AB | Arithmetic shift left (zero page)
    LDA $FF5F1F          ; AF 1F 5F FF | Load from absolute long address into accumulator
    ORA $FD              ; 05 FD | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    INC $7C01,X          ; FE 01 7C | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0A5
; Address: $E1A7E0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0A5:
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BPL $07              ; 10 07 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BCC $DF              ; 90 DF | Branch if carry clear
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    BRA $21              ; 80 21 | PPU graphics register access
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0A6
; Address: $E1A82C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0A6:
    JSL $2C3138          ; 22 38 31 2C | Jump to subroutine long
    CPX #$78             ; E0 78 | Compare X register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0A7
; Address: $E1A839
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0A7:
    ASL $0420,X          ; 1E 20 04 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    AND $18              ; 25 18 | Logical AND with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF F0 FF C0 | Load from absolute long,X into accumulator
    BRA $FE              ; 80 FE | Branch always
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    CPY $00D8            ; CC D8 00 | Compare Y register (absolute)
    BCS $00              ; B0 00 | Branch if carry set
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $07              ; 10 07 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    INC $FA0C,X          ; FE 0C FA | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0A8
; Address: $E1A8B8
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0A8:
    SBC $FA00,X          ; FD 00 FA | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $06              ; 80 06 | Branch always
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    BVS $C8              ; 70 C8 | Branch if overflow set
    JMP ($DCDC)          ; 6C DC DC | Jump to address (absolute indirect)
    STZ $DC              ; 64 DC | Store zero to zero page
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    STY $38              ; 84 38 | Store Y register to zero page
    PLA                  ; 68 | Pull accumulator from stack
    BVS $0C              ; 70 0C | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    LDY $3870,X          ; BC 70 38 | Load from absolute,X into Y register
    AND $1A24,Y          ; 39 24 1A | Logical AND with accumulator (absolute,Y)
    ORA $0301,X          ; 1D 01 03 | Logical OR with accumulator (absolute,X)
    ROL $3F3F,X          ; 3E 3F 3F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0AA
; Address: $E1A8ED
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0AA:
    JSR $101D            ; 20 1D 10 | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $FD              ; 80 FD | Branch always
    BRA $65              ; 80 65 | Branch always
    BRA $A3              ; 80 A3 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDX #$41             ; A2 41 | Load immediate value into X register
    INY                  ; C8 | Increment Y register
    BNE $00              ; D0 00 | Branch if not equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $02              ; 80 02 | Branch always
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    CPY #$1A             ; C0 1A | Compare Y register (immediate)
    CPY #$9C             ; C0 9C | Compare Y register (immediate)
    CPY #$9C             ; C0 9C | Compare Y register (immediate)
    LDA $F8C7D8          ; AF D8 C7 F8 | Load from absolute long address into accumulator
    INC $A8F0            ; EE F0 A8 | Increment (absolute)
    BCS $A0              ; B0 A0 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC ($E8,X)          ; E1 E8 | Subtract with carry ((zero page,X))
    SEP #$E5             ; E2 E5 | Set processor status bits
    LDA ($A7),Y          ; B1 A7 | Load from (zero page),Y into accumulator
    JMP $3080            ; 4C 80 30 | Jump to address
    CPY #$10             ; C0 10 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0AB
; Address: $E1A935
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0AB:
    SBC ($50,X)          ; E1 50 | Subtract with carry ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    ASL $5FF8,X          ; 1E F8 5F | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA $170D,X          ; 1D 0D 17 | Logical OR with accumulator (absolute,X)
    ORA $2505,X          ; 1D 05 25 | Logical OR with accumulator (absolute,X)
    ORA $3F              ; 05 3F | Logical OR with accumulator (zero page)
    AND $E205,X          ; 3D 05 E2 | Logical AND with accumulator (absolute,X)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    NOP                  ; EA | No operation
    PHX                  ; DA | Push X register to stack
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    PHX                  ; DA | Push X register to stack
    SBC #$30             ; E9 30 | Subtract with carry (immediate)
    PEA #$F419           ; F4 19 F4 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    ASL $06EC            ; 0E EC 06 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0AC
; Address: $E1A971
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0AC:
    ASL $31              ; 06 31 | Arithmetic shift left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($87),Y          ; 11 87 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    BCS $30              ; B0 30 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $78              ; F0 78 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $40              ; 80 40 | Branch always
    BCS $00              ; B0 00 | Branch if carry set
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0AD
; Address: $E1A9B8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0AD:
    BRA $80              ; 80 80 | Branch always
    BCS $B0              ; B0 B0 | Branch if carry set
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0AE
; Address: $E1A9D2
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0AE:
    JSR $023F            ; 20 3F 02 | Jump to subroutine
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    AND #$17             ; 29 17 | Logical AND with accumulator (immediate)
    BRA $1F              ; 80 1F | Branch always
    BEQ $01              ; F0 01 | Branch if equal
    SBC ($C8,X)          ; E1 C8 | Subtract with carry ((zero page,X))
    CPY #$F7             ; C0 F7 | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FD              ; E6 FD | Increment (zero page)
    INC $BE              ; E6 BE | Increment (zero page)
    LDX $A7              ; A6 A7 | Load from zero page into X register
    INC $FEE6,X          ; FE E6 FE | Increment (absolute,X)
    INC $BF              ; E6 BF | Increment (zero page)
    LDX $5F              ; A6 5F | Load from zero page into X register
    SED                  ; F8 | Set decimal mode flag
    INC                  ; 1A | Increment accumulator
    EOR $59FE,Y          ; 59 FE 59 | Exclusive OR with accumulator (absolute,Y)
    INC $FF19,X          ; FE 19 FF | Increment (absolute,X)
    ORA $59FF,Y          ; 19 FF 59 | Logical OR with accumulator (absolute,Y)
    AND $5F              ; 25 5F | Logical AND with accumulator (zero page)
    SBC $E565,X          ; FD 65 E5 | Subtract with carry (absolute,X)
    ADC $E7              ; 65 E7 | Add with carry (zero page)
    SBC $5D65            ; ED 65 5D | Subtract with carry (absolute)
    EOR $9A              ; 45 9A | Exclusive OR with accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    BCC $27              ; 90 27 | Branch if carry clear
    BVC $03              ; 50 03 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0AF
; Address: $E1AA45
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0AF:
    JSR $0003            ; 20 03 00 | Jump to subroutine
    LDA                  ; BF 4F DF 8F | Load from absolute long,X into accumulator
    SBC $C0FF,Y          ; F9 FF C0 | Subtract with carry (absolute,Y)
    BRA $FD              ; 80 FD | Branch always
    BEQ $03              ; F0 03 | Branch if equal
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0B0
; Address: $E1AA7F
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0B0:
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FE              ; F0 FE | Branch if equal
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CMP ($F1,X)          ; C1 F1 | Compare accumulator ((zero page,X))
    CMP ($F1,X)          ; C1 F1 | Compare accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SBC $F107,Y          ; F9 07 F1 | Subtract with carry (absolute,Y)
    ASL $1EE7            ; 0E E7 1E | Arithmetic shift left (absolute)
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    ORA $05FE            ; 0D FE 05 | Logical OR with accumulator (absolute)
    INC $FC03,X          ; FE 03 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    ADC ($FE),Y          ; 71 FE | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    SBC $00FC,X          ; FD FC 00 | Subtract with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BMI $FF              ; 30 FF | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0B1
; Address: $E1AB2E
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0B1:
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F FF BF FF | Store accumulator to absolute long,X
    ASL $06FF            ; 0E FF 06 | Arithmetic shift left (absolute)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC $F9FF,Y          ; F9 FF F9 | Subtract with carry (absolute,Y)
    ASL $1CFF,X          ; 1E FF 1C | Arithmetic shift left (absolute,X)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0B2
; Address: $E1ABD0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0B2:
    JSR $00C0            ; 20 C0 00 | Jump to subroutine
    ROL $00FE,X          ; 3E FE 00 | Rotate left (absolute,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0B3
; Address: $E1ABED
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0B3:
    ADC $7D82,X          ; 7D 82 7D | Add with carry (absolute,X)
    ASL $BEFF            ; 0E FF BE | Arithmetic shift left (absolute)
    ROL $FD7F,X          ; 3E 7F FD | Rotate left (absolute,X)
    ADC $7DFF,X          ; 7D FF 7D | Add with carry (absolute,X)
    INC $10FE,X          ; FE FE 10 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    INC $80FF,X          ; FE FF 80 | Increment (absolute,X)
    INC $FFF0,X          ; FE F0 FF | Increment (absolute,X)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    INC $C301,X          ; FE 01 C3 | Increment (absolute,X)
    REP #$F2             ; C2 F2 | Reset processor status bits
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    BMI $30              ; 30 30 | Branch if negative
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    SEP #$E2             ; E2 E2 | Set processor status bits
    STA $398C            ; 8D 8C 39 | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    ADC #$68             ; 69 68 | Add with carry (immediate)
    REP #$AA             ; C2 AA | Reset processor status bits
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FE              ; 80 FE | Branch always
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    NOP                  ; EA | No operation
    BIT $4480            ; 2C 80 44 | Test bits in accumulator (absolute)
    STY $84              ; 84 84 | Store Y register to zero page
    LDA ($31),Y          ; B1 31 | Load from (zero page),Y into accumulator
    STZ $14D4            ; 9C D4 14 | Store zero to absolute
    LSR                  ; 4A | Logical shift right (accumulator)
    WDM #$D5             ; 42 D5 | Reserved instruction
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    BRA $3F              ; 80 3F | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0B4
; Address: $E1AC99
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0B4:
    JSR $2817            ; 20 17 28 | Jump to subroutine
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    XBA                  ; EB | Exchange accumulator bytes
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    EOR ($BF,X)          ; 41 BF | Exclusive OR with accumulator ((zero page,X))
    EOR ($BF,X)          ; 41 BF | Exclusive OR with accumulator ((zero page,X))
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 9F FF | Load from absolute long,X into accumulator
    LDA                  ; BF FE BE BF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0B5
; Address: $E1ACD7
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0B5:
    LDX $3EBF,Y          ; BE BF 3E | Load from absolute,Y into X register
    ROL $BEBE,X          ; 3E BE BE | Rotate left (absolute,X)
    STZ $089E,X          ; 9E 9E 08 | Store zero to absolute,X
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    BRA $FD              ; 80 FD | Branch always
    BRA $FD              ; 80 FD | Branch always
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    SBC $F3F7,X          ; FD F7 F3 | Subtract with carry (absolute,X)
    LDA                  ; BF 3F BF 3F | Load from absolute long,X into accumulator
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    BRA $80              ; 80 80 | Branch always
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    ASL $060E            ; 0E 0E 06 | Arithmetic shift left (absolute)
    DEC $07              ; C6 07 | Decrement (zero page)
    ASL $E6              ; 06 E6 | Arithmetic shift left (zero page)
    STX $E6              ; 86 E6 | Store X register to zero page
    SEP #$3F             ; E2 3F | Set processor status bits
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STA $38CF78          ; 8F 78 CF 38 | Store accumulator to absolute long address
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    INC $F0C0,X          ; FE C0 F0 | Increment (absolute,X)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    CPY $08              ; C4 08 | Compare Y register (zero page)
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF FC 03 C0 | Load from absolute long,X into accumulator
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    STA $789F78          ; 8F 78 9F 78 | Store accumulator to absolute long address
    BEQ $A2              ; F0 A2 | Branch if equal
    LDA ($8F,X)          ; A1 8F | Load from (zero page,X) into accumulator
    STA $9A              ; 85 9A | Store accumulator to zero page
    BRA $04              ; 80 04 | Branch always
    STY $FB              ; 84 FB | Store Y register to zero page
    CLV                  ; B8 | Clear overflow flag
    LDA $50              ; A5 50 | Load from zero page into accumulator
    LDY $41              ; A4 41 | Load from zero page into Y register
    ROL $FBD1            ; 2E D1 FB | Rotate left (absolute)
    ADC $6B94,X          ; 7D 94 6B | Add with carry (absolute,X)
    SBC ($A1),Y          ; F1 A1 | Subtract with carry ((zero page),Y)
    EOR $2001,Y          ; 59 01 20 | Exclusive OR with accumulator (absolute,Y)
    AND ($F7,X)          ; 21 F7 | Logical AND with accumulator ((zero page,X))
    ORA #$4B             ; 09 4B | Logical OR with accumulator (immediate)
    BVC $77              ; 50 77 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0B6
; Address: $E1ADF0
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0B6:
    AND $A502,X          ; 3D 02 A5 | Logical AND with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $82              ; 25 82 | Logical AND with accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    BVC $AF              ; 50 AF | Branch if overflow clear
    ADC $7D82,X          ; 7D 82 7D | Add with carry (absolute,X)
    AND $3DC2,X          ; 3D C2 3D | Logical AND with accumulator (absolute,X)
    WDM #$3D             ; 42 3D | Reserved instruction
    AND $3D02,X          ; 3D 02 3D | Logical AND with accumulator (absolute,X)
    SBC $BF3F,X          ; FD 3F BF | Subtract with carry (absolute,X)
    LDA                  ; BF 3F FF 3F | Load from absolute long,X into accumulator
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    LDA                  ; BF 1F FF 00 | Load from absolute long,X into accumulator
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$02             ; E0 02 | Compare X register (immediate)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    CMP ($F1,X)          ; C1 F1 | Compare accumulator ((zero page,X))
    BRA $F8              ; 80 F8 | Branch always
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    BEQ $FC              ; F0 FC | Branch if equal
    BRA $FE              ; 80 FE | Branch always
    SED                  ; F8 | Set decimal mode flag
    ASL $3FC1,X          ; 1E C1 3F | Arithmetic shift left (absolute,X)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    ADC $3F79,Y          ; 79 79 3F | Add with carry (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $7F              ; 80 7F | Branch always
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0B8
; Address: $E1AEC7
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0B8:
    JSR $2020            ; 20 20 20 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    ASL $1D18            ; 0E 18 1D | Arithmetic shift left (absolute)
    BPL $19              ; 10 19 | Branch if positive
    ORA $7162,Y          ; 19 62 71 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    ADC ($90,X)          ; 61 90 | Add with carry ((zero page,X))
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0BA
; Address: $E1AF06
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0BA:
    BMI $B0              ; 30 B0 | Branch if negative
    BPL $D0              ; 10 D0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    STY $0F07            ; 8C 07 0F | Store Y register to absolute address
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0BB
; Address: $E1AF19
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0BB:
    JSR $30CF            ; 20 CF 30 | Jump to subroutine
    STA $B84770          ; 8F 70 47 B8 | Store accumulator to absolute long address
    BEQ $FE              ; F0 FE | Branch if equal
    BMI $EF              ; 30 EF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    BVS $8F              ; 70 8F | Branch if overflow set
    STZ $9F              ; 64 9F | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 82 FF 07 | Load from absolute long,X into accumulator
    INC $2F0F,X          ; FE 0F 2F | Increment (absolute,X)
    STA $8F9F8F          ; 8F 8F 9F 8F | Store accumulator to absolute long address
    STA $80              ; 85 80 | Store accumulator to zero page
    EOR $82              ; 45 82 | Exclusive OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    STA $CF0707          ; 8F 07 07 CF | Store accumulator to absolute long address
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    STA $070000          ; 8F 00 00 07 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0BC
; Address: $E1AF66
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0BC:
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STX $FF              ; 86 FF | Store X register to zero page
    STX $1EFF            ; 8E FF 1E | Store X register to absolute address
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    SBC $F9FB,X          ; FD FB F9 | Subtract with carry (absolute,X)
    BIT #$06             ; 89 06 | Test bits in accumulator (immediate)
    STA ($0E),Y          ; 91 0E | Store accumulator to (zero page),Y
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    SBC ($1B),Y          ; F1 1B | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BMI $FF              ; 30 FF | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    BMI $FB              ; 30 FB | Branch if negative
    BMI $FB              ; 30 FB | Branch if negative
    BVS $EF              ; 70 EF | Branch if overflow set
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    EOR #$75             ; 49 75 | Exclusive OR with accumulator (immediate)
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0BE
; Address: $E1AFCC
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0BE:
    LDY #$27             ; A0 27 | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    SEC                  ; 38 | Set carry flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    LDY $7E01,X          ; BC 01 7E | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    BNE $FF              ; D0 FF | Branch if not equal
    BRA $FF              ; 80 FF | Branch always
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $FEC0,X          ; FE C0 FE | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0BF
; Address: $E1B035
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0BF:
    INC $3FC1,X          ; FE C1 3F | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    ORA $1D19,Y          ; 19 19 1D | Logical OR with accumulator (absolute,Y)
    ORA $8C0C,X          ; 1D 0C 8C | Logical OR with accumulator (absolute,X)
    CPY $06              ; C4 06 | Compare Y register (zero page)
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $03              ; C6 03 | Decrement (zero page)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STA $788F78          ; 8F 78 8F 78 | Store accumulator to absolute long address
    BVS $F2              ; 70 F2 | Branch if overflow set
    BEQ $F2              ; F0 F2 | Branch if equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0C0
; Address: $E1B06C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0C0:
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($3B,X)          ; 01 3B | Logical OR with accumulator ((zero page,X))
    BRA $BF              ; 80 BF | Branch always
    INC $FE              ; E6 FE | Increment (zero page)
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CMP $DF22,X          ; DD 22 DF | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0C1
; Address: $E1B097
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0C1:
    JSR $10EF            ; 20 EF 10 | Jump to subroutine
    ASL $E7              ; 06 E7 | Arithmetic shift left (zero page)
    ASL $1FEE            ; 0E EE 1F | Arithmetic shift left (absolute)
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    INC $FF80,X          ; FE 80 FF | Increment (absolute,X)
    INC $C1FF,X          ; FE FF C1 | Increment (absolute,X)
    ROL $7D82,X          ; 3E 82 7D | Rotate left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    BVC $59              ; 50 59 | Branch if overflow clear
    BEQ $F0              ; F0 F0 | Branch if equal
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $FEA6,Y          ; 59 A6 FE | Exclusive OR with accumulator (absolute,Y)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STA $ABA8,X          ; 9D A8 AB | Store accumulator to absolute,X
    BEQ $F7              ; F0 F7 | Branch if equal
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0C2
; Address: $E1B0F0
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0C2:
    BCC $6F              ; 90 6F | Branch if carry clear
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($E2,X)          ; E1 E2 | Subtract with carry ((zero page,X))
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    CPY $78F2            ; CC F2 78 | Compare Y register (absolute)
    CPX $30              ; E4 30 | Compare X register (zero page)
    PEA #$7C00           ; F4 00 7C | Push effective address to stack
    SBC ($F3),Y          ; F1 F3 | Subtract with carry ((zero page),Y)
    SBC ($FB),Y          ; F1 FB | Subtract with carry ((zero page),Y)
    AND ($6F),Y          ; 31 6F | Logical AND with accumulator ((zero page),Y)
    ORA #$7F             ; 09 7F | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    CMP #$80             ; C9 80 | Compare accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    BNE $10              ; D0 10 | Branch if not equal
    ORA #$75             ; 09 75 | Logical OR with accumulator (immediate)
    SBC ($A1),Y          ; F1 A1 | Subtract with carry ((zero page),Y)
    EOR $2001,Y          ; 59 01 20 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0C3
; Address: $E1B16D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0C3:
    JSR $F9F8            ; 20 F8 F9 | Jump to subroutine
    BPL $2F              ; 10 2F | Branch if positive
    CPY #$37             ; C0 37 | Compare Y register (immediate)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    AND $A502,X          ; 3D 02 A5 | Logical AND with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $83              ; 24 83 | Test bits in accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($E7,X)          ; E1 E7 | Subtract with carry ((zero page,X))
    ADC ($67,X)          ; 61 67 | Add with carry ((zero page,X))
    SBC ($EF,X)          ; E1 EF | Subtract with carry ((zero page,X))
    STA $073F03          ; 8F 03 3F 07 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0C4
; Address: $E1B199
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0C4:
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    SBC $F880,Y          ; F9 80 F8 | Subtract with carry (absolute,Y)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    ASL $1FE1,X          ; 1E E1 1F | Arithmetic shift left (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $F000,X          ; FE 00 F0 | Increment (absolute,X)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BPL $90              ; 10 90 | Branch if positive
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    INC $F801,X          ; FE 01 F8 | Increment (absolute,X)
    INC $F000,X          ; FE 00 F0 | Increment (absolute,X)
    BCS $4F              ; B0 4F | Branch if carry set
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SBC $FBF9,Y          ; F9 F9 FB | Subtract with carry (absolute,Y)
    CMP $FFFB,Y          ; D9 FB FF | Compare accumulator (absolute,Y)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$7B             ; C0 7B | Compare Y register (immediate)
    STY $00              ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0C5
; Address: $E1B265
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0C5:
    ADC $8686,Y          ; 79 86 86 | Add with carry (absolute,Y)
    AND $2739,Y          ; 39 39 27 | Logical AND with accumulator (absolute,Y)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    STA                  ; 9F E0 E7 E1 | Store accumulator to absolute long,X
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BRA $01              ; 80 01 | Branch always
    INC $F00F,X          ; FE 0F F0 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    JMP $03FC            ; 4C FC 03 | Jump to address
    CLI                  ; 58 | Clear interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    BRA $F8              ; 80 F8 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FCC0,X          ; FE C0 FC | Increment (absolute,X)
    SBC ($FD),Y          ; F1 FD | Subtract with carry ((zero page),Y)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    SBC ($F7),Y          ; F1 F7 | Subtract with carry ((zero page),Y)
    BCS $B3              ; B0 B3 | Branch if carry set
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$01             ; E0 01 | Compare X register (immediate)
    INC $F807,X          ; FE 07 F8 | Increment (absolute,X)
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    INC $FEF0,X          ; FE F0 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC ($FD),Y          ; F1 FD | Subtract with carry ((zero page),Y)
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0C6
; Address: $E1B382
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0C6:
    ASL $E7              ; 06 E7 | Arithmetic shift left (zero page)
    ASL $3ECE            ; 0E CE 3E | Arithmetic shift left (absolute)
    ROL $FFFC,X          ; 3E FC FF | Rotate left (absolute,X)
    SBC #$FD             ; E9 FD | Subtract with carry (immediate)
    CPX $EC              ; E4 EC | Compare X register (zero page)
    LDY #$A7             ; A0 A7 | Load immediate value into Y register
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SBC $F906,X          ; FD 06 F9 | Subtract with carry (absolute,X)
    CPX #$3D             ; E0 3D | Compare X register (immediate)
    REP #$6C             ; C2 6C | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA                  ; BF 51 F7 03 | Load from absolute long,X into accumulator
    STA                  ; 9F FF E0 E0 | Store accumulator to absolute long,X
    CPX #$EE             ; E0 EE | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    LDY $6897            ; AC 97 68 | Load from absolute address into Y register
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CMP #$F9             ; C9 F9 | Compare accumulator (immediate)
    ADC #$EF             ; 69 EF | Add with carry (immediate)
    ROR $296E            ; 6E 6E 29 | Rotate right (absolute)
    AND $FB2B,Y          ; 39 2B FB | Logical AND with accumulator (absolute,Y)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    SBC $0F0F,X          ; FD 0F 0F | Subtract with carry (absolute,X)
    SBC $FF06,Y          ; F9 06 FF | Subtract with carry (absolute,Y)
    BRA $3F              ; 80 3F | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA $03F2            ; 0D F2 03 | Logical OR with accumulator (absolute)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0C7
; Address: $E1B3EB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0C7:
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    STA $7F8070          ; 8F 70 80 7F | Store accumulator to absolute long address
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BRA $9F              ; 80 9F | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0C8
; Address: $E1B41B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0C8:
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    INC $1C00,X          ; FE 00 1C | Increment (absolute,X)
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0C9
; Address: $E1B42C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0C9:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $F9              ; 10 F9 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL $00FF,X          ; 1E FF 00 | Arithmetic shift left (absolute,X)
    BVS $70              ; 70 70 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1A1A            ; 0E 1A 1A | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    STA $FF87FF          ; 8F FF 87 FF | Store accumulator to absolute long address
    BRA $FF              ; 80 FF | Branch always
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    WDM #$C0             ; 42 C0 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    WDM #$60             ; 42 60 | Reserved instruction

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0CA
; Address: $E1B46E
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0CA:
    JSR $0322            ; 20 22 03 | Jump to subroutine
    SEP #$FD             ; E2 FD | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF E0 3F E6 | Load from absolute long,X into accumulator
    AND $3FE0,Y          ; 39 E0 3F | Logical AND with accumulator (absolute,Y)
    ORA $1FF0,X          ; 1D F0 1F | Logical OR with accumulator (absolute,X)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    STA $F97773          ; 8F 73 77 F9 | Store accumulator to absolute long address
    BEQ $E1              ; F0 E1 | Branch if equal
    INC $F807,X          ; FE 07 F8 | Increment (absolute,X)
    BEQ $01              ; F0 01 | Branch if equal
    INC $FC03,X          ; FE 03 FC | Increment (absolute,X)
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $3F              ; 80 3F | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0CC
; Address: $E1B4C4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0CC:
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    STA ($87,X)          ; 81 87 | Store accumulator to (zero page,X)
    STA ($9F,X)          ; 81 9F | Store accumulator to (zero page,X)
    STA                  ; 9F 07 1F 07 | Store accumulator to absolute long,X
    SBC ($1E),Y          ; F1 1E | Subtract with carry ((zero page),Y)
    SBC ($1E),Y          ; F1 1E | Subtract with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $DF              ; 70 DF | Branch if overflow set

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0CD
; Address: $E1B4DD
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0CD:
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$81             ; E0 81 | Compare X register (immediate)
    SBC ($83),Y          ; F1 83 | Subtract with carry ((zero page),Y)
    CPX $04              ; E4 04 | Compare X register (zero page)
    CPY $0C              ; C4 0C | Compare Y register (zero page)
    STY $0404            ; 8C 04 04 | Store Y register to absolute address
    ASL $3CC7,X          ; 1E C7 3C | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    STA $F01F78          ; 8F 78 1F F0 | Store accumulator to absolute long address
    BEQ $3F              ; F0 3F | Branch if equal
    BEQ $E3              ; F0 E3 | Branch if equal
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    SBC ($FD),Y          ; F1 FD | Subtract with carry ((zero page),Y)
    BRA $F8              ; 80 F8 | Branch always
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    STA $800FF0          ; 8F F0 0F 80 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    STA ($97),Y          ; 91 97 | Store accumulator to (zero page),Y
    BCC $97              ; 90 97 | Branch if carry clear
    BNE $D3              ; D0 D3 | Branch if not equal
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    SBC ($80,X)          ; E1 80 | Subtract with carry ((zero page,X))
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STY $BF              ; 84 BF | Store Y register to zero page
    BRA $BF              ; 80 BF | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    ROL $04C1,X          ; 3E C1 04 | Rotate left (absolute,X)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    ASL $FBE1,X          ; 1E E1 FB | Arithmetic shift left (absolute,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BRA $1F              ; 80 1F | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    BRA $87              ; 80 87 | Branch always
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    STA                  ; 9F 86 79 00 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0CF
; Address: $E1B59E
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0CF:
    JSR $03FF            ; 20 FF 03 | Jump to subroutine
    ASL $1ECE            ; 0E CE 1E | Arithmetic shift left (absolute)
    STA                  ; 9F 1C DE 18 | Store accumulator to absolute long,X
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    STX $0C71            ; 8E 71 0C | Store X register to absolute address
    BEQ $1B              ; F0 1B | Branch if equal
    CPX $3C              ; E4 3C | Compare X register (zero page)
    LDY $9F1F,X          ; BC 1F 9F | Load from absolute,X into Y register
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA $3B38,Y          ; 19 38 3B | Logical OR with accumulator (absolute,Y)
    BEQ $F3              ; F0 F3 | Branch if equal
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    STA $0FF0FF          ; 8F FF F0 0F | Store accumulator to absolute long address
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0D0
; Address: $E1B60A
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0D0:
    PLY                  ; 7A | Pull Y register from stack
    INC $6A2A,X          ; FE 2A 6A | Increment (absolute,X)
    STY $F88C            ; 8C 8C F8 | Store Y register to absolute address
    SBC $FE06,Y          ; F9 06 FE | Subtract with carry (absolute,Y)
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    ORA ($CE),Y          ; 11 CE | Logical OR with accumulator ((zero page),Y)
    AND ($FC),Y          ; 31 FC | Logical AND with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $7EED            ; EC ED 7E | Compare X register (absolute)
    ROR $3E3E,X          ; 7E 3E 3E | Rotate right (absolute,X)
    ASL $004E            ; 0E 4E 00 | Arithmetic shift left (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0D1
; Address: $E1B634
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0D1:
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0D2
; Address: $E1B63F
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0D2:
    STA                  ; 9F 32 32 2E | Store accumulator to absolute long,X
    ROL $3C24,X          ; 3E 24 3C | Rotate left (absolute,X)
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CLV                  ; B8 | Clear overflow flag
    SBC $F928,Y          ; F9 28 F9 | Subtract with carry (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    SBC $FCCC,Y          ; F9 CC FC | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    INC $1B              ; E6 1B | Increment (zero page)
    LDY $3C47,X          ; BC 47 3C | Load from absolute,X into Y register
    INC $0113            ; EE 13 01 | Increment (absolute)
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$05             ; C0 05 | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    BRA $0F              ; 80 0F | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $F8              ; 80 F8 | Branch always
    INC $FEF0,X          ; FE F0 FE | Increment (absolute,X)
    BRA $FC              ; 80 FC | Branch always
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    BEQ $FE              ; F0 FE | Branch if equal
    INC $E001,X          ; FE 01 E0 | Game work RAM access
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SBC $F907,Y          ; F9 07 F9 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BMI $30              ; 30 30 | Branch if negative
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    INC $7EC7,X          ; FE C7 7E | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STX $DF00            ; 8E 00 DF | Store X register to absolute address
    ASL $FFFF            ; 0E FF FF | Arithmetic shift left (absolute)
    INC $30FF,X          ; FE FF 30 | Increment (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    STX $79              ; 86 79 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0D3
; Address: $E1B6D8
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0D3:
    STA                  ; 9F 60 FF 00 | Store accumulator to absolute long,X
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    SBC ($1C,X)          ; E1 1C | Subtract with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    ROL $7E00,X          ; 3E 00 7E | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    STA ($07,X)          ; 81 07 | Store accumulator to (zero page,X)
    AND $31C7,Y          ; 39 C7 31 | Logical AND with accumulator (absolute,Y)
    INC $F87F,X          ; FE 7F F8 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    STX $A68E            ; 8E 8E A6 | Store X register to absolute address
    LDX $EBC3,Y          ; BE C3 EB | Load from absolute,Y into X register
    ORA $CF              ; 05 CF | Logical OR with accumulator (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FEF3,X          ; FE F3 FE | Increment (absolute,X)
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    ORA $24DB,Y          ; 19 DB 24 | Logical OR with accumulator (absolute,Y)
    AND $1FC2,X          ; 3D C2 1F | Logical AND with accumulator (absolute,X)
    STA                  ; 9F 0C 8C 04 | Store accumulator to absolute long,X
    CPX $06              ; E4 06 | Compare X register (zero page)
    INC $03              ; E6 03 | Increment (zero page)
    STX $86              ; 86 86 | Store X register to zero page
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $CF              ; F0 CF | Branch if equal
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    INC $FF79,X          ; FE 79 FF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BNE $FF              ; D0 FF | Branch if not equal
    INC $80FF,X          ; FE FF 80 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $BF              ; 80 BF | Branch always
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    INC $E03F,X          ; FE 3F E0 | Game work RAM access
    BRA $FF              ; 80 FF | Branch always
    CPX #$03             ; E0 03 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0D4
; Address: $E1B7C0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0D4:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $E6              ; 06 E6 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    STA $007F            ; 8D 7F 00 | Store accumulator to absolute address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0D5
; Address: $E1B7EF
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0D5:
    CPX $00FF            ; EC FF 00 | Compare X register (absolute)
    BPL $D7              ; 10 D7 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $75              ; 45 75 | Exclusive OR with accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    SBC $F3F0,X          ; FD F0 F3 | Subtract with carry (absolute,X)
    BRA $CF              ; 80 CF | Branch always
    SBC $FDFC,X          ; FD FC FD | Subtract with carry (absolute,X)
    STX $778E            ; 8E 8E 77 | Store X register to absolute address
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BCC $1F              ; 90 1F | Branch if carry clear
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    LDY $9C90,X          ; BC 90 9C | Load from absolute,X into Y register
    DEC $7E7C,X          ; DE 7C 7E | Decrement (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    ROL $1E1A            ; 2E 1A 1E | Rotate left (absolute)
    ASL $DE1E,X          ; 1E 1E DE | Arithmetic shift left (absolute,X)
    INC $FF03,X          ; FE 03 FF | Increment (absolute,X)
    ORA $81FF            ; 0D FF 81 | Logical OR with accumulator (absolute)
    SBC $7BC3,X          ; FD C3 7B | Subtract with carry (absolute,X)
    SBC $3F              ; E5 3F | Subtract with carry (zero page)
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    BRA $3F              ; 80 3F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0D6
; Address: $E1B877
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0D6:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP #$3E             ; C9 3E | Compare accumulator (immediate)
    ORA $3CF6,X          ; 1D F6 3C | Logical OR with accumulator (absolute,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    BEQ $01              ; F0 01 | Branch if equal
    SBC ($07,X)          ; E1 07 | Subtract with carry ((zero page,X))
    ORA $0A0D            ; 0D 0D 0A | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    INC $F001,X          ; FE 01 F0 | Increment (absolute,X)
    STA $F80F7E          ; 8F 7E 0F F8 | Store accumulator to absolute long address
    ORA $78F2,X          ; 1D F2 78 | Logical OR with accumulator (absolute,X)
    BRA $1B              ; 80 1B | Branch always
    ASL $4C1E,X          ; 1E 1E 4C | Arithmetic shift left (absolute,X)
    JMP $84B4            ; 4C B4 84 | Jump to address
    DEC                  ; 3A | Decrement accumulator
    EOR #$48             ; 49 48 | Exclusive OR with accumulator (immediate)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    BCS $87              ; B0 87 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    STY $42              ; 84 42 | Hardware register operation
    STA $78              ; 85 78 | Store accumulator to zero page
    STX $3A              ; 86 3A | Store X register to zero page
    CPY $C6              ; C4 C6 | Compare Y register (zero page)
    ORA $F01D,Y          ; 19 1D F0 | Logical OR with accumulator (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    CPY $F3              ; C4 F3 | Compare Y register (zero page)
    ROL $CC3F,X          ; 3E 3F CC | Rotate left (absolute,X)
    CPY $6060            ; CC 60 60 | Compare Y register (absolute)
    INC $FDC1,X          ; FE C1 FD | Increment (absolute,X)
    SBC $F606,Y          ; F9 06 F6 | Subtract with carry (absolute,Y)
    ORA #$CB             ; 09 CB | Logical OR with accumulator (immediate)
    BMI $FF              ; 30 FF | Branch if negative
    ROR $129F,X          ; 7E 9F 12 | Rotate right (absolute,X)
    STA $73016F          ; 8F 6F 01 73 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0D8
; Address: $E1B931
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0D8:
    JSR $502F            ; 20 2F 50 | Jump to subroutine
    JMP $00FF            ; 4C FF 00 | Jump to address
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STA $FC03F0          ; 8F F0 03 FC | Store accumulator to absolute long address
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    BMI $3B              ; 30 3B | Branch if negative
    BNE $F0              ; D0 F0 | Branch if not equal
    BVC $D6              ; 50 D6 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0DA
; Address: $E1B955
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0DA:
    JSR $04FB            ; 20 FB 04 | Jump to subroutine
    BEQ $0F              ; F0 0F | Branch if equal
    AND #$7D             ; 29 7D | Logical AND with accumulator (immediate)
    BIT $33D3            ; 2C D3 33 | Test bits in accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0DB
; Address: $E1B966
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0DB:
    CMP $69DB,Y          ; D9 DB 69 | Compare accumulator (absolute,Y)
    SBC $6F69,Y          ; F9 69 6F | Subtract with carry (absolute,Y)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    ORA ($FB),Y          ; 11 FB | Logical OR with accumulator ((zero page),Y)
    SBC $6F06,Y          ; F9 06 6F | Subtract with carry (absolute,Y)
    BCC $81              ; 90 81 | Branch if carry clear
    ROR $7F80,X          ; 7E 80 7F | Rotate right (absolute,X)
    BRA $8F              ; 80 8F | Branch always
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0DC
; Address: $E1B98E
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0DC:
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    INC $C03F,X          ; FE 3F C0 | Increment (absolute,X)
    BEQ $80              ; F0 80 | Branch if equal
    SEC                  ; 38 | Set carry flag
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CPY #$F2             ; C0 F2 | Compare Y register (immediate)
    INC $FD81,X          ; FE 81 FD | Increment (absolute,X)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    BCS $FC              ; B0 FC | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF F8 07 80 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0DD
; Address: $E1B9BB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0DD:
    STA                  ; 9F FE 01 FF | Store accumulator to absolute long,X
    BEQ $FC              ; F0 FC | Branch if equal
    SBC ($F8),Y          ; F1 F8 | Subtract with carry ((zero page),Y)
    CPY $FFFC            ; CC FC FF | Compare Y register (absolute)
    PEA #$36FF           ; F4 FF 36 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0DE
; Address: $E1B9D1
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0DE:
    STY $C836            ; 8C 36 C8 | Store Y register to absolute address
    BPL $3F              ; 10 3F | Branch if positive
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    CPY $13              ; C4 13 | Compare Y register (zero page)
    EOR ($CD),Y          ; 51 CD | Exclusive OR with accumulator ((zero page),Y)
    CPX #$EE             ; E0 EE | Compare X register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA                  ; BF 5D 5F 2E | Load from absolute long,X into accumulator
    CMP ($57),Y          ; D1 57 | Compare accumulator ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY $8A65            ; CC 65 8A | Compare Y register (absolute)
    ORA $04FB            ; 0D FB 04 | Logical OR with accumulator (absolute)
    LDA                  ; BF 40 DF 20 | Load from absolute long,X into accumulator
    SBC ($F7),Y          ; F1 F7 | Subtract with carry ((zero page),Y)
    BMI $33              ; 30 33 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    SBC $DC5C,Y          ; F9 5C DC | Subtract with carry (absolute,Y)
    ROL $E6EE            ; 2E EE E6 | Rotate left (absolute)
    INC $86              ; E6 86 | Increment (zero page)
    STX $03              ; 86 03 | Store X register to zero page
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    CLI                  ; 58 | Clear interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    STY $8000            ; 8C 00 80 | Store Y register to absolute address
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC ($80),Y          ; F1 80 | Subtract with carry ((zero page),Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STX $C07F            ; 8E 7F C0 | Store X register to absolute address
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($35,X)          ; 01 35 | Logical OR with accumulator ((zero page,X))
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0DF
; Address: $E1BA87
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0DF:
    BMI $20              ; 30 20 | Branch if negative
    BMI $0F              ; 30 0F | Branch if negative
    STY $70              ; 84 70 | Store Y register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    PEA #$F4CA           ; F4 CA F4 | Push effective address to stack
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    BEQ $31              ; F0 31 | Branch if equal
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack
    AND ($4E,X)          ; 21 4E | Logical AND with accumulator ((zero page,X))
    INC $4BB4,X          ; FE B4 4B | Increment (absolute,X)
    STY $84              ; 84 84 | Store Y register to zero page
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    JMP $004C            ; 4C 4C 00 | Jump to address
    STY $07              ; 84 07 | Store Y register to zero page
    BRA $B4              ; 80 B4 | Branch always
    ORA ($84,X)          ; 01 84 | Logical OR with accumulator ((zero page,X))
    BMI $CE              ; 30 CE | Branch if negative
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    BRA $83              ; 80 83 | Branch always
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    STA $7E029F          ; 8F 9F 02 7E | Store accumulator to absolute long address
    ASL $207E,X          ; 1E 7E 20 | Arithmetic shift left (absolute,X)
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    STA $7C8370          ; 8F 70 83 7C | Store accumulator to absolute long address
    STA                  ; 9F 60 0E F1 | Store accumulator to absolute long,X
    ROR $0781,X          ; 7E 81 07 | Rotate right (absolute,X)
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    STY $E2              ; 84 E2 | Store Y register to zero page
    LDY #$49             ; A0 49 | Load immediate value into Y register
    ORA #$AB             ; 09 AB | Logical OR with accumulator (immediate)
    BIT #$86             ; 89 86 | Test bits in accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$39             ; C0 39 | Compare Y register (immediate)
    SBC #$10             ; E9 10 | Subtract with carry (immediate)
    DEY                  ; 88 | Decrement Y register
    BVS $0F              ; 70 0F | Branch if overflow set
    BCS $00              ; B0 00 | Branch if carry set
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $0F              ; 10 0F | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0E2
; Address: $E1BB12
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0E2:
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 03 | Load from absolute long,X into accumulator
    STA $340EF1          ; 8F F1 0E 34 | Store accumulator to absolute long address
    ROL $9C0C,X          ; 3E 0C 9C | Rotate left (absolute,X)
    ASL $03EE            ; 0E EE 03 | Arithmetic shift left (absolute)
    INY                  ; C8 | Increment Y register
    CPX $F00F            ; EC 0F F0 | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    STA ($99,X)          ; 81 99 | Store accumulator to (zero page,X)
    BRA $8E              ; 80 8E | Branch always
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0E4
; Address: $E1BB4C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0E4:
    CLV                  ; B8 | Clear overflow flag
    BEQ $F3              ; F0 F3 | Branch if equal
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF E0 EF E0 | Load from absolute long,X into accumulator
    INC $00              ; E6 00 | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    REP #$3D             ; C2 3D | Reset processor status bits
    ORA ($EF),Y          ; 11 EF | Logical OR with accumulator ((zero page),Y)
    ROL $FE03,X          ; 3E 03 FE | Rotate left (absolute,X)
    INC $FF07,X          ; FE 07 FF | Increment (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0E6
; Address: $E1BB8C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0E6:
    AND $0339,Y          ; 39 39 03 | Logical AND with accumulator (absolute,Y)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $87              ; F0 87 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FF07,X          ; FE 07 FF | Increment (absolute,X)
    CPX $CCFC            ; EC FC CC | Compare X register (absolute)
    SBC $C948            ; ED 48 C9 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0E7
; Address: $E1BBA6
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0E7:
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    XBA                  ; EB | Exchange accumulator bytes
    CPX $ACFD            ; EC FD AC | Compare X register (absolute)
    SBC $07F8            ; ED F8 07 | Subtract with carry (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BVS $8F              ; 70 8F | Branch if overflow set
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    BEQ $0F              ; F0 0F | Branch if equal
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $1F              ; 80 1F | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $FC              ; 80 FC | Branch always
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page
    INC $F000,X          ; FE 00 F0 | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    BMI $CF              ; 30 CF | Branch if negative
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BVS $71              ; 70 71 | Branch if overflow set
    BVS $74              ; 70 74 | Branch if overflow set
    BRA $88              ; 80 88 | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $F88F,X          ; FE 8F F8 | Increment (absolute,X)
    STA $C07FF0          ; 8F F0 7F C0 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    ROR $7E3E,X          ; 7E 3E 7E | Rotate right (absolute,X)
    BPL $FE              ; 10 FE | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0E8
; Address: $E1BC68
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0E8:
    CLC                  ; 18 | Clear carry flag
    STA                  ; 9F 4F CF F3 | Store accumulator to absolute long,X
    BMI $CF              ; 30 CF | Branch if negative
    ROR $3C81,X          ; 7E 81 3C | Rotate right (absolute,X)
    ROR $FE81,X          ; 7E 81 FE | Rotate right (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ADC #$00             ; 69 00 | Add with carry (immediate)
    BPL $10              ; 10 10 | Branch if positive
    LDA                  ; BF 3F BF 30 | Load from absolute long,X into accumulator
    BCS $07              ; B0 07 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    BCC $06              ; 90 06 | Branch if carry clear
    LDA $3F46,Y          ; B9 46 3F | Load from absolute,Y into accumulator
    CPY #$1E             ; C0 1E | Compare Y register (immediate)
    SBC ($10,X)          ; E1 10 | Subtract with carry ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0E9
; Address: $E1BCA4
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0E9:
    BRA $81              ; 80 81 | Branch always
    SBC ($E7,X)          ; E1 E7 | Subtract with carry ((zero page,X))
    STA $003F00          ; 8F 00 3F 00 | Store accumulator to absolute long address
    CPY #$F3             ; C0 F3 | Compare Y register (immediate)
    BCC $2F              ; 90 2F | Branch if carry clear
    STA ($0E),Y          ; 91 0E | Store accumulator to (zero page),Y
    BNE $2F              ; D0 2F | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $71              ; F0 71 | Branch if equal
    STX $1FE0            ; 8E E0 1F | Store X register to absolute address
    BVS $E0              ; 70 E0 | Game work RAM access
    BEQ $FE              ; F0 FE | Branch if equal
    STZ $0800            ; 9C 00 08 | Store zero to absolute
    BMI $CF              ; 30 CF | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    LDA $0147,Y          ; B9 47 01 | Load from absolute,Y into accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ADC $977D,X          ; 7D 7D 97 | Add with carry (absolute,X)
    STA                  ; 9F A5 B7 A1 | Store accumulator to absolute long,X
    LDA $00              ; A5 00 | Load from zero page into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    ORA $6E1B,Y          ; 19 1B 6E | Logical OR with accumulator (absolute,Y)
    LDA ($E1,X)          ; A1 E1 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0EA
; Address: $E1BD08
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0EA:
    JSR $3CA0            ; 20 A0 3C | Jump to subroutine
    SBC $FEE6,X          ; FD E6 FE | Subtract with carry (absolute,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    LDA                  ; BF 40 3F C0 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0EB
; Address: $E1BD1F
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0EB:
    PHP                  ; 08 | Push processor status to stack
    LDA $F5E4,X          ; BD E4 F5 | Load from absolute,X into accumulator
    CPY $4CED            ; CC ED 4C | Compare Y register (absolute)
    CMP $7606            ; CD 06 76 | Compare accumulator (absolute)
    LDX $D6BE,Y          ; BE BE D6 | Load from absolute,Y into X register
    DEC $1616,X          ; DE 16 16 | Decrement (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    LDY $FC43,X          ; BC 43 FC | Load from absolute,X into Y register
    PEA #$0F0B           ; F4 0B 0F | Push effective address to stack
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    ROL $FD01,X          ; 3E 01 FD | Rotate left (absolute,X)
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    ROL $7EC1,X          ; 3E C1 7E | Rotate left (absolute,X)
    STA ($10,X)          ; 81 10 | Store accumulator to (zero page,X)
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0EC
; Address: $E1BD5F
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0EC:
    STA                  ; 9F 87 FF 03 | Store accumulator to absolute long,X
    BEQ $F3              ; F0 F3 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    JMP $FFCD            ; 4C CD FF | Jump to address
    SEC                  ; 38 | Set carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $F0              ; 80 F0 | Branch always
    STA $00FF70          ; 8F 70 FF 00 | Store accumulator to absolute long address
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $FB              ; 80 FB | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $07              ; F0 07 | Branch if equal
    LDA                  ; BF 38 38 E8 | Load from absolute long,X into accumulator
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0ED
; Address: $E1BDEE
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0ED:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $64              ; 80 64 | Branch always
    ASL $02FF            ; 0E FF 02 | Arithmetic shift left (absolute)
    BRA $8F              ; 80 8F | Branch always
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    BEQ $F3              ; F0 F3 | Branch if equal
    ROL $FE3E,X          ; 3E 3E FE | Rotate left (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    BRA $0F              ; 80 0F | Branch always
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    SBC ($C0),Y          ; F1 C0 | Subtract with carry ((zero page),Y)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    CPY #$E7             ; C0 E7 | Compare Y register (immediate)
    BRA $E3              ; 80 E3 | Branch always
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    INC $E0FF,X          ; FE FF E0 | Game work RAM access
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    INC $E301,X          ; FE 01 E3 | Increment (absolute,X)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    SBC ($F9,X)          ; E1 F9 | Subtract with carry ((zero page,X))
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    INC $6E93,X          ; FE 93 6E | Increment (absolute,X)
    ASL $3EC3            ; 0E C3 3E | Arithmetic shift left (absolute)
    ASL $FE03            ; 0E 03 FE | Arithmetic shift left (absolute)
    ROL $7C87,X          ; 3E 87 7C | Rotate left (absolute,X)
    SBC ($F9,X)          ; E1 F9 | Subtract with carry ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    CMP #$E9             ; C9 E9 | Compare accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0EE
; Address: $E1BE8A
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0EE:
    DEC $B2FE            ; CE FE B2 | Decrement (absolute)
    SBC $FF06,Y          ; F9 06 FF | Subtract with carry (absolute,Y)
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    BMI $FE              ; 30 FE | Branch if negative
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 40 5C DC | Load from absolute long,X into accumulator
    BVS $71              ; 70 71 | Branch if overflow set
    CLI                  ; 58 | Clear interrupt disable flag
    ADC $D818,Y          ; 79 18 D8 | Add with carry (absolute,Y)
    INC                  ; 1A | Increment accumulator
    ROR $FB7B,X          ; 7E 7B FB | Rotate right (absolute,X)
    CPX $DEEC            ; EC EC DE | Compare X register (absolute)
    DEC $1F27,X          ; DE 27 1F | Decrement (absolute,X)
    SBC ($7F,X)          ; E1 7F | Subtract with carry ((zero page,X))
    BRA $FB              ; 80 FB | Branch always
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $83              ; 80 83 | Branch always
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    INC $FCF3,X          ; FE F3 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BVS $73              ; 70 73 | Branch if overflow set
    BPL $13              ; 10 13 | Branch if positive
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$83             ; E0 83 | Compare X register (immediate)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    LDA $79FE,Y          ; B9 FE 79 | Load from absolute,Y into accumulator
    STX $8E79            ; 8E 79 8E | Store X register to absolute address
    ROL $0E3E,X          ; 3E 3E 0E | Rotate left (absolute,X)
    ASL $0F0F            ; 0E 0F 0F | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ORA $1A6D            ; 0D 6D 1A | Logical OR with accumulator (absolute)
    BEQ $FA              ; F0 FA | Branch if equal
    CPX #$F1             ; E0 F1 | Compare X register (immediate)
    CPY #$EE             ; C0 EE | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0EF
; Address: $E1BF55
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0EF:
    BEQ $0A              ; F0 0A | Branch if equal
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    INC $CB11            ; EE 11 CB | Increment (absolute)
    JMP $FC4D            ; 4C 4D FC | Jump to address
    SBC $FCDC,X          ; FD DC FC | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F4              ; F0 F4 | Branch if equal
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    BRA $B0              ; 80 B0 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CMP $E127,Y          ; D9 27 E1 | Compare accumulator (absolute,Y)
    STA $7B              ; 85 7B | Store accumulator to zero page
    BIT #$77             ; 89 77 | Test bits in accumulator (immediate)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0F0
; Address: $E1BF84
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0F0:
    JSR $7C20            ; 20 20 7C | Jump to subroutine
    CPY $98CC            ; CC CC 98 | Compare Y register (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $91              ; 90 91 | Branch if carry clear
    LDY #$A3             ; A0 A3 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0F1
; Address: $E1BF94
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0F1:
    INC $FEDF,X          ; FE DF FE | Increment (absolute,X)
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ADC $7F7D,X          ; 7D 7D 7F | Add with carry (absolute,X)
    AND $393D,X          ; 3D 3D 39 | Logical AND with accumulator (absolute,X)
    AND $B430,Y          ; 39 30 B4 | Logical AND with accumulator (absolute,Y)
    STX $FE00            ; 8E 00 FE | Store X register to absolute address
    BEQ $19              ; F0 19 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $C101,X          ; FE 01 C1 | Increment (absolute,X)
    SBC $FE00,X          ; FD 00 FE | Subtract with carry (absolute,X)
    INC $C101,X          ; FE 01 C1 | Increment (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $83              ; 80 83 | Branch always
    BRA $9F              ; 80 9F | Branch always
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    INC $3F00,X          ; FE 00 3F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0F2
; Address: $E1C008
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0F2:
    BRA $9F              ; 80 9F | Branch always
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ASL $06F1            ; 0E F1 06 | Arithmetic shift left (absolute)
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    BRA $7F              ; 80 7F | Branch always
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0F4
; Address: $E1C02F
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0F4:
    JSR $F81F            ; 20 1F F8 | Jump to subroutine
    BEQ $7F              ; F0 7F | Branch if equal
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    STA $009F80          ; 8F 80 9F 00 | Store accumulator to absolute long address
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BCC $91              ; 90 91 | Branch if carry clear
    BPL $11              ; 10 11 | Branch if positive
    BPL $11              ; 10 11 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $0C0C,Y          ; 19 0C 0C | Logical OR with accumulator (absolute,Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SBC $F80E,Y          ; F9 0E F8 | Subtract with carry (absolute,Y)
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$8F             ; E0 8F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0F5
; Address: $E1C0BF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0F5:
    BEQ $81              ; F0 81 | Branch if equal
    LDA ($86,X)          ; A1 86 | Load from (zero page,X) into accumulator
    STX $1C              ; 86 1C | Store X register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0F7
; Address: $E1C0C8
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0F7:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    DEC $F81F,X          ; DE 1F F8 | Decrement (absolute,X)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    BVS $70              ; 70 70 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BEQ $1F              ; F0 1F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    STA ($8F,X)          ; 81 8F | Store accumulator to (zero page,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$8F             ; E0 8F | Compare X register (immediate)
    BEQ $C3              ; F0 C3 | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$87             ; C0 87 | Compare Y register (immediate)
    STA $108808          ; 8F 08 88 10 | Store accumulator to absolute long address
    BPL $30              ; 10 30 | Branch if positive
    BMI $FF              ; 30 FF | Branch if negative
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STA                  ; 9F 7F 9F 78 | Store accumulator to absolute long,X
    STA                  ; 9F 70 3F F0 | Store accumulator to absolute long,X
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $E70E            ; 0E 0E E7 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0F8
; Address: $E1C18A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0F8:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    SBC ($3E),Y          ; F1 3E | Subtract with carry ((zero page),Y)
    SBC $301E,Y          ; F9 1E 30 | Subtract with carry (absolute,Y)
    BMI $20              ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0F9
; Address: $E1C1C3
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0F9:
    JSR $4540            ; 20 40 45 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    WDM #$4F             ; 42 4F | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    BEQ $1F              ; F0 1F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STY $06              ; 84 06 | Store Y register to zero page
    INC $02              ; E6 02 | Increment (zero page)
    SEP #$04             ; E2 04 | Set processor status bits
    STY $CC              ; 84 CC | Store Y register to zero page
    CPY $C303            ; CC 03 C3 | Compare Y register (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STA $1CE778          ; 8F 78 E7 1C | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    BMI $9F              ; 30 9F | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $8703,X          ; FE 03 87 | Increment (absolute,X)
    STA                  ; 9F 87 9F 01 | Store accumulator to absolute long,X
    BVS $CF              ; 70 CF | Branch if overflow set
    BVS $C7              ; 70 C7 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F E0 81 FE | Store accumulator to absolute long,X
    CPX #$02             ; E0 02 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0FA
; Address: $E1C23D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0FA:
    SBC $C03F,X          ; FD 3F C0 | Subtract with carry (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $0F              ; 80 0F | Branch always
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0FB
; Address: $E1C282
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0FB:
    JSR $6022            ; 20 22 60 | Jump to subroutine
    ROR $40              ; 66 40 | Rotate right (zero page)
    LSR $CFC0            ; 4E C0 CF | Logical shift right (absolute)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0FC
; Address: $E1C28E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0FC:
    JSR $F923            ; 20 23 F9 | Jump to subroutine
    BEQ $1F              ; F0 1F | Branch if equal
    BEQ $1F              ; F0 1F | Branch if equal
    CPX $3B              ; E4 3B | Compare X register (zero page)
    CPX $3B              ; E4 3B | Compare X register (zero page)
    SBC ($1E),Y          ; F1 1E | Subtract with carry ((zero page),Y)
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0FD
; Address: $E1C2A4
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0FD:
    BVC $53              ; 50 53 | Branch if overflow clear
    BVS $73              ; 70 73 | Branch if overflow set
    BMI $33              ; 30 33 | Branch if negative
    BPL $93              ; 10 93 | Branch if positive
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F FB 8C F8 | Store accumulator to absolute long,X
    STA $39CE79          ; 8F 79 CE 39 | Store accumulator to absolute long address
    INC $FE19            ; EE 19 FE | Increment (absolute)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $0007,X          ; FE 07 00 | Increment (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $E03F,X          ; FE 3F E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    BRA $87              ; 80 87 | Branch always
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0FE
; Address: $E1C350
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0FE:
    SBC ($3E),Y          ; F1 3E | Subtract with carry ((zero page),Y)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ROL $FEC1,X          ; 3E C1 FE | Rotate left (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STY $84              ; 84 84 | Store Y register to zero page
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    ORA ($79,X)          ; 01 79 | Logical OR with accumulator ((zero page,X))
    CPY #$DC             ; C0 DC | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    INC $CE33,X          ; FE 33 CE | Increment (absolute,X)
    ORA $08E7,Y          ; 19 E7 08 | Logical OR with accumulator (absolute,Y)
    EOR ($4F,X)          ; 41 4F | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BRA $9C              ; 80 9C | Branch always
    CLC                  ; 18 | Clear carry flag
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    ASL $66              ; 06 66 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC $39              ; E6 39 | Increment (zero page)
    CPY $CB73            ; CC 73 CB | Compare Y register (absolute)
    INC $DCAF            ; EE AF DC | Increment (absolute)
    SED                  ; F8 | Set decimal mode flag
    BRA $C0              ; 80 C0 | Branch always
    BEQ $10              ; F0 10 | Branch if equal
    BRA $8C              ; 80 8C | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    ADC $3987,Y          ; 79 87 39 | Add with carry (absolute,Y)
    STA $C1E7,Y          ; 99 E7 C1 | Store accumulator to absolute,Y
    SBC ($7F,X)          ; E1 7F | Subtract with carry ((zero page,X))
    SBC ($3F),Y          ; F1 3F | Subtract with carry ((zero page),Y)
    BIT $283C            ; 2C 3C 28 | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ASL $191E,X          ; 1E 1E 19 | Arithmetic shift left (absolute,X)
    BMI $3A              ; 30 3A | Branch if negative
    INX                  ; E8 | Increment X register
    PLX                  ; FA | Pull X register from stack
    BPL $F3              ; 10 F3 | Branch if positive
    CPX #$E2             ; E0 E2 | Compare X register (immediate)
    BPL $FF              ; 10 FF | Branch if positive
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    SBC $FE02,X          ; FD 02 FE | Subtract with carry (absolute,X)
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA $7F76,X          ; 1D 76 7F | Logical OR with accumulator (absolute,X)
    LDX $F6BE            ; AE BE F6 | Load from absolute address into X register
    AND $FFAF            ; 2D AF FF | Logical AND with accumulator (absolute)
    ORA #$D3             ; 09 D3 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_0FF
; Address: $E1C3F7
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_0FF:
    BIT $10EF            ; 2C EF 10 | Test bits in accumulator (absolute)
    CPY #$ED             ; C0 ED | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $11              ; 10 11 | Branch if positive
    BMI $33              ; 30 33 | Branch if negative
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $000E,Y          ; F9 0E 00 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $3F              ; 80 3F | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    ASL $301E,X          ; 1E 1E 30 | Arithmetic shift left (absolute,X)
    BMI $40              ; 30 40 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $C7              ; 06 C7 | Arithmetic shift left (zero page)
    ASL $FFCE            ; 0E CE FF | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STX $3071            ; 8E 71 30 | Store X register to absolute address
    AND ($18),Y          ; 31 18 | Logical AND with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    LDY $94EC            ; AC EC 94 | Load from absolute address into Y register
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    INC $BE03,X          ; FE 03 BE | Increment (absolute,X)
    DEC $0123,X          ; DE 23 01 | Decrement (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_100
; Address: $E1C4BD
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_100:
    BRA $7F              ; 80 7F | Branch always
    BRA $1F              ; 80 1F | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    BRA $87              ; 80 87 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $3F              ; F0 3F | Branch if equal
    SBC ($7E,X)          ; E1 7E | Subtract with carry ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX $FF              ; E4 FF | Compare X register (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ASL $F61E,X          ; 1E 1E F6 | Arithmetic shift left (absolute,X)
    DEC $F8CE            ; CE CE F8 | Decrement (absolute)
    SBC $0700,Y          ; F9 00 07 | Subtract with carry (absolute,Y)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ADC $F906,X          ; 7D 06 F9 | Add with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$06             ; E0 06 | Compare X register (immediate)
    DEC $3E              ; C6 3E | Decrement (zero page)
    LDX $B939,Y          ; BE 39 B9 | Load from absolute,Y into X register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $C0E1,X          ; 1E E1 C0 | Arithmetic shift left (absolute,X)
    DEC $BF88,X          ; DE 88 BF | Decrement (absolute,X)
    ASL $0F7F            ; 0E 7F 0F | Arithmetic shift left (absolute)
    DEY                  ; 88 | Decrement Y register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $8F              ; F0 8F | Branch if equal
    BVS $0C              ; 70 0C | Branch if overflow set
    CPY $8C0C            ; CC 0C 8C | Compare Y register (absolute)
    BPL $90              ; 10 90 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_101
; Address: $E1C58A
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_101:
    ASL $00CE            ; 0E CE 00 | Arithmetic shift left (absolute)
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    CPX $1F              ; E4 1F | Compare X register (zero page)
    BEQ $BF              ; F0 BF | Branch if equal
    BVS $3F              ; 70 3F | Branch if overflow set
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BEQ $9F              ; F0 9F | Branch if equal
    BVS $9F              ; 70 9F | Branch if overflow set
    BVS $9F              ; 70 9F | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    TXA                  ; 8A | Transfer X register to accumulator
    STA $F0FF,Y          ; 99 FF F0 | Store accumulator to absolute,Y
    PLX                  ; FA | Pull X register from stack
    BIT $32              ; 24 32 | Test bits in accumulator (zero page)
    SBC $F2E2,X          ; FD E2 F2 | Subtract with carry (absolute,X)
    STA $E5              ; 85 E5 | Store accumulator to zero page
    INC $FA01,X          ; FE 01 FA | Increment (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    SBC $FE02,X          ; FD 02 FE | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $B6              ; E6 B6 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_102
; Address: $E1C5C4
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_102:
    JSR $A03C            ; 20 3C A0 | Jump to subroutine
    LDA $3B7773          ; AF 73 77 3B | Load from absolute long address into accumulator
    LDA                  ; BF 0C FF 33 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    PLB                  ; AB | Pull data bank register from stack
    CPX $EF13            ; EC 13 EF | Compare X register (absolute)
    BPL $77              ; 10 77 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_103
; Address: $E1C5E2
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_103:
    JSR $4027            ; 20 27 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    JMP $4040            ; 4C 40 40 | Jump to address
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BEQ $3F              ; F0 3F | Branch if equal
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    ROL $00FF,X          ; 3E FF 00 | Rotate left (absolute,X)
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    ORA ($71,X)          ; 01 71 | Logical OR with accumulator ((zero page,X))
    STX $86              ; 86 86 | Store X register to zero page
    STA $3CC778          ; 8F 78 C7 3C | Store accumulator to absolute long address
    ASL $DE27,X          ; 1E 27 DE | Arithmetic shift left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $FB              ; 30 FB | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_104
; Address: $E1C622
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_104:
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    ADC #$F0             ; 69 F0 | Add with carry (immediate)
    SBC $3130,Y          ; F9 30 31 | Subtract with carry (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDY $9E47,X          ; BC 47 9E | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $F0FF,X          ; FE FF F0 | Increment (absolute,X)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    INC $F801,X          ; FE 01 F8 | Increment (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    STA ($8F,X)          ; 81 8F | Store accumulator to (zero page,X)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FE              ; F0 FE | Branch if equal
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    ORA $0CD9,Y          ; 19 D9 0C | Logical OR with accumulator (absolute,Y)
    CPX $EC0C            ; EC 0C EC | Compare X register (absolute)
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $87              ; F0 87 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$F1             ; C0 F1 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BMI $37              ; 30 37 | Branch if negative
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_105
; Address: $E1C716
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_105:
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    REP #$3D             ; C2 3D | Reset processor status bits
    STY $E4              ; 84 E4 | Store Y register to zero page
    STX $E7              ; 86 E7 | Store X register to zero page
    STY $E6              ; 84 E6 | Store Y register to zero page
    STY $E4              ; 84 E4 | Store Y register to zero page
    STY $E7              ; 84 E7 | Store Y register to zero page
    STA $85              ; 85 85 | Store accumulator to zero page
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    DEC $CC39            ; CE 39 CC | Decrement (absolute)
    STA $789F78          ; 8F 78 9F 78 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    STZ $84DE,X          ; 9E DE 84 | Store zero to absolute,X
    STY $E585            ; 8C 85 E5 | Store Y register to absolute address
    INC $FE              ; E6 FE | Increment (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA $9888,Y          ; B9 88 98 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_106
; Address: $E1C751
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_106:
    JSR $708F            ; 20 8F 70 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    LDY $9C47,X          ; BC 47 9C | Load from absolute,X into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    BEQ $07              ; F0 07 | Branch if equal
    INC $0EF3,X          ; FE F3 0E | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $F0              ; F0 F0 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_107
; Address: $E1C79E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_107:
    STA                  ; 9F F8 37 3F | Store accumulator to absolute long,X
    ROR $C4C4,X          ; 7E C4 C4 | Rotate right (absolute,X)
    STA ($99,X)          ; 81 99 | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ROR $AEAE,X          ; 7E AE AE | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_109
; Address: $E1C7C4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_109:
    JSL $222262          ; 22 62 22 22 | Jump to subroutine long
    SEP #$E2             ; E2 E2 | Set processor status bits
    AND ($21,X)          ; 21 21 | PPU graphics register access
    LDX $FE41,Y          ; BE 41 FE | Load from absolute,Y into X register
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    STA ($3E,X)          ; 81 3E | Store accumulator to (zero page,X)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_10B
; Address: $E1C7EC
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_10B:
    JSR $6027            ; 20 27 60 | Jump to subroutine
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    ADC ($DE),Y          ; 71 DE | Add with carry ((zero page),Y)
    SBC $F18E,Y          ; F9 8E F1 | Subtract with carry (absolute,Y)
    ASL $1EF1,X          ; 1E F1 1E | Arithmetic shift left (absolute,X)
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FDF1,X          ; FE F1 FD | Increment (absolute,X)
    SBC ($FD),Y          ; F1 FD | Subtract with carry ((zero page),Y)
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FFF8,X          ; FE F8 FF | Increment (absolute,X)
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    SBC $F906,Y          ; F9 06 F9 | Subtract with carry (absolute,Y)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $70              ; 70 70 | Branch if overflow set
    BMI $30              ; 30 30 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX $00FF            ; EC FF 00 | Compare X register (absolute)
    BRA $3F              ; 80 3F | Branch always
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $87              ; F0 87 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_10C
; Address: $E1C856
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_10C:
    INC $E801,X          ; FE 01 E8 | Increment (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BVS $70              ; 70 70 | Branch if overflow set
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    BVS $70              ; 70 70 | Branch if overflow set
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    BVS $70              ; 70 70 | Branch if overflow set
    STA $7C8370          ; 8F 70 83 7C | Store accumulator to absolute long address
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_10D
; Address: $E1C8A2
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_10D:
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    REP #$DF             ; C2 DF | Reset processor status bits
    STA                  ; 9F 87 BF C2 | Store accumulator to absolute long,X
    AND $39C6,X          ; 3D C6 39 | Logical AND with accumulator (absolute,X)
    STX $79              ; 86 79 | Store X register to zero page
    STX $79              ; 86 79 | Store X register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    STA $F00F70          ; 8F 70 0F F0 | Store accumulator to absolute long address
    CPX #$14             ; E0 14 | Compare X register (immediate)
    PHB                  ; 8B | Push data bank register to stack
    ORA $0D8F            ; 0D 8F 0D | Logical OR with accumulator (absolute)
    CPY $7E              ; C4 7E | Compare Y register (zero page)
    SBC ($3C,X)          ; E1 3C | Subtract with carry ((zero page,X))
    BEQ $1F              ; F0 1F | Branch if equal
    BEQ $9F              ; F0 9F | Branch if equal
    BVS $9F              ; 70 9F | Branch if overflow set
    BVS $9F              ; 70 9F | Branch if overflow set
    BVS $9F              ; 70 9F | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    AND #$39             ; 29 39 | Logical AND with accumulator (immediate)
    BIT $EC              ; 24 EC | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_10E
; Address: $E1C8E8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_10E:
    INC $E7              ; E6 E7 | Increment (zero page)
    LDY $FE              ; A4 FE | Load from zero page into Y register
    BCS $B4              ; B0 B4 | Branch if carry set
    LDY #$F1             ; A0 F1 | Load immediate value into Y register
    ROR $3F87,X          ; 7E 87 3F | Rotate right (absolute,X)
    CPY #$EF             ; C0 EF | Compare Y register (immediate)
    BPL $E7              ; 10 E7 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    INC $B401,X          ; FE 01 B4 | Increment (absolute,X)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    JMP $0909            ; 4C 09 09 | Jump to address

;------------------------------------------------------------------------------
; Bank42_DmaFunction_10F
; Address: $E1C908
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_10F:
    JSL $775723          ; 22 23 57 77 | Jump to subroutine long
    ADC #$6B             ; 69 6B | Add with carry (immediate)
    BEQ $9F              ; F0 9F | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BRA $9F              ; 80 9F | Branch always
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    SBC ($1E),Y          ; F1 1E | Subtract with carry ((zero page),Y)
    BRA $9C              ; 80 9C | Branch always
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_110
; Address: $E1C966
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_110:
    JSR $3021            ; 20 21 30 | Jump to subroutine
    BMI $18              ; 30 18 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BIT #$C9             ; 89 C9 | Test bits in accumulator (immediate)
    SBC #$37             ; E9 37 | Subtract with carry (immediate)
    BEQ $BF              ; F0 BF | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    ROR $1EE7,X          ; 7E E7 1E | Rotate right (absolute,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_111
; Address: $E1C989
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_111:
    DEC $00              ; C6 00 | Decrement (zero page)
    BRA $7F              ; 80 7F | Branch always
    BPL $FF              ; 10 FF | Branch if positive
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    BRA $71              ; 80 71 | Branch always
    STX $CFC1            ; 8E C1 CF | Store X register to absolute address
    STA $071F03          ; 8F 03 1F 07 | Store accumulator to absolute long address
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    STA $F00FF0          ; 8F F0 0F F0 | Store accumulator to absolute long address
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    ADC #$68             ; 69 68 | Add with carry (immediate)
    WDM #$2A             ; 42 2A | Reserved instruction
    STA ($22),Y          ; 91 22 | Store accumulator to (zero page),Y
    LDA ($0F,X)          ; A1 0F | Load from (zero page,X) into accumulator
    ORA $9A              ; 05 9A | Logical OR with accumulator (zero page)
    BRA $84              ; 80 84 | Branch always
    STY $FF              ; 84 FF | Store Y register to zero page
    ROL                  ; 2A | Rotate left (accumulator)
    CPX $C400            ; EC 00 C4 | Compare X register (absolute)
    SEC                  ; 38 | Set carry flag
    CPY $25              ; C4 25 | Compare Y register (zero page)
    BNE $24              ; D0 24 | Branch if not equal
    CMP ($AE,X)          ; C1 AE | Compare accumulator ((zero page,X))
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    STX $E6              ; 86 E6 | Store X register to zero page
    STA $3CC3EF          ; 8F EF C3 3C | Store accumulator to absolute long address
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CMP ($F1,X)          ; C1 F1 | Compare accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    LDX $B737,Y          ; BE 37 B7 | Load from absolute,Y into X register
    BMI $B0              ; 30 B0 | Branch if negative
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    STX $1F71            ; 8E 71 1F | Store X register to absolute address
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$EB             ; E0 EB | Compare X register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    CMP ($D1),Y          ; D1 D1 | Compare accumulator ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank42_DmaFunction_112
; Address: $E1CA28
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_112:
    AND ($1B,X)          ; 21 1B | Logical AND with accumulator ((zero page,X))
    BRA $9C              ; 80 9C | Branch always
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    STY $D5              ; 84 D5 | Store Y register to zero page
    ROL                  ; 2A | Rotate left (accumulator)
    LDA $887750          ; AF 50 77 88 | Load from absolute long address into accumulator
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $9E              ; 80 9E | Branch always
    BRA $BE              ; 80 BE | Branch always
    STX $96              ; 86 96 | Store X register to zero page
    DEC $C6              ; C6 C6 | Decrement (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDY $ECFC,X          ; BC FC EC | Load from absolute,X into Y register
    LDA $06E745          ; AF 45 E7 06 | Load from absolute long address into accumulator
    ROR $2C0C,X          ; 7E 0C 2C | Rotate right (absolute,X)
    ORA #$FC             ; 09 FC | Logical OR with accumulator (immediate)
    BPL $E6              ; 10 E6 | Branch if positive
    ORA $8778,Y          ; 19 78 87 | Logical OR with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    LDA                  ; BF 87 BF C7 | Load from absolute long,X into accumulator
    LDA                  ; BF 87 BF 0F | Load from absolute long,X into accumulator
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $8F              ; F0 8F | Branch if equal
    BVS $1F              ; 70 1F | Branch if overflow set
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    CPY $07              ; C4 07 | Compare Y register (zero page)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F 78 DF 38 | Store accumulator to absolute long,X
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    INC $D001,X          ; FE 01 D0 | Increment (absolute,X)
    CMP ($E3,X)          ; C1 E3 | Compare accumulator ((zero page,X))
    CMP ($D9,X)          ; C1 D9 | Compare accumulator ((zero page,X))
    EOR #$4F             ; 49 4F | Exclusive OR with accumulator (immediate)
    ORA $1F3D            ; 0D 3D 1F | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    CMP $CF26,Y          ; D9 26 CF | Compare accumulator (absolute,Y)
    BCS $FF              ; B0 FF | Branch if carry set
    CPY #$73             ; C0 73 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_113
; Address: $E1CAD9
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_113:
    CPX $FE31            ; EC 31 FE | Compare X register (absolute)
    LDA $99F9,Y          ; B9 F9 99 | Load from absolute,Y into accumulator
    LDA                  ; BF 97 9F 11 | Load from absolute long,X into accumulator
    BVS $F1              ; 70 F1 | Branch if overflow set
    LDY #$FC             ; A0 FC | Load immediate value into Y register
    LDY #$EB             ; A0 EB | Load immediate value into Y register
    CPX #$E6             ; E0 E6 | Compare X register (immediate)
    SBC $BF06,Y          ; F9 06 BF | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 60 F7 08 | Store accumulator to absolute long,X
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    ROR $99              ; 66 99 | Rotate right (zero page)
    CMP ($DD,X)          ; C1 DD | Compare accumulator ((zero page,X))
    CPY #$DE             ; C0 DE | Compare Y register (immediate)
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    ADC $DC5C,Y          ; 79 5C DC | Add with carry (absolute,Y)
    LSR $46              ; 46 46 | Logical shift right (zero page)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    STY $C273            ; 8C 73 C2 | Store Y register to absolute address
    AND $1EE1,X          ; 3D E1 1E | Logical AND with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INC $7FFE,X          ; FE FE 7F | Increment (absolute,X)
    STZ $7E00            ; 9C 00 7E | Store zero to absolute
    BRA $21              ; 80 21 | PPU graphics register access
    DEC $FF00,X          ; DE 00 FF | Decrement (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BMI $33              ; 30 33 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_114
; Address: $E1CB44
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_114:
    RTI                  ; 40 | Return from interrupt
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    CMP ($DF,X)          ; C1 DF | Compare accumulator ((zero page,X))
    SBC $F90E,Y          ; F9 0E F9 | Subtract with carry (absolute,Y)
    ASL $3EE1,X          ; 1E E1 3E | Arithmetic shift left (absolute,X)
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    STA $F00F70          ; 8F 70 0F F0 | Store accumulator to absolute long address
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPY #$E6             ; C0 E6 | Compare Y register (immediate)
    CPY #$F3             ; C0 F3 | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_115
; Address: $E1CB72
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_115:
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    INC $19              ; E6 19 | Increment (zero page)
    SBC $E003,X          ; FD 03 E0 | Game work RAM access
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    STA $030F01          ; 8F 01 0F 03 | Store accumulator to absolute long address
    SBC $1E              ; E5 1E | Subtract with carry (zero page)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $9F              ; 80 9F | Branch always
    BRA $87              ; 80 87 | Branch always
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    CMP ($7E,X)          ; C1 7E | Compare accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_116
; Address: $E1CBCC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_116:
    JSR $E020            ; 20 20 E0 | Game work RAM access
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $1F              ; F0 1F | Branch if equal
    ASL $0EEE            ; 0E EE 0E | Arithmetic shift left (absolute)
    INC $9C1C            ; EE 1C 9C | Increment (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_118
; Address: $E1CBEC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_118:
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $FE1E,X          ; 1E 1E FE | Arithmetic shift left (absolute,X)
    INC $F0F0,X          ; FE F0 F0 | Increment (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_119
; Address: $E1CC27
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_119:
    SEC                  ; 38 | Set carry flag
    BRA $F8              ; 80 F8 | Branch always
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CMP $99FF,X          ; DD FF 99 | Compare accumulator (absolute,X)
    CMP $8988,X          ; DD 88 89 | Compare accumulator (absolute,X)
    BRA $E6              ; 80 E6 | Branch always
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    CMP $9922,X          ; DD 22 99 | Compare accumulator (absolute,X)
    ROR $FE              ; 66 FE | Rotate right (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BPL $EF              ; 10 EF | Branch if positive
    CMP $BD04            ; CD 04 BD | Compare accumulator (absolute)
    STA $F918,X          ; 9D 18 F9 | Store accumulator to absolute,X
    BVS $71              ; 70 71 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_11A
; Address: $E1CC6C
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_11A:
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    SBC ($EF,X)          ; E1 EF | Subtract with carry ((zero page,X))
    INY                  ; C8 | Increment Y register
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF C1 3E C3 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    INC $D0FF,X          ; FE FF D0 | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    INC $FEF0,X          ; FE F0 FE | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF FC 03 F8 | Load from absolute long,X into accumulator
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $FF              ; E6 FF | Increment (zero page)
    ROR $66              ; 66 66 | Rotate right (zero page)
    ROR $3E7E,X          ; 7E 7E 3E | Rotate right (absolute,X)
    ROL $8000,X          ; 3E 00 80 | Rotate left (absolute,X)
    BRA $7E              ; 80 7E | Branch always
    STA ($3C,X)          ; 81 3C | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_11B
; Address: $E1CD07
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_11B:
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    INC $1C01,X          ; FE 01 1C | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_11C
; Address: $E1CD19
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_11C:
    STA                  ; 9F 7F 80 FF | Store accumulator to absolute long,X
    ROL $0CC1,X          ; 3E C1 0C | Rotate left (absolute,X)
    BRA $1F              ; 80 1F | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    SED                  ; F8 | Set decimal mode flag
    CPY #$8F             ; C0 8F | Compare Y register (immediate)
    BVS $FF              ; 70 FF | Branch if overflow set
    BRA $86              ; 80 86 | Branch always
    BRA $84              ; 80 84 | Branch always
    BRA $98              ; 80 98 | Branch always
    BRA $90              ; 80 90 | Branch always
    LSR $46              ; 46 46 | Logical shift right (zero page)
    ADC $7BC5,Y          ; 79 C5 7B | Add with carry (absolute,Y)
    CMP $D767,Y          ; D9 67 D7 | Compare accumulator (absolute,Y)
    JMP ($6CD7)          ; 6C D7 6C | Jump to address (absolute indirect)
    SEC                  ; 38 | Set carry flag
    BRA $80              ; 80 80 | Branch always
    STZ $3F9E,X          ; 9E 9E 3F | Store zero to absolute,X
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    CMP ($C9,X)          ; C1 C9 | Compare accumulator ((zero page,X))
    STA                  ; 9F FF 00 FF | Store accumulator to absolute long,X
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    ORA $101F,Y          ; 19 1F 10 | Logical OR with accumulator (absolute,Y)
    ORA $3A30,Y          ; 19 30 3A | Logical OR with accumulator (absolute,Y)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    CMP $3BFD,X          ; DD FD 3B | Compare accumulator (absolute,X)
    BCS $B0              ; B0 B0 | Branch if carry set
    STX $76              ; 86 76 | Store X register to zero page
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    BPL $7E              ; 10 7E | Branch if positive
    STZ $BFFF            ; 9C FF BF | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    BCS $E7              ; B0 E7 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    LDA $BE42,X          ; BD 42 BE | Load from absolute,X into accumulator
    EOR ($BF,X)          ; 41 BF | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ASL $FC0E            ; 0E 0E FC | Arithmetic shift left (absolute)
    ORA $7F7C,X          ; 1D 7C 7F | Logical OR with accumulator (absolute,X)
    ORA $F9F8,X          ; 1D F8 F9 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_11D
; Address: $E1CDEC
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_11D:
    JSR $C0E3            ; 20 E3 C0 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    BNE $FF              ; D0 FF | Branch if not equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    CPY #$19             ; C0 19 | Compare Y register (immediate)
    INC $FF              ; E6 FF | Increment (zero page)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    BRA $F3              ; 80 F3 | Branch always
    SBC $F180            ; ED 80 F1 | Subtract with carry (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STY $E073            ; 8C 73 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BMI $FF              ; 30 FF | Branch if negative
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    STA $0FC000          ; 8F 00 C0 0F | Store accumulator to absolute long address
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $3F              ; 80 3F | Branch always
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_11E
; Address: $E1CF4A
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_11E:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $F1              ; F0 F1 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC $F021,X          ; DE 21 F0 | Decrement (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    STA                  ; 9F 01 3F 07 | Store accumulator to absolute long,X
    LDA                  ; BF FF 07 F8 | Load from absolute long,X into accumulator
    CPY #$05             ; C0 05 | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    INC $C0FF,X          ; FE FF C0 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FE              ; F0 FE | Branch if equal
    BRA $FC              ; 80 FC | Branch always
    BEQ $01              ; F0 01 | Branch if equal
    CMP ($0A,X)          ; C1 0A | Compare accumulator ((zero page,X))
    SBC $FE06,Y          ; F9 06 FE | Subtract with carry (absolute,Y)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    INC $F03F,X          ; FE 3F F0 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ORA $F9F0,X          ; 1D F0 F9 | Logical OR with accumulator (absolute,X)
    STY $F5              ; 84 F5 | Store Y register to zero page
    DEC $E3CF            ; CE CF E3 | Decrement (absolute)
    ROR $FC0F,X          ; 7E 0F FC | Rotate right (absolute,X)
    ROL $FFF9,X          ; 3E F9 FF | Rotate left (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))
    ROR $9C              ; 66 9C | Rotate right (zero page)
    STZ $7D48,X          ; 9E 48 7D | Store zero to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_11F
; Address: $E1D00C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_11F:
    BMI $BF              ; 30 BF | Branch if negative
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)
    JMP ($B793)          ; 6C 93 B7 | Jump to address (absolute indirect)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_120
; Address: $E1D01F
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_120:
    BMI $03              ; 30 03 | Branch if negative
    BRA $8F              ; 80 8F | Branch always
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    STX $86              ; 86 86 | Store X register to zero page
    CMP $C7D9,Y          ; D9 D9 C7 | Compare accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    ADC ($BE),Y          ; 71 BE | Add with carry ((zero page),Y)
    CLV                  ; B8 | Clear overflow flag
    INC $FF07,X          ; FE 07 FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    INX                  ; E8 | Increment X register
    BRA $3F              ; 80 3F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$8F             ; C0 8F | Compare Y register (immediate)
    BEQ $FE              ; F0 FE | Branch if equal
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    ASL $148F            ; 0E 8F 14 | Arithmetic shift left (absolute)
    ASL $7A6A,X          ; 1E 6A 7A | Arithmetic shift left (absolute,X)
    ADC ($75,X)          ; 61 75 | Add with carry ((zero page,X))
    INY                  ; C8 | Increment Y register
    INC $B0              ; E6 B0 | Increment (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FA05,X          ; FD 05 FA | Subtract with carry (absolute,X)
    PEA #$D22D           ; F4 2D D2 | Push effective address to stack
    SBC ($BF,X)          ; E1 BF | Subtract with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 0D FF 84 | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $FF00,X          ; 7D 00 FF | Add with carry (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    BMI $FD              ; 30 FD | Branch if negative
    BRA $83              ; 80 83 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank42_DmaFunction_121
; Address: $E1D0CC
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_121:
    LDA ($E1,X)          ; A1 E1 | Load from (zero page,X) into accumulator
    CPX #$01             ; E0 01 | Compare X register (immediate)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BEQ $F7              ; F0 F7 | Branch if equal
    BEQ $F7              ; F0 F7 | Branch if equal
    SEC                  ; 38 | Set carry flag
    AND $9E9E,Y          ; 39 9E 9E | Logical AND with accumulator (absolute,Y)
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BMI $37              ; 30 37 | Branch if negative
    BMI $34              ; 30 34 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVS $70              ; 70 70 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $CC0C            ; 9C 0C CC | Store zero to absolute
    ASL $03EE            ; 0E EE 03 | Arithmetic shift left (absolute)
    STA ($B9,X)          ; 81 B9 | Store accumulator to (zero page,X)
    BRA $1F              ; 80 1F | Branch always
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $87              ; F0 87 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_122
; Address: $E1D17E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_122:
    JSR $F0DF            ; 20 DF F0 | Jump to subroutine
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_123
; Address: $E1D18E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_123:
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $C107,Y          ; F9 07 C1 | Subtract with carry (absolute,Y)
    SBC $F107,Y          ; F9 07 F1 | Subtract with carry (absolute,Y)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ROL $AB3E            ; 2E 3E AB | Rotate left (absolute)
    LDA                  ; BF B1 FB A1 | Load from absolute long,X into accumulator
    LDA ($64),Y          ; B1 64 | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_124
; Address: $E1D1AA
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_124:
    JSR $183D            ; 20 3D 18 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    STX $C1FE            ; 8E FE C1 | Store X register to absolute address
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC $79C2,X          ; 7D C2 79 | Add with carry (absolute,X)
    SBC ($BE),Y          ; F1 BE | Subtract with carry ((zero page),Y)
    ROL $A7              ; 26 A7 | Rotate left (zero page)
    BMI $FE              ; 30 FE | Branch if negative
    CMP $D7FD,X          ; DD FD D7 | Compare accumulator (absolute,X)
    LDA                  ; BF 40 3E C1 | Load from absolute long,X into accumulator
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    ASL $4E9E,X          ; 1E 9E 4E | Arithmetic shift left (absolute,X)
    LDX $3343            ; AE 43 33 | Load from absolute address into X register
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    BRA $BE              ; 80 BE | Branch always
    INC $FF              ; E6 FF | Increment (zero page)
    ASL $2EE1,X          ; 1E E1 2E | Arithmetic shift left (absolute,X)
    STA ($93),Y          ; 91 93 | Store accumulator to (zero page),Y
    BIT $22DD            ; 2C DD 22 | Test bits in accumulator (absolute)
    DEC $EF21,X          ; DE 21 EF | Decrement (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BEQ $75              ; F0 75 | Branch if equal
    SBC $7666,X          ; FD 66 76 | Subtract with carry (absolute,X)
    ROR $E6              ; 66 E6 | Rotate right (zero page)
    LDX $BE              ; A6 BE | Load from zero page into X register
    CLD                  ; D8 | Clear decimal mode flag
    JMP $FF5C            ; 4C 5C FF | Jump to address
    BIT #$E7             ; 89 E7 | Test bits in accumulator (immediate)
    ORA $01FF,Y          ; 19 FF 01 | Logical OR with accumulator (absolute,Y)
    ORA #$33             ; 09 33 | Logical OR with accumulator (immediate)
    CMP $03FF            ; CD FF 03 | Compare accumulator (absolute)
    DEC $0F23,X          ; DE 23 0F | Decrement (absolute,X)
    STA                  ; 9F E0 81 FE | Store accumulator to absolute long,X
    CPX #$03             ; E0 03 | Compare X register (immediate)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    REP #$FB             ; C2 FB | Reset processor status bits

;------------------------------------------------------------------------------
; Bank42_DmaFunction_125
; Address: $E1D244
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_125:
    ASL $E7              ; 06 E7 | Arithmetic shift left (zero page)
    DEC $09              ; C6 09 | Decrement (zero page)
    CMP $9B1B,Y          ; D9 1B 9B | Compare accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    STA $F00F70          ; 8F 70 0F F0 | Store accumulator to absolute long address
    BPL $97              ; 10 97 | Branch if positive
    BVC $3B              ; 50 3B | Branch if overflow clear
    STX $CEBF            ; 8E BF CE | Store X register to absolute address
    ROR $5F7F,X          ; 7E 7F 5F | Rotate right (absolute,X)
    LDY #$EF             ; A0 EF | Load immediate value into Y register
    BPL $B7              ; 10 B7 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BIT $E7              ; 24 E7 | Test bits in accumulator (zero page)
    LDA #$BF             ; A9 BF | Load immediate value into accumulator
    CMP ($FB,X)          ; C1 FB | Compare accumulator ((zero page,X))
    CMP ($EF,X)          ; C1 EF | Compare accumulator ((zero page,X))
    LDY $00FF,X          ; BC FF 00 | Load from absolute,X into Y register
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    BRA $7F              ; 80 7F | Branch always
    TSX                  ; BA | Transfer stack pointer to X register
    STA                  ; 9F FF 95 BD | Store accumulator to absolute long,X
    SBC $7F7F,X          ; FD 7F 7F | Subtract with carry (absolute,X)
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 40 9F 60 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA #$D9             ; 09 D9 | Logical OR with accumulator (immediate)
    ORA ($3C),Y          ; 11 3C | Logical OR with accumulator ((zero page),Y)
    LDA $FEB8,Y          ; B9 B8 FE | Load from absolute,Y into accumulator
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_126
; Address: $E1D2D3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_126:
    JSR $B04F            ; 20 4F B0 | Jump to subroutine
    CPY #$F7             ; C0 F7 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA $22DC            ; 0D DC 22 | Logical OR with accumulator (absolute)
    PLX                  ; FA | Pull X register from stack
    REP #$FF             ; C2 FF | Reset processor status bits
    SEI                  ; 78 | Set interrupt disable flag
    INC $CF01,X          ; FE 01 CF | Increment (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank42_DmaFunction_127
; Address: $E1D300
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_127:
    BRA $FF              ; 80 FF | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    SBC $FFF8,Y          ; F9 F8 FF | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    INC $FE78,X          ; FE 78 FE | Increment (absolute,X)
    INC $24FF,X          ; FE FF 24 | Increment (absolute,X)
    ASL $FFE1,X          ; 1E E1 FF | Arithmetic shift left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_129
; Address: $E1D34C
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_129:
    BMI $37              ; 30 37 | Branch if negative
    BPL $10              ; 10 10 | Branch if positive
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    DEC $39              ; C6 39 | Decrement (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    STA ($B9,X)          ; 81 B9 | Store accumulator to (zero page,X)
    LDA                  ; BF 3C BC 30 | Load from absolute long,X into accumulator
    BCS $70              ; B0 70 | Branch if carry set
    BVS $F0              ; 70 F0 | Branch if overflow set
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$20             ; E0 20 | Compare X register (immediate)
    STA $E01F70          ; 8F 70 1F E0 | Game work RAM access
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $FE              ; 80 FE | Branch always
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    STY $C17F            ; 8C 7F C1 | Store Y register to absolute address
    ROL $1CE3,X          ; 3E E3 1C | Rotate left (absolute,X)
    ROR $FF81,X          ; 7E 81 FF | Rotate right (absolute,X)
    ASL $86              ; 06 86 | Arithmetic shift left (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    INC $FFF0,X          ; FE F0 FF | Increment (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_12A
; Address: $E1D3FA
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_12A:
    INC $F801,X          ; FE 01 F8 | Increment (absolute,X)
    JMP $A84C            ; 4C 4C A8 | Jump to address
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BMI $31              ; 30 31 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    DEC $FE33            ; CE 33 FE | Decrement (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    ASL $07DE,X          ; 1E DE 07 | Arithmetic shift left (absolute,X)
    STA ($F9,X)          ; 81 F9 | Store accumulator to (zero page,X)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STA $788770          ; 8F 70 87 78 | Store accumulator to absolute long address
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $3701,X          ; FE 01 37 | Increment (absolute,X)
    BCC $F5              ; 90 F5 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    AND $FFBD,X          ; 3D BD FF | Logical AND with accumulator (absolute,X)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    BRA $3F              ; 80 3F | Branch always
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    DEC $DF              ; C6 DF | Decrement (zero page)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    SBC ($E7,X)          ; E1 E7 | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $7F              ; 80 7F | Branch always
    STZ $8161,X          ; 9E 61 81 | Store zero to absolute,X
    ROR $3CC3,X          ; 7E C3 3C | Rotate right (absolute,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    INC $E700,X          ; FE 00 E7 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CMP $3D3C,Y          ; D9 3C 3D | Compare accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    DEC $00              ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_12B
; Address: $E1D4B0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_12B:
    CLC                  ; 18 | Clear carry flag
    INC $19              ; E6 19 | Increment (zero page)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    SBC $7F80,X          ; FD 80 7F | Subtract with carry (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ASL $1071            ; 0E 71 10 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_12C
; Address: $E1D4DF
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_12C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ADC ($F1),Y          ; 71 F1 | Add with carry ((zero page),Y)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SEP #$1F             ; E2 1F | Set processor status bits
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    BRA $FF              ; 80 FF | Branch always
    INC $C2FE,X          ; FE FE C2 | Increment (absolute,X)
    INC $7C74,X          ; FE 74 7C | Increment (absolute,X)
    INC $02FE,X          ; FE FE 02 | Increment (absolute,X)
    STY $09              ; 84 09 | Store Y register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    DEC $C2              ; C6 C2 | Decrement (zero page)
    STY $1C80            ; 8C 80 1C | Store Y register to absolute address
    CPX $18              ; E4 18 | Compare X register (zero page)
    STY $78              ; 84 78 | Store Y register to zero page
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    REP #$3E             ; C2 3E | Reset processor status bits
    STY $7C              ; 84 7C | Store Y register to zero page
    BPL $2F              ; 10 2F | Branch if positive
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_12D
; Address: $E1D5D0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_12D:
    JSR $103F            ; 20 3F 10 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal

;------------------------------------------------------------------------------
; Bank42_DmaFunction_12E
; Address: $E1D5ED
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_12E:
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $04              ; F0 04 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA #$31             ; 09 31 | Logical OR with accumulator (immediate)
    ORA $1321,Y          ; 19 21 13 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    AND ($3E,X)          ; 21 3E | Logical AND with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BPL $0F              ; 10 0F | Branch if positive
    BPL $F8              ; 10 F8 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BNE $D0              ; D0 D0 | Branch if not equal
    BNE $D0              ; D0 D0 | Branch if not equal
    BNE $D0              ; D0 D0 | Branch if not equal
    BNE $D0              ; D0 D0 | Branch if not equal
    BNE $D0              ; D0 D0 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BNE $30              ; D0 30 | Branch if not equal
    BNE $30              ; D0 30 | Branch if not equal
    BNE $30              ; D0 30 | Branch if not equal
    BNE $30              ; D0 30 | Branch if not equal
    BNE $30              ; D0 30 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_12F
; Address: $E1D663
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_12F:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BPL $1F              ; 10 1F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $E8              ; F0 E8 | Branch if equal
    BPL $F8              ; 10 F8 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    ROL $2C2F            ; 2E 2F 2C | Rotate left (absolute)
    BIT $382F            ; 2C 2F 38 | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    BMI $3F              ; 30 3F | Branch if negative
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    BEQ $F0              ; F0 F0 | Branch if equal
    BMI $F0              ; 30 F0 | Branch if negative
    BMI $F0              ; 30 F0 | Branch if negative
    BMI $F0              ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank42_DmaFunction_130
; Address: $E1D6E8
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_130:
    BMI $F0              ; 30 F0 | Branch if negative
    BPL $F0              ; 10 F0 | Branch if positive
    BPL $F0              ; 10 F0 | Branch if positive
    BPL $F0              ; 10 F0 | Branch if positive
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PEA #$F40C           ; F4 0C F4 | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_131
; Address: $E1D72E
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_131:
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_132
; Address: $E1D73F
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_132:
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_133
; Address: $E1D768
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_133:
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $1F              ; 10 1F | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ASL $1C10,X          ; 1E 10 1C | Arithmetic shift left (absolute,X)
    BPL $1C              ; 10 1C | Branch if positive
    BPL $3F              ; 10 3F | Branch if positive
    ASL $1C00,X          ; 1E 00 1C | Arithmetic shift left (absolute,X)
    BPL $F0              ; 10 F0 | Branch if positive
    BCC $70              ; 90 70 | Branch if carry clear
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_134
; Address: $E1D811
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_134:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $08              ; 10 08 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $20              ; 10 20 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BPL $30              ; 10 30 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank42_DmaFunction_139
; Address: $E1D89A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_139:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BPL $18              ; 10 18 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_13A
; Address: $E1D8DD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_13A:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $20              ; 30 20 | Branch if negative
    BMI $20              ; 30 20 | Branch if negative
    BMI $20              ; 30 20 | Branch if negative
    BMI $20              ; 30 20 | Branch if negative
    BMI $20              ; 30 20 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank42_DmaFunction_13F
; Address: $E1D8FC
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_13F:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0808            ; 0E 08 08 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPY $00              ; C4 00 | Compare Y register (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    CPX $04              ; E4 04 | Compare X register (zero page)
    STY $04              ; 84 04 | Store Y register to zero page
    ASL $1C1F,X          ; 1E 1F 1C | Arithmetic shift left (absolute,X)
    BPL $1F              ; 10 1F | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank42_DmaFunction_140
; Address: $E1D965
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_140:
    BEQ $28              ; F0 28 | Branch if equal
    BNE $68              ; D0 68 | Branch if not equal
    BCC $E8              ; 90 E8 | Branch if carry clear
    BPL $F8              ; 10 F8 | Branch if positive
    BEQ $08              ; F0 08 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_148
; Address: $E1D99C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_148:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    ASL $1C07            ; 0E 07 1C | Arithmetic shift left (absolute)
    BIT $571F            ; 2C 1F 57 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_149
; Address: $E1D9DB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_149:
    JSR $4008            ; 20 08 40 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    BRA $FC              ; 80 FC | Branch always
    ASL $1FF0            ; 0E F0 1F | Arithmetic shift left (absolute)
    CPX #$83             ; E0 83 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_14B
; Address: $E1DA19
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_14B:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    INC $C701,X          ; FE 01 C7 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_14D
; Address: $E1DA45
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_14D:
    JSR $013E            ; 20 3E 01 | Jump to subroutine
    ROR $7C01,X          ; 7E 01 7C | Rotate right (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_150
; Address: $E1DA57
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_150:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BRA $70              ; 80 70 | Branch always
    BEQ $18              ; F0 18 | Branch if equal
    CPX #$2C             ; E0 2C | Compare X register (immediate)
    BEQ $F6              ; F0 F6 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $10FE,X          ; FE FE 10 | Increment (absolute,X)
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    INC $00FE,X          ; FE FE 00 | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_152
; Address: $E1DACD
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_152:
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($07),Y          ; 31 07 | Logical AND with accumulator ((zero page),Y)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    CPY #$C2             ; C0 C2 | Compare Y register (immediate)
    BMI $79              ; 30 79 | Branch if negative
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    ADC ($11),Y          ; 71 11 | Add with carry ((zero page),Y)
    AND $1F0D,Y          ; 39 0D 1F | Logical AND with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ADC $02              ; 65 02 | Add with carry (zero page)
    ASL $0C04,X          ; 1E 04 0C | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA $43              ; 05 43 | Logical OR with accumulator (zero page)
    ROR $3212,X          ; 7E 12 32 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0700            ; 0D 00 07 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_153
; Address: $E1DC28
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_153:
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($7B),Y          ; 11 7B | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $18              ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank42_DmaFunction_154
; Address: $E1DCCB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_154:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    BMI $39              ; 30 39 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    CMP $C706,X          ; DD 06 C7 | Compare accumulator (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_155
; Address: $E1DD32
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_155:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($05),Y          ; 11 05 | Logical OR with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_156
; Address: $E1DE09
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_156:
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PLB                  ; AB | Pull data bank register from stack
    ROR                  ; 6A | Rotate right (accumulator)
    ADC $F109,Y          ; 79 09 F1 | Add with carry (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    REP #$B0             ; C2 B0 | Reset processor status bits
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    INC $F8FE,X          ; FE FE F8 | Increment (absolute,X)
    INC $FDF0,X          ; FE F0 FD | Increment (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y
    LDA $AF              ; A5 AF | Load from zero page into accumulator
    SBC $FAD2,X          ; FD D2 FA | Subtract with carry (absolute,X)
    ADC #$B5             ; 69 B5 | Add with carry (immediate)
    AND #$D1             ; 29 D1 | Logical AND with accumulator (immediate)
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    BEQ $FC              ; F0 FC | Branch if equal

;------------------------------------------------------------------------------
; Bank42_DmaFunction_157
; Address: $E1DE5F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_157:
    JSR $649B            ; 20 9B 64 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    ROL                  ; 2A | Rotate left (accumulator)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CMP $DCC3,X          ; DD C3 DC | Compare accumulator (absolute,X)
    STA ($9E,X)          ; 81 9E | Store accumulator to (zero page,X)
    BCS $8F              ; B0 8F | Branch if carry set
    LDA                  ; BF FF 1F 3F | Load from absolute long,X into accumulator
    ORA ($BC,X)          ; 01 BC | Logical OR with accumulator ((zero page,X))
    STZ $DB              ; 64 DB | Store zero to zero page
    SEI                  ; 78 | Set interrupt disable flag
    STX $59              ; 86 59 | Store X register to zero page
    LDA $84D428          ; AF 28 D4 84 | Load from absolute long address into accumulator
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_158
; Address: $E1DE8C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_158:
    JSR $B2D8            ; 20 D8 B2 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $DC              ; F0 DC | Branch if equal
    PLX                  ; FA | Pull X register from stack
    TSX                  ; BA | Transfer stack pointer to X register
    TAX                  ; AA | Transfer accumulator to X register
    LDY $1B              ; A4 1B | Load from zero page into Y register
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    STA $CF33            ; 8D 33 CF | Store accumulator to absolute address
    LDA                  ; BF FF 1F FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_159
; Address: $E1DEC2
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_159:
    SEP #$77             ; E2 77 | Set processor status bits
    SBC ($63,X)          ; E1 63 | Subtract with carry ((zero page,X))
    CMP ($73),Y          ; D1 73 | Compare accumulator ((zero page),Y)
    BNE $FB              ; D0 FB | Branch if not equal
    STA ($1F),Y          ; 91 1F | Store accumulator to (zero page),Y
    BIT #$09             ; 89 09 | Test bits in accumulator (immediate)
    STA                  ; 9F 03 9E 01 | Store accumulator to absolute long,X
    LDA $002F01          ; AF 01 2F 00 | Load from absolute long address into accumulator
    INC $F000            ; EE 00 F0 | Increment (absolute)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    SBC #$F9             ; E9 F9 | Subtract with carry (immediate)
    EOR #$58             ; 49 58 | Exclusive OR with accumulator (immediate)
    STA ($B0,X)          ; 81 B0 | Store accumulator to (zero page,X)
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    CPX #$6D             ; E0 6D | Compare X register (immediate)
    CPX #$ED             ; E0 ED | Compare X register (immediate)
    CPX #$36             ; E0 36 | Compare X register (immediate)
    BMI $F3              ; 30 F3 | Branch if negative
    BPL $B7              ; 10 B7 | Branch if positive
    ROR $8700,X          ; 7E 00 87 | Rotate right (absolute,X)
    LDX $26              ; A6 26 | Load from zero page into X register
    DEC $06              ; C6 06 | Decrement (zero page)
    SEP #$03             ; E2 03 | Set processor status bits
    INC $F81F,X          ; FE 1F F8 | Increment (absolute,X)
    NOP                  ; EA | No operation
    ROR $7C              ; 66 7C | Rotate right (zero page)
    CMP $7900,Y          ; D9 00 79 | Compare accumulator (absolute,Y)
    ADC $6100,X          ; 7D 00 61 | Add with carry (absolute,X)
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    AND $7C              ; 25 7C | Logical AND with accumulator (zero page)
    WDM #$79             ; 42 79 | Reserved instruction
    PHB                  ; 8B | Push data bank register to stack
    CPX $FE93            ; EC 93 FE | Compare X register (absolute)
    ORA ($FE),Y          ; 11 FE | Logical OR with accumulator ((zero page),Y)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    PHX                  ; DA | Push X register to stack
    LDX $7600,Y          ; BE 00 76 | Load from absolute,Y into X register
    JMP ($EF00)          ; 6C 00 EF | Jump to address (absolute indirect)
    CMP $BC00,Y          ; D9 00 BC | Compare accumulator (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    ORA ($EF,X)          ; 01 EF | Logical OR with accumulator ((zero page,X))
    ASL $2E              ; 06 2E | Arithmetic shift left (zero page)
    LDY $B7              ; A4 B7 | Load from zero page into Y register
    PHA                  ; 48 | Push accumulator to stack
    LSR $00              ; 46 00 | Logical shift right (zero page)
    BMI $00              ; 30 00 | Branch if negative
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    ORA ($B7,X)          ; 01 B7 | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_15A
; Address: $E1DF62
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_15A:
    INC $FEC0,X          ; FE C0 FE | Increment (absolute,X)
    INC $1707,X          ; FE 07 17 | Increment (absolute,X)
    CMP ($D9,X)          ; C1 D9 | Compare accumulator ((zero page,X))
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    ROL $3F00,X          ; 3E 00 3F | Rotate left (absolute,X)
    LDA                  ; BF BF 7F 7F | Load from absolute long,X into accumulator
    INC $FDFE,X          ; FE FE FD | Increment (absolute,X)
    SBC $F3F3,X          ; FD F3 F3 | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $77F9,Y          ; F9 F9 77 | Subtract with carry (absolute,Y)
    INC $9DEE            ; EE EE 9D | Increment (absolute)
    STA $1717,X          ; 9D 17 17 | Store accumulator to absolute,X
    LDA                  ; BF BF 7E 7E | Load from absolute long,X into accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    INX                  ; E8 | Increment X register
    BCS $00              ; B0 00 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    INC $FF36,X          ; FE 36 FF | Increment (absolute,X)
    LDA                  ; BF FF FF FE | Load from absolute long,X into accumulator
    INC $FDFD,X          ; FE FD FD | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_15B
; Address: $E1DFE5
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_15B:
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF BD 1F 1F | Load from absolute long,X into accumulator
    LDA                  ; BF BF 7E 7E | Load from absolute long,X into accumulator
    BVC $50              ; 50 50 | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ADC $25              ; 65 25 | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BCS $00              ; B0 00 | Branch if carry set
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_15C
; Address: $E1DFFE
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_15C:
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CPX $1213            ; EC 13 12 | Compare X register (absolute)
    SBC $38C7            ; ED C7 38 | Subtract with carry (absolute)
    STY $6773            ; 8C 73 67 | Store Y register to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $E5E1,X          ; 1E E1 E5 | Arithmetic shift left (absolute,X)
    INC                  ; 1A | Increment accumulator
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STA $30CF            ; 8D CF 30 | Store accumulator to absolute address
    XBA                  ; EB | Exchange accumulator bytes
    LDA $5F46,Y          ; B9 46 5F | Load from absolute,Y into accumulator
    LDY #$88             ; A0 88 | Load immediate value into Y register
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    LDA                  ; BF F9 FE 0E | Load from absolute long,X into accumulator
    INC $EF              ; E6 EF | Increment (zero page)
    LSR $FC20,X          ; 5E 20 FC | Logical shift right (absolute,X)
    REP #$16             ; C2 16 | Reset processor status bits
    INC $F4F9            ; EE F9 F4 | Increment (absolute)
    CPY $C56E            ; CC 6E C5 | Compare Y register (absolute)
    LDY $C700,X          ; BC 00 C7 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_15D
; Address: $E1E061
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_15D:
    JSR $20E7            ; 20 E7 20 | Jump to subroutine
    SBC $DF0E,X          ; FD 0E DF | Subtract with carry (absolute,X)
    AND $422C,Y          ; 39 2C 42 | Hardware register operation
    SBC $FB0E,X          ; FD 0E FB | Subtract with carry (absolute,X)
    ORA $D7              ; 05 D7 | Logical OR with accumulator (zero page)
    BMI $9F              ; 30 9F | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    DEC $FF              ; C6 FF | Decrement (zero page)
    BIT $F9FF            ; 2C FF F9 | Test bits in accumulator (absolute)
    SBC $87FE,Y          ; F9 FE 87 | Subtract with carry (absolute,Y)
    SBC $BF02,X          ; FD 02 BF | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STZ $02              ; 64 02 | Store zero to zero page
    LDA ($ED,X)          ; A1 ED | Load from (zero page,X) into accumulator
    CPX $02              ; E4 02 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    SBC $17FF,Y          ; F9 FF 17 | Subtract with carry (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_15E
; Address: $E1E098
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_15E:
    ASL $CDFF,X          ; 1E FF CD | Arithmetic shift left (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    STY $02FD            ; 8C FD 02 | Store Y register to absolute address
    BPL $2F              ; 10 2F | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    SBC $E743,X          ; FD 43 E7 | Subtract with carry (absolute,X)
    BVS $FF              ; 70 FF | Branch if overflow set
    SBC $73FF,X          ; FD FF 73 | Subtract with carry (absolute,X)
    ADC $C7BE,X          ; 7D BE C7 | Add with carry (absolute,X)
    INC $3F00            ; EE 00 3F | Increment (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_15F
; Address: $E1E0C3
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_15F:
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 DF 31 | Load from absolute long,X into accumulator
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)
    STX $40BF            ; 8E BF 40 | Store X register to absolute address
    CPY $3FFF            ; CC FF 3F | Compare Y register (absolute)
    STY $31FF            ; 8C FF 31 | Store Y register to absolute address
    INC $FE7D,X          ; FE 7D FE | Increment (absolute,X)
    LDA $9F77,Y          ; B9 77 9F | Load from absolute,Y into accumulator
    SBC #$17             ; E9 17 | Subtract with carry (immediate)
    LDX $F5F9,Y          ; BE F9 F5 | Load from absolute,Y into X register
    ADC $0B              ; 65 0B | Add with carry (zero page)
    PHX                  ; DA | Push X register to stack
    LDA $ED              ; A5 ED | Load from zero page into accumulator
    ASL $E7              ; 06 E7 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLY                  ; 7A | Pull Y register from stack
    ORA $FFFD            ; 0D FD FF | Logical OR with accumulator (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SBC $F3F9,Y          ; F9 F9 F3 | Subtract with carry (absolute,Y)
    ROR $FE7E,X          ; 7E 7E FE | Rotate right (absolute,X)
    INC $00F9,X          ; FE F9 00 | Increment (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $D870,X          ; 7E 70 D8 | Rotate right (absolute,X)
    CPY #$A1             ; C0 A1 | Compare Y register (immediate)
    STA ($C7,X)          ; 81 C7 | Store accumulator to (zero page,X)
    LSR $381E,X          ; 5E 1E 38 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STA $003F00          ; 8F 00 3F 00 | Store accumulator to absolute long address
    ROR $7800,X          ; 7E 00 78 | Rotate right (absolute,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    CPX $1313            ; EC 13 13 | Compare X register (absolute)
    SEP #$1A             ; E2 1A | Set processor status bits
    ASL $2FDA,X          ; 1E DA 2F | Arithmetic shift left (absolute,X)
    ORA $2C00,X          ; 1D 00 2C | Logical OR with accumulator (absolute,X)
    ADC $00              ; 65 00 | Add with carry (zero page)
    STZ $7E01            ; 9C 01 7E | Store zero to absolute
    STA $90AF,X          ; 9D AF 90 | Store accumulator to absolute,X
    ORA $C2E5            ; 0D E5 C2 | Logical OR with accumulator (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    INC $FA              ; E6 FA | Increment (zero page)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_160
; Address: $E1E174
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_160:
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $E700,X          ; FE 00 E7 | Increment (absolute,X)
    STA                  ; 9F 9F BE 3E | Store accumulator to absolute long,X
    ADC $FB7D,X          ; 7D 7D FB | Add with carry (absolute,X)
    DEC $B9DE,X          ; DE DE B9 | Decrement (absolute,X)
    LDA $7373,Y          ; B9 73 73 | Load from absolute,Y into accumulator
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_161
; Address: $E1E194
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_161:
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LSR $00              ; 46 00 | Logical shift right (zero page)
    STY $F800            ; 8C 00 F8 | Store Y register to absolute address
    BEQ $71              ; F0 71 | Branch if equal
    ADC ($C7,X)          ; 61 C7 | Add with carry ((zero page,X))
    STA $5E5E8F          ; 8F 8F 5E 5E | Store accumulator to absolute long address
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    STZ $3800,X          ; 9E 00 38 | Store zero to absolute,X
    BVS $00              ; 70 00 | Branch if overflow set
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_162
; Address: $E1E1BE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_162:
    JSR $E700            ; 20 00 E7 | Jump to subroutine
    STA                  ; 9F 9F BE BE | Store accumulator to absolute long,X
    SBC $FBFD,X          ; FD FD FB | Subtract with carry (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_163
; Address: $E1E1CA
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_163:
    INC $3F1E,X          ; FE 1E 3F | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CPX #$80             ; E0 80 | Compare X register (immediate)
    SBC ($A0,X)          ; E1 A0 | Subtract with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    INY                  ; C8 | Increment Y register
    JMP ($1968)          ; 6C 68 19 | Jump to address (absolute indirect)
    CLC                  ; 18 | Clear carry flag
    ASL $0F0E            ; 0E 0E 0F | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $71              ; F0 71 | Branch if equal
    ADC ($C7,X)          ; 61 C7 | Add with carry ((zero page,X))
    STA $5D5F8F          ; 8F 8F 5F 5D | Store accumulator to absolute long address
    LDA                  ; BF B8 FC FB | Load from absolute long,X into accumulator
    STZ $3900,X          ; 9E 00 39 | Store zero to absolute,X
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $30              ; 30 30 | Branch if negative
    JMP $FBB3            ; 4C B3 FB | Jump to address

;------------------------------------------------------------------------------
; Bank42_DmaFunction_165
; Address: $E1E207
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_165:
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    AND #$21             ; 29 21 | PPU graphics register access
    DEC $738C,X          ; DE 8C 73 | Decrement (absolute,X)
    ROL $04C1,X          ; 3E C1 04 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_166
; Address: $E1E225
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_166:
    JSR $9669            ; 20 69 96 | Jump to subroutine
    BRA $7F              ; 80 7F | Branch always
    LDY $03FC            ; AC FC 03 | Load from absolute address into Y register
    PHY                  ; 5A | Push Y register to stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    EOR $F6              ; 45 F6 | Exclusive OR with accumulator (zero page)
    EOR #$FE             ; 49 FE | Exclusive OR with accumulator (immediate)
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    ROR                  ; 6A | Rotate right (accumulator)
    SBC $8FFF,X          ; FD FF 8F | Subtract with carry (absolute,X)
    STA $BB03DF          ; 8F DF 03 BB | Store accumulator to absolute long address
    ORA ($B6,X)          ; 01 B6 | Logical OR with accumulator ((zero page,X))
    ORA ($76,X)          ; 01 76 | Logical OR with accumulator ((zero page,X))
    ORA ($6C,X)          ; 01 6C | Logical OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    PHX                  ; DA | Push X register to stack
    AND $EE19,X          ; 3D 19 EE | Logical AND with accumulator (absolute,X)
    LDA $422C,Y          ; B9 2C 42 | Hardware register operation
    LDA $F37E            ; AD 7E F3 | Load from absolute address into accumulator
    ORA $30D7            ; 0D D7 30 | Logical OR with accumulator (absolute)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $DEF7,X          ; FE F7 DE | Increment (absolute,X)
    ROL $F9FF            ; 2E FF F9 | Rotate left (absolute)
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    LSR $F9F9,X          ; 5E F9 F9 | Logical shift right (absolute,X)
    ASL $5E20            ; 0E 20 5E | Arithmetic shift left (absolute)
    LDA ($ED,X)          ; A1 ED | Load from (zero page,X) into accumulator
    CPX $02              ; E4 02 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF F7 EF FF | Load from absolute long,X into accumulator
    ASL $CDFF,X          ; 1E FF CD | Arithmetic shift left (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    STY $02FD            ; 8C FD 02 | Store Y register to absolute address
    BPL $2F              ; 10 2F | Branch if positive
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 78 79 D7 | Store accumulator to absolute long,X
    LDA $FE              ; A5 FE | Load from zero page into accumulator
    ROL $2F              ; 26 2F | Rotate left (zero page)
    BVS $FF              ; 70 FF | Branch if overflow set
    SBC $73FF,X          ; FD FF 73 | Subtract with carry (absolute,X)
    SBC $7FBE,X          ; FD BE 7F | Subtract with carry (absolute,X)
    INC $3F00            ; EE 00 3F | Increment (absolute)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank42_DmaFunction_167
; Address: $E1E2C4
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_167:
    TSX                  ; BA | Transfer stack pointer to X register
    ADC $D7              ; 65 D7 | Add with carry (zero page)
    AND $6715,Y          ; 39 15 67 | Logical AND with accumulator (absolute,Y)
    CMP $78BD            ; CD BD 78 | Compare accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    CPY $3FFF            ; CC FF 3F | Compare Y register (absolute)
    STY $37FF            ; 8C FF 37 | Store Y register to absolute address
    INC $FF7F,X          ; FE 7F FF | Increment (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $5E              ; F0 5E | Branch if equal
    BCS $A7              ; B0 A7 | Branch if carry set
    BVC $D7              ; 50 D7 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_168
; Address: $E1E2E7
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_168:
    LDA $B6              ; A5 B6 | Load from zero page into accumulator
    BNE $AF              ; D0 AF | Branch if not equal
    BEQ $7D              ; F0 7D | Branch if equal
    STA                  ; 9F 97 E8 FC | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    LDA                  ; BF FF FB FB | Load from absolute long,X into accumulator
    ROR $F97E,X          ; 7E 7E F9 | Rotate right (absolute,X)
    SBC $8E8E,Y          ; F9 8E 8E | Subtract with carry (absolute,Y)
    AND $0438,Y          ; 39 38 04 | Logical AND with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    STA $FCFC8F          ; 8F 8F FC FC | Store accumulator to absolute long address
    STA                  ; 9F 1F 3C 3C | Store accumulator to absolute long,X
    ASL $7000,X          ; 1E 00 70 | Arithmetic shift left (absolute,X)
    LDY $F000,X          ; BC 00 F0 | Load from absolute,X into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDA                  ; BF 3F BF 6F | Load from absolute long,X into accumulator
    LDA $EF8FEF          ; AF EF 8F EF | Load from absolute long address into accumulator
    STA $288FEF          ; 8F EF 8F 28 | Store accumulator to absolute long address
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    SEC                  ; 38 | Set carry flag
    SBC ($F2),Y          ; F1 F2 | Subtract with carry ((zero page),Y)
    SBC ($F2),Y          ; F1 F2 | Subtract with carry ((zero page),Y)
    SBC ($F5),Y          ; F1 F5 | Subtract with carry ((zero page),Y)
    SBC $F9F7,Y          ; F9 F7 F9 | Subtract with carry (absolute,Y)
    INC                  ; 1A | Increment accumulator
    CPY $FF3F            ; CC 3F FF | Compare Y register (absolute)
    INC $1C00,X          ; FE 00 1C | Increment (absolute,X)
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_169
; Address: $E1E386
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_169:
    LDA $5921,X          ; BD 21 59 | Load from absolute,X into accumulator
    SBC $58F9,Y          ; F9 F9 58 | Subtract with carry (absolute,Y)
    CLV                  ; B8 | Clear overflow flag
    DEC $007B,X          ; DE 7B 00 | Decrement (absolute,X)
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    ORA $4C00,X          ; 1D 00 4C | Logical OR with accumulator (absolute,X)
    AND $367F            ; 2D 7F 36 | Logical AND with accumulator (absolute)
    AND $FD3F,Y          ; 39 3F FD | Logical AND with accumulator (absolute,Y)
    SBC $BF5E,X          ; FD 5E BF | Subtract with carry (absolute,X)
    LDX $361D            ; AE 1D 36 | Load from absolute address into X register
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    SBC $E300            ; ED 00 E3 | Subtract with carry (absolute)
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    LDA                  ; BF AB FD 55 | Load from absolute long,X into accumulator
    ORA $B919,Y          ; 19 19 B9 | Logical OR with accumulator (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    SEC                  ; 38 | Set carry flag
    INC $00DB            ; EE DB 00 | Increment (absolute)
    LDX #$00             ; A2 00 | Load immediate value into X register
    INC $5F00            ; EE 00 5F | Increment (absolute)
    AND $4C00,X          ; 3D 00 4C | Logical AND with accumulator (absolute,X)
    AND $367F            ; 2D 7F 36 | Logical AND with accumulator (absolute)
    LSR $AFBF,X          ; 5E BF AF | Logical shift right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    LDY $00              ; A4 00 | Load from zero page into Y register
    SBC $C700            ; ED 00 C7 | Subtract with carry (absolute)
    SEC                  ; 38 | Set carry flag
    JMP $26E5A8          ; 5C A8 E5 26 | Jump to address long
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    SBC $0030,Y          ; F9 30 00 | Subtract with carry (absolute,Y)
    ROL $6C00,X          ; 3E 00 6C | Rotate left (absolute,X)
    JMP $004F00          ; 5C 00 4F 00 | Jump to address long
    SBC ($DE,X)          ; E1 DE | Subtract with carry ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    STZ $E2              ; 64 E2 | Store zero to zero page
    CPX $9F              ; E4 9F | Compare X register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    INC                  ; 1A | Increment accumulator
    LDA ($E1,X)          ; A1 E1 | Load from (zero page,X) into accumulator
    SBC $E4              ; E5 E4 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_16A
; Address: $E1E445
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_16A:
    CPX #$87             ; E0 87 | Compare X register (immediate)
    CPY #$5F             ; C0 5F | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    LDA                  ; BF BC 55 F6 | Load from absolute long,X into accumulator
    STA $66              ; 85 66 | Store accumulator to zero page
    ROR $DBE0,X          ; 7E E0 DB | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    DEC $F880,X          ; DE 80 F8 | Decrement (absolute,X)
    CPY #$22             ; C0 22 | Compare Y register (immediate)
    BRA $C2              ; 80 C2 | Branch always
    BRA $A9              ; 80 A9 | Branch always
    BRA $7B              ; 80 7B | Branch always
    BRA $FD              ; 80 FD | Branch always
    LDA                  ; BF F8 FF 0C | Load from absolute long,X into accumulator
    STZ $02              ; 64 02 | Store zero to zero page
    ROR $DFFF,X          ; 7E FF DF | Rotate right (absolute,X)
    DEC $F9A0,X          ; DE A0 F9 | Decrement (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_16C
; Address: $E1E481
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_16C:
    JSR $20E7            ; 20 E7 20 | Jump to subroutine
    SBC $DF0E,X          ; FD 0E DF | Subtract with carry (absolute,X)
    AND $6A24,Y          ; 39 24 6A | Logical AND with accumulator (absolute,Y)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    STY $FF9F            ; 8C 9F FF | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    DEC $FF              ; C6 FF | Decrement (zero page)
    BIT $FBDF            ; 2C DF FB | Test bits in accumulator (absolute)
    LDA $5A77,Y          ; B9 77 5A | Load from absolute,Y into accumulator
    AND #$78             ; 29 78 | Logical AND with accumulator (immediate)
    BEQ $9C              ; F0 9C | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    SBC $E7FF,Y          ; F9 FF E7 | Subtract with carry (absolute,Y)
    INC $BDE3            ; EE E3 BD | Increment (absolute)
    BNE $C8              ; D0 C8 | Branch if not equal
    CPY #$77             ; C0 77 | Compare Y register (immediate)
    LDA                  ; BF 40 FD 1F | Load from absolute long,X into accumulator
    SEC                  ; 38 | Set carry flag
    INC $D4              ; E6 D4 | Increment (zero page)
    STA $0F              ; 85 0F | Store accumulator to zero page
    ADC $9F00,X          ; 7D 00 9F | Add with carry (absolute,X)
    INX                  ; E8 | Increment X register
    INC $6B0F,X          ; FE 0F 6B | Increment (absolute,X)
    STA                  ; 9F 00 FE 3F | Store accumulator to absolute long,X
    INC $C96F            ; EE 6F C9 | Increment (absolute)
    CMP $944F            ; CD 4F 94 | Compare accumulator (absolute)
    STA                  ; 9F 36 3F 90 | Store accumulator to absolute long,X
    DEY                  ; 88 | Decrement Y register
    ORA #$43             ; 09 43 | Logical OR with accumulator (immediate)
    DEC $E70F            ; CE 0F E7 | Decrement (absolute)
    SBC ($07),Y          ; F1 07 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_16E
; Address: $E1E507
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_16E:
    JSR $6196            ; 20 96 61 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    ORA $039C,Y          ; 19 9C 03 | Logical OR with accumulator (absolute,Y)
    INY                  ; C8 | Increment Y register
    BMI $CF              ; 30 CF | Branch if negative
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    STA $E619,X          ; 9D 19 E6 | Store accumulator to absolute,X
    PHP                  ; 08 | Push processor status to stack
    ASL $FFFF            ; 0E FF FF | Arithmetic shift left (absolute)
    LDA                  ; BF FF 6A FE | Load from absolute long,X into accumulator
    ORA ($4F,X)          ; 01 4F | Logical OR with accumulator ((zero page,X))
    BCS $A4              ; B0 A4 | Branch if carry set
    TXA                  ; 8A | Transfer X register to accumulator
    EOR $7759,Y          ; 59 59 77 | Exclusive OR with accumulator (absolute,Y)
    LDA                  ; BF BF 6A 6A | Load from absolute long,X into accumulator
    CMP $E6DF            ; CD DF E6 | Compare accumulator (absolute)
    STA ($E6),Y          ; 91 E6 | Store accumulator to (zero page),Y
    CLC                  ; 18 | Clear carry flag
    SBC $7E25,Y          ; F9 25 7E | Subtract with carry (absolute,Y)
    PEA #$BA07           ; F4 07 BA | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    AND $7E00,Y          ; 39 00 7E | Logical AND with accumulator (absolute,Y)
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ROR $34D2,X          ; 7E D2 34 | Rotate right (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    LDA $FF2D            ; AD 2D FF | Load from absolute address into accumulator
    PHY                  ; 5A | Push Y register to stack
    LDA $15              ; A5 15 | Load from zero page into accumulator
    AND $0900            ; 2D 00 09 | Logical AND with accumulator (absolute)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    LDA                  ; BF B6 FF 56 | Load from absolute long,X into accumulator
    ADC $FFF7,Y          ; 79 F7 FF | Add with carry (absolute,Y)
    STY $7B              ; 84 7B | Store Y register to zero page
    PEA #$CB00           ; F4 00 CB | Push effective address to stack
    LDX $2800            ; AE 00 28 | Load from absolute address into X register
    LDA $000000          ; AF 00 00 00 | Load from absolute long address into accumulator
    ROL $DC2A,X          ; 3E 2A DC | Rotate left (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    CMP $DFB5,X          ; DD B5 DF | Compare accumulator (absolute,X)
    LDA                  ; BF F7 FF CA | Load from absolute long,X into accumulator
    CMP $2F00,X          ; DD 00 2F | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_16F
; Address: $E1E5D6
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_16F:
    ROR                  ; 6A | Rotate right (accumulator)
    ADC $0900            ; 6D 00 09 | Add with carry (absolute)
    SBC $0000            ; ED 00 00 | Subtract with carry (absolute)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ADC $FFFF            ; 6D FF FF | Add with carry (absolute)
    STY $FC73            ; 8C 73 FC | Store Y register to absolute address
    SBC $CD00,X          ; FD 00 CD | Subtract with carry (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    STA $E3D33F          ; 8F 3F D3 E3 | Store accumulator to absolute long address
    AND ($D0),Y          ; 31 D0 | Logical AND with accumulator ((zero page),Y)
    CPX $01              ; E4 01 | Compare X register (zero page)
    ROL $C2              ; 26 C2 | Rotate left (zero page)
    ADC ($90),Y          ; 71 90 | Add with carry ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    BIT $3F00            ; 2C 00 3F | Test bits in accumulator (absolute)
    AND $2F00            ; 2D 00 2F | Logical AND with accumulator (absolute)
    AND $2F00,X          ; 3D 00 2F | Logical AND with accumulator (absolute,X)
    SBC $FFC0,X          ; FD C0 FF | Subtract with carry (absolute,X)
    CPX $D9              ; E4 D9 | Compare X register (zero page)
    ROL $CF70            ; 2E 70 CF | Rotate left (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $000C,X          ; FD 0C 00 | Subtract with carry (absolute,X)
    PEA #$BC00           ; F4 00 BC | Push effective address to stack
    LDY $A400            ; AC 00 A4 | Load from absolute address into Y register
    STY $7F00            ; 8C 00 7F | Store Y register to absolute address
    LDA #$F9             ; A9 F9 | Load immediate value into accumulator
    JMP $89FC            ; 4C FC 89 | Jump to address
    INX                  ; E8 | Increment X register
    ORA ($90),Y          ; 11 90 | Logical OR with accumulator ((zero page),Y)
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    CPX #$6D             ; E0 6D | Compare X register (immediate)
    CPX #$ED             ; E0 ED | Compare X register (immediate)
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    BEQ $73              ; F0 73 | Branch if equal
    BEQ $E7              ; F0 E7 | Branch if equal
    BEQ $8E              ; F0 8E | Branch if equal
    CPX #$3A             ; E0 3A | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    BCC $BF              ; 90 BF | Branch if carry clear
    BCS $7F              ; B0 7F | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_170
; Address: $E1E66C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_170:
    PLX                  ; FA | Pull X register from stack
    STA $E5              ; 85 E5 | Store accumulator to zero page
    INC                  ; 1A | Increment accumulator
    INY                  ; C8 | Increment Y register
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $B0              ; 80 B0 | Branch always
    BRA $68              ; 80 68 | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_171
; Address: $E1E678
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_171:
    JMP $9C00            ; 4C 00 9C | Jump to address
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDA ($61,X)          ; A1 61 | Load from (zero page,X) into accumulator
    EOR $6B3F            ; 4D 3F 6B | Exclusive OR with accumulator (absolute)
    STA $6B              ; 85 6B | Store accumulator to zero page
    ASL $C0DE            ; 0E DE C0 | Arithmetic shift left (absolute)
    JMP $E0E9C0          ; 5C C0 E9 E0 | Game work RAM access
    BEQ $FC              ; F0 FC | Branch if equal
    SBC $3FFF,Y          ; F9 FF 3F | Subtract with carry (absolute,Y)
    ORA $4E0E            ; 0D 0E 4E | Logical OR with accumulator (absolute)
    EOR $A656,Y          ; 59 56 A6 | Exclusive OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SBC $F967,X          ; FD 67 F9 | Subtract with carry (absolute,X)
    CPY $BE              ; C4 BE | Compare Y register (zero page)
    BVS $F3              ; 70 F3 | Branch if overflow set
    LDA $1F5E0F          ; AF 0F 5E 1F | Load from absolute long address into accumulator
    LDY $FB3F,X          ; BC 3F FB | Load from absolute,X into Y register
    ADC $3E8F,Y          ; 79 8F 3E | Add with carry (absolute,Y)
    SBC $FA0D,X          ; FD 0D FA | Subtract with carry (absolute,X)
    LSR $AEA0,X          ; 5E A0 AE | Logical shift right (absolute,X)
    EOR ($16),Y          ; 51 16 | Exclusive OR with accumulator ((zero page),Y)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    AND $3301,X          ; 3D 01 33 | Logical AND with accumulator (absolute,X)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    STA $87              ; 85 87 | Store accumulator to zero page
    DEC $07              ; C6 07 | Decrement (zero page)
    SBC ($03,X)          ; E1 03 | Subtract with carry ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    SBC $EA3D,X          ; FD 3D EA | Subtract with carry (absolute,X)
    ROR $7E              ; 66 7E | Rotate right (zero page)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    STZ $01              ; 64 01 | Store zero to zero page
    ORA ($95,X)          ; 01 95 | Logical OR with accumulator ((zero page,X))
    ORA ($DC,X)          ; 01 DC | Logical OR with accumulator ((zero page,X))
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    DEC $3CD3            ; CE D3 3C | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    LDX $B880,Y          ; BE 80 B8 | Load from absolute,Y into X register
    BRA $51              ; 80 51 | Branch always
    BPL $67              ; 10 67 | Branch if positive
    STZ $98              ; 64 98 | Store zero to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    DEC $FF00            ; CE 00 FF | Decrement (absolute)
    INC $7C83            ; EE 83 7C | Increment (absolute)
    LSR $B930            ; 4E 30 B9 | Logical shift right (absolute)
    EOR ($CC,X)          ; 41 CC | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank42_DmaFunction_172
; Address: $E1E72E
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_172:
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    INC $F700,X          ; FE 00 F7 | Increment (absolute,X)
    CMP $7C2B,X          ; DD 2B 7C | Compare accumulator (absolute,X)
    LDX $D966            ; AE 66 D9 | Load from absolute address into X register
    EOR $EDAE,Y          ; 59 AE ED | Exclusive OR with accumulator (absolute,Y)
    DEC $3770            ; CE 70 37 | Decrement (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($EE),Y          ; 31 EE | Logical AND with accumulator ((zero page),Y)
    ADC $7C83,Y          ; 79 83 7C | Add with carry (absolute,Y)
    ADC $B19E            ; 6D 9E B1 | Add with carry (absolute)
    ASL $0738            ; 0E 38 07 | Arithmetic shift left (absolute)
    CMP $00C3,X          ; DD C3 00 | Compare accumulator (absolute,X)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX $FC00            ; EC 00 FC | Compare X register (absolute)
    INC $3F00            ; EE 00 3F | Increment (absolute)
    LDX $9900            ; AE 00 99 | Load from absolute address into X register
    ASL $D900            ; 0E 00 D9 | Arithmetic shift left (absolute)
    ROL $00              ; 26 00 | Rotate left (zero page)
    CMP $7C2B,X          ; DD 2B 7C | Compare accumulator (absolute,X)
    LDX $D964            ; AE 64 D9 | Load from absolute address into X register
    CLI                  ; 58 | Clear interrupt disable flag
    LDX $36ED            ; AE ED 36 | Load from absolute address into X register
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    ROL $C0              ; 26 C0 | Rotate left (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ROL $4101            ; 2E 01 41 | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    ORA ($34,X)          ; 01 34 | Logical OR with accumulator ((zero page,X))
    BVS $0F              ; 70 0F | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($EE),Y          ; 31 EE | Logical AND with accumulator ((zero page),Y)
    ADC $7C03,Y          ; 79 03 7C | Add with carry (absolute,Y)
    EOR $019E            ; 4D 9E 01 | Exclusive OR with accumulator (absolute)
    ASL $07D8            ; 0E D8 07 | Arithmetic shift left (absolute)
    AND $03              ; 25 03 | Logical AND with accumulator (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BVS $80              ; 70 80 | Branch if overflow set
    BVS $80              ; 70 80 | Branch if overflow set
    STY $0C60            ; 8C 60 0C | Store Y register to absolute address
    BEQ $06              ; F0 06 | Branch if equal
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    BCS $47              ; B0 47 | Branch if carry set

;------------------------------------------------------------------------------
; Bank42_DmaFunction_173
; Address: $E1E7E3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_173:
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    CPX #$07             ; E0 07 | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    BCS $47              ; B0 47 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    CPX #$07             ; E0 07 | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    BRA $9F              ; 80 9F | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_174
; Address: $E1E7F3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_174:
    JSR $00BF            ; 20 BF 00 | Jump to subroutine
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    BRA $9F              ; 80 9F | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_175
; Address: $E1E7FB
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_175:
    JSR $00BF            ; 20 BF 00 | Jump to subroutine
    LDY #$F4             ; A0 F4 | Load immediate value into Y register
    ORA ($A6),Y          ; 11 A6 | Logical OR with accumulator ((zero page),Y)
    WDM #$71             ; 42 71 | Reserved instruction
    BCC $E4              ; 90 E4 | Branch if carry clear
    ADC ($D6,X)          ; 61 D6 | Add with carry ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    ROL $90              ; 26 90 | Rotate left (zero page)
    BCC $2F              ; 90 2F | Branch if carry clear
    AND $2F00,X          ; 3D 00 2F | Logical AND with accumulator (absolute,X)
    AND $2700            ; 2D 00 27 | Logical AND with accumulator (absolute)
    CMP $6F00,Y          ; D9 00 6F | Compare accumulator (absolute,Y)
    CMP $7AFE,Y          ; D9 FE 7A | Compare accumulator (absolute,Y)
    CLD                  ; D8 | Clear decimal mode flag
    ASL $AC0B            ; 0E 0B AC | Arithmetic shift left (absolute)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    STY $A600            ; 8C 00 A6 | Store Y register to absolute address
    AND $2D00            ; 2D 00 2D | Logical AND with accumulator (absolute)
    PHB                  ; 8B | Push data bank register to stack
    ADC $6AFC,X          ; 7D FC 6A | Add with carry (absolute,X)
    ADC $F033,Y          ; 79 33 F0 | Add with carry (absolute,Y)
    LDA $8EEE            ; AD EE 8E | Load from absolute address into accumulator
    CPX $E2E0            ; EC E0 E2 | Compare X register (absolute)
    BRA $76              ; 80 76 | Branch always
    BCC $6E              ; 90 6E | Branch if carry clear
    CPX #$88             ; E0 88 | Compare X register (immediate)
    CPX #$D3             ; E0 D3 | Compare X register (immediate)
    CPY #$F1             ; C0 F1 | Compare Y register (immediate)
    CPY #$BC             ; C0 BC | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ROL $002E            ; 2E 2E 00 | Rotate left (absolute)
    CLV                  ; B8 | Clear overflow flag
    LDA                  ; BF 66 FF 46 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_177
; Address: $E1E87A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_177:
    SED                  ; F8 | Set decimal mode flag
    INC $9EC0,X          ; FE C0 9E | Increment (absolute,X)
    STZ $0707,X          ; 9E 07 07 | Store zero to absolute,X
    ORA $E419,Y          ; 19 19 E4 | Logical OR with accumulator (absolute,Y)
    AND ($FB),Y          ; 31 FB | Logical AND with accumulator ((zero page),Y)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    INC $00              ; E6 00 | Increment (zero page)
    STA                  ; 9F 8F FB FF | Store accumulator to absolute long,X
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    BCS $24              ; B0 24 | Branch if carry set
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    JMP ($00B7)          ; 6C B7 00 | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_178
; Address: $E1E8B4
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_178:
    BNE $00              ; D0 00 | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    BRA $18              ; 80 18 | Branch always
    CPX #$04             ; E0 04 | Compare X register (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    BEQ $4A              ; F0 4A | Branch if equal
    BCC $DF              ; 90 DF | Branch if carry clear
    LDA ($D8),Y          ; B1 D8 | Load from (zero page),Y into accumulator
    PLB                  ; AB | Pull data bank register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $8D86            ; 4C 86 8D | Jump to address
    PLP                  ; 28 | Pull processor status from stack
    ROR $5C00            ; 6E 00 5C | Rotate right (absolute)
    NOP                  ; EA | No operation
    SBC $7A00,X          ; FD 00 7A | Subtract with carry (absolute,X)
    LDY $7800,X          ; BC 00 78 | Load from absolute,X into Y register
    DEC $FE4F            ; CE 4F FE | Decrement (absolute)
    STZ $0FCA,X          ; 9E CA 0F | Store zero to absolute,X
    INX                  ; E8 | Increment X register
    ADC #$F8             ; 69 F8 | Add with carry (immediate)
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    CPY $B7CF            ; CC CF B7 | Compare Y register (absolute)
    ORA ($6E,X)          ; 01 6E | Logical OR with accumulator ((zero page,X))
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    STA ($07),Y          ; 91 07 | Store accumulator to (zero page),Y
    STA $0F1707          ; 8F 07 17 0F | Store accumulator to absolute long address
    ROL $F83E,X          ; 3E 3E F8 | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    CMP #$C1             ; C9 C1 | Compare accumulator (immediate)
    ASL $BD30            ; 0E 30 BD | Arithmetic shift left (absolute)
    LSR $04              ; 46 04 | Logical shift right (zero page)
    CLC                  ; 18 | Clear carry flag
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_179
; Address: $E1E918
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_179:
    ASL $3E00            ; 0E 00 3E | Arithmetic shift left (absolute)
    BEQ $F0              ; F0 F0 | Branch if equal
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    STA $FCFC8F          ; 8F 8F FC FC | Store accumulator to absolute long address
    CPX #$E0             ; E0 E0 | Game work RAM access
    STX $80              ; 86 80 | Store X register to zero page
    AND $A202,X          ; 3D 02 A2 | Logical AND with accumulator (absolute,X)
    ADC $000F,X          ; 7D 0F 00 | Add with carry (absolute,X)
    STZ $7000,X          ; 9E 00 70 | Store zero to absolute,X
    SBC $B800,X          ; FD 00 B8 | Subtract with carry (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    WDM #$7F             ; 42 7F | Reserved instruction
    CPY $B6              ; C4 B6 | Compare Y register (zero page)
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    DEC $E133            ; CE 33 E1 | Decrement (absolute)
    ASL $006C,X          ; 1E 6C 00 | Arithmetic shift left (absolute,X)
    AND $7D00,X          ; 3D 00 7D | Logical AND with accumulator (absolute,X)
    CMP #$C6             ; C9 C6 | Compare accumulator (immediate)
    STA $026D            ; 8D 6D 02 | Store accumulator to absolute address
    LDX $4CA5            ; AE A5 4C | Load from absolute address into X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_17A
; Address: $E1E970
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_17A:
    ROL $7E00,X          ; 3E 00 7E | Rotate left (absolute,X)
    INC $5C00,X          ; FE 00 5C | Increment (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    INC $D800,X          ; FE 00 D8 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    STA                  ; 9F FF 45 7F | Store accumulator to absolute long,X
    STA $CFB34F          ; 8F 4F B3 CF | Store accumulator to absolute long address
    STA $0808,Y          ; 99 08 08 | Store accumulator to absolute,Y
    EOR $45              ; 45 45 | Exclusive OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    LDX $5F40            ; AE 40 5F | Load from absolute address into X register
    CPY $B6              ; C4 B6 | Compare Y register (zero page)
    CPY #$7B             ; C0 7B | Compare Y register (immediate)
    CPY #$9E             ; C0 9E | Compare Y register (immediate)
    DEC $E133            ; CE 33 E1 | Decrement (absolute)
    ASL $7F00,X          ; 1E 00 7F | Arithmetic shift left (absolute,X)
    AND $3DC0,Y          ; 39 C0 3D | Logical AND with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    ADC ($06),Y          ; 71 06 | Add with carry ((zero page),Y)
    LDX #$0D             ; A2 0D | Load immediate value into X register
    STA $7602,Y          ; 99 02 76 | Store accumulator to absolute,Y
    ORA $DC              ; 05 DC | Logical OR with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_17C
; Address: $E1E9D9
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_17C:
    SED                  ; F8 | Set decimal mode flag
    BPL $C8              ; 10 C8 | Branch if positive
    BRA $18              ; 80 18 | Branch always
    ORA $E2              ; 05 E2 | Logical OR with accumulator (zero page)
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA $E2              ; 05 E2 | Logical OR with accumulator (zero page)
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    INC $F901,X          ; FE 01 F9 | Increment (absolute,X)
    SBC $FA00,X          ; FD 00 FA | Subtract with carry (absolute,X)
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    SBC $FA00,X          ; FD 00 FA | Subtract with carry (absolute,X)
    ORA $C7              ; 05 C7 | Logical OR with accumulator (zero page)
    STA $C019,Y          ; 99 19 C0 | Store accumulator to absolute,Y
    CLI                  ; 58 | Clear interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    LDY #$43             ; A0 43 | Load immediate value into Y register
    ORA $54E6,X          ; 1D E6 54 | Logical OR with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    CLV                  ; B8 | Clear overflow flag
    INC $00              ; E6 00 | Increment (zero page)
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    INC $5EED,X          ; FE ED 5E | Increment (absolute,X)
    LDX $BD              ; A6 BD | Load from zero page into X register
    ROR $2CE3,X          ; 7E E3 2C | Rotate right (absolute,X)
    AND $F8FA,X          ; 3D FA F8 | Logical AND with accumulator (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STA $D200,X          ; 9D 00 D2 | Store accumulator to absolute,X
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_17D
; Address: $E1EA3E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_17D:
    JSR $0700            ; 20 00 07 | Jump to subroutine
    STX $83              ; 86 83 | Store X register to zero page
    STX $0F8F            ; 8E 8F 0F | Store X register to absolute address
    SBC $FCAF,X          ; FD AF FC | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    LDA $FCC0,Y          ; B9 C0 FC | Load from absolute,Y into accumulator
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    DEY                  ; 88 | Decrement Y register
    DEC $B9              ; C6 B9 | Decrement (zero page)
    REP #$CE             ; C2 CE | Reset processor status bits
    ADC $60FF,Y          ; 79 FF 60 | Add with carry (absolute,Y)
    STZ $CCCF            ; 9C CF CC | Store zero to absolute
    BEQ $00              ; F0 00 | Branch if equal
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_17E
; Address: $E1EA7A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_17E:
    CLC                  ; 18 | Clear carry flag
    ROR                  ; 6A | Rotate right (accumulator)
    ORA $DF              ; 05 DF | Logical OR with accumulator (zero page)
    BIT #$47             ; 89 47 | Test bits in accumulator (immediate)
    STZ $0EEF,X          ; 9E EF 0E | Store zero to absolute,X
    SBC #$39             ; E9 39 | Subtract with carry (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_17F
; Address: $E1EA98
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_17F:
    AND $1000            ; 2D 00 10 | Logical AND with accumulator (absolute)
    JMP $A000            ; 4C 00 A0 | Jump to address
    STZ $C4              ; 64 C4 | Store zero to zero page
    BIT $58              ; 24 58 | Test bits in accumulator (zero page)
    STA $1093            ; 8D 93 10 | Store accumulator to absolute address
    STA $2C8A            ; 8D 8A 2C | Store accumulator to absolute address
    AND $C0              ; 25 C0 | Logical AND with accumulator (zero page)
    CMP ($B2,X)          ; C1 B2 | Compare accumulator ((zero page,X))
    ADC $7D00,X          ; 7D 00 7D | Add with carry (absolute,X)
    PEA #$72FB           ; F4 FB 72 | Push effective address to stack
    INX                  ; E8 | Increment X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_180
; Address: $E1EAC6
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_180:
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt
    LSR $0B00,X          ; 5E 00 0B | Logical shift right (absolute,X)
    BRA $8D              ; 80 8D | Branch always
    STA                  ; 9F 00 BF 00 | Store accumulator to absolute long,X
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    LDY #$61             ; A0 61 | Load immediate value into Y register
    SBC ($21,X)          ; E1 21 | PPU graphics register access
    ADC ($91),Y          ; 71 91 | Add with carry ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHA                  ; 48 | Push accumulator to stack
    INC $7B1E,X          ; FE 1E 7B | Increment (absolute,X)
    NOP                  ; EA | No operation
    STA $5F03,X          ; 9D 03 5F | Store accumulator to absolute,X
    ROL $1700            ; 2E 00 17 | Rotate left (absolute)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    ORA ($C2,X)          ; 01 C2 | Logical OR with accumulator ((zero page,X))
    REP #$E4             ; C2 E4 | Reset processor status bits
    LDA $7941            ; AD 41 79 | Load from absolute address into accumulator
    STA ($93,X)          ; 81 93 | Store accumulator to (zero page,X)
    STX $E0              ; 86 E0 | Game work RAM access
    BRA $A6              ; 80 A6 | Branch always
    RTI                  ; 40 | Return from interrupt
    SBC $7B00,X          ; FD 00 7B | Subtract with carry (absolute,X)
    ROR $5E00,X          ; 7E 00 5E | Rotate right (absolute,X)
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    LSR $43              ; 46 43 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_181
; Address: $E1EB22
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_181:
    SBC #$E6             ; E9 E6 | Subtract with carry (immediate)
    SBC $D3E6,X          ; FD E6 D3 | Subtract with carry (absolute,X)
    CPY $4669            ; CC 69 46 | Compare Y register (absolute)
    STX $3701            ; 8E 01 37 | Store X register to absolute address
    XBA                  ; EB | Exchange accumulator bytes
    INC $BE              ; E6 BE | Increment (zero page)
    LDX $FF00,Y          ; BE 00 FF | Load from absolute,Y into X register
    SBC $1E00,X          ; FD 00 1E | Subtract with carry (absolute,X)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ADC $E17B,Y          ; 79 7B E1 | Add with carry (absolute,Y)
    SBC $C2              ; E5 C2 | Subtract with carry (zero page)
    DEX                  ; CA | Decrement X register
    STA                  ; 9F C7 79 89 | Store accumulator to absolute long,X
    SBC $8600,Y          ; F9 00 86 | Subtract with carry (absolute,Y)
    ASL $3D00,X          ; 1E 00 3D | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $88              ; F0 88 | Branch if equal
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    LDA ($E3,X)          ; A1 E3 | Load from (zero page,X) into accumulator
    DEC $342B            ; CE 2B 34 | Decrement (absolute)
    NOP                  ; EA | No operation
    SBC $008F,X          ; FD 8F 00 | Subtract with carry (absolute,X)
    ROR $3C00,X          ; 7E 00 3C | Rotate right (absolute,X)
    AND $DF00,Y          ; 39 00 DF | Logical AND with accumulator (absolute,Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SBC $F3F9,Y          ; F9 F9 F3 | Subtract with carry (absolute,Y)
    STX $86              ; 86 86 | Store X register to zero page
    SBC $F7FD,X          ; FD FD F7 | Subtract with carry (absolute,X)
    INC $F90E,X          ; FE 0E F9 | Increment (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ADC $0200,Y          ; 79 00 02 | Add with carry (absolute,Y)
    INY                  ; C8 | Increment Y register
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ADC $92CE,X          ; 7D CE 92 | Add with carry (absolute,X)
    STA ($18,X)          ; 81 18 | Store accumulator to (zero page,X)
    ASL $D900            ; 0E 00 D9 | Arithmetic shift left (absolute)
    ROL $00              ; 26 00 | Rotate left (zero page)
    DEC $3C00            ; CE 00 3C | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    CPY $1B33            ; CC 33 1B | Compare Y register (absolute)
    CPX $6F              ; E4 6F | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDY #$4F             ; A0 4F | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F BE 77 00 | Store accumulator to absolute long,X
    BPL $07              ; 10 07 | Branch if positive
    BMI $0F              ; 30 0F | Branch if negative
    LDY #$07             ; A0 07 | Load immediate value into Y register
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_182
; Address: $E1EBDF
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_182:
    ORA ($EC,X)          ; 01 EC | Logical OR with accumulator ((zero page,X))
    SBC $3CC3            ; ED C3 3C | Subtract with carry (absolute)
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    LDA                  ; BF 0C 7F 84 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    STZ $D3              ; 64 D3 | Store zero to zero page
    REP #$B1             ; C2 B1 | Reset processor status bits
    SBC $9EE1,Y          ; F9 E1 9E | Subtract with carry (absolute,Y)
    CMP $E720,X          ; DD 20 E7 | Compare accumulator (absolute,X)
    BIT $ED              ; 24 ED | Test bits in accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    PLP                  ; 28 | Pull processor status from stack
    EOR $E2              ; 45 E2 | Exclusive OR with accumulator (zero page)
    BIT $25              ; 24 25 | Test bits in accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    STA $E3FF,X          ; 9D FF E3 | Store accumulator to absolute,X
    INC $3EC7,X          ; FE C7 3E | Increment (absolute,X)
    DEC $DAC3,X          ; DE C3 DA | Decrement (absolute,X)
    STA ($B7,X)          ; 81 B7 | Store accumulator to (zero page,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    BRA $FE              ; 80 FE | Branch always
    SED                  ; F8 | Set decimal mode flag
    STA $2A241C          ; 8F 1C 24 2A | Store accumulator to absolute long address
    CMP ($DF,X)          ; C1 DF | Compare accumulator ((zero page,X))
    CMP ($DC,X)          ; C1 DC | Compare accumulator ((zero page,X))
    CMP $7FBF,Y          ; D9 BF 7F | Compare accumulator (absolute,Y)
    STA $5C87FB          ; 8F FB 87 5C | Store accumulator to absolute long address
    ROL $3D07,X          ; 3E 07 3D | Rotate left (absolute,X)
    INC $1003            ; EE 03 10 | Increment (absolute)
    BMI $F0              ; 30 F0 | Branch if negative
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    BPL $FF              ; 10 FF | Branch if positive
    SBC $AD00            ; ED 00 AD | Subtract with carry (absolute)
    ADC $6D00            ; 6D 00 6D | Add with carry (absolute)
    ORA #$F4             ; 09 F4 | Logical OR with accumulator (immediate)
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    LDY $FF              ; A4 FF | Load from zero page into Y register
    STA ($DF),Y          ; 91 DF | Store accumulator to (zero page),Y
    STA ($DB),Y          ; 91 DB | Store accumulator to (zero page),Y
    PHP                  ; 08 | Push processor status to stack
    JMP ($5B00)          ; 6C 00 5B | Jump to address (absolute indirect)
    ROR $6B00            ; 6E 00 6B | Rotate right (absolute)
    ROR $2A00            ; 6E 00 2A | Rotate right (absolute)
    LDY $52BB            ; AC BB 52 | Load from absolute address into Y register
    ADC $D2AC,X          ; 7D AC D2 | Add with carry (absolute,X)
    ADC $52AD,X          ; 7D AD 52 | Add with carry (absolute,X)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    AND $1200            ; 2D 00 12 | Logical AND with accumulator (absolute)
    AND $3B00            ; 2D 00 3B | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_183
; Address: $E1ECA2
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_183:
    AND $F6C6,Y          ; 39 C6 F6 | Logical AND with accumulator (absolute,Y)
    ADC #$61             ; 69 61 | Add with carry (immediate)
    ROR $F32D,X          ; 7E 2D F3 | Rotate right (absolute,X)
    BCS $6B              ; B0 6B | Branch if carry set
    ROR                  ; 6A | Rotate right (accumulator)
    PHB                  ; 8B | Push data bank register to stack
    BPL $00              ; 10 00 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    BNE $00              ; D0 00 | Branch if not equal
    JMP $9400            ; 4C 00 94 | Jump to address
    CPY $3E33            ; CC 33 3E | Compare Y register (absolute)
    CMP $2CF3,Y          ; D9 F3 2C | Compare accumulator (absolute,Y)
    CMP $3512            ; CD 12 35 | Compare accumulator (absolute)
    STY $2B9F            ; 8C 9F 2B | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank42_DmaFunction_184
; Address: $E1ECCC
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_184:
    JSL $D194FC          ; 22 FC 94 D1 | Jump to subroutine long
    ROL $6200            ; 2E 00 62 | Rotate left (absolute)
    ROR $FF00            ; 6E 00 FF | Rotate right (absolute)
    ROR $FCFF,X          ; 7E FF FC | Rotate right (absolute,X)
    SBC $A5FE,X          ; FD FE A5 | Subtract with carry (absolute,X)
    LDA                  ; BF 77 7D F5 | Load from absolute long,X into accumulator
    SBC #$69             ; E9 69 | Subtract with carry (immediate)
    PLB                  ; AB | Pull data bank register from stack
    LDA #$42             ; A9 42 | Hardware register operation
    PHY                  ; 5A | Push Y register to stack
    PEA #$EC07           ; F4 07 EC | Push effective address to stack
    CLD                  ; D8 | Clear decimal mode flag
    TSX                  ; BA | Transfer stack pointer to X register
    LDA $C545,Y          ; B9 45 C5 | Load from absolute,Y into accumulator
    AND $71A9,Y          ; 39 A9 71 | Logical AND with accumulator (absolute,Y)
    EOR $32E1,Y          ; 59 E1 32 | Exclusive OR with accumulator (absolute,Y)
    REP #$94             ; C2 94 | Reset processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_185
; Address: $E1ED0C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_185:
    ORA $62E0,Y          ; 19 E0 62 | Logical OR with accumulator (absolute,Y)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    ASL $3E00,X          ; 1E 00 3E | Arithmetic shift left (absolute,X)
    ROR $7D00,X          ; 7E 00 7D | Rotate right (absolute,X)
    CPX $DDE3            ; EC E3 DD | Compare X register (absolute)
    DEX                  ; CA | Decrement X register
    TYA                  ; 98 | Transfer Y register to accumulator
    AND $077A            ; 2D 7A 07 | Logical AND with accumulator (absolute)
    SBC $8606,Y          ; F9 06 86 | Subtract with carry (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    AND $1C              ; 25 1C | Logical AND with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    INC $FA00,X          ; FE 00 FA | Increment (absolute,X)
    INC $DE00,X          ; FE 00 DE | Increment (absolute,X)
    LDA $38B252          ; AF 52 B2 38 | Load from absolute long address into accumulator
    CLD                  ; D8 | Clear decimal mode flag
    AND $6FE0            ; 2D E0 6F | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_186
; Address: $E1ED49
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_186:
    LDX $DC              ; A6 DC | Load from zero page into X register
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $F039,Y          ; 39 39 F0 | Logical AND with accumulator (absolute,Y)
    SBC $E700            ; ED 00 E7 | Subtract with carry (absolute)
    CMP $BF00,Y          ; D9 00 BF | Compare accumulator (absolute,Y)
    DEC $00              ; C6 00 | Decrement (zero page)
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    PHB                  ; 8B | Push data bank register to stack
    LSR $3A0D            ; 4E 0D 3A | Logical shift right (absolute)
    AND ($EF,X)          ; 21 EF | Logical AND with accumulator ((zero page,X))
    BCC $6F              ; 90 6F | Branch if carry clear
    ROR $CF7E,X          ; 7E 7E CF | Rotate right (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    INC $F91E,X          ; FE 1E F9 | Increment (absolute,X)
    AND $0E8E,Y          ; 39 8E 0E | Logical AND with accumulator (absolute,Y)
    AND $FC38,Y          ; 39 38 FC | Logical AND with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    DEC $00              ; C6 00 | Decrement (zero page)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    LDX $9900            ; AE 00 99 | Load from absolute address into X register
    ASL $D900            ; 0E 00 D9 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_187
; Address: $E1EDAE
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_187:
    JSL $FF007D          ; 22 7D 00 FF | Jump to subroutine long
    SBC $8038,X          ; FD 38 80 | Subtract with carry (absolute,X)
    LSR $46              ; 46 46 | Logical shift right (zero page)
    ORA $190D,X          ; 1D 0D 19 | Logical OR with accumulator (absolute,X)
    ORA #$28             ; 09 28 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $00              ; B0 00 | Branch if carry set
    STZ $00              ; 64 00 | Store zero to zero page
    CPX $B900            ; EC 00 B9 | Compare X register (absolute)
    NOP                  ; EA | No operation
    ROR                  ; 6A | Rotate right (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $4D35            ; CD 35 4D | Compare accumulator (absolute)
    AND $0EFD            ; 2D FD 0E | Logical AND with accumulator (absolute)
    INC $7606,X          ; FE 06 76 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDA ($40),Y          ; B1 40 | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_188
; Address: $E1EDFF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_188:
    JSR $FD43            ; 20 43 FD | Jump to subroutine
    REP #$36             ; C2 36 | Reset processor status bits
    BNE $5F              ; D0 5F | Branch if not equal
    ADC $EE              ; 65 EE | Add with carry (zero page)
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_189
; Address: $E1EE13
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_189:
    INC $FC75,X          ; FE 75 FC | Increment (absolute,X)
    ROL $EFCC            ; 2E CC EF | Rotate left (absolute)
    STA $7F83,Y          ; 99 83 7F | Store accumulator to absolute,Y
    DEC $DF              ; C6 DF | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_18A
; Address: $E1EE20
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_18A:
    JSR $453F            ; 20 3F 45 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    STX $FF              ; 86 FF | Store X register to zero page
    EOR $C5FF,Y          ; 59 FF C5 | Exclusive OR with accumulator (absolute,Y)
    DEX                  ; CA | Decrement X register
    ORA ($B7,X)          ; 01 B7 | Logical OR with accumulator ((zero page,X))
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    INC $FE7D,X          ; FE 7D FE | Increment (absolute,X)
    BIT #$20             ; 89 20 | Test bits in accumulator (immediate)
    CMP $C0ED            ; CD ED C0 | Compare accumulator (absolute)
    STA $FB              ; 85 FB | Store accumulator to zero page
    PEA #$D4DB           ; F4 DB D4 | Push effective address to stack
    SBC $3200,X          ; FD 00 32 | Subtract with carry (absolute,X)
    ADC $9706,X          ; 7D 06 97 | Add with carry (absolute,X)
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    SBC $B99D            ; ED 9D B9 | Subtract with carry (absolute)
    EOR #$FB             ; 49 FB | Exclusive OR with accumulator (immediate)
    LDA                  ; BF 00 4C 00 | Load from absolute long,X into accumulator
    ROR $B2E0,X          ; 7E E0 B2 | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_18B
; Address: $E1EE7F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_18B:
    BEQ $02              ; F0 02 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    LDX $66              ; A6 66 | Load from zero page into X register
    JMP $0DF2BF          ; 5C BF F2 0D | Jump to address long
    EOR $7DB2            ; 4D B2 7D | Exclusive OR with accumulator (absolute)
    BIT $25              ; 24 25 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    JMP $B7B6            ; 4C B6 B7 | Jump to address
    CMP $BACE            ; CD CE BA | Compare accumulator (absolute)
    ADC $9669,X          ; 7D 69 96 | Add with carry (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC $CC              ; 65 CC | Add with carry (zero page)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BMI $00              ; 30 00 | Branch if negative
    LDA $861D            ; AD 1D 86 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_18D
; Address: $E1EECA
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_18D:
    INC $25              ; E6 25 | Increment (zero page)
    PHX                  ; DA | Push X register to stack
    LDY $67              ; A4 67 | Load from zero page into Y register
    ADC $7E00,X          ; 7D 00 7E | Add with carry (absolute,X)
    ROR $3C00,X          ; 7E 00 3C | Rotate right (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    STA $E3FC,Y          ; 99 FC E3 | Store accumulator to absolute,Y
    CPX $CDF2            ; EC F2 CD | Compare X register (absolute)
    INC $FFF1,X          ; FE F1 FF | Increment (absolute,X)
    LDX #$FE             ; A2 FE | Load immediate value into X register
    SBC $F4FB,Y          ; F9 FB F4 | Subtract with carry (absolute,Y)
    BCC $90              ; 90 90 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_191
; Address: $E1EEF6
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_191:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BNE $D0              ; D0 D0 | Branch if not equal
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BPL $10              ; 10 10 | Branch if positive
    BIT $D9D3            ; 2C D3 D9 | Test bits in accumulator (absolute)
    ROL $7E              ; 26 7E | Rotate left (zero page)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    SBC $EEFD,X          ; FD FD EE | Subtract with carry (absolute,X)
    INC $9A9A            ; EE 9A 9A | Increment (absolute)
    EOR ($41),Y          ; 51 41 | Exclusive OR with accumulator ((zero page),Y)
    JMP ($2847)          ; 6C 47 28 | Jump to address (absolute indirect)
    STA $BE              ; 85 BE | Store accumulator to zero page
    CMP #$DF             ; C9 DF | Compare accumulator (immediate)
    INY                  ; C8 | Increment Y register
    SBC $9E              ; E5 9E | Subtract with carry (zero page)
    EOR $14C3            ; 4D C3 14 | Exclusive OR with accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ADC $F91F,Y          ; 79 1F F9 | Add with carry (absolute,Y)
    ASL $1FF7,X          ; 1E F7 1F | Arithmetic shift left (absolute,X)
    INY                  ; C8 | Increment Y register
    SEP #$14             ; E2 14 | Set processor status bits
    LDA ($7D,X)          ; A1 7D | Load from (zero page,X) into accumulator
    ADC #$A7             ; 69 A7 | Add with carry (immediate)
    ADC $B2CC,Y          ; 79 CC B2 | Add with carry (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    ASL $2CFC,X          ; 1E FC 2C | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ROL $9EF8,X          ; 3E F8 9E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_192
; Address: $E1EF5B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_192:
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F 78 EF F8 | Store accumulator to absolute long,X
    BNE $2C              ; D0 2C | Branch if not equal
    SBC $19              ; E5 19 | Subtract with carry (zero page)
    LDA $5971            ; AD 71 59 | Load from absolute address into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_193
; Address: $E1EF6B
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_193:
    STA $FF7F7F          ; 8F 7F 7F FF | Store accumulator to absolute long address
    LDA                  ; BF FC FE F8 | Load from absolute long,X into accumulator
    DEC $FEF0,X          ; DE F0 FE | Decrement (absolute,X)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    LDA $9A              ; A5 9A | Load from zero page into accumulator
    STX $AD9A            ; 8E 9A AD | Store X register to absolute address
    CMP #$D6             ; C9 D6 | Compare accumulator (immediate)
    NOP                  ; EA | No operation
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SBC $7F3F,X          ; FD 3F 7F | Subtract with carry (absolute,X)
    ADC $7F0F,Y          ; 79 0F 7F | Add with carry (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$EE             ; C0 EE | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STA $7440,Y          ; 99 40 74 | Store accumulator to absolute,Y
    BRA $9B              ; 80 9B | Branch always
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    BRA $D9              ; 80 D9 | Branch always
    BRA $A6              ; 80 A6 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt
    ORA $79BB,Y          ; 19 BB 79 | Logical OR with accumulator (absolute,Y)
    LDA ($0C,X)          ; A1 0C | Load from (zero page,X) into accumulator
    BRA $DA              ; 80 DA | Branch always
    RTI                  ; 40 | Return from interrupt
    DEC                  ; 3A | Decrement accumulator
    ROR $10              ; 66 10 | Rotate right (zero page)
    EOR $E6A2,X          ; 5D A2 E6 | Exclusive OR with accumulator (absolute,X)
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $FF00,X          ; DE 00 FF | Decrement (absolute,X)
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    BIT #$2C             ; 89 2C | Test bits in accumulator (immediate)
    LDY #$5E             ; A0 5E | Load immediate value into Y register
    STA ($5F,X)          ; 81 5F | Store accumulator to (zero page,X)
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_194
; Address: $E1EFEC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_194:
    STA ($5E,X)          ; 81 5E | Store accumulator to (zero page,X)
    JMP $814000          ; 5C 00 40 81 | Jump to address long
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_196
; Address: $E1EFF8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_196:
    SEI                  ; 78 | Set interrupt disable flag
    STX $F0              ; 86 F0 | Store X register to zero page
    ASL $0EF1            ; 0E F1 0E | Arithmetic shift left (absolute)
    PLB                  ; AB | Pull data bank register from stack
    CLI                  ; 58 | Clear interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    SBC $05              ; E5 05 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_197
; Address: $E1F00B
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_197:
    JSL $347501          ; 22 01 75 34 | Jump to subroutine long
    DEX                  ; CA | Decrement X register
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($8A,X)          ; 01 8A | Logical OR with accumulator ((zero page,X))
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    LDA $3502            ; AD 02 35 | Load from absolute address into accumulator
    ORA ($D2,X)          ; 01 D2 | Logical OR with accumulator ((zero page,X))
    EOR $10              ; 45 10 | Exclusive OR with accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    STA $6252            ; 8D 52 62 | Store accumulator to absolute address
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    BIT $BA04            ; 2C 04 BA | Test bits in accumulator (absolute)
    STZ $00              ; 64 00 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank42_DmaFunction_198
; Address: $E1F03B
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_198:
    JSR $9860            ; 20 60 98 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    TXA                  ; 8A | Transfer X register to accumulator
    AND $A3C6,Y          ; 39 C6 A3 | Logical AND with accumulator (absolute,Y)
    JMP $65F00E          ; 5C 0E F0 65 | Jump to address long
    TXS                  ; 9A | Transfer X register to stack pointer
    STA $B260,Y          ; 99 60 B2 | Store accumulator to absolute,Y
    RTI                  ; 40 | Return from interrupt
    LDY $0044            ; AC 44 00 | Load from absolute address into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($3B,X)          ; 01 3B | Logical OR with accumulator ((zero page,X))
    ASL $CD              ; 06 CD | Arithmetic shift left (zero page)
    AND ($6D),Y          ; 31 6D | Logical AND with accumulator ((zero page),Y)
    TSX                  ; BA | Transfer stack pointer to X register
    AND ($9A,X)          ; 21 9A | Logical AND with accumulator ((zero page,X))
    CMP ($0D),Y          ; D1 0D | Compare accumulator ((zero page),Y)
    DEX                  ; CA | Decrement X register
    BVC $38              ; 50 38 | Branch if overflow clear
    CPY $9F00            ; CC 00 9F | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_199
; Address: $E1F07A
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_199:
    INC $FD00,X          ; FE 00 FD | Increment (absolute,X)
    BRA $FE              ; 80 FE | Branch always
    ORA ($45,X)          ; 01 45 | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    STY $4B              ; 84 4B | Store Y register to zero page
    BRA $7A              ; 80 7A | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    CPY #$29             ; C0 29 | Compare Y register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    BCC $6C              ; 90 6C | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BCC $C1              ; 90 C1 | Branch if carry clear
    CPY $B00F            ; CC 0F B0 | Compare Y register (absolute)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    ADC $65              ; 65 65 | Add with carry (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR ($25,X)          ; 41 25 | Exclusive OR with accumulator ((zero page,X))
    ORA #$79             ; 09 79 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    BRA $27              ; 80 27 | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_19A
; Address: $E1F0CD
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_19A:
    JSR $0FB3            ; 20 B3 0F | Jump to subroutine
    INC $F600,X          ; FE 00 F6 | Increment (absolute,X)
    SBC $D600,X          ; FD 00 D6 | Subtract with carry (absolute,X)
    CPY $B0              ; C4 B0 | Compare Y register (zero page)
    DEX                  ; CA | Decrement X register
    TAX                  ; AA | Transfer accumulator to X register
    LDY $24              ; A4 24 | Load from zero page into Y register
    CMP ($99,X)          ; C1 99 | Compare accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    EOR $EA00,X          ; 5D 00 EA | Exclusive OR with accumulator (absolute,X)
    ROR $ED00,X          ; 7E 00 ED | Rotate right (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    CLD                  ; D8 | Clear decimal mode flag
    INC $5E06            ; EE 06 5E | Increment (absolute)
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $00              ; 84 00 | Store Y register to zero page
    AND $F900,X          ; 3D 00 F9 | Logical AND with accumulator (absolute,X)
    SBC $DC00,X          ; FD 00 DC | Subtract with carry (absolute,X)
    SBC $7200,X          ; FD 00 72 | Subtract with carry (absolute,X)
    STA $67B8,X          ; 9D B8 67 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank42_DmaFunction_19B
; Address: $E1F124
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_19B:
    ADC ($EA),Y          ; 71 EA | Add with carry ((zero page),Y)
    ORA $085C,X          ; 1D 5C 08 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BCC $90              ; 90 90 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    ORA $1F00,X          ; 1D 00 1F | Logical OR with accumulator (absolute,X)
    SBC $7F00,X          ; FD 00 7F | Subtract with carry (absolute,X)
    PHX                  ; DA | Push X register to stack
    LDY $13              ; A4 13 | Load from zero page into Y register
    NOP                  ; EA | No operation
    ORA #$59             ; 09 59 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_19C
; Address: $E1F148
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_19C:
    JSL $8207A0          ; 22 A0 07 82 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    SBC $D800,X          ; FD 00 D8 | Subtract with carry (absolute,X)
    SBC $7B00,X          ; FD 00 7B | Subtract with carry (absolute,X)
    STY $8D              ; 84 8D | Store Y register to zero page
    PHY                  ; 5A | Push Y register to stack
    LDA $E9              ; A5 E9 | Load from zero page into accumulator
    BEQ $53              ; F0 53 | Branch if equal
    BCS $00              ; B0 00 | Branch if carry set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    CPX $00              ; E4 00 | Compare X register (zero page)
    INC $99FE,X          ; FE FE 99 | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    LDY #$CE             ; A0 CE | Load immediate value into Y register
    LDA ($C0),Y          ; B1 C0 | Load from (zero page),Y into accumulator
    LDA                  ; BF 31 4F C3 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $1FF7,X          ; 1E F7 1F | Arithmetic shift left (absolute,X)
    ROR $2700,X          ; 7E 00 27 | Rotate right (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    AND ($4E),Y          ; 31 4E | Logical AND with accumulator ((zero page),Y)
    BPL $6F              ; 10 6F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    STX $79              ; 86 79 | Store X register to zero page
    ADC $00FF,X          ; 7D FF 00 | Add with carry (absolute,X)
    LDA $FE42,X          ; BD 42 FE | Load from absolute,X into accumulator
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_19D
; Address: $E1F1BD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_19D:
    JSR $30CF            ; 20 CF 30 | Jump to subroutine
    BVS $03              ; 70 03 | Branch if overflow set
    LDA $06              ; A5 06 | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    AND $07DA            ; 2D DA 07 | Logical AND with accumulator (absolute)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    REP #$1B             ; C2 1B | Reset processor status bits

;------------------------------------------------------------------------------
; Bank42_DmaFunction_19E
; Address: $E1F1CE
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_19E:
    JSL $FC0005          ; 22 05 00 FC | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CPX #$2C             ; E0 2C | Compare X register (immediate)
    BNE $06              ; D0 06 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC                  ; 1A | Increment accumulator
    CPX $04              ; E4 04 | Compare X register (zero page)
    PLX                  ; FA | Pull X register from stack
    STZ $3EC1            ; 9C C1 3E | Store zero to absolute
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ORA $05F6            ; 0D F6 05 | Logical OR with accumulator (absolute)
    INC $778C,X          ; FE 8C 77 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $24              ; 80 24 | Branch always
    BPL $E4              ; 10 E4 | Branch if positive
    INC                  ; 1A | Increment accumulator
    CPX $92              ; E4 92 | Compare X register (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    LSR $C1              ; 46 C1 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_19F
; Address: $E1F205
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_19F:
    JSL $809918          ; 22 18 99 80 | Jump to subroutine long
    ORA $6A              ; 05 6A | Logical OR with accumulator (zero page)
    ORA ($A8),Y          ; 11 A8 | Logical OR with accumulator ((zero page),Y)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ROR $00              ; 66 00 | Rotate right (zero page)
    BCC $04              ; 90 04 | Branch if carry clear
    DEX                  ; CA | Decrement X register
    LSR $10              ; 46 10 | Logical shift right (zero page)
    DEY                  ; 88 | Decrement Y register
    CPY $35              ; C4 35 | Compare Y register (zero page)
    BVC $AA              ; 50 AA | Branch if overflow clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY $30              ; C4 30 | Compare Y register (zero page)
    PHB                  ; 8B | Push data bank register to stack
    ORA #$50             ; 09 50 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    AND ($30),Y          ; 31 30 | Logical AND with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $04              ; A6 04 | Load from zero page into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1A0
; Address: $E1F242
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1A0:
    ADC ($F1),Y          ; 71 F1 | Add with carry ((zero page),Y)
    INC $9F7B,X          ; FE 7B 9F | Increment (absolute,X)
    ADC $21D9            ; 6D D9 21 | PPU graphics register access
    RTI                  ; 40 | Return from interrupt
    ORA #$6E             ; 09 6E | Logical OR with accumulator (immediate)
    AND $131E            ; 2D 1E 13 | Logical AND with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $3F00,X          ; 1E 00 3F | Arithmetic shift left (absolute,X)
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1A1
; Address: $E1F265
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1A1:
    JSL $BFD52F          ; 22 2F D5 BF | Jump to subroutine long
    LDA $69              ; A5 69 | Load from zero page into accumulator
    BIT #$D3             ; 89 D3 | Test bits in accumulator (immediate)
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    ROR $4200            ; 6E 00 42 | Hardware register operation
    LDY #$59             ; A0 59 | Load immediate value into Y register
    BRA $76              ; 80 76 | Branch always
    SBC ($0A),Y          ; F1 0A | Subtract with carry ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    LDA ($5E,X)          ; A1 5E | Load from (zero page,X) into accumulator
    BIT #$02             ; 89 02 | Test bits in accumulator (immediate)
    ORA $0600            ; 0D 00 06 | Logical OR with accumulator (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    STA ($16,X)          ; 81 16 | Store accumulator to (zero page,X)
    BIT $C23D            ; 2C 3D C2 | Test bits in accumulator (absolute)
    LDY $00              ; A4 00 | Load from zero page into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F 70 54 C0 | Store accumulator to absolute long,X
    STA ($80,X)          ; 81 80 | Store accumulator to (zero page,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1A2
; Address: $E1F2CA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1A2:
    JSR $8023            ; 20 23 80 | Jump to subroutine
    PHB                  ; 8B | Push data bank register to stack
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1A3
; Address: $E1F2CF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1A3:
    JSL $AF0067          ; 22 67 00 AF | Jump to subroutine long
    SBC $1700,X          ; FD 00 17 | Subtract with carry (absolute,X)
    STA ($57),Y          ; 91 57 | Store accumulator to (zero page),Y
    LDA $2CFD2B          ; AF 2B FD 2C | Load from absolute long address into accumulator
    ORA $2AF9,Y          ; 19 F9 2A | Logical OR with accumulator (absolute,Y)
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1A5
; Address: $E1F2F2
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1A5:
    LDA $D400            ; AD 00 D4 | Load from absolute address into accumulator
    INC $00              ; E6 00 | Increment (zero page)
    LDA                  ; BF 00 E0 A0 | Load from absolute long,X into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $90              ; 90 90 | Branch if carry clear
    LDA #$A9             ; A9 A9 | Load immediate value into accumulator
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    STX $20FF            ; 8E FF 20 | Store X register to absolute address
    LDA $EF00,X          ; BD 00 EF | Load from absolute,X into accumulator
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    WDM #$42             ; 42 42 | Hardware register operation
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    LDA $FF00,X          ; BD 00 FF | Load from absolute,X into accumulator
    SBC $B000,X          ; FD 00 B0 | Subtract with carry (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1A6
; Address: $E1F33F
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1A6:
    JSR $D12D            ; 20 2D D1 | Jump to subroutine
    EOR $710E,X          ; 5D 0E 71 | Exclusive OR with accumulator (absolute,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SEP #$05             ; E2 05 | Set processor status bits
    INC $FFF0,X          ; FE F0 FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX $FF3F            ; EC 3F FF | Compare X register (absolute)
    LDA                  ; BF C7 FF CF | Load from absolute long,X into accumulator
    PHB                  ; 8B | Push data bank register to stack
    SEC                  ; 38 | Set carry flag
    EOR $70BA            ; 4D BA 70 | Exclusive OR with accumulator (absolute)
    STX $7887            ; 8E 87 78 | Store X register to absolute address
    REP #$47             ; C2 47 | Reset processor status bits
    LDY #$F7             ; A0 F7 | Load immediate value into Y register
    INC $FC37,X          ; FE 37 FC | Increment (absolute,X)
    INC $E3FD,X          ; FE FD E3 | Increment (absolute,X)
    ORA ($EF),Y          ; 11 EF | Logical OR with accumulator ((zero page),Y)
    CMP #$37             ; C9 37 | Compare accumulator (immediate)
    LDA $53              ; A5 53 | Load from zero page into accumulator
    REP #$19             ; C2 19 | Reset processor status bits
    STA $B74E            ; 8D 4E B7 | Store accumulator to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    EOR $02B1            ; 4D B1 02 | Exclusive OR with accumulator (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $7F00,X          ; 1E 00 7F | Arithmetic shift left (absolute,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    SBC $C8A7            ; ED A7 C8 | Subtract with carry (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $B1D2,Y          ; 99 D2 B1 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1A7
; Address: $E1F3AC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1A7:
    CPX $B61F            ; EC 1F B6 | Compare X register (absolute)
    BIT #$40             ; 89 40 | Test bits in accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1A8
; Address: $E1F3B4
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1A8:
    SEI                  ; 78 | Set interrupt disable flag
    INC $EE00,X          ; FE 00 EE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPY $1233            ; CC 33 12 | Compare Y register (absolute)
    SBC $9A64            ; ED 64 9A | Subtract with carry (absolute)
    ORA $EFE1,X          ; 1D E1 EF | Logical OR with accumulator (absolute,X)
    ADC $E9              ; 65 E9 | Add with carry (zero page)
    BIT #$93             ; 89 93 | Test bits in accumulator (immediate)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    ROR $E300            ; 6E 00 E3 | Rotate right (absolute)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BMI $B4              ; 30 B4 | Branch if negative
    PHB                  ; 8B | Push data bank register to stack
    LDA $AF86,Y          ; B9 86 AF | Load from absolute,Y into accumulator
    BCC $55              ; 90 55 | Branch if carry clear
    ASL $573A            ; 0E 3A 57 | Arithmetic shift left (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1A9
; Address: $E1F3F8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1A9:
    BVS $00              ; 70 00 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    INC $9900            ; EE 00 99 | Increment (absolute)
    INC $61              ; E6 61 | Increment (zero page)
    INC $FE19,X          ; FE 19 FE | Increment (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1AA
; Address: $E1F40A
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1AA:
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ROR $CD91            ; 6E 91 CD | Rotate right (absolute)
    ORA $0F02,X          ; 1D 02 0F | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $BF02,X          ; FD 02 BF | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STZ $0A              ; 64 0A | Store zero to zero page
    LSR $C9A1,X          ; 5E A1 C9 | Logical shift right (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $17FF,Y          ; F9 FF 17 | Subtract with carry (absolute,Y)
    PLA                  ; 68 | Pull accumulator from stack
    STA                  ; 9F FF FF FF | Store accumulator to absolute long,X
    AND $5882,X          ; 3D 82 58 | Logical AND with accumulator (absolute,X)
    LDX $C1              ; A6 C1 | Load from zero page into X register
    ROR $7E91,X          ; 7E 91 7E | Rotate right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STA $7F639F          ; 8F 9F 63 7F | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1AB
; Address: $E1F45A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1AB:
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA $0302            ; 0D 02 03 | Logical OR with accumulator (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    XBA                  ; EB | Exchange accumulator bytes
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1AC
; Address: $E1F46A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1AC:
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ROR $CD91            ; 6E 91 CD | Rotate right (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $EE              ; 10 EE | Branch if positive
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1AD
; Address: $E1F487
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1AD:
    STA                  ; 9F 00 FF F0 | Store accumulator to absolute long,X
    STY $1777            ; 8C 77 17 | Store Y register to absolute address
    XBA                  ; EB | Exchange accumulator bytes
    SBC $E902,X          ; FD 02 E9 | Subtract with carry (absolute,X)
    ADC $0706,Y          ; 79 06 07 | Add with carry (absolute,Y)
    STA $C911,Y          ; 99 11 C9 | Store accumulator to absolute,Y
    ORA $73              ; 05 73 | Logical OR with accumulator (zero page)
    STA $FD03            ; 8D 03 FD | Store accumulator to absolute address
    STY $C3F2            ; 8C F2 C3 | Store Y register to absolute address
    PLP                  ; 28 | Pull processor status from stack
    BMI $00              ; 30 00 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    INC $FE00            ; EE 00 FE | Increment (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F BF 45 7F | Store accumulator to absolute long,X
    BCS $8F              ; B0 8F | Branch if carry set
    ADC ($19),Y          ; 71 19 | Add with carry ((zero page),Y)
    INC $06              ; E6 06 | Increment (zero page)
    SBC $0808,Y          ; F9 08 08 | Subtract with carry (absolute,Y)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PEA #$F9FE           ; F4 FE F9 | Push effective address to stack
    SBC $FEA2,X          ; FD A2 FE | Subtract with carry (absolute,X)
    SBC ($F2,X)          ; E1 F2 | Subtract with carry ((zero page,X))
    ORA $8EF1            ; 0D F1 8E | Logical OR with accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1AE
; Address: $E1F4EF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1AE:
    STA                  ; 9F 10 10 38 | Store accumulator to absolute long,X
    SEC                  ; 38 | Set carry flag
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    LDX #$5D             ; A2 5D | Load immediate value into X register
    LDX $3190            ; AE 90 31 | Load from absolute address into X register
    ASL $10E1            ; 0E E1 10 | Arithmetic shift left (absolute)
    CPY $D050            ; CC 50 D0 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1AF
; Address: $E1F512
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1AF:
    BRA $00              ; 80 00 | Branch always
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    AND ($2F,X)          ; 21 2F | Logical AND with accumulator ((zero page,X))
    BMI $6D              ; 30 6D | Branch if negative
    TSX                  ; BA | Transfer stack pointer to X register
    AND ($90,X)          ; 21 90 | Logical AND with accumulator ((zero page,X))
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    CPY $25              ; C4 25 | Compare Y register (zero page)
    SEC                  ; 38 | Set carry flag
    CPY $9F00            ; CC 00 9F | Compare Y register (absolute)
    BRA $DF              ; 80 DF | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1B0
; Address: $E1F541
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1B0:
    JSR $17E8            ; 20 E8 17 | Jump to subroutine
    STA $FE62,X          ; 9D 62 FE | Store accumulator to absolute,X
    ORA ($73,X)          ; 01 73 | Logical OR with accumulator ((zero page,X))
    BRA $22              ; 80 22 | Branch always
    DEY                  ; 88 | Decrement Y register
    CMP $EA36,X          ; DD 36 EA | Compare accumulator (absolute,X)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    STA $6662,X          ; 9D 62 66 | Store accumulator to absolute,X
    STA ($FD,X)          ; 81 FD | Store accumulator to (zero page,X)
    INC                  ; 1A | Increment accumulator
    NOP                  ; EA | No operation
    AND #$17             ; 29 17 | Logical AND with accumulator (immediate)
    BRA $B4              ; 80 B4 | Branch always
    STA $002320          ; 8F 20 23 00 | Store accumulator to absolute long address
    CLC                  ; 18 | Clear carry flag
    ROL $00              ; 26 00 | Rotate left (zero page)
    BVS $DF              ; 70 DF | Branch if overflow set
    STY $E3              ; 84 E3 | Store Y register to zero page
    LDX #$73             ; A2 73 | Load immediate value into X register
    ADC $9AA2            ; 6D A2 9A | Add with carry (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    LDX $C6CA            ; AE CA C6 | Load from absolute address into X register
    STX $1F              ; 86 1F | Store X register to zero page
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CPY $CB              ; C4 CB | Compare Y register (zero page)
    CMP $CE              ; C5 CE | Compare accumulator (zero page)
    EOR $59              ; 45 59 | Exclusive OR with accumulator (zero page)
    EOR $75E9,X          ; 5D E9 75 | Exclusive OR with accumulator (absolute,X)
    ADC ($F8,X)          ; 61 F8 | Add with carry ((zero page,X))
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    LDA                  ; BF 9B 7F 53 | Load from absolute long,X into accumulator
    CMP $3F              ; C5 3F | Compare accumulator (zero page)
    INC $7F              ; E6 7F | Increment (zero page)
    SEP #$4F             ; E2 4F | Set processor status bits
    CMP ($91,X)          ; C1 91 | Compare accumulator ((zero page,X))
    ORA ($65),Y          ; 11 65 | Logical OR with accumulator ((zero page),Y)
    EOR ($AC,X)          ; 41 AC | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1B1
; Address: $E1F5D5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1B1:
    CPX #$3C             ; E0 3C | Compare X register (immediate)
    BEQ $3A              ; F0 3A | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ORA $1DF8,Y          ; 19 F8 1D | Logical OR with accumulator (absolute,Y)
    ROL $45FE,X          ; 3E FE 45 | Rotate left (absolute,X)
    LSR $39              ; 46 39 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1B2
; Address: $E1F5E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1B2:
    JSR $005F            ; 20 5F 00 | Jump to subroutine
    EOR ($2F),Y          ; 51 2F | Exclusive OR with accumulator ((zero page),Y)
    DEC $3F              ; C6 3F | Decrement (zero page)
    SBC $F5FA,X          ; FD FA F5 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1B3
; Address: $E1F5F3
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1B3:
    JSR $10EF            ; 20 EF 10 | Jump to subroutine
    CPX $1B              ; E4 1B | Compare X register (zero page)
    DEC $BD20,X          ; DE 20 BD | Decrement (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    BRA $DA              ; 80 DA | Branch always
    BIT $12              ; 24 12 | Test bits in accumulator (zero page)
    JMP ($BC83)          ; 6C 83 BC | Jump to address (absolute indirect)
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1B4
; Address: $E1F60B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1B4:
    ORA ($49),Y          ; 11 49 | Logical OR with accumulator ((zero page),Y)
    ORA #$D8             ; 09 D8 | Logical OR with accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    EOR $32              ; 45 32 | Exclusive OR with accumulator (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1B6
; Address: $E1F633
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1B6:
    JSR $10EF            ; 20 EF 10 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BRA $33              ; 80 33 | Branch always
    INY                  ; C8 | Increment Y register
    BNE $EC              ; D0 EC | Branch if not equal
    SBC $3FC1,X          ; FD C1 3F | Subtract with carry (absolute,X)
    BRA $7E              ; 80 7E | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1B7
; Address: $E1F649
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1B7:
    STA $FD19            ; 8D 19 FD | Store accumulator to absolute address
    AND $6BB1            ; 2D B1 6B | Logical AND with accumulator (absolute)
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ASL $0D13            ; 0E 13 0D | Arithmetic shift left (absolute)
    BPL $06              ; 10 06 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    LDA ($17),Y          ; B1 17 | Load from (zero page),Y into accumulator
    SBC #$BB             ; E9 BB | Subtract with carry (immediate)
    CMP $DE              ; C5 DE | Compare accumulator (zero page)
    CPX $11              ; E4 11 | Compare X register (zero page)
    LDA $2555,Y          ; B9 55 25 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1B8
; Address: $E1F66E
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1B8:
    LDA #$F1             ; A9 F1 | Load immediate value into accumulator
    STA ($20,X)          ; 81 20 | Store accumulator to (zero page,X)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    STA ($47,X)          ; 81 47 | Store accumulator to (zero page,X)
    STA ($DE,X)          ; 81 DE | Store accumulator to (zero page,X)
    PLX                  ; FA | Pull X register from stack
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    INC $0C00,X          ; FE 00 0C | Increment (absolute,X)
    ROR $19              ; 66 19 | Rotate right (zero page)
    LDA ($A4,X)          ; A1 A4 | Load from (zero page,X) into accumulator
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    EOR $8DD1,X          ; 5D D1 8D | Exclusive OR with accumulator (absolute,X)
    STA $25              ; 85 25 | Store accumulator to zero page
    BRA $01              ; 80 01 | Branch always
    BRA $81              ; 80 81 | Branch always
    BRA $63              ; 80 63 | Branch always
    STA ($BB,X)          ; 81 BB | Store accumulator to (zero page,X)
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    JMP ($0293)          ; 6C 93 02 | Jump to address (absolute indirect)
    SBC $FE81,X          ; FD 81 FE | Subtract with carry (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    LSR $AD39,X          ; 5E 39 AD | Logical shift right (absolute,X)
    LDX $CA91            ; AE 91 CA | Load from absolute address into X register
    BRA $34              ; 80 34 | Branch always
    INY                  ; C8 | Increment Y register
    BVC $8E              ; 50 8E | Branch if overflow clear
    STY $10D8            ; 8C D8 10 | Store Y register to absolute address
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    PEA #$FE18           ; F4 18 FE | Push effective address to stack
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA $8FE6,Y          ; 19 E6 8F | Logical OR with accumulator (absolute,Y)
    ADC ($4F),Y          ; 71 4F | Add with carry ((zero page),Y)
    BCS $7F              ; B0 7F | Branch if carry set
    LDA                  ; BF 45 7F 9F | Load from absolute long,X into accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1B9
; Address: $E1F6E1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1B9:
    STA                  ; 9F 98 67 F1 | Store accumulator to absolute long,X
    STX $0DF2            ; 8E F2 0D | Store X register to absolute address
    INC $FDE1,X          ; FE E1 FD | Increment (absolute,X)
    LDX #$FE             ; A2 FE | Load immediate value into X register
    SBC $F4FB,Y          ; F9 FB F4 | Subtract with carry (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDY #$A0             ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1BA
; Address: $E1F6FC
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1BA:
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BPL $10              ; 10 10 | Branch if positive
    BNE $2F              ; D0 2F | Branch if not equal
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    ORA $FAFF,X          ; 1D FF FA | Logical OR with accumulator (absolute,X)
    PEA #$CDCB           ; F4 CB CD | Push effective address to stack
    CMP $E526,Y          ; D9 26 E5 | Compare accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    BCS $3D              ; B0 3D | Branch if carry set
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC ($74,X)          ; 61 74 | Add with carry ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    CMP ($6E),Y          ; D1 6E | Compare accumulator ((zero page),Y)
    STY $7A              ; 84 7A | Store Y register to zero page
    PHB                  ; 8B | Push data bank register to stack
    DEC                  ; 3A | Decrement accumulator
    CMP $80FF,X          ; DD FF 80 | Compare accumulator (absolute,X)
    BNE $FF              ; D0 FF | Branch if not equal
    SBC $FAFF,Y          ; F9 FF FA | Subtract with carry (absolute,Y)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    STA ($10),Y          ; 91 10 | Store accumulator to (zero page),Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1BB
; Address: $E1F746
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1BB:
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    EOR #$34             ; 49 34 | Exclusive OR with accumulator (immediate)
    DEX                  ; CA | Decrement X register
    JMP $EFB3            ; 4C B3 EF | Jump to address
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    SEP #$FF             ; E2 FF | Set processor status bits
    TSX                  ; BA | Transfer stack pointer to X register
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    SBC $FB04,X          ; FD 04 FB | Subtract with carry (absolute,X)
    ASL $EBFD            ; 0E FD EB | Arithmetic shift left (absolute)
    SBC $9993            ; ED 93 99 | Subtract with carry (absolute)
    ROR $FD              ; 66 FD | Rotate right (zero page)
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$E3             ; C0 E3 | Compare Y register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    INY                  ; C8 | Increment Y register
    LDA ($E9,X)          ; A1 E9 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1BC
; Address: $E1F789
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1BC:
    ORA ($7A),Y          ; 11 7A | Logical OR with accumulator ((zero page),Y)
    BMI $C0              ; 30 C0 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $3D00            ; 0E 00 3D | Arithmetic shift left (absolute)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STY $30CF            ; 8C CF 30 | Store Y register to absolute address
    INX                  ; E8 | Increment X register
    LDA $5945,Y          ; B9 45 59 | Load from absolute,Y into accumulator
    LDA ($0B,X)          ; A1 0B | Load from (zero page,X) into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $DC00            ; 0E 00 DC | Arithmetic shift left (absolute)
    CPX $7213            ; EC 13 72 | Compare X register (absolute)
    STA $3887            ; 8D 87 38 | Store accumulator to absolute address
    CPY $E7F3            ; CC F3 E7 | Compare Y register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    DEC $D9              ; C6 D9 | Decrement (zero page)
    STA ($9E,X)          ; 81 9E | Store accumulator to (zero page,X)
    LDA ($8E),Y          ; B1 8E | Load from (zero page),Y into accumulator
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ROR $DF00,X          ; 7E 00 DF | Rotate right (absolute,X)
    LDA $FF5DFF          ; AF FF 5D FF | Load from absolute long address into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA                  ; BF 00 57 49 | Load from absolute long,X into accumulator
    CMP $66ED            ; CD ED 66 | Compare accumulator (absolute)
    DEC $FC05            ; CE 05 FC | Decrement (absolute)
    STY $08AA            ; 8C AA 08 | Store Y register to absolute address
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$BE             ; E0 BE | Compare X register (immediate)
    BEQ $36              ; F0 36 | Branch if equal
    BEQ $9B              ; F0 9B | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    EOR $FB59,X          ; 5D 59 FB | Exclusive OR with accumulator (absolute,X)
    SBC $A8              ; E5 A8 | Subtract with carry (zero page)
    INY                  ; C8 | Increment Y register
    WDM #$80             ; 42 80 | Reserved instruction
    INC $FC17,X          ; FE 17 FC | Increment (absolute,X)
    SBC $A6BE,X          ; FD BE A6 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $1A              ; F0 1A | Branch if equal
    CPX #$37             ; E0 37 | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1BD
; Address: $E1F81F
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1BD:
    BRA $43              ; 80 43 | Branch always
    BVS $B5              ; 70 B5 | Branch if overflow set
    LDX #$18             ; A2 18 | Load immediate value into X register
    LDA ($9F),Y          ; B1 9F | Load from (zero page),Y into accumulator
    STX $061A            ; 8E 1A 06 | Store X register to absolute address
    EOR $2C03            ; 4D 03 2C | Exclusive OR with accumulator (absolute)
    STA                  ; 9F 60 5F E0 | Store accumulator to absolute long,X
    BVS $6E              ; 70 6E | Branch if overflow set
    ORA ($75),Y          ; 11 75 | Logical OR with accumulator ((zero page),Y)
    SBC $FC07,Y          ; F9 07 FC | Subtract with carry (absolute,Y)
    INC $5B01,X          ; FE 01 5B | Increment (absolute,X)
    STA $993C,Y          ; 99 3C 99 | Store accumulator to absolute,Y
    ROR $42              ; 66 42 | Hardware register operation
    PHY                  ; 5A | Push Y register to stack
    ROR $18FF,X          ; 7E FF 18 | Rotate right (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    STA $99A5,Y          ; 99 A5 99 | Store accumulator to absolute,Y
    WDM #$E7             ; 42 E7 | Reserved instruction
    BIT $A2              ; 24 A2 | Test bits in accumulator (zero page)
    BNE $FF              ; D0 FF | Branch if not equal
    INX                  ; E8 | Increment X register
    LDA                  ; BF DD FD B8 | Load from absolute long,X into accumulator
    ADC $F9D5,Y          ; 79 D5 F9 | Add with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    TSX                  ; BA | Transfer stack pointer to X register
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $2B77            ; 8D 77 2B | Store accumulator to absolute address
    SBC $7D7D,X          ; FD 7D 7D | Subtract with carry (absolute,X)
    ORA $CCEF,X          ; 1D EF CC | Logical OR with accumulator (absolute,X)
    LDX $AFCF,Y          ; BE CF AF | Load from absolute,Y into X register
    BPL $9F              ; 10 9F | Branch if positive
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $C800,X          ; FE 00 C8 | Increment (absolute,X)
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    LDY $7F99,X          ; BC 99 7F | Load from absolute,X into Y register
    PHA                  ; 48 | Push accumulator to stack
    JMP $D438            ; 4C 38 D4 | Jump to address
    SEC                  ; 38 | Set carry flag
    LDX $78              ; A6 78 | Load from zero page into X register
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    BIT $D8              ; 24 D8 | Test bits in accumulator (zero page)
    LDY #$E8             ; A0 E8 | Load immediate value into Y register
    BCC $AC              ; 90 AC | Branch if carry clear

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1BE
; Address: $E1F8CA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1BE:
    JSL $085718          ; 22 18 57 08 | Jump to subroutine long
    SBC $FB00,X          ; FD 00 FB | Subtract with carry (absolute,X)
    LDY #$DE             ; A0 DE | Load immediate value into Y register
    TAX                  ; AA | Transfer accumulator to X register
    CPX $7C              ; E4 7C | Compare X register (zero page)
    LDY $3CFC,X          ; BC FC 3C | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1BF
; Address: $E1F8E9
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1BF:
    JMP $92645C          ; 5C 5C 64 92 | Jump to address long
    EOR #$6D             ; 49 6D | Exclusive OR with accumulator (immediate)
    STY $5F              ; 84 5F | Store Y register to zero page
    BRA $C3              ; 80 C3 | Branch always
    BRA $43              ; 80 43 | Branch always
    BRA $E3              ; 80 E3 | Branch always
    BRA $CB              ; 80 CB | Branch always
    BRA $6D              ; 80 6D | Branch always
    ADC #$E0             ; 69 E0 | Game work RAM access
    SEP #$02             ; E2 02 | Set processor status bits
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    STA ($71),Y          ; 91 71 | Store accumulator to (zero page),Y
    CMP $003D            ; CD 3D 00 | Compare accumulator (absolute)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA $F710,X          ; 9D 10 F7 | Store accumulator to absolute,X
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    INC $E21F            ; EE 1F E2 | Increment (absolute)
    DEC                  ; 3A | Decrement accumulator
    CMP $C7              ; C5 C7 | Compare accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    LDY $51D3            ; AC D3 51 | Load from absolute address into Y register
    ROR $223D            ; 6E 3D 22 | Rotate right (absolute)
    LDX $7FA9            ; AE A9 7F | Load from absolute address into X register
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1C1
; Address: $E1F93B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1C1:
    BEQ $50              ; F0 50 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    REP #$3D             ; C2 3D | Reset processor status bits
    STZ $FF04,X          ; 9E 04 FF | Store zero to absolute,X
    SBC $22BD            ; ED BD 22 | Subtract with carry (absolute)
    LDY $FC8B            ; AC 8B FC | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    JMP ($1890)          ; 6C 90 18 | Jump to address (absolute indirect)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1C2
; Address: $E1F95C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1C2:
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BVS $D8              ; 70 D8 | Branch if overflow set
    LSR $3F              ; 46 3F | Logical shift right (zero page)
    LDY $BF              ; A4 BF | Load from zero page into Y register
    CMP $FE              ; C5 FE | Compare accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    LDY $7F              ; A4 7F | Load from zero page into Y register
    AND $26C2,Y          ; 39 C2 26 | Logical AND with accumulator (absolute,Y)
    BCC $DB              ; 90 DB | Branch if carry clear

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1C3
; Address: $E1F971
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1C3:
    BIT $62              ; 24 62 | Test bits in accumulator (zero page)
    LDX #$04             ; A2 04 | Load immediate value into X register
    LDX $04              ; A6 04 | Load from zero page into X register
    SEP #$04             ; E2 04 | Set processor status bits
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PHX                  ; DA | Push X register to stack
    INC $4C24,X          ; FE 24 4C | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    DEC $8B75,X          ; DE 75 8B | Decrement (absolute,X)
    DEY                  ; 88 | Decrement Y register
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1C4
; Address: $E1F98C
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1C4:
    JSR $82D8            ; 20 D8 82 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $D8              ; 24 D8 | Test bits in accumulator (zero page)
    LDY #$E8             ; A0 E8 | Load immediate value into Y register
    BCC $AC              ; 90 AC | Branch if carry clear
    LDX #$98             ; A2 98 | Load immediate value into X register
    DEY                  ; 88 | Decrement Y register
    SBC $FB00,X          ; FD 00 FB | Subtract with carry (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    SEP #$9F             ; E2 9F | Set processor status bits
    STA                  ; 9F 79 0F 55 | Store accumulator to absolute long,X
    PHB                  ; 8B | Push data bank register to stack
    ROR $7F00,X          ; 7E 00 7F | Rotate right (absolute,X)
    ROL $04C1,X          ; 3E C1 04 | Rotate left (absolute,X)
    STA                  ; 9F 60 49 B6 | Store accumulator to absolute long,X
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    PHB                  ; 8B | Push data bank register to stack
    CMP $0000            ; CD 00 00 | Compare accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BCS $02              ; B0 02 | Branch if carry set
    CMP $1102            ; CD 02 11 | Compare accumulator (absolute)
    ROR $1E01            ; 6E 01 1E | Rotate right (absolute)
    BNE $CF              ; D0 CF | Branch if not equal
    BVC $47              ; 50 47 | Branch if overflow clear
    BIT $FF13            ; 2C 13 FF | Test bits in accumulator (absolute)
    BRA $FB              ; 80 FB | Branch always
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    BMI $C4              ; 30 C4 | Branch if negative
    SEC                  ; 38 | Set carry flag
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1C5
; Address: $E1FA27
; Size: 119 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1C5:
    INC $38              ; E6 38 | Increment (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    JMP ($DDA4)          ; 6C A4 DD | Jump to address (absolute indirect)
    JMP $093A            ; 4C 3A 09 | Jump to address
    SBC $E700,Y          ; F9 00 E7 | Subtract with carry (absolute,Y)
    LDA $C36E,X          ; BD 6E C3 | Load from absolute,X into accumulator
    SBC $BF              ; E5 BF | Subtract with carry (zero page)
    STA $DBA5,Y          ; 99 A5 DB | Store accumulator to absolute,Y
    SBC $3B9B,X          ; FD 9B 3B | Subtract with carry (absolute,X)
    STA $FF              ; 85 FF | Store accumulator to zero page
    BVS $FE              ; 70 FE | Branch if overflow set
    CMP $0000,X          ; DD 00 00 | Compare accumulator (absolute,X)
    STA $F788,Y          ; 99 88 F7 | Store accumulator to absolute,Y
    BIT #$6F             ; 89 6F | Test bits in accumulator (immediate)
    ADC ($B1),Y          ; 71 B1 | Add with carry ((zero page),Y)
    INC $FD00,X          ; FE 00 FD | Increment (absolute,X)
    ASL $5D6F,X          ; 1E 6F 5D | Arithmetic shift left (absolute,X)
    CMP $0000,X          ; DD 00 00 | Compare accumulator (absolute,X)
    STA $7789,Y          ; 99 89 77 | Store accumulator to absolute,Y
    ORA ($76),Y          ; 11 76 | Logical OR with accumulator ((zero page),Y)
    STX $ED8D            ; 8E 8D ED | Store X register to absolute address
    CPY $00FF            ; CC FF 00 | Compare Y register (absolute)
    LDA                  ; BF 00 8F 70 | Load from absolute long,X into accumulator
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    BRA $3F              ; 80 3F | Branch always
    BEQ $DF              ; F0 DF | Branch if equal
    INX                  ; E8 | Increment X register
    CPY $8EDF            ; CC DF 8E | Compare Y register (absolute)
    STA                  ; 9F B7 8F FF | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    LDA $8941,Y          ; B9 41 89 | Load from absolute,Y into accumulator
    ADC ($93),Y          ; 71 93 | Add with carry ((zero page),Y)
    INC $66              ; E6 66 | Increment (zero page)
    DEC $8A              ; C6 8A | Decrement (zero page)
    DEX                  ; CA | Decrement X register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)
    ASL $07BE            ; 0E BE 07 | Arithmetic shift left (absolute)
    LSR $D6DE            ; 4E DE D6 | Logical shift right (absolute)
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    BIT $B6              ; 24 B6 | Test bits in accumulator (zero page)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $F100,X          ; FD 00 F1 | Subtract with carry (absolute,X)
    STA $FFB600          ; 8F 00 B6 FF | Store accumulator to absolute long address
    EOR #$E5             ; 49 E5 | Exclusive OR with accumulator (immediate)
    ORA $8F73,X          ; 1D 73 8F | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1C7
; Address: $E1FB0C
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1C7:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BPL $0F              ; 10 0F | Branch if positive
    PLX                  ; FA | Pull X register from stack
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    BPL $F3              ; 10 F3 | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    INC $A901,X          ; FE 01 A9 | Increment (absolute,X)
    ASL $9967,X          ; 1E 67 99 | Arithmetic shift left (absolute,X)
    LDA $39D3            ; AD D3 39 | Load from absolute address into accumulator
    DEC $AA              ; C6 AA | Decrement (zero page)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    JMP $FFB3            ; 4C B3 FF | Jump to address
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC $09              ; C6 09 | Decrement (zero page)
    ORA #$D0             ; 09 D0 | Logical OR with accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $0F              ; B0 0F | Branch if carry set
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    LDA $FFF1FE          ; AF FE F1 FF | Load from absolute long address into accumulator
    INC $BF01,X          ; FE 01 BF | Increment (absolute,X)
    SBC $FC02,X          ; FD 02 FC | Subtract with carry (absolute,X)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    LDY $2B              ; A4 2B | Load from zero page into Y register
    INC $FC1F,X          ; FE 1F FC | Increment (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    PEA #$92ED           ; F4 ED 92 | Push effective address to stack
    STA $FC66,Y          ; 99 66 FC | Store accumulator to absolute,Y
    DEY                  ; 88 | Decrement Y register
    ASL $3CF0            ; 0E F0 3C | Arithmetic shift left (absolute)
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    CMP $34              ; C5 34 | Compare accumulator (zero page)
    LDY $A6              ; A4 A6 | Load from zero page into Y register
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    STA ($32,X)          ; 81 32 | Store accumulator to (zero page,X)
    STA ($62,X)          ; 81 62 | Store accumulator to (zero page,X)
    STA ($8A),Y          ; 91 8A | Store accumulator to (zero page),Y
    ADC ($1B),Y          ; 71 1B | Add with carry ((zero page),Y)
    LDA                  ; BF 00 74 08 | Load from absolute long,X into accumulator
    LDA $8941,Y          ; B9 41 89 | Load from absolute,Y into accumulator
    ADC ($93),Y          ; 71 93 | Add with carry ((zero page),Y)
    ROL $66              ; 26 66 | Rotate left (zero page)
    STX $0A              ; 86 0A | Store X register to zero page
    DEX                  ; CA | Decrement X register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1C9
; Address: $E1FBC2
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1C9:
    PLX                  ; FA | Pull X register from stack
    ADC $29              ; 65 29 | Add with carry (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    BCS $4E              ; B0 4E | Branch if carry set
    STA $FF66,Y          ; 99 66 FF | Store accumulator to absolute,Y
    CPX $F6C9            ; EC C9 F6 | Compare X register (absolute)
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $6EFE,X          ; FD FE 6E | Subtract with carry (absolute,X)
    BCS $7F              ; B0 7F | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    LDA ($1E,X)          ; A1 1E | Load from (zero page,X) into accumulator
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ORA $0F91            ; 0D 91 0F | Logical OR with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $FF              ; 50 FF | Branch if overflow clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ROR $F0B0            ; 6E B0 F0 | Rotate right (absolute)
    CLC                  ; 18 | Clear carry flag
    XBA                  ; EB | Exchange accumulator bytes
    BVS $D7              ; 70 D7 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1CA
; Address: $E1FC1E
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1CA:
    LDA $107740          ; AF 40 77 10 | Load from absolute long address into accumulator
    INC $4801            ; EE 01 48 | Increment (absolute)
    PHB                  ; 8B | Push data bank register to stack
    CLV                  ; B8 | Clear overflow flag
    BIT $5613            ; 2C 13 56 | Test bits in accumulator (absolute)
    ORA #$2B             ; 09 2B | Logical OR with accumulator (immediate)
    SBC $7F02,X          ; FD 02 7F | Subtract with carry (absolute,X)
    ROR $FD01,X          ; 7E 01 FD | Rotate right (absolute,X)
    CMP $979B,Y          ; D9 9B 97 | Compare accumulator (absolute,Y)
    STA ($59),Y          ; 91 59 | Store accumulator to (zero page),Y
    STA $DB9B,Y          ; 99 9B DB | Store accumulator to absolute,Y
    STA $9BD9,Y          ; 99 D9 9B | Store accumulator to absolute,Y
    DEY                  ; 88 | Decrement Y register
    ROR $2400,X          ; 7E 00 24 | Rotate right (absolute,X)
    ORA $7AE2,X          ; 1D E2 7A | Logical OR with accumulator (absolute,X)
    STA $EB              ; 85 EB | Store accumulator to zero page
    INC $0400,X          ; FE 00 04 | Increment (absolute,X)
    CPX $D4              ; E4 D4 | Compare X register (zero page)
    CPY $5F90            ; CC 90 5F | Compare Y register (absolute)
    DEC $39              ; C6 39 | Decrement (zero page)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    CPY $DB33            ; CC 33 DB | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1CC
; Address: $E1FC9A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1CC:
    BMI $00              ; 30 00 | Branch if negative
    LDA $9FE297          ; AF 97 E2 9F | Load from absolute long address into accumulator
    STA                  ; 9F 79 0F 55 | Store accumulator to absolute long,X
    PHB                  ; 8B | Push data bank register to stack
    BCC $10              ; 90 10 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1CD
; Address: $E1FCC2
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1CD:
    JSL $423B00          ; 22 00 3B 42 | Hardware register operation
    CLC                  ; 18 | Clear carry flag
    LDY #$AC             ; A0 AC | Load immediate value into Y register
    BPL $24              ; 10 24 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    CPY $00EF            ; CC EF 00 | Compare Y register (absolute)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    LDY $59              ; A4 59 | Load from zero page into Y register
    STA ($61,X)          ; 81 61 | Store accumulator to (zero page,X)
    LSR $5E80,X          ; 5E 80 5E | Logical shift right (absolute,X)
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    STY $F7D2            ; 8C D2 F7 | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    ASL $33ED,X          ; 1E ED 33 | Arithmetic shift left (absolute,X)
    AND ($C0,X)          ; 21 C0 | Logical AND with accumulator ((zero page,X))
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    AND ($E0,X)          ; 21 E0 | Game work RAM access
    PEA #$D2F3           ; F4 F3 D2 | Push effective address to stack
    CMP ($49),Y          ; D1 49 | Compare accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA $B8              ; 05 B8 | Logical OR with accumulator (zero page)
    LDA $1F06,Y          ; B9 06 1F | Load from absolute,Y into accumulator
    ASL $2F01            ; 0E 01 2F | Arithmetic shift left (absolute)
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    DEC $3D              ; C6 3D | Decrement (zero page)
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    BIT $1BDF            ; 2C DF 1B | Test bits in accumulator (absolute)
    ADC $225D            ; 6D 5D 22 | Add with carry (absolute)
    PHB                  ; 8B | Push data bank register to stack
    BEQ $00              ; F0 00 | Branch if equal
    BRA $F8              ; 80 F8 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    DEC $3F              ; C6 3F | Decrement (zero page)
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    ROL $CDD1            ; 2E D1 CD | Rotate left (absolute)
    SEC                  ; 38 | Set carry flag
    SBC $1A              ; E5 1A | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1CE
; Address: $E1FD56
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1CE:
    DEC $BD20,X          ; DE 20 BD | Decrement (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STA ($EE),Y          ; 91 EE | Store accumulator to (zero page),Y
    DEX                  ; CA | Decrement X register
    SBC $6EFE,X          ; FD FE 6E | Subtract with carry (absolute,X)
    SBC $B975,Y          ; F9 75 B9 | Subtract with carry (absolute,Y)
    ADC ($8B),Y          ; 71 8B | Add with carry ((zero page),Y)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    SBC ($E4,X)          ; E1 E4 | Subtract with carry ((zero page,X))
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    AND #$21             ; 29 21 | PPU graphics register access
    DEC $738C,X          ; DE 8C 73 | Decrement (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($10),Y          ; 91 10 | Store accumulator to (zero page),Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1CF
; Address: $E1FDA6
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1CF:
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    JMP $C83580          ; 5C 80 35 C8 | Jump to address long
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    ROR $1D00,X          ; 7E 00 1D | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    EOR ($BF),Y          ; 51 BF | Exclusive OR with accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    LSR $4D3F            ; 4E 3F 4D | Logical shift right (absolute)
    ROL $17E8,X          ; 3E E8 17 | Rotate left (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    ROR $99              ; 66 99 | Rotate right (zero page)
    PLP                  ; 28 | Pull processor status from stack
    LDA ($DE,X)          ; A1 DE | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1D0
; Address: $E1FDE8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1D0:
    JSR $03DF            ; 20 DF 03 | Jump to subroutine
    PHY                  ; 5A | Push Y register to stack
    LDA $FF              ; A5 FF | Load from zero page into accumulator
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    EOR $E0              ; 45 E0 | Game work RAM access
    WDM #$41             ; 42 41 | Reserved instruction
    SBC ($4B,X)          ; E1 4B | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1D1
; Address: $E1FE08
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1D1:
    ORA ($EB,X)          ; 01 EB | Logical OR with accumulator ((zero page,X))
    ADC ($23),Y          ; 71 23 | Add with carry ((zero page),Y)
    LDX $27              ; A6 27 | Load from zero page into X register
    AND #$30             ; 29 30 | Logical AND with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    BVS $0D              ; 70 0D | Branch if overflow set
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BPL $0E              ; 10 0E | Branch if positive
    BPL $0D              ; 10 0D | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    WDM #$F8             ; 42 F8 | Reserved instruction
    CPY #$1A             ; C0 1A | Compare Y register (immediate)
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ORA ($BC,X)          ; 01 BC | Logical OR with accumulator ((zero page,X))
    STA ($7C,X)          ; 81 7C | Store accumulator to (zero page,X)
    LDY $7C01,X          ; BC 01 7C | Load from absolute,X into Y register
    EOR $27              ; 45 27 | Exclusive OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    BRA $AD              ; 80 AD | Branch always
    RTI                  ; 40 | Return from interrupt
    EOR $FB80,X          ; 5D 80 FB | Exclusive OR with accumulator (absolute,X)
    BRA $59              ; 80 59 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    DEC $F5D4,X          ; DE D4 F5 | Decrement (absolute,X)
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1D2
; Address: $E1FE56
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1D2:
    JSR $8A20            ; 20 20 8A | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    BRA $6F              ; 80 6F | Branch always
    PLP                  ; 28 | Pull processor status from stack
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    BPL $84              ; 10 84 | Branch if positive
    EOR $CE41,X          ; 5D 41 CE | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1D3
; Address: $E1FE67
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1D3:
    JSR $04F3            ; 20 F3 04 | Jump to subroutine
    SBC $2212            ; ED 12 22 | Subtract with carry (absolute)
    CMP $54              ; C5 54 | Compare accumulator (zero page)
    AND ($92,X)          ; 21 92 | Logical AND with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    STZ $4B              ; 64 4B | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    ORA $43              ; 05 43 | Logical OR with accumulator (zero page)
    EOR ($F3,X)          ; 41 F3 | Exclusive OR with accumulator ((zero page,X))
    AND $E2              ; 25 E2 | Logical AND with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1D4
; Address: $E1FE8F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1D4:
    BNE $21              ; D0 21 | PPU graphics register access
    BIT $1A              ; 24 1A | Test bits in accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1D5
; Address: $E1FE9A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1D5:
    CLC                  ; 18 | Clear carry flag
    BMI $0F              ; 30 0F | Branch if negative
    BMI $0F              ; 30 0F | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    REP #$DC             ; C2 DC | Reset processor status bits
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    STA ($9C,X)          ; 81 9C | Store accumulator to (zero page,X)
    WDM #$38             ; 42 38 | Reserved instruction
    EOR ($24,X)          ; 41 24 | Exclusive OR with accumulator ((zero page,X))
    STA $1B              ; 85 1B | Store accumulator to zero page
    CPY $AB              ; C4 AB | Compare Y register (zero page)
    RTI                  ; 40 | Return from interrupt
    ADC $2F00,X          ; 7D 00 2F | Add with carry (absolute,X)
    CPY #$87             ; C0 87 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1D6
; Address: $E1FEB9
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1D6:
    JSR $443B            ; 20 3B 44 | Jump to subroutine
    STA $6342,X          ; 9D 42 63 | Store accumulator to absolute,X
    STZ $823F            ; 9C 3F 82 | Store zero to absolute
    SEC                  ; 38 | Set carry flag
    SBC $F682,X          ; FD 82 F6 | Subtract with carry (absolute,X)
    CPX #$0A             ; E0 0A | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    CLD                  ; D8 | Clear decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP ($7413)          ; 6C 13 74 | Jump to address (absolute indirect)
    INX                  ; E8 | Increment X register
    BCC $0F              ; 90 0F | Branch if carry clear
    ROR $E4              ; 66 E4 | Rotate right (zero page)
    STX $CCE0            ; 8E E0 CC | Store X register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1D7
; Address: $E1FEE7
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1D7:
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    BIT $2C34            ; 2C 34 2C | Test bits in accumulator (absolute)
    BEQ $D4              ; F0 D4 | Branch if equal
    JMP $98A0            ; 4C A0 98 | Jump to address
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$28             ; E0 28 | Compare X register (immediate)
    CPY #$A8             ; C0 A8 | Compare Y register (immediate)
    BVC $8C              ; 50 8C | Branch if overflow clear
    BVC $AC              ; 50 AC | Branch if overflow clear
    AND ($15,X)          ; 21 15 | Logical AND with accumulator ((zero page,X))
    LDA $AD              ; A5 AD | Load from zero page into accumulator
    ORA $1FBB            ; 0D BB 1F | Logical OR with accumulator (absolute)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    SBC $B942            ; ED 42 B9 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1D8
; Address: $E1FF1C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1D8:
    ROR $90              ; 66 90 | Rotate right (zero page)
    AND $D4D2            ; 2D D2 D4 | Logical AND with accumulator (absolute)
    STX $2E84            ; 8E 84 2E | Store X register to absolute address
    LDY $D4C0,X          ; BC C0 D4 | Load from absolute,X into Y register
    BNE $B0              ; D0 B0 | Branch if not equal
    BRA $B8              ; 80 B8 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    CLV                  ; B8 | Clear overflow flag
    TAY                  ; A8 | Transfer accumulator to Y register
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    BRA $78              ; 80 78 | Branch always

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1DA
; Address: $E1FF38
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1DA:
    JSR $7080            ; 20 80 70 | Jump to subroutine
    BRA $50              ; 80 50 | Branch always
    BRA $40              ; 80 40 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1DB
; Address: $E1FF44
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1DB:
    JSR $80E8            ; 20 E8 80 | Jump to subroutine
    CPX #$80             ; E0 80 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    BEQ $E2              ; F0 E2 | Branch if equal
    SBC ($E7,X)          ; E1 E7 | Subtract with carry ((zero page,X))
    SBC $EDA5            ; ED A5 ED | Subtract with carry (absolute)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    STZ $1E80,X          ; 9E 80 1E | Store zero to absolute,X
    BPL $5C              ; 10 5C | Branch if positive
    LDA $BC42            ; AD 42 BC | Load from absolute address into accumulator
    WDM #$1C             ; 42 1C | Reserved instruction
    CPX #$1A             ; E0 1A | Compare X register (immediate)
    CPX #$1A             ; E0 1A | Compare X register (immediate)
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BRA $70              ; 80 70 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC                  ; 1A | Increment accumulator
    LDA $EBE05E          ; AF 5E E0 EB | Load from absolute long address into accumulator
    EOR ($5E),Y          ; 51 5E | Exclusive OR with accumulator ((zero page),Y)
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    BRA $27              ; 80 27 | Branch always
    LDY #$F4             ; A0 F4 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1DE
; Address: $E1FFA7
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1DE:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    SBC $BC              ; E5 BC | Subtract with carry (zero page)
    AND $81              ; 25 81 | Logical AND with accumulator (zero page)
    PHX                  ; DA | Push X register to stack
    LDY $207E,X          ; BC 7E 20 | Load from absolute,X into Y register
    ORA $08F6,Y          ; 19 F6 08 | Logical OR with accumulator (absolute,Y)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDA ($E9,X)          ; A1 E9 | Load from (zero page,X) into accumulator
    PLY                  ; 7A | Pull Y register from stack
    LDA $70FD,X          ; BD FD 70 | Load from absolute,X into accumulator
    SBC $2F78            ; ED 78 2F | Subtract with carry (absolute)
    ASL $D0              ; 06 D0 | Arithmetic shift left (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank42_DmaFunction_1DF
; Address: $E1FFF5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank42_DmaFunction_1DF:
    BCC $44              ; 90 44 | Branch if carry clear
    BMI $C6              ; 30 C6 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
