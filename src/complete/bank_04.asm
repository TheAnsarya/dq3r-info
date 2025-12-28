;==============================================================================
; Dragon Quest III - Bank $04
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $C20000-$C27FFF
; Instructions: 11423
; Bytes: 32769
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_04"

;------------------------------------------------------------------------------
; Bank04_DmaFunction_000
; Address: $C28001
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_000:
    AND #$F9             ; 29 F9 | Logical AND with accumulator (immediate)
    JMP $F7C7            ; 4C C7 F7 | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $0126            ; 2C 26 01 | Test bits in accumulator (absolute)
    DEC $F7C7,X          ; DE C7 F7 | Decrement (absolute,X)
    BPL $11              ; 10 11 | Branch if positive
    ASL $3701,X          ; 1E 01 37 | Arithmetic shift left (absolute,X)
    INY                  ; C8 | Increment Y register
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ASL $0110,X          ; 1E 10 01 | Arithmetic shift left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    INY                  ; C8 | Increment Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    ASL $0118            ; 0E 18 01 | Arithmetic shift left (absolute)
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_001
; Address: $C2802D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_001:
    JSR $011A            ; 20 1A 01 | Jump to subroutine
    CPX #$C8             ; E0 C8 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_002
; Address: $C28036
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_002:
    PHP                  ; 08 | Push processor status to stack
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    CMP #$F7             ; C9 F7 | Compare accumulator (immediate)
    LSR $01              ; 46 01 | Logical shift right (zero page)
    DEC                  ; 3A | Decrement accumulator
    DEX                  ; CA | Decrement X register
    LSR $42              ; 46 42 | Hardware register operation
    ORA ($88,X)          ; 01 88 | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($73,X)          ; 01 73 | Logical OR with accumulator ((zero page,X))
    CPY $00F7            ; CC F7 00 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_003
; Address: $C28055
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_003:
    JSR $011A            ; 20 1A 01 | Jump to subroutine
    BCS $CC              ; B0 CC | Branch if carry set
    BPL $12              ; 10 12 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    CPY $14F7            ; CC F7 14 | Compare Y register (absolute)
    BPL $17              ; 10 17 | Branch if positive
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    CMP $0FF7            ; CD F7 0F | Compare accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($9C,X)          ; 01 9C | Logical OR with accumulator ((zero page,X))
    DEC $10F7            ; CE F7 10 | Decrement (absolute)
    ASL $1723            ; 0E 23 17 | Arithmetic shift left (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $01              ; 80 01 | Branch always
    CMP ($F7),Y          ; D1 F7 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_004
; Address: $C2808C
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_004:
    BPL $16              ; 10 16 | Branch if positive
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    BPL $0D              ; 10 0D | Branch if positive
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    BPL $12              ; 10 12 | Branch if positive
    BPL $15              ; 10 15 | Branch if positive
    ORA ($D3,X)          ; 01 D3 | Logical OR with accumulator ((zero page,X))
    BPL $12              ; 10 12 | Branch if positive
    BPL $15              ; 10 15 | Branch if positive
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BPL $13              ; 10 13 | Branch if positive
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ASL $1B10            ; 0E 10 1B | Arithmetic shift left (absolute)
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    ASL $660E            ; 0E 0E 66 | Arithmetic shift left (absolute)
    ORA ($5B,X)          ; 01 5B | Logical OR with accumulator ((zero page,X))
    CMP $13F7,Y          ; D9 F7 13 | Compare accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA $A601,X          ; 1D 01 A6 | Logical OR with accumulator (absolute,X)
    CMP $13F7,Y          ; D9 F7 13 | Compare accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA $CF01            ; 0D 01 CF | Logical OR with accumulator (absolute)
    CMP $11F7,Y          ; D9 F7 11 | Compare accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    BPL $2A              ; 10 2A | Branch if positive
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    ASL $4A12            ; 0E 12 4A | Arithmetic shift left (absolute)
    LSR $5B01            ; 4E 01 5B | Logical shift right (absolute)
    DEC $10F7,X          ; DE F7 10 | Decrement (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_005
; Address: $C28106
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_005:
    BVC $01              ; 50 01 | Branch if overflow clear
    LDA $10F7E0          ; AF E0 F7 10 | Load from absolute long address into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_006
; Address: $C2810E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_006:
    BVC $01              ; 50 01 | Branch if overflow clear
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ORA $5301,X          ; 1D 01 53 | Logical OR with accumulator (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $CD01,X          ; 1D 01 CD | Logical OR with accumulator (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $4701,X          ; 1D 01 47 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_007
; Address: $C28131
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_007:
    CPX $F7              ; E4 F7 | Compare X register (zero page)
    ASL $010D            ; 0E 0D 01 | Arithmetic shift left (absolute)
    ADC $E4              ; 65 E4 | Add with carry (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $4A46,X          ; 1E 46 4A | Arithmetic shift left (absolute,X)
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    INC $F7              ; E6 F7 | Increment (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_008
; Address: $C28145
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_008:
    JSR $0116            ; 20 16 01 | Jump to subroutine
    INC $F7              ; E6 F7 | Increment (zero page)
    BPL $18              ; 10 18 | Branch if positive
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    INC $F7              ; E6 F7 | Increment (zero page)
    BPL $18              ; 10 18 | Branch if positive
    ORA $C201            ; 0D 01 C2 | Logical OR with accumulator (absolute)
    INC $F7              ; E6 F7 | Increment (zero page)
    BPL $10              ; 10 10 | Branch if positive
    ROL $0158,X          ; 3E 58 01 | Rotate left (absolute,X)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_009
; Address: $C28165
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_009:
    JSL $4A011E          ; 22 1E 01 4A | Jump to subroutine long
    SBC #$F7             ; E9 F7 | Subtract with carry (immediate)
    BPL $13              ; 10 13 | Branch if positive
    INC                  ; 1A | Increment accumulator
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    SBC #$F7             ; E9 F7 | Subtract with carry (immediate)
    BPL $44              ; 10 44 | Branch if positive
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)
    ASL $0119            ; 0E 19 01 | Arithmetic shift left (absolute)
    LDA                  ; BF EB F7 1A | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ASL $011B            ; 0E 1B 01 | Arithmetic shift left (absolute)
    INX                  ; E8 | Increment X register
    XBA                  ; EB | Exchange accumulator bytes
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_00A
; Address: $C2818D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_00A:
    JSL $4F0119          ; 22 19 01 4F | Jump to subroutine long
    CPX $10F7            ; EC F7 10 | Compare X register (absolute)
    WDM #$82             ; 42 82 | Reserved instruction
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($42,X)          ; 01 42 | Hardware register operation
    ORA ($15),Y          ; 11 15 | Logical OR with accumulator ((zero page),Y)
    WDM #$6A             ; 42 6A | Reserved instruction
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    SBC ($F7),Y          ; F1 F7 | Subtract with carry ((zero page),Y)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_00B
; Address: $C281AD
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_00B:
    CLC                  ; 18 | Clear carry flag
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ORA $2A12            ; 0D 12 2A | Logical OR with accumulator (absolute)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($EB,X)          ; 01 EB | Logical OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    INC                  ; 1A | Increment accumulator
    ORA ($2B,X)          ; 01 2B | Logical OR with accumulator ((zero page,X))
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    LSR $62              ; 46 62 | Logical shift right (zero page)
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA $F001            ; 0D 01 F0 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($35,X)          ; 01 35 | Logical OR with accumulator ((zero page,X))
    SBC $11F7,Y          ; F9 F7 11 | Subtract with carry (absolute,Y)
    LSR $54              ; 46 54 | Logical shift right (zero page)
    ORA ($69,X)          ; 01 69 | Logical OR with accumulator ((zero page,X))
    ORA ($93,X)          ; 01 93 | Logical OR with accumulator ((zero page,X))
    ORA ($BA,X)          ; 01 BA | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    EOR #$52             ; 49 52 | Exclusive OR with accumulator (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    ASL $0113            ; 0E 13 01 | Arithmetic shift left (absolute)
    BIT $F7FF            ; 2C FF F7 | Test bits in accumulator (absolute)
    BPL $0A              ; 10 0A | Branch if positive
    ORA $4101            ; 0D 01 41 | Logical OR with accumulator (absolute)
    BPL $10              ; 10 10 | Branch if positive
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    BPL $0E              ; 10 0E | Branch if positive
    WDM #$48             ; 42 48 | Reserved instruction
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    BPL $12              ; 10 12 | Branch if positive
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    ASL $150F            ; 0E 0F 15 | Arithmetic shift left (absolute)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_00C
; Address: $C2824D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_00C:
    LSR                  ; 4A | Logical shift right (accumulator)
    JMP $03B701          ; 5C 01 B7 03 | Jump to address long
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_00D
; Address: $C28254
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_00D:
    JSR $644C            ; 20 4C 64 | Jump to subroutine
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    BPL $1A              ; 10 1A | Branch if positive
    BPL $15              ; 10 15 | Branch if positive
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    ORA ($1A),Y          ; 11 1A | Logical OR with accumulator ((zero page),Y)
    ASL $0115            ; 0E 15 01 | Arithmetic shift left (absolute)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    ASL $4C18            ; 0E 18 4C | Arithmetic shift left (absolute)
    ROR $01              ; 66 01 | Rotate right (zero page)
    ORA #$F8             ; 09 F8 | Logical OR with accumulator (immediate)
    ASL $0115            ; 0E 15 01 | Arithmetic shift left (absolute)
    LSR $09              ; 46 09 | Logical shift right (zero page)
    SED                  ; F8 | Set decimal mode flag
    ASL $0113            ; 0E 13 01 | Arithmetic shift left (absolute)
    ORA #$F8             ; 09 F8 | Logical OR with accumulator (immediate)
    ORA ($1C),Y          ; 11 1C | Logical OR with accumulator ((zero page),Y)
    BPL $1B              ; 10 1B | Branch if positive
    ORA ($9B,X)          ; 01 9B | Logical OR with accumulator ((zero page,X))
    ORA #$F8             ; 09 F8 | Logical OR with accumulator (immediate)
    LSR $0182            ; 4E 82 01 | Logical shift right (absolute)
    LDA $F80C,X          ; BD 0C F8 | Load from absolute,X into accumulator
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ORA ($EF,X)          ; 01 EF | Logical OR with accumulator ((zero page,X))
    ORA $07F8            ; 0D F8 07 | Logical OR with accumulator (absolute)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ASL $06F8            ; 0E F8 06 | Arithmetic shift left (absolute)
    LSR $66              ; 46 66 | Logical shift right (zero page)
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    BPL $F8              ; 10 F8 | Branch if positive
    ORA ($1A),Y          ; 11 1A | Logical OR with accumulator ((zero page),Y)
    ORA ($65,X)          ; 01 65 | Logical OR with accumulator ((zero page,X))
    BPL $F8              ; 10 F8 | Branch if positive
    ORA ($1A),Y          ; 11 1A | Logical OR with accumulator ((zero page),Y)
    BPL $11              ; 10 11 | Branch if positive
    ORA ($8A,X)          ; 01 8A | Logical OR with accumulator ((zero page,X))
    BPL $F8              ; 10 F8 | Branch if positive
    ASL $3E16            ; 0E 16 3E | Arithmetic shift left (absolute)
    ORA ($2A,X)          ; 01 2A | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BPL $16              ; 10 16 | Branch if positive
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_00E
; Address: $C282CA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_00E:
    SED                  ; F8 | Set decimal mode flag
    BPL $14              ; 10 14 | Branch if positive
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BPL $0E              ; 10 0E | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    ORA ($53,X)          ; 01 53 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BPL $13              ; 10 13 | Branch if positive
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_00F
; Address: $C282E4
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_00F:
    JSL $015444          ; 22 44 54 01 | Jump to subroutine long
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    ASL $141C            ; 0E 1C 14 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ADC #$01             ; 69 01 | Add with carry (immediate)
    INC                  ; 1A | Increment accumulator
    SED                  ; F8 | Set decimal mode flag
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    SED                  ; F8 | Set decimal mode flag
    ASL $1514            ; 0E 14 15 | Arithmetic shift left (absolute)
    ORA ($93,X)          ; 01 93 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    SED                  ; F8 | Set decimal mode flag
    ASL $1D16            ; 0E 16 1D | Arithmetic shift left (absolute)
    ORA ($E8,X)          ; 01 E8 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    SED                  ; F8 | Set decimal mode flag
    BPL $14              ; 10 14 | Branch if positive
    AND $01              ; 25 01 | Logical AND with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    BPL $14              ; 10 14 | Branch if positive
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL $1B10            ; 0E 10 1B | Arithmetic shift left (absolute)
    ORA ($B8,X)          ; 01 B8 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BPL $11              ; 10 11 | Branch if positive
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA #$23             ; 09 23 | Logical OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ASL $13F8,X          ; 1E F8 13 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_010
; Address: $C2833D
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_010:
    ROL $37              ; 26 37 | Rotate left (zero page)
    ORA ($D3,X)          ; 01 D3 | Logical OR with accumulator ((zero page,X))
    ASL $0FF8,X          ; 1E F8 0F | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    AND ($F8,X)          ; 21 F8 | Logical AND with accumulator ((zero page,X))
    BPL $12              ; 10 12 | Branch if positive
    BPL $1B              ; 10 1B | Branch if positive
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_012
; Address: $C28369
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_012:
    JSL $1211F8          ; 22 F8 11 12 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    AND $1B01            ; 2D 01 1B | Logical AND with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($16),Y          ; 11 16 | Logical OR with accumulator ((zero page),Y)
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($16),Y          ; 11 16 | Logical OR with accumulator ((zero page),Y)
    ORA ($75,X)          ; 01 75 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BIT $46              ; 24 46 | Test bits in accumulator (zero page)
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    AND $F8              ; 25 F8 | Logical AND with accumulator (zero page)
    ORA ($16),Y          ; 11 16 | Logical OR with accumulator ((zero page),Y)
    WDM #$29             ; 42 29 | Reserved instruction
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    ROL $F8              ; 26 F8 | Rotate left (zero page)
    ORA $3001            ; 0D 01 30 | Logical OR with accumulator (absolute)
    ROL $F8              ; 26 F8 | Rotate left (zero page)
    ORA $4501            ; 0D 01 45 | Logical OR with accumulator (absolute)
    ROL $F8              ; 26 F8 | Rotate left (zero page)
    ASL $0115            ; 0E 15 01 | Arithmetic shift left (absolute)
    ROR $F826            ; 6E 26 F8 | Rotate right (absolute)
    ASL $0115            ; 0E 15 01 | Arithmetic shift left (absolute)
    ROL $F8              ; 26 F8 | Rotate left (zero page)
    ASL $011F            ; 0E 1F 01 | Arithmetic shift left (absolute)
    ROL $F8              ; 26 F8 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    ROL $014D,X          ; 3E 4D 01 | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    ORA #$1C             ; 09 1C | Logical OR with accumulator (immediate)
    EOR $BE01            ; 4D 01 BE | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_014
; Address: $C283CD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_014:
    JSL $570133          ; 22 33 01 57 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_015
; Address: $C283D5
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_015:
    JSL $50014C          ; 22 4C 01 50 | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    BPL $4F              ; 10 4F | Branch if positive
    STA ($01),Y          ; 91 01 | Store accumulator to (zero page),Y
    LDA #$2E             ; A9 2E | Load immediate value into accumulator
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    ORA ($AC,X)          ; 01 AC | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BPL $1A              ; 10 1A | Branch if positive
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA $3018            ; 0D 18 30 | Logical OR with accumulator (absolute)
    EOR $0F01            ; 4D 01 0F | Exclusive OR with accumulator (absolute)
    AND ($F8),Y          ; 31 F8 | Logical AND with accumulator ((zero page),Y)
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    AND ($F8),Y          ; 31 F8 | Logical AND with accumulator ((zero page),Y)
    ORA $560A            ; 0D 0A 56 | Logical OR with accumulator (absolute)
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    AND ($4A,X)          ; 21 4A | Logical AND with accumulator ((zero page,X))
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    JMP $0153            ; 4C 53 01 | Jump to address
    BVC $38              ; 50 38 | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($0C),Y          ; 11 0C | Logical OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    SED                  ; F8 | Set decimal mode flag
    ORA $0610,X          ; 1D 10 06 | Logical OR with accumulator (absolute,X)
    ORA ($6F,X)          ; 01 6F | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    SED                  ; F8 | Set decimal mode flag
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA $4C16,X          ; 1D 16 4C | Logical OR with accumulator (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ROL $21F8,X          ; 3E F8 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank04_DmaFunction_016
; Address: $C28444
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_016:
    JSL $015750          ; 22 50 57 01 | Jump to subroutine long
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_017
; Address: $C2844D
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_017:
    JSL $570137          ; 22 37 01 57 | Jump to subroutine long
    EOR ($F8,X)          ; 41 F8 | Exclusive OR with accumulator ((zero page,X))
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL $170E            ; 0E 0E 17 | Arithmetic shift left (absolute)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    ORA $0A01            ; 0D 01 0A | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    BPL $12              ; 10 12 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($4D,X)          ; 01 4D | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ROL $012B            ; 2E 2B 01 | Rotate left (absolute)
    ASL $F845            ; 0E 45 F8 | Arithmetic shift left (absolute)
    BPL $12              ; 10 12 | Branch if positive
    ASL $0119            ; 0E 19 01 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    EOR $F8              ; 45 F8 | Exclusive OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    DEC $F847            ; CE 47 F8 | Decrement (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    LSR $53              ; 46 53 | Logical shift right (zero page)
    ORA ($A5,X)          ; 01 A5 | Logical OR with accumulator ((zero page,X))
    EOR #$F8             ; 49 F8 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_018
; Address: $C28496
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_018:
    JSR $FD01            ; 20 01 FD | Jump to subroutine
    EOR #$F8             ; 49 F8 | Exclusive OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    ROL $3D              ; 26 3D | Rotate left (zero page)
    ORA ($CB,X)          ; 01 CB | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    BMI $4D              ; 30 4D | Branch if negative
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BPL $0E              ; 10 0E | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    LSR $D101            ; 4E 01 D1 | Logical shift right (absolute)
    LSR $10F8            ; 4E F8 10 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_019
; Address: $C284BF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_019:
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    LSR $11F8            ; 4E F8 11 | Logical shift right (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $2701            ; 0D 01 27 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    BPL $12              ; 10 12 | Branch if positive
    ASL $010F            ; 0E 0F 01 | Arithmetic shift left (absolute)
    EOR $4F              ; 45 4F | Exclusive OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    BPL $39              ; 10 39 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_01A
; Address: $C284D7
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_01A:
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    EOR ($F8),Y          ; 51 F8 | Exclusive OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $4B              ; 46 4B | Logical shift right (zero page)
    ORA ($BC,X)          ; 01 BC | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA $321E,X          ; 1D 1E 32 | Logical OR with accumulator (absolute,X)
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)
    ASL $0123,X          ; 1E 23 01 | Arithmetic shift left (absolute,X)
    REP #$54             ; C2 54 | Reset processor status bits
    SED                  ; F8 | Set decimal mode flag
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)
    ASL $012B,X          ; 1E 2B 01 | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)
    ASL $010B            ; 0E 0B 01 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_01B
; Address: $C2850C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_01B:
    JSL $016B5E          ; 22 5E 6B 01 | Jump to subroutine long
    BMI $59              ; 30 59 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    ORA ($16),Y          ; 11 16 | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BMI $72              ; 30 72 | Branch if negative
    ORA ($4E,X)          ; 01 4E | Logical OR with accumulator ((zero page,X))
    EOR $11F8,X          ; 5D F8 11 | Exclusive OR with accumulator (absolute,X)
    LSR $017B            ; 4E 7B 01 | Logical shift right (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_01D
; Address: $C2852C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_01D:
    JSR $7F56            ; 20 56 7F | Jump to subroutine
    ORA ($D5,X)          ; 01 D5 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_01E
; Address: $C28534
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_01E:
    JSR $651A            ; 20 1A 65 | Jump to subroutine
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    STZ $F8              ; 64 F8 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_01F
; Address: $C2853C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_01F:
    JSR $321A            ; 20 1A 32 | Jump to subroutine
    ORA ($6D,X)          ; 01 6D | Logical OR with accumulator ((zero page,X))
    ADC $F8              ; 65 F8 | Add with carry (zero page)
    ASL $0116            ; 0E 16 01 | Arithmetic shift left (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    ADC $F8              ; 65 F8 | Add with carry (zero page)
    ORA $7614            ; 0D 14 76 | Logical OR with accumulator (absolute)
    PHY                  ; 5A | Push Y register to stack
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    ASL $3410            ; 0E 10 34 | Arithmetic shift left (absolute)
    ROL $4E01            ; 2E 01 4E | Rotate left (absolute)
    ADC #$F8             ; 69 F8 | Add with carry (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    JMP $3B01            ; 4C 01 3B | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_020
; Address: $C28562
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_020:
    SED                  ; F8 | Set decimal mode flag
    ROL $012F,X          ; 3E 2F 01 | Rotate left (absolute,X)
    JMP ($13F8)          ; 6C F8 13 | Jump to address (absolute indirect)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($BB,X)          ; 01 BB | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    BVS $F8              ; 70 F8 | Branch if overflow set
    ROL $0129            ; 2E 29 01 | Rotate left (absolute)
    PHB                  ; 8B | Push data bank register to stack
    ADC ($F8),Y          ; 71 F8 | Add with carry ((zero page),Y)
    ASL $723C            ; 0E 3C 72 | Arithmetic shift left (absolute)
    ORA ($AF,X)          ; 01 AF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA $420E            ; 0D 0E 42 | Hardware register operation
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    LSR $013E,X          ; 5E 3E 01 | Logical shift right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_021
; Address: $C285AD
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_021:
    INC                  ; 1A | Increment accumulator
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    ORA $3818,Y          ; 19 18 38 | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    ORA ($75,X)          ; 01 75 | Logical OR with accumulator ((zero page,X))
    ADC $0FF8,Y          ; 79 F8 0F | Add with carry (absolute,Y)
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    ADC $0DF8,X          ; 7D F8 0D | Add with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA $E601,X          ; 1D 01 E6 | Logical OR with accumulator (absolute,X)
    ADC $1FF8,X          ; 7D F8 1F | Add with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    ADC $016B,X          ; 7D 6B 01 | Add with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ASL $4C28            ; 0E 28 4C | Arithmetic shift left (absolute)
    ADC $01              ; 65 01 | Add with carry (zero page)
    ASL $F885            ; 0E 85 F8 | Arithmetic shift left (absolute)
    JMP $0119            ; 4C 19 01 | Jump to address
    LDX $85              ; A6 85 | Load from zero page into X register
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    STX $F8              ; 86 F8 | Store X register to zero page
    BIT $5C              ; 24 5C | Test bits in accumulator (zero page)
    ORA ($A7,X)          ; 01 A7 | Logical OR with accumulator ((zero page,X))
    BIT #$F8             ; 89 F8 | Test bits in accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    STX $5B              ; 86 5B | Store X register to zero page
    ORA ($BD,X)          ; 01 BD | Logical OR with accumulator ((zero page,X))
    STX $19F8            ; 8E F8 19 | Store X register to absolute address
    CLC                  ; 18 | Clear carry flag
    LSR $0185            ; 4E 85 01 | Logical shift right (absolute)
    ASL $92              ; 06 92 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    ROL $0167,X          ; 3E 67 01 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    ASL $6563,X          ; 1E 63 65 | Arithmetic shift left (absolute,X)
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BPL $20              ; 10 20 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    ORA ($6E,X)          ; 01 6E | Logical OR with accumulator ((zero page,X))
    STA $31F8,Y          ; 99 F8 31 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank04_DmaFunction_022
; Address: $C28625
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_022:
    ASL $014A            ; 0E 4A 01 | Arithmetic shift left (absolute)
    CMP $F899,Y          ; D9 99 F8 | Compare accumulator (absolute,Y)
    AND $010A,Y          ; 39 0A 01 | Logical AND with accumulator (absolute,Y)
    ORA $F89A            ; 0D 9A F8 | Logical OR with accumulator (absolute)
    ORA $3662,X          ; 1D 62 36 | Logical OR with accumulator (absolute,X)
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    AND $3EAA            ; 2D AA 3E | Logical AND with accumulator (absolute)
    ORA ($D8,X)          ; 01 D8 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHY                  ; 5A | Push Y register to stack
    ADC #$01             ; 69 01 | Add with carry (immediate)
    STZ $15F8,X          ; 9E F8 15 | Store zero to absolute,X
    BPL $26              ; 10 26 | Branch if positive
    ORA $8B01            ; 0D 01 8B | Logical OR with accumulator (absolute)
    STZ $11F8,X          ; 9E F8 11 | Store zero to absolute,X
    BPL $2A              ; 10 2A | Branch if positive
    ORA ($27,X)          ; 01 27 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F F8 13 14 | Store accumulator to absolute long,X
    ROR $33              ; 66 33 | Rotate right (zero page)
    ORA ($BD,X)          ; 01 BD | Logical OR with accumulator ((zero page,X))
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    ORA $720E            ; 0D 0E 72 | Logical OR with accumulator (absolute)
    ROR $01              ; 66 01 | Rotate right (zero page)
    AND $F8A4,Y          ; 39 A4 F8 | Logical AND with accumulator (absolute,Y)
    ORA ($6E,X)          ; 01 6E | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA $520E            ; 0D 0E 52 | Logical OR with accumulator (absolute)
    EOR $7601            ; 4D 01 76 | Exclusive OR with accumulator (absolute)
    LDA #$F8             ; A9 F8 | Load immediate value into accumulator
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    LDA #$F8             ; A9 F8 | Load immediate value into accumulator
    ORA ($9C,X)          ; 01 9C | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_023
; Address: $C28694
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_023:
    JSL $013F34          ; 22 34 3F 01 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    SED                  ; F8 | Set decimal mode flag
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    AND ($45),Y          ; 31 45 | Logical AND with accumulator ((zero page),Y)
    ORA ($D2,X)          ; 01 D2 | Logical OR with accumulator ((zero page,X))
    LDY $11F8            ; AC F8 11 | Load from absolute address into Y register
    ROL $0174            ; 2E 74 01 | Rotate left (absolute)
    STX $AE              ; 86 AE | Store X register to zero page
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_024
; Address: $C286AC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_024:
    CLC                  ; 18 | Clear carry flag
    ROR $69              ; 66 69 | Rotate right (zero page)
    ORA ($C8,X)          ; 01 C8 | Logical OR with accumulator ((zero page,X))
    LDA ($F8),Y          ; B1 F8 | Load from (zero page),Y into accumulator
    CLC                  ; 18 | Clear carry flag
    LSR $016D            ; 4E 6D 01 | Logical shift right (absolute)
    STY $B4              ; 84 B4 | Store Y register to zero page
    SED                  ; F8 | Set decimal mode flag
    ORA ($AE,X)          ; 01 AE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($16),Y          ; 11 16 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_025
; Address: $C286C5
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_025:
    JSL $000115          ; 22 15 01 00 | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    ROL $271C            ; 2E 1C 27 | Rotate left (absolute)
    ORA ($6E,X)          ; 01 6E | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)
    ORA ($96,X)          ; 01 96 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)
    ORA ($BE,X)          ; 01 BE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($15),Y          ; 11 15 | Logical OR with accumulator ((zero page),Y)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    EOR #$01             ; 49 01 | Exclusive OR with accumulator (immediate)
    EOR $B7              ; 45 B7 | Exclusive OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ORA $C401,X          ; 1D 01 C4 | Logical OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_026
; Address: $C28705
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_026:
    JSR $0132            ; 20 32 01 | Jump to subroutine
    LSR $F8B8            ; 4E B8 F8 | Logical shift right (absolute)
    BPL $26              ; 10 26 | Branch if positive
    ORA ($D0,X)          ; 01 D0 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($16),Y          ; 11 16 | Logical OR with accumulator ((zero page),Y)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    LDA $11F8,Y          ; B9 F8 11 | Load from absolute,Y into accumulator
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDA $0EF8,Y          ; B9 F8 0E | Load from absolute,Y into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $012E,X          ; 1E 2E 01 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_027
; Address: $C28728
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_027:
    ROR $F8BA,X          ; 7E BA F8 | Rotate right (absolute,X)
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    ORA ($95,X)          ; 01 95 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    LDY $0FF8,X          ; BC F8 0F | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_028
; Address: $C2873D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_028:
    JSL $DE012B          ; 22 2B 01 DE | Jump to subroutine long
    LDY $11F8,X          ; BC F8 11 | Load from absolute,X into Y register
    INC                  ; 1A | Increment accumulator
    PLP                  ; 28 | Pull processor status from stack
    ROL $7001            ; 2E 01 70 | Rotate left (absolute)
    LDA $13F8,X          ; BD F8 13 | Load from absolute,X into accumulator
    BIT $0131            ; 2C 31 01 | Test bits in accumulator (absolute)
    LDX $1AF8,Y          ; BE F8 1A | Load from absolute,Y into X register
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_029
; Address: $C28756
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_029:
    JSR $5701            ; 20 01 57 | Jump to subroutine
    LDX $13F8,Y          ; BE F8 13 | Load from absolute,Y into X register
    ORA $8501,Y          ; 19 01 85 | Logical OR with accumulator (absolute,Y)
    LDX $13F8,Y          ; BE F8 13 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_02A
; Address: $C28764
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_02A:
    JSR $1B46            ; 20 46 1B | Jump to subroutine
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF F8 13 14 | Load from absolute long,X into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    LDA                  ; BF F8 11 16 | Load from absolute long,X into accumulator
    BIT $35              ; 24 35 | Test bits in accumulator (zero page)
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $012E            ; 2C 2E 01 | Test bits in accumulator (absolute)
    CMP ($F8,X)          ; C1 F8 | Compare accumulator ((zero page,X))
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    BMI $2C              ; 30 2C | Branch if negative
    ORA ($CC,X)          ; 01 CC | Logical OR with accumulator ((zero page,X))
    CMP ($F8,X)          ; C1 F8 | Compare accumulator ((zero page,X))
    BIT $2A              ; 24 2A | Test bits in accumulator (zero page)
    ORA ($93,X)          ; 01 93 | Logical OR with accumulator ((zero page,X))
    REP #$F8             ; C2 F8 | Reset processor status bits
    AND ($1E,X)          ; 21 1E | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    AND $4F01            ; 2D 01 4F | Logical AND with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA $3A12,Y          ; 19 12 3A | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_02B
; Address: $C287A7
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_02B:
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    CMP $F8              ; C5 F8 | Compare accumulator (zero page)
    ORA $3918,Y          ; 19 18 39 | Logical OR with accumulator (absolute,Y)
    JMP $C6EF01          ; 5C 01 EF C6 | Jump to address long
    SED                  ; F8 | Set decimal mode flag
    PHY                  ; 5A | Push Y register to stack
    ORA ($84,X)          ; 01 84 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    ORA ($24),Y          ; 11 24 | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    CMP #$F8             ; C9 F8 | Compare accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA ($4F,X)          ; 01 4F | Logical OR with accumulator ((zero page,X))
    CMP #$F8             ; C9 F8 | Compare accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    EOR $8701,X          ; 5D 01 87 | Exclusive OR with accumulator (absolute,X)
    CPY $0CF8            ; CC F8 0C | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    BNE $F8              ; D0 F8 | Branch if not equal
    ASL $6312            ; 0E 12 63 | Arithmetic shift left (absolute)
    ORA ($67,X)          ; 01 67 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BIT $52              ; 24 52 | Test bits in accumulator (zero page)
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    LDX $F8D3            ; AE D3 F8 | Load from absolute address into X register
    AND $265A            ; 2D 5A 26 | Logical AND with accumulator (absolute)
    ORA ($B3,X)          ; 01 B3 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BMI $5A              ; 30 5A | Branch if negative
    ORA $7F01,X          ; 1D 01 7F | Logical OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ORA ($94,X)          ; 01 94 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    ORA ($8B,X)          ; 01 8B | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA $2E16,Y          ; 19 16 2E | Logical OR with accumulator (absolute,Y)
    AND $3701            ; 2D 01 37 | Logical AND with accumulator (absolute)
    CMP $1DF8,Y          ; D9 F8 1D | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_02C
; Address: $C2881C
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_02C:
    INC                  ; 1A | Increment accumulator
    ROL $27              ; 26 27 | Rotate left (zero page)
    ORA ($A5,X)          ; 01 A5 | Logical OR with accumulator ((zero page,X))
    CMP $1DF8,Y          ; D9 F8 1D | Compare accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    ROL $27              ; 26 27 | Rotate left (zero page)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    SED                  ; F8 | Set decimal mode flag
    ORA $461C,X          ; 1D 1C 46 | Logical OR with accumulator (absolute,X)
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL $3C11,X          ; 1E 11 3C | Arithmetic shift left (absolute,X)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    CMP $1EF8,X          ; DD F8 1E | Compare accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA #$34             ; 09 34 | Logical OR with accumulator (immediate)
    LSR $0501            ; 4E 01 05 | Logical shift right (absolute)
    SBC ($F8,X)          ; E1 F8 | Subtract with carry ((zero page,X))
    ASL $2120            ; 0E 20 21 | PPU graphics register access
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    SBC ($F8,X)          ; E1 F8 | Subtract with carry ((zero page,X))
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    ROL $01              ; 26 01 | Rotate left (zero page)
    SBC ($F8,X)          ; E1 F8 | Subtract with carry ((zero page,X))
    ORA ($56),Y          ; 11 56 | Logical OR with accumulator ((zero page),Y)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    SBC $F8              ; E5 F8 | Subtract with carry (zero page)
    ASL $4817,X          ; 1E 17 48 | Arithmetic shift left (absolute,X)
    ADC $01              ; 65 01 | Add with carry (zero page)
    AND $F8E8            ; 2D E8 F8 | Logical AND with accumulator (absolute)
    ASL $4818,X          ; 1E 18 48 | Arithmetic shift left (absolute,X)
    STZ $01              ; 64 01 | Store zero to zero page
    EOR $F8EA,Y          ; 59 EA F8 | Exclusive OR with accumulator (absolute,Y)
    ASL $4818,X          ; 1E 18 48 | Arithmetic shift left (absolute,X)
    STZ $01              ; 64 01 | Store zero to zero page
    PHB                  ; 8B | Push data bank register to stack
    CPX $1EF8            ; EC F8 1E | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    STZ $01              ; 64 01 | Store zero to zero page
    CMP $F8EE            ; CD EE F8 | Compare accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ORA ($AB,X)          ; 01 AB | Logical OR with accumulator ((zero page,X))
    SBC ($F8),Y          ; F1 F8 | Subtract with carry ((zero page),Y)
    BPL $36              ; 10 36 | Branch if positive
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_02D
; Address: $C28892
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_02D:
    SED                  ; F8 | Set decimal mode flag
    ORA $3620,Y          ; 19 20 36 | Logical OR with accumulator (absolute,Y)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    ORA ($97,X)          ; 01 97 | Logical OR with accumulator ((zero page,X))
    PEA #$1BF8           ; F4 F8 1B | Push effective address to stack
    ROL                  ; 2A | Rotate left (accumulator)
    EOR $AD01            ; 4D 01 AD | Exclusive OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ASL $0178,X          ; 1E 78 01 | Arithmetic shift left (absolute,X)
    ROL $F7              ; 26 F7 | Rotate left (zero page)
    SED                  ; F8 | Set decimal mode flag
    ASL $6B1C,X          ; 1E 1C 6B | Arithmetic shift left (absolute,X)
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STZ $0678,X          ; 9E 78 06 | Store zero to absolute,X
    ORA ($BC,X)          ; 01 BC | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    EOR $0634            ; 4D 34 06 | Exclusive OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $21F8,Y          ; F9 F8 21 | PPU graphics register access
    ROL $3B56,X          ; 3E 56 3B | Rotate left (absolute,X)
    ORA ($A7,X)          ; 01 A7 | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_02E
; Address: $C288D4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_02E:
    JSR $2918            ; 20 18 29 | Jump to subroutine
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_02F
; Address: $C288DC
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_02F:
    JSR $1338            ; 20 38 13 | Jump to subroutine
    ORA ($5C,X)          ; 01 5C | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA $621C,X          ; 1D 1C 62 | Logical OR with accumulator (absolute,X)
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    INC                  ; 1A | Increment accumulator
    LSR $4B              ; 46 4B | Logical shift right (zero page)
    ORA ($E3,X)          ; 01 E3 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC                  ; 1A | Increment accumulator
    ROL $013D            ; 2E 3D 01 | Rotate left (absolute)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    SBC $1A23,Y          ; F9 23 1A | Subtract with carry (absolute,Y)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_030
; Address: $C28907
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_030:
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    JMP $0157            ; 4C 57 01 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    SBC $1E21,Y          ; F9 21 1E | Subtract with carry (absolute,Y)
    BMI $33              ; 30 33 | Branch if negative
    ORA ($CF,X)          ; 01 CF | Logical OR with accumulator ((zero page,X))
    SBC $1410,Y          ; F9 10 14 | Subtract with carry (absolute,Y)
    JMP $0153            ; 4C 53 01 | Jump to address
    ORA $F9              ; 05 F9 | Logical OR with accumulator (zero page)
    BPL $14              ; 10 14 | Branch if positive
    JMP $0153            ; 4C 53 01 | Jump to address
    SBC ($07),Y          ; F1 07 | Subtract with carry ((zero page),Y)
    SBC $1610,Y          ; F9 10 16 | Subtract with carry (absolute,Y)
    BIT $0132            ; 2C 32 01 | Test bits in accumulator (absolute)
    LDX $F908            ; AE 08 F9 | Load from absolute address into X register
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_031
; Address: $C28935
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_031:
    JSR $0139            ; 20 39 01 | Jump to subroutine
    WDM #$09             ; 42 09 | Reserved instruction
    SBC $140F,Y          ; F9 0F 14 | Subtract with carry (absolute,Y)
    ROL $6D              ; 26 6D | Rotate left (zero page)
    ORA ($92,X)          ; 01 92 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $1812,Y          ; F9 12 18 | Subtract with carry (absolute,Y)
    BMI $30              ; 30 30 | Branch if negative
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    SBC $120F,Y          ; F9 0F 12 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_032
; Address: $C2894D
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_032:
    JSL $980119          ; 22 19 01 98 | Jump to subroutine long
    SBC $2013,Y          ; F9 13 20 | Subtract with carry (absolute,Y)
    ORA ($BB,X)          ; 01 BB | Logical OR with accumulator ((zero page,X))
    SBC $0C15,Y          ; F9 15 0C | Subtract with carry (absolute,Y)
    BMI $24              ; 30 24 | Branch if negative
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    ORA $17F9            ; 0D F9 17 | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    WDM #$44             ; 42 44 | Reserved instruction
    ORA ($B6,X)          ; 01 B6 | Logical OR with accumulator ((zero page,X))
    ASL $16F9            ; 0E F9 16 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    RTI                  ; 40 | Return from interrupt
    JMP $1601            ; 4C 01 16 | Jump to address
    BPL $F9              ; 10 F9 | Branch if positive
    ROL $32              ; 26 32 | Rotate left (zero page)
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    BPL $F9              ; 10 F9 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    EOR $6001,Y          ; 59 01 60 | Exclusive OR with accumulator (absolute,Y)
    SBC $1219,Y          ; F9 19 12 | Subtract with carry (absolute,Y)
    LSR $C701            ; 4E 01 C7 | Logical shift right (absolute)
    SBC $160B,Y          ; F9 0B 16 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_033
; Address: $C2898D
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_033:
    ROL $0149,X          ; 3E 49 01 | Rotate left (absolute,X)
    SBC $1417,Y          ; F9 17 14 | Subtract with carry (absolute,Y)
    LSR $48              ; 46 48 | Logical shift right (zero page)
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    SBC $1009,Y          ; F9 09 10 | Subtract with carry (absolute,Y)
    ROL $0143            ; 2E 43 01 | Rotate left (absolute)
    CLC                  ; 18 | Clear carry flag
    SBC $0C0F,Y          ; F9 0F 0C | Subtract with carry (absolute,Y)
    LSR $6D              ; 46 6D | Logical shift right (zero page)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    SBC $0E0B,Y          ; F9 0B 0E | Subtract with carry (absolute,Y)
    LSR $016B            ; 4E 6B 01 | Logical shift right (absolute)
    BVC $1D              ; 50 1D | Branch if overflow clear
    SBC $221B,Y          ; F9 1B 22 | Subtract with carry (absolute,Y)
    ROL $0147,X          ; 3E 47 01 | Rotate left (absolute,X)
    ASL $1BF9,X          ; 1E F9 1B | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ROL $015D            ; 2E 5D 01 | Rotate left (absolute)
    SBC $110F,Y          ; F9 0F 11 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_034
; Address: $C289C5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_034:
    JSR $0149            ; 20 49 01 | Jump to subroutine
    ADC ($20,X)          ; 61 20 | Add with carry ((zero page,X))
    SBC $1210,Y          ; F9 10 12 | Subtract with carry (absolute,Y)
    INC                  ; 1A | Increment accumulator
    ORA ($AC,X)          ; 01 AC | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_035
; Address: $C289D1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_035:
    JSR $0FF9            ; 20 F9 0F | Jump to subroutine
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    AND ($F9,X)          ; 21 F9 | Logical AND with accumulator ((zero page,X))
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_038
; Address: $C289ED
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_038:
    JSR $0147            ; 20 47 01 | Jump to subroutine
    BRA $23              ; 80 23 | Branch always
    SBC $1109,Y          ; F9 09 11 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_039
; Address: $C289F5
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_039:
    JSR $014D            ; 20 4D 01 | Jump to subroutine
    BIT $F9              ; 24 F9 | Test bits in accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    SBC $0503,Y          ; F9 03 05 | Subtract with carry (absolute,Y)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    SBC $0E10,Y          ; F9 10 0E | Subtract with carry (absolute,Y)
    WDM #$48             ; 42 48 | Reserved instruction
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    AND #$F9             ; 29 F9 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_03A
; Address: $C28A13
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_03A:
    DEC                  ; 3A | Decrement accumulator
    ORA ($5B,X)          ; 01 5B | Logical OR with accumulator ((zero page,X))
    AND #$F9             ; 29 F9 | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    BPL $12              ; 10 12 | Branch if positive
    ORA ($98,X)          ; 01 98 | Logical OR with accumulator ((zero page,X))
    AND #$F9             ; 29 F9 | Logical AND with accumulator (immediate)
    AND $24              ; 25 24 | Logical AND with accumulator (zero page)
    ORA $010F            ; 0D 0F 01 | Logical OR with accumulator (absolute)
    AND #$F9             ; 29 F9 | Logical AND with accumulator (immediate)
    ROL $100C            ; 2E 0C 10 | Rotate left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PEA #$0203           ; F4 03 02 | Push effective address to stack
    SBC ($03),Y          ; F1 03 | Subtract with carry ((zero page),Y)
    ORA $03F0,Y          ; 19 F0 03 | Logical OR with accumulator (absolute,Y)
    SBC ($03),Y          ; F1 03 | Subtract with carry ((zero page),Y)
    PEA #$0303           ; F4 03 03 | Push effective address to stack
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $0404            ; 0E 04 04 | Arithmetic shift left (absolute)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA $0204            ; 0D 04 02 | Logical OR with accumulator (absolute)
    ASL $0204            ; 0E 04 02 | Arithmetic shift left (absolute)
    BPL $04              ; 10 04 | Branch if positive
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $0204,Y          ; 19 04 02 | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_03B
; Address: $C28AE3
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_03B:
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    ORA ($27,X)          ; 01 27 | Logical OR with accumulator ((zero page,X))
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    ORA ($2A,X)          ; 01 2A | Logical OR with accumulator ((zero page,X))
    ORA ($2B,X)          ; 01 2B | Logical OR with accumulator ((zero page,X))
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ORA ($2D,X)          ; 01 2D | Logical OR with accumulator ((zero page,X))
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    ORA ($34,X)          ; 01 34 | Logical OR with accumulator ((zero page,X))
    ORA ($35,X)          ; 01 35 | Logical OR with accumulator ((zero page,X))
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    ORA ($3B,X)          ; 01 3B | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    ORA ($42,X)          ; 01 42 | Hardware register operation
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    ORA ($45,X)          ; 01 45 | Logical OR with accumulator ((zero page,X))
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    ORA ($47,X)          ; 01 47 | Logical OR with accumulator ((zero page,X))
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    ORA ($49,X)          ; 01 49 | Logical OR with accumulator ((zero page,X))
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    ORA ($4B,X)          ; 01 4B | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ORA ($4D,X)          ; 01 4D | Logical OR with accumulator ((zero page,X))
    ORA ($4E,X)          ; 01 4E | Logical OR with accumulator ((zero page,X))
    ORA ($4F,X)          ; 01 4F | Logical OR with accumulator ((zero page,X))
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    ORA ($51,X)          ; 01 51 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_03C
; Address: $C28B7E
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_03C:
    ORA ($52,X)          ; 01 52 | Logical OR with accumulator ((zero page,X))
    ORA ($53,X)          ; 01 53 | Logical OR with accumulator ((zero page,X))
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    ORA ($55,X)          ; 01 55 | Logical OR with accumulator ((zero page,X))
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    ORA ($57,X)          ; 01 57 | Logical OR with accumulator ((zero page,X))
    ORA ($58,X)          ; 01 58 | Logical OR with accumulator ((zero page,X))
    ORA ($59,X)          ; 01 59 | Logical OR with accumulator ((zero page,X))
    ORA ($5A,X)          ; 01 5A | Logical OR with accumulator ((zero page,X))
    ORA ($5B,X)          ; 01 5B | Logical OR with accumulator ((zero page,X))
    ORA ($5C,X)          ; 01 5C | Logical OR with accumulator ((zero page,X))
    ORA ($5D,X)          ; 01 5D | Logical OR with accumulator ((zero page,X))
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    ORA ($64,X)          ; 01 64 | Logical OR with accumulator ((zero page,X))
    ORA ($65,X)          ; 01 65 | Logical OR with accumulator ((zero page,X))
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))
    ORA ($67,X)          ; 01 67 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    ORA ($69,X)          ; 01 69 | Logical OR with accumulator ((zero page,X))
    ORA ($6A,X)          ; 01 6A | Logical OR with accumulator ((zero page,X))
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    ORA ($6C,X)          ; 01 6C | Logical OR with accumulator ((zero page,X))
    ORA ($6D,X)          ; 01 6D | Logical OR with accumulator ((zero page,X))
    ORA ($6E,X)          ; 01 6E | Logical OR with accumulator ((zero page,X))
    ORA ($6F,X)          ; 01 6F | Logical OR with accumulator ((zero page,X))
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    ORA ($71,X)          ; 01 71 | Logical OR with accumulator ((zero page,X))
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    ORA ($73,X)          ; 01 73 | Logical OR with accumulator ((zero page,X))
    ORA ($74,X)          ; 01 74 | Logical OR with accumulator ((zero page,X))
    ORA ($75,X)          ; 01 75 | Logical OR with accumulator ((zero page,X))
    ORA ($76,X)          ; 01 76 | Logical OR with accumulator ((zero page,X))
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    ORA ($79,X)          ; 01 79 | Logical OR with accumulator ((zero page,X))
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    ORA ($7B,X)          ; 01 7B | Logical OR with accumulator ((zero page,X))
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_03D
; Address: $C28C16
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_03D:
    ORA ($84,X)          ; 01 84 | Logical OR with accumulator ((zero page,X))
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    STX $04              ; 86 04 | Store X register to zero page
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($8B,X)          ; 01 8B | Logical OR with accumulator ((zero page,X))
    STY $0104            ; 8C 04 01 | Store Y register to absolute address
    STA $0204            ; 8D 04 02 | Store accumulator to absolute address
    STX $0104            ; 8E 04 01 | Store X register to absolute address
    STA $12FF04          ; 8F 04 FF 12 | Store accumulator to absolute long address
    CMP ($16,X)          ; C1 16 | Compare accumulator ((zero page,X))
    CMP ($46,X)          ; C1 46 | Compare accumulator ((zero page,X))
    CMP ($B7,X)          ; C1 B7 | Compare accumulator ((zero page,X))
    CMP ($D1,X)          ; C1 D1 | Compare accumulator ((zero page,X))
    CMP ($0A,X)          ; C1 0A | Compare accumulator ((zero page,X))
    CMP ($C9,X)          ; C1 C9 | Compare accumulator ((zero page,X))
    CMP ($5C,X)          ; C1 5C | Compare accumulator ((zero page,X))
    CMP ($89,X)          ; C1 89 | Compare accumulator ((zero page,X))
    CMP ($B0,X)          ; C1 B0 | Compare accumulator ((zero page,X))
    CMP ($BF,X)          ; C1 BF | Compare accumulator ((zero page,X))
    CMP ($D6,X)          ; C1 D6 | Compare accumulator ((zero page,X))
    CMP ($E5,X)          ; C1 E5 | Compare accumulator ((zero page,X))
    CMP ($EE,X)          ; C1 EE | Compare accumulator ((zero page,X))
    CMP ($2D,X)          ; C1 2D | Compare accumulator ((zero page,X))
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    CMP ($CA,X)          ; C1 CA | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    CMP ($9A,X)          ; C1 9A | Compare accumulator ((zero page,X))
    CMP ($A0,X)          ; C1 A0 | Compare accumulator ((zero page,X))
    CMP ($A6,X)          ; C1 A6 | Compare accumulator ((zero page,X))
    CMP ($AC,X)          ; C1 AC | Compare accumulator ((zero page,X))
    CMP ($04,X)          ; C1 04 | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    CMP ($14,X)          ; C1 14 | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    CMP ($AC,X)          ; C1 AC | Compare accumulator ((zero page,X))
    CMP ($24,X)          ; C1 24 | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    CMP ($45,X)          ; C1 45 | Compare accumulator ((zero page,X))
    LDA $DAC1,Y          ; B9 C1 DA | Load from absolute,Y into accumulator
    CLV                  ; B8 | Clear overflow flag
    CMP ($03,X)          ; C1 03 | Compare accumulator ((zero page,X))
    CMP ($C7,X)          ; C1 C7 | Compare accumulator ((zero page,X))
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    CMP ($2A,X)          ; C1 2A | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    CMP ($30,X)          ; C1 30 | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_03E
; Address: $C28C9B
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_03E:
    CMP ($5E,X)          ; C1 5E | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    CMP ($83,X)          ; C1 83 | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    CMP ($96,X)          ; C1 96 | Compare accumulator ((zero page,X))
    CMP ($19,X)          ; C1 19 | Compare accumulator ((zero page,X))
    CMP ($23,X)          ; C1 23 | Compare accumulator ((zero page,X))
    CMP ($64,X)          ; C1 64 | Compare accumulator ((zero page,X))
    CMP ($70,X)          ; C1 70 | Compare accumulator ((zero page,X))
    CMP ($7C,X)          ; C1 7C | Compare accumulator ((zero page,X))
    CMP ($88,X)          ; C1 88 | Compare accumulator ((zero page,X))
    CMP ($37,X)          ; C1 37 | Compare accumulator ((zero page,X))
    CMP ($46,X)          ; C1 46 | Compare accumulator ((zero page,X))
    CMP ($55,X)          ; C1 55 | Compare accumulator ((zero page,X))
    CMP ($C7,X)          ; C1 C7 | Compare accumulator ((zero page,X))
    LDA $92C1,Y          ; B9 C1 92 | Load from absolute,Y into accumulator
    CMP ($A9,X)          ; C1 A9 | Compare accumulator ((zero page,X))
    CMP ($EA,X)          ; C1 EA | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    CMP ($5D,X)          ; C1 5D | Compare accumulator ((zero page,X))
    LDA $51C1,Y          ; B9 C1 51 | Load from absolute,Y into accumulator
    LDA $CCC1,Y          ; B9 C1 CC | Load from absolute,Y into accumulator
    SEC                  ; 38 | Set carry flag
    ORA $CA              ; 05 CA | Logical OR with accumulator (zero page)
    AND ($05),Y          ; 31 05 | Logical AND with accumulator ((zero page),Y)
    ORA $25              ; 05 25 | Logical OR with accumulator (zero page)
    ORA $79              ; 05 79 | Logical OR with accumulator (zero page)
    ORA $58              ; 05 58 | Logical OR with accumulator (zero page)
    ORA $F1              ; 05 F1 | Logical OR with accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    ORA $2B              ; 05 2B | Logical OR with accumulator (zero page)
    ORA $10              ; 05 10 | Logical OR with accumulator (zero page)
    ORA $D2              ; 05 D2 | Logical OR with accumulator (zero page)
    ORA $E3              ; 05 E3 | Logical OR with accumulator (zero page)
    ORA ($05),Y          ; 11 05 | Logical OR with accumulator ((zero page),Y)
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    ORA $CD              ; 05 CD | Logical OR with accumulator (zero page)
    CPX $04              ; E4 04 | Compare X register (zero page)
    ORA $E9              ; 05 E9 | Logical OR with accumulator (zero page)
    ORA $E5              ; 05 E5 | Logical OR with accumulator (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    ORA $CE              ; 05 CE | Logical OR with accumulator (zero page)
    ORA $CF              ; 05 CF | Logical OR with accumulator (zero page)
    INC $F005            ; EE 05 F0 | Increment (absolute)
    ORA $E8              ; 05 E8 | Logical OR with accumulator (zero page)
    ORA $F305,Y          ; 19 05 F3 | Logical OR with accumulator (absolute,Y)
    ORA $DF              ; 05 DF | Logical OR with accumulator (zero page)
    ORA $FC              ; 05 FC | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_03F
; Address: $C28D1E
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_03F:
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    SBC $FE04,X          ; FD 04 FE | Subtract with carry (absolute,X)
    EOR $F405,Y          ; 59 05 F4 | Exclusive OR with accumulator (absolute,Y)
    ORA $D1              ; 05 D1 | Logical OR with accumulator (zero page)
    ORA $1B              ; 05 1B | Logical OR with accumulator (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA $D2              ; 05 D2 | Logical OR with accumulator (zero page)
    ORA $1D              ; 05 1D | Logical OR with accumulator (zero page)
    ORA $E9              ; 05 E9 | Logical OR with accumulator (zero page)
    NOP                  ; EA | No operation
    ORA $D5              ; 05 D5 | Logical OR with accumulator (zero page)
    ORA $D6              ; 05 D6 | Logical OR with accumulator (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ORA $2C              ; 05 2C | Logical OR with accumulator (zero page)
    ORA $D6              ; 05 D6 | Logical OR with accumulator (zero page)
    ORA $D7              ; 05 D7 | Logical OR with accumulator (zero page)
    ORA $BB              ; 05 BB | Logical OR with accumulator (zero page)
    ORA $EA              ; 05 EA | Logical OR with accumulator (zero page)
    ORA $EB              ; 05 EB | Logical OR with accumulator (zero page)
    ORA $EC              ; 05 EC | Logical OR with accumulator (zero page)
    ORA $56              ; 05 56 | Logical OR with accumulator (zero page)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    ORA $67              ; 05 67 | Logical OR with accumulator (zero page)
    ORA $2F              ; 05 2F | Logical OR with accumulator (zero page)
    ORA $EF              ; 05 EF | Logical OR with accumulator (zero page)
    ORA $5C              ; 05 5C | Logical OR with accumulator (zero page)
    ORA $30              ; 05 30 | Logical OR with accumulator (zero page)
    ORA $5D              ; 05 5D | Logical OR with accumulator (zero page)
    ORA $68              ; 05 68 | Logical OR with accumulator (zero page)
    ORA $5E              ; 05 5E | Logical OR with accumulator (zero page)
    ORA $F6              ; 05 F6 | Logical OR with accumulator (zero page)
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    ORA $F7              ; 05 F7 | Logical OR with accumulator (zero page)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    ORA $69              ; 05 69 | Logical OR with accumulator (zero page)
    ORA $5F              ; 05 5F | Logical OR with accumulator (zero page)
    ORA $21              ; 05 21 | PPU graphics register access
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    ORA $BE              ; 05 BE | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_040
; Address: $C28D84
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_040:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA $87              ; 05 87 | Logical OR with accumulator (zero page)
    ORA $D8              ; 05 D8 | Logical OR with accumulator (zero page)
    ORA $D9              ; 05 D9 | Logical OR with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL $89              ; 06 89 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_041
; Address: $C28D96
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_041:
    ORA $F1              ; 05 F1 | Logical OR with accumulator (zero page)
    ORA $EB              ; 05 EB | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $8A              ; 05 8A | Logical OR with accumulator (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    ASL $23              ; 06 23 | Arithmetic shift left (zero page)
    ORA $BF              ; 05 BF | Logical OR with accumulator (zero page)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    PHX                  ; DA | Push X register to stack
    ORA $DB              ; 05 DB | Logical OR with accumulator (zero page)
    CPX $F204            ; EC 04 F2 | Compare X register (absolute)
    ORA $ED              ; 05 ED | Logical OR with accumulator (zero page)
    ORA $57              ; 05 57 | Logical OR with accumulator (zero page)
    ORA $D8              ; 05 D8 | Logical OR with accumulator (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA $BC              ; 05 BC | Logical OR with accumulator (zero page)
    ORA $BD              ; 05 BD | Logical OR with accumulator (zero page)
    ORA $BE              ; 05 BE | Logical OR with accumulator (zero page)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $CC              ; 06 CC | Arithmetic shift left (zero page)
    CPY $6B04            ; CC 04 6B | Compare Y register (absolute)
    ORA $35              ; 05 35 | Logical OR with accumulator (zero page)
    ORA $2D              ; 05 2D | Logical OR with accumulator (zero page)
    ORA $2E              ; 05 2E | Logical OR with accumulator (zero page)
    ORA $39              ; 05 39 | Logical OR with accumulator (zero page)
    ORA $52              ; 05 52 | Logical OR with accumulator (zero page)
    ORA $37              ; 05 37 | Logical OR with accumulator (zero page)
    ORA $29              ; 05 29 | Logical OR with accumulator (zero page)
    ORA $2A              ; 05 2A | Logical OR with accumulator (zero page)
    ORA $54              ; 05 54 | Logical OR with accumulator (zero page)
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    ORA $B5              ; 05 B5 | Logical OR with accumulator (zero page)
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    LDA $BA04,Y          ; B9 04 BA | Load from absolute,Y into accumulator
    LDY $BD04,X          ; BC 04 BD | Load from absolute,X into Y register
    CMP ($04,X)          ; C1 04 | Compare accumulator ((zero page,X))
    SBC $EE04            ; ED 04 EE | Subtract with carry (absolute)
    CMP $DE04,X          ; DD 04 DE | Compare accumulator (absolute,X)
    REP #$04             ; C2 04 | Reset processor status bits
    BEQ $04              ; F0 04 | Branch if equal
    PEA #$C404           ; F4 04 C4 | Push effective address to stack
    CPX #$04             ; E0 04 | Compare X register (immediate)
    SBC ($04,X)          ; E1 04 | Subtract with carry ((zero page,X))
    CMP $04              ; C5 04 | Compare accumulator (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    SEP #$04             ; E2 04 | Set processor status bits
    ORA $C8              ; 05 C8 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_042
; Address: $C28E29
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_042:
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    CPY $CC04            ; CC 04 CC | Compare Y register (absolute)
    DEC                  ; 3A | Decrement accumulator
    ORA $D9              ; 05 D9 | Logical OR with accumulator (zero page)
    ORA $DA              ; 05 DA | Logical OR with accumulator (zero page)
    ORA $E6              ; 05 E6 | Logical OR with accumulator (zero page)
    ORA $DB              ; 05 DB | Logical OR with accumulator (zero page)
    ORA $F9              ; 05 F9 | Logical OR with accumulator (zero page)
    ORA $E7              ; 05 E7 | Logical OR with accumulator (zero page)
    ORA $DD              ; 05 DD | Logical OR with accumulator (zero page)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    DEC $E805,X          ; DE 05 E8 | Decrement (absolute,X)
    ORA $FB              ; 05 FB | Logical OR with accumulator (zero page)
    CPX #$05             ; E0 05 | Compare X register (immediate)
    SBC ($05,X)          ; E1 05 | Subtract with carry ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA $E2              ; 05 E2 | Logical OR with accumulator (zero page)
    ORA $8B              ; 05 8B | Logical OR with accumulator (zero page)
    ORA $84              ; 05 84 | Logical OR with accumulator (zero page)
    ORA $3E              ; 05 3E | Logical OR with accumulator (zero page)
    ORA $85              ; 05 85 | Logical OR with accumulator (zero page)
    ORA $3F              ; 05 3F | Logical OR with accumulator (zero page)
    ORA $40              ; 05 40 | Logical OR with accumulator (zero page)
    ORA $41              ; 05 41 | Logical OR with accumulator (zero page)
    ORA $E3              ; 05 E3 | Logical OR with accumulator (zero page)
    ORA $42              ; 05 42 | Hardware register operation
    ORA $E4              ; 05 E4 | Logical OR with accumulator (zero page)
    ORA $43              ; 05 43 | Logical OR with accumulator (zero page)
    ORA $44              ; 05 44 | Logical OR with accumulator (zero page)
    ORA $45              ; 05 45 | Logical OR with accumulator (zero page)
    ORA $46              ; 05 46 | Logical OR with accumulator (zero page)
    ORA $E5              ; 05 E5 | Logical OR with accumulator (zero page)
    ORA $6A              ; 05 6A | Logical OR with accumulator (zero page)
    ORA $47              ; 05 47 | Logical OR with accumulator (zero page)
    ORA $49              ; 05 49 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_043
; Address: $C28EB2
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_043:
    ORA $4A              ; 05 4A | Logical OR with accumulator (zero page)
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ORA $4D              ; 05 4D | Logical OR with accumulator (zero page)
    ORA $3B              ; 05 3B | Logical OR with accumulator (zero page)
    ORA $3C              ; 05 3C | Logical OR with accumulator (zero page)
    ORA $72              ; 05 72 | Logical OR with accumulator (zero page)
    ORA $5B              ; 05 5B | Logical OR with accumulator (zero page)
    ORA $3D              ; 05 3D | Logical OR with accumulator (zero page)
    ORA $48              ; 05 48 | Logical OR with accumulator (zero page)
    ORA $88              ; 05 88 | Logical OR with accumulator (zero page)
    ORA $4B              ; 05 4B | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $4E              ; 06 4E | Arithmetic shift left (zero page)
    ORA $36              ; 05 36 | Logical OR with accumulator (zero page)
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    LDY $0400            ; AC 00 04 | Load from absolute address into Y register
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_044
; Address: $C28F1B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_044:
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_045
; Address: $C28FE3
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_045:
    JSR $8850            ; 20 50 88 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BEQ $48              ; F0 48 | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BVS $48              ; 70 48 | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BEQ $00              ; F0 00 | Branch if equal
    BVS $88              ; 70 88 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $88              ; 80 88 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $48              ; F0 48 | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    BRA $F0              ; 80 F0 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    BRA $F0              ; 80 F0 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BVS $88              ; 70 88 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    BRA $98              ; 80 98 | Branch always
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank04_DmaFunction_046
; Address: $C29053
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_046:
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVS $20              ; 70 20 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank04_DmaFunction_048
; Address: $C29068
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_048:
    JSR $2020            ; 20 20 20 | Jump to subroutine
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BCC $60              ; 90 60 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BCC $A0              ; 90 A0 | Branch if carry clear
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BCC $88              ; 90 88 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVS $88              ; 70 88 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_049
; Address: $C290C7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_049:
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $88              ; F0 88 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BEQ $80              ; F0 80 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BVS $88              ; 70 88 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BVS $08              ; 70 08 | Branch if overflow set
    BEQ $88              ; F0 88 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BEQ $A0              ; F0 A0 | Branch if equal
    BCC $88              ; 90 88 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    BVS $88              ; 70 88 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    BVS $08              ; 70 08 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_04C
; Address: $C2911A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_04C:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVC $50              ; 50 50 | Branch if overflow clear
    BVC $20              ; 50 20 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_04D
; Address: $C2913B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_04D:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLD                  ; D8 | Clear decimal mode flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVC $50              ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_04E
; Address: $C29157
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_04E:
    JSR $5050            ; 20 50 50 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVC $50              ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_050
; Address: $C2916A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_050:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_051
; Address: $C29177
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_051:
    JSR $4040            ; 20 40 40 | Jump to subroutine
    BRA $F8              ; 80 F8 | Branch always
    BVS $08              ; 70 08 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    BRA $F0              ; 80 F0 | Branch always
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BEQ $00              ; F0 00 | Branch if equal
    BVS $88              ; 70 88 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_052
; Address: $C291BB
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_052:
    SEI                  ; 78 | Set interrupt disable flag
    BVS $88              ; 70 88 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BRA $88              ; 80 88 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $48              ; 30 48 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $40              ; F0 40 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVS $88              ; 70 88 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    BRA $B0              ; 80 B0 | Branch always
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_055
; Address: $C2920A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_055:
    JSR $0070            ; 20 70 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    BMI $10              ; 30 10 | Branch if negative
    BPL $10              ; 10 10 | Branch if positive
    BPL $90              ; 10 90 | Branch if positive
    BCC $60              ; 90 60 | Branch if carry clear
    BRA $80              ; 80 80 | Branch always
    BRA $90              ; 80 90 | Branch always
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    LDY #$90             ; A0 90 | Load immediate value into Y register
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_058
; Address: $C2923A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_058:
    JSR $0070            ; 20 70 00 | Jump to subroutine
    BNE $A8              ; D0 A8 | Branch if not equal
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    BCS $C8              ; B0 C8 | Branch if carry set
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_059
; Address: $C29259
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_059:
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVS $88              ; 70 88 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $88              ; F0 88 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BEQ $80              ; F0 80 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BCS $C8              ; B0 C8 | Branch if carry set
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BVS $88              ; 70 88 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_05A
; Address: $C292A9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_05A:
    BPL $88              ; 10 88 | Branch if positive
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $40              ; F0 40 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    BMI $00              ; 30 00 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVC $50              ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_05B
; Address: $C292DB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_05B:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_05C
; Address: $C292EA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_05C:
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $00              ; 50 00 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    BVC $20              ; 50 20 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_05D
; Address: $C292F9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_05D:
    JSR $8850            ; 20 50 88 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $F8              ; 80 F8 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_05E
; Address: $C29323
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_05E:
    JSR $8850            ; 20 50 88 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVC $20              ; 50 20 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_061
; Address: $C29339
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_061:
    JSR $F820            ; 20 20 F8 | Jump to subroutine
    BVS $88              ; 70 88 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $F8              ; 80 F8 | Branch always
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    BVS $08              ; 70 08 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $10              ; 10 10 | Branch if positive
    BMI $50              ; 30 50 | Branch if negative
    BVC $90              ; 50 90 | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    BPL $10              ; 10 10 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    BCS $C8              ; B0 C8 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_062
; Address: $C2937B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_062:
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $88              ; 70 88 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    BEQ $88              ; F0 88 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_063
; Address: $C29397
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_063:
    JSR $4020            ; 20 20 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVS $88              ; 70 88 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVS $88              ; 70 88 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $88              ; 70 88 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank04_DmaFunction_066
; Address: $C293E9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_066:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BVC $50              ; 50 50 | Branch if overflow clear
    BVC $00              ; 50 00 | Branch if overflow clear
    BVC $50              ; 50 50 | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    BVC $F8              ; 50 F8 | Branch if overflow clear
    BVC $50              ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_067
; Address: $C29413
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_067:
    JSR $A078            ; 20 78 A0 | Jump to subroutine
    LDY #$70             ; A0 70 | Load immediate value into Y register
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BEQ $20              ; F0 20 | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $10              ; 50 10 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_068
; Address: $C29427
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_068:
    JSR $5040            ; 20 40 50 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    BCC $00              ; 90 00 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_069
; Address: $C29436
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_069:
    RTI                  ; 40 | Return from interrupt
    LDY #$98             ; A0 98 | Load immediate value into Y register
    BCC $68              ; 90 68 | Branch if carry clear
    BMI $20              ; 30 20 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BPL $20              ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_06E
; Address: $C29474
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_06E:
    JSR $F8A8            ; 20 A8 F8 | Jump to subroutine
    BVS $F8              ; 70 F8 | Branch if overflow set
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_071
; Address: $C29488
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_071:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BMI $20              ; 30 20 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_072
; Address: $C294B9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_072:
    JSR $2070            ; 20 70 20 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_076
; Address: $C294E4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_076:
    JSR $2070            ; 20 70 20 | Jump to subroutine
    BMI $20              ; 30 20 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_077
; Address: $C294F9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_077:
    JSR $0810            ; 20 10 08 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $40              ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_078
; Address: $C29515
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_078:
    JSR $0810            ; 20 10 08 | Jump to subroutine
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BVS $88              ; 70 88 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_07A
; Address: $C29FD3
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_07A:
    LDA $BDF5            ; AD F5 BD | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2004            ; 4C 04 20 | Jump to address
    LDX $BDFB            ; AE FB BD | Load from absolute address into X register
    LDA $BDFD,X          ; BD FD BD | Load from absolute,X into accumulator
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $BDFB            ; 8E FB BD | Store X register to absolute address
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$AB             ; C9 AB | Compare accumulator (immediate)
    BCS $12              ; B0 12 | Branch if carry set
    CMP #$87             ; C9 87 | Compare accumulator (immediate)
    BCC $05              ; 90 05 | Branch if carry clear
    CMP #$91             ; C9 91 | Compare accumulator (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    SBC #$0B             ; E9 0B | Subtract with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC #$00             ; 69 00 | Add with carry (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_07B
; Address: $C2A004
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_07B:
    LDA $A0              ; A5 A0 | Load from zero page into accumulator
    STA $C02F            ; 8D 2F C0 | Store accumulator to absolute address
    LDA $A2              ; A5 A2 | Load from zero page into accumulator
    STA $C031            ; 8D 31 C0 | Store accumulator to absolute address
    LDA $A4              ; A5 A4 | Load from zero page into accumulator
    STA $C033            ; 8D 33 C0 | Store accumulator to absolute address
    LDY #$29             ; A0 29 | Load immediate value into Y register
    INC $A0              ; E6 A0 | Increment (zero page)
    BNE $02              ; D0 02 | Branch if not equal
    INC $A2              ; E6 A2 | Increment (zero page)
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    ADC #$00             ; 69 00 | Add with carry (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_07D
; Address: $C2A02F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_07D:
    JSR $0601            ; 20 01 06 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BMI $73              ; 30 73 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_07E
; Address: $C2A036
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_07E:
    JSL $1FC913          ; 22 13 C9 1F | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    STA ($FC),Y          ; 91 FC | Store accumulator to (zero page),Y
    EOR ($10),Y          ; 51 10 | Exclusive OR with accumulator ((zero page),Y)
    ROR $2A00,X          ; 7E 00 2A | Rotate right (absolute,X)
    BCC $81              ; 90 81 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BMI $F0              ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank04_DmaFunction_07F
; Address: $C2A053
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_07F:
    BMI $FC              ; 30 FC | Branch if negative
    ROL $44              ; 26 44 | Rotate left (zero page)
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    AND ($88,X)          ; 21 88 | Logical AND with accumulator ((zero page,X))
    CPX #$38             ; E0 38 | Compare X register (immediate)
    EOR $2D              ; 45 2D | Exclusive OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    TXA                  ; 8A | Transfer X register to accumulator
    PLB                  ; AB | Pull data bank register from stack
    AND $4F              ; 25 4F | Logical AND with accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    LDY $44              ; A4 44 | Load from zero page into Y register
    CPY $00CF            ; CC CF 00 | Compare Y register (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $FC              ; 80 FC | Branch always
    STA $04A0            ; 8D A0 04 | Store accumulator to absolute address
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    WDM #$10             ; 42 10 | Reserved instruction
    STX $00              ; 86 00 | Store X register to zero page
    CPX $6F              ; E4 6F | Compare X register (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    CPX $AF              ; E4 AF | Compare X register (zero page)
    ADC $BD              ; 65 BD | Add with carry (zero page)
    ORA $90CE            ; 0D CE 90 | Logical OR with accumulator (absolute)
    ORA $492F,X          ; 1D 2F 49 | Logical OR with accumulator (absolute,X)
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_080
; Address: $C2A0A5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_080:
    JSL $63A2D5          ; 22 D5 A2 63 | Jump to subroutine long
    EOR $A4              ; 45 A4 | Exclusive OR with accumulator (zero page)
    EOR ($89),Y          ; 51 89 | Exclusive OR with accumulator ((zero page),Y)
    DEX                  ; CA | Decrement X register
    LDA                  ; BF 23 10 81 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_081
; Address: $C2A0B3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_081:
    JSR $3FF8            ; 20 F8 3F | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BPL $FE              ; 10 FE | Branch if positive
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($CC,X)          ; 01 CC | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_083
; Address: $C2A0C8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_083:
    JSR $E104            ; 20 04 E1 | Jump to subroutine
    INC $040F,X          ; FE 0F 04 | Increment (absolute,X)
    ROR $8410,X          ; 7E 10 84 | Rotate right (absolute,X)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPX #$80             ; E0 80 | Compare X register (immediate)
    ORA $18C6            ; 0D C6 18 | Logical OR with accumulator (absolute)
    LDY $00BF            ; AC BF 00 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_084
; Address: $C2A0E0
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_084:
    BEQ $9F              ; F0 9F | Branch if equal
    BRA $04              ; 80 04 | Branch always
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    SBC ($1F),Y          ; F1 1F | Subtract with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BCC $80              ; 90 80 | Branch if carry clear
    BRA $38              ; 80 38 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    LDA $409B,Y          ; B9 9B 40 | Load from absolute,Y into accumulator
    SBC $22              ; E5 22 | Subtract with carry (zero page)
    BMI $B9              ; 30 B9 | Branch if negative
    LDA #$4A             ; A9 4A | Load immediate value into accumulator
    CPX $0F              ; E4 0F | Compare X register (zero page)
    EOR ($78,X)          ; 41 78 | Exclusive OR with accumulator ((zero page,X))
    WDM #$92             ; 42 92 | Reserved instruction
    BCS $BF              ; B0 BF | Branch if carry set
    SBC ($0F,X)          ; E1 0F | Subtract with carry ((zero page,X))
    EOR ($F8,X)          ; 41 F8 | Exclusive OR with accumulator ((zero page,X))
    BPL $86              ; 10 86 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    REP #$11             ; C2 11 | Reset processor status bits
    WDM #$11             ; 42 11 | Reserved instruction
    TXA                  ; 8A | Transfer X register to accumulator
    DEY                  ; 88 | Decrement Y register
    STZ $24              ; 64 24 | Store zero to zero page
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    LDA                  ; BF FF 80 40 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    CPY $3E              ; C4 3E | Compare Y register (zero page)
    LDA $2F              ; A5 2F | Load from zero page into accumulator
    EOR $E9              ; 45 E9 | Exclusive OR with accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_086
; Address: $C2A142
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_086:
    JSR $0380            ; 20 80 03 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BCS $7C              ; B0 7C | Branch if carry set
    CPY #$7F             ; C0 7F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_088
; Address: $C2A154
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_088:
    ASL $C1              ; 06 C1 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    EOR $BE              ; 45 BE | Exclusive OR with accumulator (zero page)
    PLB                  ; AB | Pull data bank register from stack
    ORA $28              ; 05 28 | Logical OR with accumulator (zero page)
    STA                  ; 9F 89 C4 37 | Store accumulator to absolute long,X
    LDX #$F2             ; A2 F2 | Load immediate value into X register
    LDA ($4F,X)          ; A1 4F | Load from (zero page,X) into accumulator
    SEP #$7B             ; E2 7B | Set processor status bits
    STA ($F8),Y          ; 91 F8 | Store accumulator to (zero page),Y
    STZ $A8              ; 64 A8 | Store zero to zero page
    LDA #$49             ; A9 49 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX #$92             ; A2 92 | Load immediate value into X register
    STA $0584,Y          ; 99 84 05 | Store accumulator to absolute,Y
    ASL $28              ; 06 28 | Arithmetic shift left (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    ADC $FB              ; 65 FB | Add with carry (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $9512,Y          ; BE 12 95 | Load from absolute,Y into X register
    BCC $02              ; 90 02 | Branch if carry clear
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_08A
; Address: $C2A193
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_08A:
    JSR $2924            ; 20 24 29 | Jump to subroutine
    EOR $2C              ; 45 2C | Exclusive OR with accumulator (zero page)
    LDX #$FF             ; A2 FF | Load immediate value into X register
    SBC $1F              ; E5 1F | Subtract with carry (zero page)
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    SBC ($7F),Y          ; F1 7F | Subtract with carry ((zero page),Y)
    WDM #$10             ; 42 10 | Reserved instruction
    SBC ($8F),Y          ; F1 8F | Subtract with carry ((zero page),Y)
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    BPL $FF              ; 10 FF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    STA                  ; 9F B1 AA E6 | Store accumulator to absolute long,X
    EOR #$F9             ; 49 F9 | Exclusive OR with accumulator (immediate)
    INC $E92A,X          ; FE 2A E9 | Increment (absolute,X)
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    DEC $925F,X          ; DE 5F 92 | Decrement (absolute,X)
    LDA                  ; BF 20 E6 6F | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    WDM #$E0             ; 42 E0 | Game work RAM access
    BPL $81              ; 10 81 | Branch if positive
    INY                  ; C8 | Increment Y register
    EOR $22              ; 45 22 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_08B
; Address: $C2A1D8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_08B:
    LDA #$49             ; A9 49 | Load immediate value into accumulator
    STX $0CA2            ; 8E A2 0C | Store X register to absolute address
    ADC ($88,X)          ; 61 88 | Add with carry ((zero page,X))
    WDM #$26             ; 42 26 | Reserved instruction
    BRA $FC              ; 80 FC | Branch always
    RTI                  ; 40 | Return from interrupt
    AND $09              ; 25 09 | Logical AND with accumulator (zero page)
    EOR #$48             ; 49 48 | Exclusive OR with accumulator (immediate)
    BCC $84              ; 90 84 | Branch if carry clear
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    ADC ($C0,X)          ; 61 C0 | Add with carry ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_08C
; Address: $C2A1F9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_08C:
    JSR $81F0            ; 20 F0 81 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    STY $20              ; 84 20 | Store Y register to zero page
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    WDM #$10             ; 42 10 | Reserved instruction
    ADC ($D0,X)          ; 61 D0 | Add with carry ((zero page,X))
    WDM #$F2             ; 42 F2 | Reserved instruction
    BNE $FE              ; D0 FE | Branch if not equal
    EOR $7FEA,X          ; 5D EA 7F | Exclusive OR with accumulator (absolute,X)
    ORA ($C8,X)          ; 01 C8 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_08D
; Address: $C2A214
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_08D:
    JSL $CE8611          ; 22 11 86 CE | Jump to subroutine long
    STA $42              ; 85 42 | Hardware register operation
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    STA $D0              ; 85 D0 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_08E
; Address: $C2A222
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_08E:
    JSL $AA9552          ; 22 52 95 AA | Jump to subroutine long
    LDY #$07             ; A0 07 | Load immediate value into Y register
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    BCS $C1              ; B0 C1 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    LDY $67              ; A4 67 | Load from zero page into Y register
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_08F
; Address: $C2A23C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_08F:
    JSR $6938            ; 20 38 69 | Jump to subroutine
    AND #$50             ; 29 50 | Logical AND with accumulator (immediate)
    CMP #$DF             ; C9 DF | Compare accumulator (immediate)
    AND ($C2),Y          ; 31 C2 | Logical AND with accumulator ((zero page),Y)
    ORA ($95),Y          ; 11 95 | Logical OR with accumulator ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT $29              ; 24 29 | Test bits in accumulator (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    LDA                  ; BF 21 00 01 | Load from absolute long,X into accumulator
    LDA                  ; BF 43 14 A2 | Load from absolute long,X into accumulator
    BPL $FD              ; 10 FD | Branch if positive
    ADC ($8A,X)          ; 61 8A | Add with carry ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_091
; Address: $C2A262
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_091:
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BPL $FC              ; 10 FC | Branch if positive
    BVS $40              ; 70 40 | Branch if overflow set
    ORA $29              ; 05 29 | Logical OR with accumulator (zero page)
    SEP #$9F             ; E2 9F | Set processor status bits
    LDY $24              ; A4 24 | Load from zero page into Y register
    LDA $FD69            ; AD 69 FD | Load from absolute address into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_092
; Address: $C2A279
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_092:
    PHY                  ; 5A | Push Y register to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    LDA                  ; BF 22 1F 81 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    INC $445F,X          ; FE 5F 44 | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    ROL                  ; 2A | Rotate left (accumulator)
    CMP $E0              ; C5 E0 | Game work RAM access
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_094
; Address: $C2A29D
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_094:
    JSL $0FFD10          ; 22 10 FD 0F | Jump to subroutine long
    WDM #$10             ; 42 10 | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)
    SBC ($06,X)          ; E1 06 | Subtract with carry ((zero page,X))
    CPX $A177            ; EC 77 A1 | Compare X register (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $EA4748          ; AF 48 47 EA | Load from absolute long address into accumulator
    STA ($8A),Y          ; 91 8A | Store accumulator to (zero page),Y
    PEA #$16A2           ; F4 A2 16 | Push effective address to stack
    INC $01C1            ; EE C1 01 | Increment (absolute)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BEQ $7F              ; F0 7F | Branch if equal
    SEC                  ; 38 | Set carry flag
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_095
; Address: $C2A2C4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_095:
    JSR $4889            ; 20 89 48 | Jump to subroutine
    LSR $14              ; 46 14 | Logical shift right (zero page)
    WDM #$10             ; 42 10 | Reserved instruction
    INC $9013,X          ; FE 13 90 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_096
; Address: $C2A2D2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_096:
    JSR $A104            ; 20 04 A1 | Jump to subroutine
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_097
; Address: $C2A2DA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_097:
    JSL $BF60E2          ; 22 E2 60 BF | Jump to subroutine long
    CMP $EF              ; C5 EF | Compare accumulator (zero page)
    SBC ($FB),Y          ; F1 FB | Subtract with carry ((zero page),Y)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_098
; Address: $C2A2E7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_098:
    ROL $9913,X          ; 3E 13 99 | Rotate left (absolute,X)
    INY                  ; C8 | Increment Y register
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    BRA $DF              ; 80 DF | Branch always
    STA $A3F7E2          ; 8F E2 F7 A3 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    SBC $0600,X          ; FD 00 06 | Subtract with carry (absolute,X)
    BMI $80              ; 30 80 | Branch if negative
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_099
; Address: $C2A2FF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_099:
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    ORA ($FE),Y          ; 11 FE | Logical OR with accumulator ((zero page),Y)
    BEQ $FF              ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_09A
; Address: $C2A30C
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_09A:
    JSR $03F2            ; 20 F2 03 | Jump to subroutine
    AND #$30             ; 29 30 | Logical AND with accumulator (immediate)
    ASL $FE40,X          ; 1E 40 FE | Arithmetic shift left (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    LDA ($0A,X)          ; A1 0A | Load from (zero page,X) into accumulator
    INC $000F,X          ; FE 0F 00 | Increment (absolute,X)
    EOR #$25             ; 49 25 | Exclusive OR with accumulator (immediate)
    ORA ($41),Y          ; 11 41 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    LDA $7CA8,X          ; BD A8 7C | Load from absolute,X into accumulator
    AND $4A              ; 25 4A | Logical AND with accumulator (zero page)
    REP #$54             ; C2 54 | Reset processor status bits
    EOR $24              ; 45 24 | Exclusive OR with accumulator (zero page)
    AND ($95,X)          ; 21 95 | Logical AND with accumulator ((zero page,X))
    LDX $08C2            ; AE C2 08 | Load from absolute address into X register
    BPL $FC              ; 10 FC | Branch if positive
    STY $51              ; 84 51 | Store Y register to zero page
    STY $2262            ; 8C 62 22 | Store Y register to absolute address
    PHY                  ; 5A | Push Y register to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    BRA $07              ; 80 07 | Branch always
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    EOR ($F0,X)          ; 41 F0 | Exclusive OR with accumulator ((zero page,X))
    ROL $32              ; 26 32 | Rotate left (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    SBC $610C,Y          ; F9 0C 61 | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    REP #$11             ; C2 11 | Reset processor status bits
    LDA ($18,X)          ; A1 18 | Load from (zero page,X) into accumulator
    EOR $01              ; 45 01 | Exclusive OR with accumulator (zero page)
    LDY $25              ; A4 25 | Load from zero page into Y register
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)
    ORA ($82),Y          ; 11 82 | Logical OR with accumulator ((zero page),Y)
    STA $535F28          ; 8F 28 5F 53 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_09B
; Address: $C2A373
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_09B:
    LSR $DC55            ; 4E 55 DC | Logical shift right (absolute)
    WDM #$A2             ; 42 A2 | Reserved instruction
    EOR #$25             ; 49 25 | Exclusive OR with accumulator (immediate)
    AND #$89             ; 29 89 | Logical AND with accumulator (immediate)
    ORA ($88,X)          ; 01 88 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_09E
; Address: $C2A38D
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_09E:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    BPL $C0              ; 10 C0 | Branch if positive
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    STY $5BB1            ; 8C B1 5B | Store Y register to absolute address
    SBC $0083,Y          ; F9 83 00 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    TAX                  ; AA | Transfer accumulator to X register
    STA $EC              ; 85 EC | Store accumulator to zero page
    RTI                  ; 40 | Return from interrupt
    LDY $22              ; A4 22 | Load from zero page into Y register
    LDA #$C8             ; A9 C8 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    BCC $82              ; 90 82 | Branch if carry clear
    INC                  ; 1A | Increment accumulator
    SBC $2011,X          ; FD 11 20 | Subtract with carry (absolute,X)
    ASL $0F81,X          ; 1E 81 0F | Arithmetic shift left (absolute,X)
    STY $20              ; 84 20 | Store Y register to zero page
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    SBC $420F,X          ; FD 0F 42 | Hardware register operation
    BPL $82              ; 10 82 | Branch if positive
    BPL $84              ; 10 84 | Branch if positive
    CMP $3F              ; C5 3F | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_09F
; Address: $C2A3C7
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_09F:
    JSL $188510          ; 22 10 85 18 | Jump to subroutine long
    STZ $20              ; 64 20 | Store zero to zero page
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR #$55             ; 49 55 | Exclusive OR with accumulator (immediate)
    BCC $7C              ; 90 7C | Branch if carry clear
    PEA #$049B           ; F4 9B 04 | Push effective address to stack
    STZ $AF              ; 64 AF | Store zero to zero page
    ORA ($91,X)          ; 01 91 | Logical OR with accumulator ((zero page,X))
    BIT #$C0             ; 89 C0 | Test bits in accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY $AB              ; C4 AB | Compare Y register (zero page)
    PHY                  ; 5A | Push Y register to stack
    LDX $2447            ; AE 47 24 | Load from absolute address into X register
    AND #$2A             ; 29 2A | Logical AND with accumulator (immediate)
    ORA ($2D),Y          ; 11 2D | Logical OR with accumulator ((zero page),Y)
    ADC ($05,X)          ; 61 05 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0A0
; Address: $C2A3F1
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0A0:
    PHY                  ; 5A | Push Y register to stack
    LDX $24              ; A6 24 | Load from zero page into X register
    LDA $2A              ; A5 2A | Load from zero page into accumulator
    ADC $09              ; 65 09 | Add with carry (zero page)
    DEX                  ; CA | Decrement X register
    BIT $42              ; 24 42 | Hardware register operation
    ORA ($2C),Y          ; 11 2C | Logical OR with accumulator ((zero page),Y)
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    PEA #$04B8           ; F4 B8 04 | Push effective address to stack
    LDA $4528,X          ; BD 28 45 | Load from absolute,X into accumulator
    SBC #$59             ; E9 59 | Subtract with carry (immediate)
    STA ($4B),Y          ; 91 4B | Store accumulator to (zero page),Y
    TAY                  ; A8 | Transfer accumulator to Y register
    PHP                  ; 08 | Push processor status to stack
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $EAAD,Y          ; 59 AD EA | Exclusive OR with accumulator (absolute,Y)
    LDA $5A              ; A5 5A | Load from zero page into accumulator
    LDY $F942            ; AC 42 F9 | Load from absolute address into Y register
    SBC $0205,Y          ; F9 05 02 | Subtract with carry (absolute,Y)
    BPL $FC              ; 10 FC | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPX #$17             ; E0 17 | Compare X register (immediate)
    AND ($09,X)          ; 21 09 | Logical AND with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    BRA $04              ; 80 04 | Branch always
    CPX $20              ; E4 20 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0A1
; Address: $C2A434
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0A1:
    JSR $F955            ; 20 55 F9 | Jump to subroutine
    LSR $52AA            ; 4E AA 52 | Logical shift right (absolute)
    DEY                  ; 88 | Decrement Y register
    INC $060F,X          ; FE 0F 06 | Increment (absolute,X)
    ROR $1C1C            ; 6E 1C 1C | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0A2
; Address: $C2A443
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0A2:
    JSR $497F            ; 20 7F 49 | Jump to subroutine
    LSR                  ; 4A | Logical shift right (accumulator)
    CPX $24              ; E4 24 | Compare X register (zero page)
    SBC $08AF            ; ED AF 08 | Subtract with carry (absolute)
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    WDM #$10             ; 42 10 | Reserved instruction
    STX $08              ; 86 08 | Store X register to zero page
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    CPX $3F              ; E4 3F | Compare X register (zero page)
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    BRA $02              ; 80 02 | Branch always
    PEA #$003F           ; F4 3F 00 | Push effective address to stack
    SBC $448F,X          ; FD 8F 44 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0A3
; Address: $C2A470
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0A3:
    LSR $1F8A            ; 4E 8A 1F | Logical shift right (absolute)
    STY $FC              ; 84 FC | Store Y register to zero page
    ORA $C1              ; 05 C1 | Logical OR with accumulator (zero page)
    INY                  ; C8 | Increment Y register
    BIT $FA              ; 24 FA | Test bits in accumulator (zero page)
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    ROL $3F64            ; 2E 64 3F | Rotate left (absolute)
    ORA #$C9             ; 09 C9 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    RTI                  ; 40 | Return from interrupt
    CPX #$3F             ; E0 3F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0A4
; Address: $C2A48E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0A4:
    JSR $FFE2            ; 20 E2 FF | Jump to subroutine
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    REP #$1F             ; C2 1F | Reset processor status bits
    BPL $84              ; 10 84 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0A5
; Address: $C2A49C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0A5:
    JSR $8100            ; 20 00 81 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $E0              ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0A6
; Address: $C2A4A7
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0A6:
    JSR $0380            ; 20 80 03 | Jump to subroutine
    ROL                  ; 2A | Rotate left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    SEP #$8F             ; E2 8F | Set processor status bits
    BPL $04              ; 10 04 | Branch if positive
    SBC $891F,Y          ; F9 1F 89 | Subtract with carry (absolute,Y)
    INC $A357,X          ; FE 57 A3 | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SBC $7C88,X          ; FD 88 7C | Subtract with carry (absolute,X)
    JMP $4971            ; 4C 71 49 | Jump to address
    STA $4428            ; 8D 28 44 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0A7
; Address: $C2A4C1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0A7:
    JSR $43E4            ; 20 E4 43 | Jump to subroutine
    STA ($0A),Y          ; 91 0A | Store accumulator to (zero page),Y
    BIT #$82             ; 89 82 | Test bits in accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    ROL                  ; 2A | Rotate left (accumulator)
    STA ($FA),Y          ; 91 FA | Store accumulator to (zero page),Y
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0A8
; Address: $C2A4D8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0A8:
    JSL $621204          ; 22 04 12 62 | Jump to subroutine long
    INX                  ; E8 | Increment X register
    ROR $9212,X          ; 7E 12 92 | Rotate right (absolute,X)
    BPL $FD              ; 10 FD | Branch if positive
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0A9
; Address: $C2A4E4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0A9:
    JSL $C001FF          ; 22 FF 01 C0 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    PEA #$2AA5           ; F4 A5 2A | Push effective address to stack
    ADC $688D,X          ; 7D 8D 68 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0AA
; Address: $C2A4F4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0AA:
    CMP $0104            ; CD 04 01 | Compare accumulator (absolute)
    BPL $41              ; 10 41 | Branch if positive
    BPL $01              ; 10 01 | Branch if positive
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    ORA ($88),Y          ; 11 88 | Logical OR with accumulator ((zero page),Y)
    CPY #$05             ; C0 05 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0AB
; Address: $C2A506
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0AB:
    JSR $2404            ; 20 04 24 | Jump to subroutine
    ROL $2945,X          ; 3E 45 29 | Rotate left (absolute,X)
    STA $5CAA,X          ; 9D AA 5C | Store accumulator to absolute,X
    LDA $5A              ; A5 5A | Load from zero page into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    AND ($0A,X)          ; 21 0A | Logical AND with accumulator ((zero page,X))
    LDA ($20,X)          ; A1 20 | Load from (zero page,X) into accumulator
    ORA ($E8),Y          ; 11 E8 | Logical OR with accumulator ((zero page),Y)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    BCC $80              ; 90 80 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    CPX $A0              ; E4 A0 | Compare X register (zero page)
    INC                  ; 1A | Increment accumulator
    STA ($88),Y          ; 91 88 | Store accumulator to (zero page),Y
    CPX $21              ; E4 21 | PPU graphics register access
    INC $C103,X          ; FE 03 C1 | Increment (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $F8              ; 10 F8 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($89),Y          ; 11 89 | Logical OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    TAX                  ; AA | Transfer accumulator to X register
    LSR $24              ; 46 24 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ADC $4A09,Y          ; 79 09 4A | Add with carry (absolute,Y)
    BVC $FC              ; 50 FC | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    BCC $F4              ; 90 F4 | Branch if carry clear
    LDY $28              ; A4 28 | Load from zero page into Y register
    EOR $29              ; 45 29 | Exclusive OR with accumulator (zero page)
    JMP $1245            ; 4C 45 12 | Jump to address
    BPL $88              ; 10 88 | Branch if positive
    BRA $1C              ; 80 1C | Branch always
    PHP                  ; 08 | Push processor status to stack
    BIT $11              ; 24 11 | Test bits in accumulator (zero page)
    BIT #$8A             ; 89 8A | Test bits in accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $D0              ; 06 D0 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    BPL $82              ; 10 82 | Branch if positive
    BPL $84              ; 10 84 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    STA ($4A,X)          ; 81 4A | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0AD
; Address: $C2A57D
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0AD:
    JSR $A895            ; 20 95 A8 | Jump to subroutine
    LDA #$48             ; A9 48 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    INC $5088,X          ; FE 88 50 | Increment (absolute,X)
    LDA #$D2             ; A9 D2 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    SBC ($09),Y          ; F1 09 | Subtract with carry ((zero page),Y)
    AND $D2AA,Y          ; 39 AA D2 | Logical AND with accumulator (absolute,Y)
    LDY $20              ; A4 20 | Load from zero page into Y register
    BEQ $4F              ; F0 4F | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INC $949E,X          ; FE 9E 94 | Increment (absolute,X)
    LDA                  ; BF 20 E4 2F | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    ORA ($B8),Y          ; 11 B8 | Logical OR with accumulator ((zero page),Y)
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    SBC $4889,X          ; FD 89 48 | Subtract with carry (absolute,X)
    JMP $5272            ; 4C 72 52 | Jump to address
    DEX                  ; CA | Decrement X register
    RTI                  ; 40 | Return from interrupt
    SEP #$10             ; E2 10 | Set processor status bits
    INC $1FF3,X          ; FE F3 1F | Increment (absolute,X)
    STY $BE              ; 84 BE | Store Y register to zero page
    CPX $3F              ; E4 3F | Compare X register (zero page)
    ORA #$79             ; 09 79 | Logical OR with accumulator (immediate)
    EOR #$52             ; 49 52 | Exclusive OR with accumulator (immediate)
    STZ $94F3,X          ; 9E F3 94 | Store zero to absolute,X
    LDY $3918,X          ; BC 18 39 | Load from absolute,X into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LSR $3E25,X          ; 5E 25 3E | Logical shift right (absolute,X)
    EOR ($89),Y          ; 51 89 | Exclusive OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $F88410          ; 8F 10 84 F8 | Store accumulator to absolute long address
    AND ($08),Y          ; 31 08 | Logical AND with accumulator ((zero page),Y)
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)
    INC $0103,X          ; FE 03 01 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BPL $FC              ; 10 FC | Branch if positive
    AND ($EA),Y          ; 31 EA | Logical AND with accumulator ((zero page),Y)
    BRA $2A              ; 80 2A | Branch always
    WDM #$F5             ; 42 F5 | Reserved instruction
    SEP #$FD             ; E2 FD | Set processor status bits
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$FA             ; A9 FA | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    ADC ($BE),Y          ; 71 BE | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0AE
; Address: $C2A604
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0AE:
    WDM #$14             ; 42 14 | Reserved instruction
    LDX #$FE             ; A2 FE | Load immediate value into X register
    ROL $2A              ; 26 2A | Rotate left (zero page)
    EOR ($27),Y          ; 51 27 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($3E),Y          ; 51 3E | Exclusive OR with accumulator ((zero page),Y)
    BPL $82              ; 10 82 | Branch if positive
    ORA $C1              ; 05 C1 | Logical OR with accumulator (zero page)
    ADC ($10,X)          ; 61 10 | Add with carry ((zero page,X))
    JMP $8129            ; 4C 29 81 | Jump to address
    RTI                  ; 40 | Return from interrupt
    EOR #$F9             ; 49 F9 | Exclusive OR with accumulator (immediate)
    BIT $C1              ; 24 C1 | Test bits in accumulator (zero page)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0AF
; Address: $C2A628
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0AF:
    JSR $1FF0            ; 20 F0 1F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    WDM #$10             ; 42 10 | Reserved instruction
    WDM #$10             ; 42 10 | Reserved instruction
    ORA ($88),Y          ; 11 88 | Logical OR with accumulator ((zero page),Y)
    BRA $C0              ; 80 C0 | Branch always
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    LDA ($7F,X)          ; A1 7F | Load from (zero page,X) into accumulator
    BRA $40              ; 80 40 | Branch always
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2A              ; A5 2A | Load from zero page into accumulator
    SBC ($92),Y          ; F1 92 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0B1
; Address: $C2A64C
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0B1:
    JSL $7FF110          ; 22 10 F1 7F | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    INC $9113,X          ; FE 13 91 | Increment (absolute,X)
    WDM #$F0             ; 42 F0 | Reserved instruction
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    SBC ($19),Y          ; F1 19 | Subtract with carry ((zero page),Y)
    WDM #$11             ; 42 11 | Reserved instruction
    STA ($BF),Y          ; 91 BF | Store accumulator to (zero page),Y
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    EOR ($F9,X)          ; 41 F9 | Exclusive OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    ROR $7A02,X          ; 7E 02 7A | Rotate right (absolute,X)
    ROL $61              ; 26 61 | Rotate left (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX #$16             ; A2 16 | Load immediate value into X register
    LDA $28              ; A5 28 | Load from zero page into accumulator
    AND $49              ; 25 49 | Logical AND with accumulator (zero page)
    EOR #$46             ; 49 46 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0B3
; Address: $C2A683
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0B3:
    ADC $08              ; 65 08 | Add with carry (zero page)
    WDM #$7A             ; 42 7A | Reserved instruction
    TXA                  ; 8A | Transfer X register to accumulator
    STX $6463            ; 8E 63 64 | Store X register to absolute address
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    EOR ($09,X)          ; 41 09 | Exclusive OR with accumulator ((zero page,X))
    ORA #$48             ; 09 48 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    INC $9013,X          ; FE 13 90 | Increment (absolute,X)
    BRA $FC              ; 80 FC | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0B4
; Address: $C2A69C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0B4:
    JSL $88610A          ; 22 0A 61 88 | Jump to subroutine long
    JMP $880783          ; 5C 83 07 88 | Jump to address long
    STA $53E904          ; 8F 04 E9 53 | Store accumulator to absolute long address
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($F1),Y          ; 11 F1 | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    EOR $E319,Y          ; 59 19 E3 | Exclusive OR with accumulator (absolute,Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    LDY $10              ; A4 10 | Load from zero page into Y register
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    SBC $007F,Y          ; F9 7F 00 | Subtract with carry (absolute,Y)
    STA ($C0,X)          ; 81 C0 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0B5
; Address: $C2A6BE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0B5:
    JSL $108110          ; 22 10 81 10 | Jump to subroutine long
    STY $20              ; 84 20 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    EOR ($F0,X)          ; 41 F0 | Exclusive OR with accumulator ((zero page,X))
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    EOR ($F0,X)          ; 41 F0 | Exclusive OR with accumulator ((zero page,X))
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0B6
; Address: $C2A6D8
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0B6:
    JSR $8110            ; 20 10 81 | Jump to subroutine
    INC $4048,X          ; FE 48 40 | Increment (absolute,X)
    DEC $7381            ; CE 81 73 | Decrement (absolute)
    BPL $82              ; 10 82 | Branch if positive
    BEQ $03              ; F0 03 | Branch if equal
    STA $8BCA08          ; 8F 08 CA 8B | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    AND $AA41,X          ; 3D 41 AA | Logical AND with accumulator (absolute,X)
    BPL $A2              ; 10 A2 | Branch if positive
    DEC                  ; 3A | Decrement accumulator
    LDX #$C5             ; A2 C5 | Load immediate value into X register
    ADC ($F9,X)          ; 61 F9 | Add with carry ((zero page,X))
    ORA ($F4,X)          ; 01 F4 | Logical OR with accumulator ((zero page,X))
    STA $13FC40          ; 8F 40 FC 13 | Store accumulator to absolute long address
    EOR ($88),Y          ; 51 88 | Exclusive OR with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    LDX #$28             ; A2 28 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0B7
; Address: $C2A709
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0B7:
    ADC $D1              ; 65 D1 | Add with carry (zero page)
    STA ($06),Y          ; 91 06 | Store accumulator to (zero page),Y
    SBC $04AB,Y          ; F9 AB 04 | Subtract with carry (absolute,Y)
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    LDX #$F6             ; A2 F6 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    BIT $FA              ; 24 FA | Test bits in accumulator (zero page)
    EOR ($54),Y          ; 51 54 | Exclusive OR with accumulator ((zero page),Y)
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0B9
; Address: $C2A728
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0B9:
    JSR $02FC            ; 20 FC 02 | Jump to subroutine
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    INC $E080,X          ; FE 80 E0 | Game work RAM access
    BRA $F0              ; 80 F0 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0BB
; Address: $C2A743
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0BB:
    JSR $F900            ; 20 00 F9 | Jump to subroutine
    ROL                  ; 2A | Rotate left (accumulator)
    EOR ($49),Y          ; 51 49 | Exclusive OR with accumulator ((zero page),Y)
    STY $38              ; 84 38 | Store Y register to zero page
    ROL                  ; 2A | Rotate left (accumulator)
    BVC $82              ; 50 82 | Branch if overflow clear
    CPX $F020            ; EC 20 F0 | Compare X register (absolute)
    ORA #$4A             ; 09 4A | Logical OR with accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    INC                  ; 1A | Increment accumulator
    STY $FC              ; 84 FC | Store Y register to zero page
    ORA $21              ; 05 21 | PPU graphics register access
    PHP                  ; 08 | Push processor status to stack
    EOR ($F0,X)          ; 41 F0 | Exclusive OR with accumulator ((zero page,X))
    LDA                  ; BF FE 13 90 | Load from absolute long,X into accumulator
    CPX $3F              ; E4 3F | Compare X register (zero page)
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    ADC $FC10,X          ; 7D 10 FC | Add with carry (absolute,X)
    STA ($FE),Y          ; 91 FE | Store accumulator to (zero page),Y
    STY $FF              ; 84 FF | Store Y register to zero page
    BPL $F1              ; 10 F1 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA                  ; BF 20 F0 1F | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    INC $020F,X          ; FE 0F 02 | Increment (absolute,X)
    BIT #$E0             ; 89 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0BC
; Address: $C2A793
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0BC:
    JSL $121FF0          ; 22 F0 1F 12 | Jump to subroutine long
    INC $108F,X          ; FE 8F 10 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0BD
; Address: $C2A79E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0BD:
    BPL $80              ; 10 80 | Branch if positive
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ASL $50              ; 06 50 | Arithmetic shift left (zero page)
    BRA $0C              ; 80 0C | Branch always
    STY $E1              ; 84 E1 | Store Y register to zero page
    BPL $11              ; 10 11 | Branch if positive
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    STA ($88),Y          ; 91 88 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0BF
; Address: $C2A7BA
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0BF:
    JSL $014028          ; 22 28 40 01 | Jump to subroutine long
    ORA ($07),Y          ; 11 07 | Logical OR with accumulator ((zero page),Y)
    BNE $F7              ; D0 F7 | Branch if not equal
    LDY $44              ; A4 44 | Load from zero page into Y register
    BPL $64              ; 10 64 | Branch if positive
    BEQ $1F              ; F0 1F | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    BMI $7E              ; 30 7E | Branch if negative
    LDY $42              ; A4 42 | Hardware register operation
    LDA $2550            ; AD 50 25 | Load from absolute address into accumulator
    PLB                  ; AB | Pull data bank register from stack
    STA ($8A),Y          ; 91 8A | Store accumulator to (zero page),Y
    TAX                  ; AA | Transfer accumulator to X register
    LDA $47C8            ; AD C8 47 | Load from absolute address into accumulator
    RTI                  ; 40 | Return from interrupt
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    EOR ($CC,X)          ; 41 CC | Exclusive OR with accumulator ((zero page,X))
    BPL $86              ; 10 86 | Branch if positive
    BVC $84              ; 50 84 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0C0
; Address: $C2A7F3
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0C0:
    JSR $2FE4            ; 20 E4 2F | Jump to subroutine
    ORA ($88),Y          ; 11 88 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    LDX $102F,Y          ; BE 2F 10 | Load from absolute,Y into X register
    CLC                  ; 18 | Clear carry flag
    JMP $4A71            ; 4C 71 4A | Jump to address
    TAY                  ; A8 | Transfer accumulator to Y register
    PHA                  ; 48 | Push accumulator to stack
    BPL $FF              ; 10 FF | Branch if positive
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $0003,X          ; FE 03 00 | Increment (absolute,X)
    LDX $050F,Y          ; BE 0F 05 | Load from absolute,Y into X register
    EOR ($E1,X)          ; 41 E1 | Exclusive OR with accumulator ((zero page,X))
    BCC $80              ; 90 80 | Branch if carry clear
    CLV                  ; B8 | Clear overflow flag
    BEQ $85              ; F0 85 | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0C1
; Address: $C2A81C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0C1:
    PLP                  ; 28 | Pull processor status from stack
    SBC ($7F,X)          ; E1 7F | Subtract with carry ((zero page,X))
    EOR ($F8),Y          ; 51 F8 | Exclusive OR with accumulator ((zero page),Y)
    LSR $34              ; 46 34 | Logical shift right (zero page)
    LDX #$F2             ; A2 F2 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0C4
; Address: $C2A831
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0C4:
    JSR $61F5            ; 20 F5 61 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    EOR ($E8,X)          ; 41 E8 | Exclusive OR with accumulator ((zero page,X))
    BPL $82              ; 10 82 | Branch if positive
    BPL $84              ; 10 84 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0C5
; Address: $C2A83C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0C5:
    JSR $A084            ; 20 84 A0 | Jump to subroutine
    EOR #$8A             ; 49 8A | Exclusive OR with accumulator (immediate)
    BCC $20              ; 90 20 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0C6
; Address: $C2A849
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0C6:
    JSL $82A13B          ; 22 3B A1 82 | Jump to subroutine long
    BIT $23              ; 24 23 | Test bits in accumulator (zero page)
    STX $08              ; 86 08 | Store X register to zero page
    LDY #$0F             ; A0 0F | Load immediate value into Y register
    ORA ($88),Y          ; 11 88 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BVC $85              ; 50 85 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0C8
; Address: $C2A863
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0C8:
    JSL $E0AA95          ; 22 95 AA E0 | Game work RAM access
    EOR $E200            ; 4D 00 E2 | Exclusive OR with accumulator (absolute)
    ADC $5081,X          ; 7D 81 50 | Add with carry (absolute,X)
    STX $086A            ; 8E 6A 08 | Store X register to absolute address
    LDA $E8              ; A5 E8 | Load from zero page into accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    LDX #$7C             ; A2 7C | Load immediate value into X register
    TAX                  ; AA | Transfer accumulator to X register
    STA $4A              ; 85 4A | Store accumulator to zero page
    PHP                  ; 08 | Push processor status to stack
    EOR $A8              ; 45 A8 | Exclusive OR with accumulator (zero page)
    ORA ($CA),Y          ; 11 CA | Logical OR with accumulator ((zero page),Y)
    EOR ($F5),Y          ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0C9
; Address: $C2A886
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0C9:
    JSR $4784            ; 20 84 47 | Jump to subroutine
    REP #$0F             ; C2 0F | Reset processor status bits
    STY $FF              ; 84 FF | Store Y register to zero page
    ROL $C3              ; 26 C3 | Rotate left (zero page)
    DEC $80              ; C6 80 | Decrement (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0CA
; Address: $C2A899
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0CA:
    STA $F84810          ; 8F 10 48 F8 | Store accumulator to absolute long address
    LDY #$E4             ; A0 E4 | Load immediate value into Y register
    DEY                  ; 88 | Decrement Y register
    SBC ($09),Y          ; F1 09 | Subtract with carry ((zero page),Y)
    WDM #$10             ; 42 10 | Reserved instruction
    STY $BC              ; 84 BC | Store Y register to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    INC $9013,X          ; FE 13 90 | Increment (absolute,X)
    BPL $F1              ; 10 F1 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0CB
; Address: $C2A8B9
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0CB:
    JSR $F944            ; 20 44 F9 | Jump to subroutine
    ORA #$F9             ; 09 F9 | Logical OR with accumulator (immediate)
    ORA #$F2             ; 09 F2 | Logical OR with accumulator (immediate)
    LDY $C484,X          ; BC 84 C4 | Load from absolute,X into Y register
    PLP                  ; 28 | Pull processor status from stack
    EOR $11              ; 45 11 | Exclusive OR with accumulator (zero page)
    STY $28              ; 84 28 | Store Y register to zero page
    INY                  ; C8 | Increment Y register
    WDM #$62             ; 42 62 | Reserved instruction
    SBC $E108,Y          ; F9 08 E1 | Subtract with carry (absolute,Y)
    ROL $BD55,X          ; 3E 55 BD | Rotate left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $8453            ; EE 53 84 | Increment (absolute)
    STA ($B3,X)          ; 81 B3 | Store accumulator to (zero page,X)
    TAX                  ; AA | Transfer accumulator to X register
    ORA $A154            ; 0D 54 A1 | Logical OR with accumulator (absolute)
    DEX                  ; CA | Decrement X register
    INY                  ; C8 | Increment Y register
    WDM #$D4             ; 42 D4 | Reserved instruction
    LDA                  ; BF 10 F5 AF | Load from absolute long,X into accumulator
    STZ $25              ; 64 25 | Store zero to zero page
    ORA $5BC9,Y          ; 19 C9 5B | Logical OR with accumulator (absolute,Y)
    CPX $2F              ; E4 2F | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    WDM #$10             ; 42 10 | Reserved instruction
    EOR ($82),Y          ; 51 82 | Exclusive OR with accumulator ((zero page),Y)
    LDA ($08,X)          ; A1 08 | Load from (zero page,X) into accumulator
    CMP $28              ; C5 28 | Compare accumulator (zero page)
    WDM #$D1             ; 42 D1 | Reserved instruction
    LDA                  ; BF 10 82 12 | Load from absolute long,X into accumulator
    LDY #$C6             ; A0 C6 | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR $2A              ; 45 2A | Exclusive OR with accumulator (zero page)
    WDM #$7D             ; 42 7D | Reserved instruction
    BPL $84              ; 10 84 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0CE
; Address: $C2A91E
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0CE:
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    LDA ($16,X)          ; A1 16 | Load from (zero page,X) into accumulator
    CLC                  ; 18 | Clear carry flag
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    ORA ($92),Y          ; 11 92 | Logical OR with accumulator ((zero page),Y)
    BVC $94              ; 50 94 | Branch if overflow clear
    LDX #$D4             ; A2 D4 | Load immediate value into X register
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    WDM #$11             ; 42 11 | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $8B8A,X          ; 5D 8A 8B | Exclusive OR with accumulator (absolute,X)
    BMI $42              ; 30 42 | Hardware register operation
    STZ $112F,X          ; 9E 2F 11 | Store zero to absolute,X
    SBC $2B              ; E5 2B | Subtract with carry (zero page)
    SED                  ; F8 | Set decimal mode flag
    ORA $80              ; 05 80 | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    CPX #$13             ; E0 13 | Compare X register (immediate)
    BCC $FC              ; 90 FC | Branch if carry clear
    INC $8082,X          ; FE 82 80 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0CF
; Address: $C2A94F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0CF:
    JSR $5FF0            ; 20 F0 5F | Jump to subroutine
    EOR ($F9,X)          ; 41 F9 | Exclusive OR with accumulator ((zero page,X))
    BVC $FE              ; 50 FE | Branch if overflow clear
    LDY $20              ; A4 20 | Load from zero page into Y register
    ORA $1089,X          ; 1D 89 10 | Logical OR with accumulator (absolute,X)
    STA                  ; 9F 22 D6 27 | Store accumulator to absolute long,X
    DEY                  ; 88 | Decrement Y register
    PHB                  ; 8B | Push data bank register to stack
    PHA                  ; 48 | Push accumulator to stack
    ROL $3A              ; 26 3A | Rotate left (zero page)
    STA                  ; 9F 8A 54 24 | Store accumulator to absolute long,X
    ROL $BF01            ; 2E 01 BF | Rotate left (absolute)
    LDY $27              ; A4 27 | Load from zero page into Y register
    AND $E9              ; 25 E9 | Logical AND with accumulator (zero page)
    EOR #$C9             ; 49 C9 | Exclusive OR with accumulator (immediate)
    BEQ $1F              ; F0 1F | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CPY #$7F             ; C0 7F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0D0
; Address: $C2A982
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0D0:
    JSR $0FE0            ; 20 E0 0F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $104F,X          ; FE 4F 10 | Increment (absolute,X)
    INC $8410,X          ; FE 10 84 | Increment (absolute,X)
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    BPL $E1              ; 10 E1 | Branch if positive
    ROR $1049,X          ; 7E 49 10 | Rotate right (absolute,X)
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    SBC ($BE),Y          ; F1 BE | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0D3
; Address: $C2A9A8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0D3:
    JSL $F8917A          ; 22 7A 91 F8 | Jump to subroutine long
    STY $1472            ; 8C 72 14 | Store Y register to absolute address
    LDA $68              ; A5 68 | Load from zero page into accumulator
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($88),Y          ; 11 88 | Logical OR with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $82              ; 10 82 | Branch if positive
    BEQ $87              ; F0 87 | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0D4
; Address: $C2A9C3
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0D4:
    JSR $E104            ; 20 04 E1 | Jump to subroutine
    ADC ($3E),Y          ; 71 3E | Add with carry ((zero page),Y)
    LSR $8F90            ; 4E 90 8F | Logical shift right (absolute)
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    JMP $1ABED4          ; 5C D4 BE 1A | Jump to address long
    CMP ($8F),Y          ; D1 8F | Compare accumulator ((zero page),Y)
    CPY $04              ; C4 04 | Compare Y register (zero page)
    INC $0103,X          ; FE 03 01 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BEQ $7F              ; F0 7F | Branch if equal
    BEQ $87              ; F0 87 | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0D5
; Address: $C2A9E4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0D5:
    JSR $21FC            ; 20 FC 21 | PPU graphics register access
    PHP                  ; 08 | Push processor status to stack
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    LDY $22              ; A4 22 | Load from zero page into Y register
    LDA $48              ; A5 48 | Load from zero page into accumulator
    LSR $02              ; 46 02 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0D7
; Address: $C2A9FF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0D7:
    JSL $889D12          ; 22 12 9D 88 | Jump to subroutine long
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    EOR ($89),Y          ; 51 89 | Exclusive OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    WDM #$10             ; 42 10 | Reserved instruction
    STY $C1              ; 84 C1 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0D8
; Address: $C2AA0E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0D8:
    JSR $2104            ; 20 04 21 | PPU graphics register access
    LDA ($3C,X)          ; A1 3C | Load from (zero page,X) into accumulator
    EOR $FE              ; 45 FE | Exclusive OR with accumulator (zero page)
    BPL $C8              ; 10 C8 | Branch if positive
    STA $1422,X          ; 9D 22 14 | Store accumulator to absolute,X
    EOR ($C8,X)          ; 41 C8 | Exclusive OR with accumulator ((zero page,X))
    CMP $4739,X          ; DD 39 47 | Compare accumulator (absolute,X)
    STA ($EA,X)          ; 81 EA | Store accumulator to (zero page,X)
    CPX #$74             ; E0 74 | Compare X register (immediate)
    BEQ $9D              ; F0 9D | Branch if equal
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0D9
; Address: $C2AA2D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0D9:
    EOR #$44             ; 49 44 | Exclusive OR with accumulator (immediate)
    PEA #$A3A2           ; F4 A2 A3 | Push effective address to stack
    BEQ $7D              ; F0 7D | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0DA
; Address: $C2AA37
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0DA:
    JSR $113A            ; 20 3A 11 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    DEC $9407            ; CE 07 94 | Decrement (absolute)
    LDA $2B2564          ; AF 64 25 2B | Load from absolute long address into accumulator
    ADC $FF7A,Y          ; 79 7A FF | Add with carry (absolute,Y)
    STA ($E0,X)          ; 81 E0 | Game work RAM access
    AND ($6C,X)          ; 21 6C | Logical AND with accumulator ((zero page,X))
    AND $5808            ; 2D 08 58 | Logical AND with accumulator (absolute)
    ORA #$C0             ; 09 C0 | Logical OR with accumulator (immediate)
    BEQ $1F              ; F0 1F | Branch if equal
    SEC                  ; 38 | Set carry flag
    LSR                  ; 4A | Logical shift right (accumulator)
    STY $FA              ; 84 FA | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    TAX                  ; AA | Transfer accumulator to X register
    BIT #$4F             ; 89 4F | Test bits in accumulator (immediate)
    EOR ($1B,X)          ; 41 1B | Exclusive OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    BCC $7E              ; 90 7E | Branch if carry clear
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    SBC ($0F,X)          ; E1 0F | Subtract with carry ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    STA ($88),Y          ; 91 88 | Store accumulator to (zero page),Y
    ASL $820C,X          ; 1E 0C 82 | Arithmetic shift left (absolute,X)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0DB
; Address: $C2AA7F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0DB:
    JSL $889FF2          ; 22 F2 9F 88 | Jump to subroutine long
    BRA $FF              ; 80 FF | Branch always
    ORA ($18),Y          ; 11 18 | Logical OR with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0DC
; Address: $C2AA8E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0DC:
    JSL $889112          ; 22 12 91 88 | Jump to subroutine long
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    ORA ($89),Y          ; 11 89 | Logical OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    STY $22              ; 84 22 | Store Y register to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0DD
; Address: $C2AA9D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0DD:
    JSR $A955            ; 20 55 A9 | Jump to subroutine
    ORA #$40             ; 09 40 | Logical OR with accumulator (immediate)
    INC $9157,X          ; FE 57 91 | Increment (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $3A              ; A5 3A | Load from zero page into accumulator
    SED                  ; F8 | Set decimal mode flag
    ORA $59              ; 05 59 | Logical OR with accumulator (zero page)
    ROR $4044,X          ; 7E 44 40 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0DE
; Address: $C2AAB0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0DE:
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INC $0103,X          ; FE 03 01 | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $90520A          ; AF 0A 52 90 | Load from absolute long address into accumulator
    STZ $CC              ; 64 CC | Store zero to zero page
    BNE $3F              ; D0 3F | Branch if not equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0DF
; Address: $C2AAC5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0DF:
    JSR $47E0            ; 20 E0 47 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    SBC $0143,X          ; FD 43 01 | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0E0
; Address: $C2AACD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0E0:
    JSL $170150          ; 22 50 01 17 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    EOR ($28,X)          ; 41 28 | Exclusive OR with accumulator ((zero page,X))
    WDM #$C9             ; 42 C9 | Reserved instruction
    BCC $80              ; 90 80 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0E1
; Address: $C2AAD9
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0E1:
    JSR $FE84            ; 20 84 FE | Jump to subroutine
    STA ($02,X)          ; 81 02 | Store accumulator to (zero page,X)
    LDA ($28,X)          ; A1 28 | Load from (zero page,X) into accumulator
    BIT #$49             ; 89 49 | Test bits in accumulator (immediate)
    BIT $42              ; 24 42 | Hardware register operation
    BIT $4A              ; 24 4A | Test bits in accumulator (zero page)
    STA                  ; 9F 8A C8 97 | Store accumulator to absolute long,X
    BRA $47              ; 80 47 | Branch always
    INY                  ; C8 | Increment Y register
    LSR $CB15,X          ; 5E 15 CB | Logical shift right (absolute,X)
    EOR $6695,Y          ; 59 95 66 | Exclusive OR with accumulator (absolute,Y)
    ORA $10              ; 05 10 | Logical OR with accumulator (zero page)
    ASL $9E11            ; 0E 11 9E | Arithmetic shift left (absolute)
    LDY $26              ; A4 26 | Load from zero page into Y register
    LDA $0130            ; AD 30 01 | Load from absolute address into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    CMP ($8A),Y          ; D1 8A | Compare accumulator ((zero page),Y)
    LDX $C779,Y          ; BE 79 C7 | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack
    CMP $0881,X          ; DD 81 08 | Compare accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    EOR $FE              ; 45 FE | Exclusive OR with accumulator (zero page)
    WDM #$91             ; 42 91 | Reserved instruction
    LDA                  ; BF 50 44 54 | Load from absolute long,X into accumulator
    BIT $08              ; 24 08 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0E2
; Address: $C2AB1C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0E2:
    JSL $000FFE          ; 22 FE 0F 00 | Jump to subroutine long
    SBC #$49             ; E9 49 | Subtract with carry (immediate)
    EOR #$7A             ; 49 7A | Exclusive OR with accumulator (immediate)
    STZ $8494,X          ; 9E 94 84 | Store zero to absolute,X
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    AND ($44,X)          ; 21 44 | Logical AND with accumulator ((zero page,X))
    AND $4249,Y          ; 39 49 42 | Hardware register operation
    ORA ($45),Y          ; 11 45 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0E3
; Address: $C2AB35
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0E3:
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    BIT #$30             ; 89 30 | Test bits in accumulator (immediate)
    LDY $92              ; A4 92 | Load from zero page into Y register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA $44              ; 05 44 | Logical OR with accumulator (zero page)
    BPL $44              ; 10 44 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($F4,X)          ; 01 F4 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    BPL $80              ; 10 80 | Branch if positive
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    SBC $420B,Y          ; F9 0B 42 | Hardware register operation
    INC $A494,X          ; FE 94 A4 | Increment (absolute,X)
    BIT $FD              ; 24 FD | Test bits in accumulator (zero page)
    ORA $5042,Y          ; 19 42 50 | Logical OR with accumulator (absolute,Y)
    ORA ($8C),Y          ; 11 8C | Logical OR with accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    PLP                  ; 28 | Pull processor status from stack
    BPL $80              ; 10 80 | Branch if positive
    CPY #$7F             ; C0 7F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0E4
; Address: $C2AB66
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0E4:
    JSL $889112          ; 22 12 91 88 | Jump to subroutine long
    BCC $00              ; 90 00 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    AND $8230,Y          ; 39 30 82 | Logical AND with accumulator (absolute,Y)
    BPL $04              ; 10 04 | Branch if positive
    AND ($E9,X)          ; 21 E9 | Logical AND with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    NOP                  ; EA | No operation
    STA ($F2,X)          ; 81 F2 | Store accumulator to (zero page,X)
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0E5
; Address: $C2AB81
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0E5:
    JSL $F9511A          ; 22 1A 51 F9 | Jump to subroutine long
    BPL $21              ; 10 21 | PPU graphics register access
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    SEP #$7D             ; E2 7D | Set processor status bits
    LDA $2A              ; A5 2A | Load from zero page into accumulator
    LDA #$52             ; A9 52 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $10A2            ; 0D A2 10 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    CPX $3F              ; E4 3F | Compare X register (zero page)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    SEP #$64             ; E2 64 | Set processor status bits
    EOR ($F0,X)          ; 41 F0 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0E7
; Address: $C2ABAC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0E7:
    JSR $0600            ; 20 00 06 | Jump to subroutine
    BPL $40              ; 10 40 | Branch if positive
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0E8
; Address: $C2ABB7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0E8:
    JSR $0A00            ; 20 00 0A | Jump to subroutine
    BMI $80              ; 30 80 | Branch if negative
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0E9
; Address: $C2ABBE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0E9:
    JSR $8100            ; 20 00 81 | Jump to subroutine
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    ORA ($89),Y          ; 11 89 | Logical OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0EB
; Address: $C2ABD4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0EB:
    JSR $1FF0            ; 20 F0 1F | Jump to subroutine
    CMP #$4A             ; C9 4A | Compare accumulator (immediate)
    STA $3FF820          ; 8F 20 F8 3F | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BPL $04              ; 10 04 | Branch if positive
    ORA ($90),Y          ; 11 90 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    BMI $73              ; 30 73 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0EC
; Address: $C2ABF1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0EC:
    CPX #$20             ; E0 20 | Compare X register (immediate)
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0ED
; Address: $C2ABF9
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0ED:
    JSR $3906            ; 20 06 39 | Jump to subroutine
    BIT #$89             ; 89 89 | Test bits in accumulator (immediate)
    PEA #$7924           ; F4 24 79 | Push effective address to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BIT $60C6            ; 2C C6 60 | Test bits in accumulator (absolute)
    REP #$F8             ; C2 F8 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    BVC $63              ; 50 63 | Branch if overflow clear
    ORA ($85),Y          ; 11 85 | Logical OR with accumulator ((zero page),Y)
    BVS $10              ; 70 10 | Branch if overflow set
    STZ $32A5            ; 9C A5 32 | Store zero to absolute
    PLP                  ; 28 | Pull processor status from stack
    LDA ($4F,X)          ; A1 4F | Load from (zero page,X) into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    STA ($6A),Y          ; 91 6A | Store accumulator to (zero page),Y
    WDM #$B8             ; 42 B8 | Reserved instruction
    BPL $9F              ; 10 9F | Branch if positive
    LDA                  ; BF 13 C0 EF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0EE
; Address: $C2AC31
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0EE:
    JSR $4939            ; 20 39 49 | Jump to subroutine
    ORA #$4A             ; 09 4A | Logical OR with accumulator (immediate)
    BVC $86              ; 50 86 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0EF
; Address: $C2AC39
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0EF:
    CLC                  ; 18 | Clear carry flag
    ROR $004F,X          ; 7E 4F 00 | Rotate right (absolute,X)
    CMP ($81),Y          ; D1 81 | Compare accumulator ((zero page),Y)
    STZ $24              ; 64 24 | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0F0
; Address: $C2AC44
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0F0:
    EOR ($ED,X)          ; 41 ED | Exclusive OR with accumulator ((zero page,X))
    AND $C0C8,Y          ; 39 C8 C0 | Logical AND with accumulator (absolute,Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0F1
; Address: $C2AC4D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0F1:
    JSR $9FF0            ; 20 F0 9F | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    BIT #$E0             ; 89 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0F3
; Address: $C2AC5D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0F3:
    JSL $28A515          ; 22 15 A5 28 | Jump to subroutine long
    EOR $48              ; 45 48 | Exclusive OR with accumulator (zero page)
    WDM #$12             ; 42 12 | Reserved instruction
    BCC $95              ; 90 95 | Branch if carry clear
    BIT $25              ; 24 25 | Test bits in accumulator (zero page)
    AND #$56             ; 29 56 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0F4
; Address: $C2AC6E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0F4:
    JSR $7FF8            ; 20 F8 7F | Jump to subroutine
    SBC $0083,Y          ; F9 83 00 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BRA $E0              ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0F5
; Address: $C2AC79
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0F5:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    ASL $84              ; 06 84 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SBC ($08),Y          ; F1 08 | Subtract with carry ((zero page),Y)
    SBC $408B,Y          ; F9 8B 40 | Subtract with carry (absolute,Y)
    STA ($88,X)          ; 81 88 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0F7
; Address: $C2AC97
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0F7:
    JSL $829FF2          ; 22 F2 9F 82 | Jump to subroutine long
    EOR $29              ; 45 29 | Exclusive OR with accumulator (zero page)
    EOR #$41             ; 49 41 | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    ASL $7FC8,X          ; 1E C8 7F | Arithmetic shift left (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    STY $44              ; 84 44 | Store Y register to zero page
    PLP                  ; 28 | Pull processor status from stack
    ORA ($88,X)          ; 01 88 | Logical OR with accumulator ((zero page,X))
    LDY #$08             ; A0 08 | Load immediate value into Y register
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    BIT $A2              ; 24 A2 | Test bits in accumulator (zero page)
    ORA ($07),Y          ; 11 07 | Logical OR with accumulator ((zero page),Y)
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    STA ($40,X)          ; 81 40 | Store accumulator to (zero page,X)
    WDM #$FE             ; 42 FE | Reserved instruction
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    EOR ($09,X)          ; 41 09 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0F8
; Address: $C2ACC5
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0F8:
    BCC $FE              ; 90 FE | Branch if carry clear
    PEA #$001F           ; F4 1F 00 | Push effective address to stack
    BRA $FF              ; 80 FF | Branch always
    BIT $11              ; 24 11 | Test bits in accumulator (zero page)
    EOR #$88             ; 49 88 | Exclusive OR with accumulator (immediate)
    WDM #$04             ; 42 04 | Reserved instruction
    WDM #$30             ; 42 30 | Reserved instruction
    STA                  ; 9F 20 04 E1 | Store accumulator to absolute long,X
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    REP #$1F             ; C2 1F | Reset processor status bits
    STY $3F              ; 84 3F | Store Y register to zero page
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0FA
; Address: $C2ACFE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0FA:
    JSR $BF11            ; 20 11 BF | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    LSR $2A05,X          ; 5E 05 2A | Logical shift right (absolute,X)
    SBC $4083,X          ; FD 83 40 | Subtract with carry (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    JMP $775AAD          ; 5C AD 5A 77 | Jump to address long
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive
    SEC                  ; 38 | Set carry flag
    ROL $0F00,X          ; 3E 00 0F | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0FB
; Address: $C2AD1C
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0FB:
    JSL $F88110          ; 22 10 81 F8 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    REP #$1F             ; C2 1F | Reset processor status bits
    BPL $81              ; 10 81 | Branch if positive
    BPL $04              ; 10 04 | Branch if positive
    BCC $C1              ; 90 C1 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    INC $0019,X          ; FE 19 00 | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    INC $1CEF,X          ; FE EF 1C | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ADC $528F,X          ; 7D 8F 52 | Add with carry (absolute,X)
    LDY $F4              ; A4 F4 | Load from zero page into Y register
    STA                  ; 9F 80 FC 27 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0FC
; Address: $C2AD50
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0FC:
    JSR $09FF            ; 20 FF 09 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA ($80,X)          ; 81 80 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0FD
; Address: $C2AD60
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0FD:
    JSR $3FF8            ; 20 F8 3F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $23              ; 84 23 | Store Y register to zero page
    PHB                  ; 8B | Push data bank register to stack
    BPL $82              ; 10 82 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA                  ; BF 03 C4 27 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_0FE
; Address: $C2AD76
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_0FE:
    JSL $CF8911          ; 22 11 89 CF | Jump to subroutine long
    BPL $E4              ; 10 E4 | Branch if positive
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    LDX $0841,Y          ; BE 41 08 | Load from absolute,Y into X register
    SEP #$90             ; E2 90 | Set processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BPL $84              ; 10 84 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_100
; Address: $C2AD8C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_100:
    JSR $8FE8            ; 20 E8 8F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    EOR ($30,X)          ; 41 30 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_101
; Address: $C2AD9A
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_101:
    JSR $E104            ; 20 04 E1 | Jump to subroutine
    STA ($C9),Y          ; 91 C9 | Store accumulator to (zero page),Y
    EOR ($EA,X)          ; 41 EA | Exclusive OR with accumulator ((zero page,X))
    BCC $9A              ; 90 9A | Branch if carry clear
    LDY $66              ; A4 66 | Load from zero page into Y register
    BIT #$CB             ; 89 CB | Test bits in accumulator (immediate)
    LDX $52              ; A6 52 | Load from zero page into X register
    LDA $A5FF,Y          ; B9 FF A5 | Load from absolute,Y into accumulator
    BIT $25              ; 24 25 | Test bits in accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    CMP ($5F),Y          ; D1 5F | Compare accumulator ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    CMP ($88),Y          ; D1 88 | Compare accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX #$64             ; A2 64 | Load immediate value into X register
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    BPL $80              ; 10 80 | Branch if positive
    BEQ $7F              ; F0 7F | Branch if equal
    RTI                  ; 40 | Return from interrupt
    CPY $3F              ; C4 3F | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_103
; Address: $C2ADD5
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_103:
    JSR $E104            ; 20 04 E1 | Jump to subroutine
    BPL $84              ; 10 84 | Branch if positive
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    LDY $A2              ; A4 A2 | Load from zero page into Y register
    STZ $59              ; 64 59 | Store zero to zero page
    BPL $86              ; 10 86 | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $80              ; 10 80 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    EOR ($8A,X)          ; 41 8A | Exclusive OR with accumulator ((zero page,X))
    LSR $A294,X          ; 5E 94 A2 | Logical shift right (absolute,X)
    LDY $3C              ; A4 3C | Load from zero page into Y register
    AND $31              ; 25 31 | Logical AND with accumulator (zero page)
    BIT #$78             ; 89 78 | Test bits in accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    WDM #$18             ; 42 18 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    BEQ $FF              ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_104
; Address: $C2AE0D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_104:
    JSL $FF0100          ; 22 00 01 FF | Jump to subroutine long
    WDM #$10             ; 42 10 | Reserved instruction
    STA ($08,X)          ; 81 08 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_105
; Address: $C2AE18
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_105:
    JSR $0700            ; 20 00 07 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BPL $80              ; 10 80 | Branch if positive
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ASL $E4              ; 06 E4 | Arithmetic shift left (zero page)
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX #$FE             ; A2 FE | Load immediate value into X register
    STA $4E59            ; 8D 59 4E | Store accumulator to absolute address
    TAY                  ; A8 | Transfer accumulator to Y register
    STZ $25              ; 64 25 | Store zero to zero page
    EOR #$42             ; 49 42 | Hardware register operation
    LDY $6F              ; A4 6F | Load from zero page into Y register
    BPL $F6              ; 10 F6 | Branch if positive
    STY $F8              ; 84 F8 | Store Y register to zero page
    LSR $BE25,X          ; 5E 25 BE | Logical shift right (absolute,X)
    EOR ($9D),Y          ; 51 9D | Exclusive OR with accumulator ((zero page),Y)
    BPL $EA              ; 10 EA | Branch if positive
    STY $FC              ; 84 FC | Store Y register to zero page
    SBC $DF              ; E5 DF | Subtract with carry (zero page)
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_106
; Address: $C2AE54
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_106:
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $52AA,X          ; 5D AA 52 | Exclusive OR with accumulator (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STZ $20              ; 64 20 | Store zero to zero page
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    SED                  ; F8 | Set decimal mode flag
    STA $3284,Y          ; 99 84 32 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank04_DmaFunction_107
; Address: $C2AE6A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_107:
    JSR $087F            ; 20 7F 08 | Jump to subroutine
    BRA $08              ; 80 08 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA $F306,Y          ; 19 06 F3 | Logical OR with accumulator (absolute,Y)
    BNE $85              ; D0 85 | Branch if not equal
    ROL                  ; 2A | Rotate left (accumulator)
    LDA ($FA,X)          ; A1 FA | Load from (zero page,X) into accumulator
    LDA $28              ; A5 28 | Load from zero page into accumulator
    EOR $39              ; 45 39 | Exclusive OR with accumulator (zero page)
    STA ($90),Y          ; 91 90 | Store accumulator to (zero page),Y
    DEY                  ; 88 | Decrement Y register
    EOR ($E4,X)          ; 41 E4 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_108
; Address: $C2AE89
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_108:
    JSL $A31691          ; 22 91 16 A3 | Jump to subroutine long
    ROR $5D              ; 66 5D | Rotate right (zero page)
    BIT $894C            ; 2C 4C 89 | Test bits in accumulator (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    EOR ($B1),Y          ; 51 B1 | Exclusive OR with accumulator ((zero page),Y)
    BPL $9E              ; 10 9E | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_109
; Address: $C2AE98
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_109:
    JSR $A902            ; 20 02 A9 | Jump to subroutine
    STX $5C              ; 86 5C | Store X register to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $BC              ; 45 BC | Exclusive OR with accumulator (zero page)
    EOR $C6              ; 45 C6 | Exclusive OR with accumulator (zero page)
    REP #$58             ; C2 58 | Reset processor status bits
    REP #$62             ; C2 62 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank04_DmaFunction_10A
; Address: $C2AEA9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_10A:
    JSR $4FDF            ; 20 DF 4F | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    ADC $F830            ; 6D 30 F8 | Add with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 80 04 E4 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_10C
; Address: $C2AECD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_10C:
    JSR $FC28            ; 20 28 FC | Jump to subroutine
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    WDM #$C4             ; 42 C4 | Reserved instruction
    BPL $F1              ; 10 F1 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    INC $070F,X          ; FE 0F 07 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_10D
; Address: $C2AEDE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_10D:
    STY $2418            ; 8C 18 24 | Store Y register to absolute address
    BPL $F1              ; 10 F1 | Branch if positive
    STY $20              ; 84 20 | Store Y register to zero page
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    SBC $420B,Y          ; F9 0B 42 | Hardware register operation
    BPL $82              ; 10 82 | Branch if positive
    BPL $84              ; 10 84 | Branch if positive
    INC $0207,X          ; FE 07 02 | Increment (absolute,X)
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_10E
; Address: $C2AEF7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_10E:
    JSR $3FF8            ; 20 F8 3F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_10F
; Address: $C2AF02
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_10F:
    JSR $0FE0            ; 20 E0 0F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $020F,X          ; FE 0F 02 | Increment (absolute,X)
    BIT #$C8             ; 89 C8 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_110
; Address: $C2AF0D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_110:
    JSL $081FF2          ; 22 F2 1F 08 | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    BPL $F4              ; 10 F4 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_111
; Address: $C2AF1F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_111:
    JSR $E907            ; 20 07 E9 | Jump to subroutine
    EOR ($0A,X)          ; 41 0A | Exclusive OR with accumulator ((zero page,X))
    STA                  ; 9F 00 E2 13 | Store accumulator to absolute long,X
    CMP ($8B),Y          ; D1 8B | Compare accumulator ((zero page),Y)
    WDM #$24             ; 42 24 | Reserved instruction

;------------------------------------------------------------------------------
; Bank04_DmaFunction_112
; Address: $C2AF2E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_112:
    JSL $651DF3          ; 22 F3 1D 65 | Jump to subroutine long
    AND #$42             ; 29 42 | Hardware register operation
    ORA ($92),Y          ; 11 92 | Logical OR with accumulator ((zero page),Y)
    CPX $28              ; E4 28 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_113
; Address: $C2AF39
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_113:
    JSR $8100            ; 20 00 81 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    STA $9F08,X          ; 9D 08 9F | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_114
; Address: $C2AF4F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_114:
    JSR $9139            ; 20 39 91 | Jump to subroutine
    TXS                  ; 9A | Transfer X register to stack pointer
    LDY $2A              ; A4 2A | Load from zero page into Y register
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_115
; Address: $C2AF5A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_115:
    JSL $081132          ; 22 32 11 08 | Jump to subroutine long
    INC $E140,X          ; FE 40 E1 | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_116
; Address: $C2AF66
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_116:
    JSR $FF88            ; 20 88 FF | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_117
; Address: $C2AF6D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_117:
    BEQ $87              ; F0 87 | Branch if equal
    INY                  ; C8 | Increment Y register
    WDM #$8C             ; 42 8C | Reserved instruction
    LDA                  ; BF 11 E5 0F | Load from absolute long,X into accumulator
    SBC $0413,X          ; FD 13 04 | Subtract with carry (absolute,X)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BEQ $01              ; F0 01 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_118
; Address: $C2AF85
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_118:
    JSL $8881FF          ; 22 FF 81 88 | Jump to subroutine long
    STY $E2              ; 84 E2 | Store Y register to zero page
    LDA ($F8,X)          ; A1 F8 | Load from (zero page,X) into accumulator
    EOR #$48             ; 49 48 | Exclusive OR with accumulator (immediate)
    ROR $C204,X          ; 7E 04 C2 | Rotate right (absolute,X)
    STA ($FA),Y          ; 91 FA | Store accumulator to (zero page),Y
    TAY                  ; A8 | Transfer accumulator to Y register
    ROR $AA35,X          ; 7E 35 AA | Rotate right (absolute,X)
    STA $17EA            ; 8D EA 17 | Store accumulator to absolute address
    STA ($A8,X)          ; 81 A8 | Store accumulator to (zero page,X)
    STY $28              ; 84 28 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_119
; Address: $C2AFA6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_119:
    JSR $4FDF            ; 20 DF 4F | Jump to subroutine
    WDM #$22             ; 42 22 | Reserved instruction
    CLV                  ; B8 | Clear overflow flag
    CPX $26              ; E4 26 | Compare X register (zero page)
    AND $22              ; 25 22 | Logical AND with accumulator (zero page)
    ORA ($51),Y          ; 11 51 | Logical OR with accumulator ((zero page),Y)
    BIT #$51             ; 89 51 | Test bits in accumulator (immediate)
    ASL $C0              ; 06 C0 | Arithmetic shift left (zero page)
    AND $4008,X          ; 3D 08 40 | Logical AND with accumulator (absolute,X)
    STZ $2484,X          ; 9E 84 24 | Store zero to absolute,X
    BIT $21              ; 24 21 | PPU graphics register access
    ORA ($89),Y          ; 11 89 | Logical OR with accumulator ((zero page),Y)
    BVC $88              ; 50 88 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_11A
; Address: $C2AFC8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_11A:
    JSR $9FF0            ; 20 F0 9F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $022F,X          ; FE 2F 02 | Increment (absolute,X)
    STA ($E0,X)          ; 81 E0 | Game work RAM access
    STA                  ; 9F 80 FC 27 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_11B
; Address: $C2AFD9
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_11B:
    JSR $21E4            ; 20 E4 21 | PPU graphics register access
    SBC #$4F             ; E9 4F | Subtract with carry (immediate)
    CMP #$4B             ; C9 4B | Compare accumulator (immediate)
    LDY $34              ; A4 34 | Load from zero page into Y register
    EOR $2E              ; 45 2E | Exclusive OR with accumulator (zero page)
    REP #$21             ; C2 21 | PPU graphics register access
    BMI $02              ; 30 02 | Branch if negative
    BPL $80              ; 10 80 | Branch if positive
    STY $FF              ; 84 FF | Store Y register to zero page
    BPL $04              ; 10 04 | Branch if positive
    EOR ($18,X)          ; 41 18 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_11C
; Address: $C2AFF8
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_11C:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ROR $18              ; 66 18 | Rotate right (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($8A,X)          ; 01 8A | Logical OR with accumulator ((zero page,X))
    LDA $63E444          ; AF 44 E4 63 | Load from absolute long address into accumulator
    ORA ($FD),Y          ; 11 FD | Logical OR with accumulator ((zero page),Y)
    TAX                  ; AA | Transfer accumulator to X register
    TXA                  ; 8A | Transfer X register to accumulator
    LDX $A4              ; A6 A4 | Load from zero page into X register
    DEC                  ; 3A | Decrement accumulator
    ADC ($CA,X)          ; 61 CA | Add with carry ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    LDX #$D4             ; A2 D4 | Load immediate value into X register
    LDY $295F            ; AC 5F 29 | Load from absolute address into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $05              ; A6 05 | Load from zero page into X register
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ORA $8C81,Y          ; 19 81 8C | Logical OR with accumulator (absolute,Y)
    CMP $2277            ; CD 77 22 | Compare accumulator (absolute)
    STA $03CF,Y          ; 99 CF 03 | Store accumulator to absolute,Y
    PLY                  ; 7A | Pull Y register from stack
    RTI                  ; 40 | Return from interrupt
    STZ $A494,X          ; 9E 94 A4 | Store zero to absolute,X
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    BVC $86              ; 50 86 | Branch if overflow clear
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    CMP ($0F,X)          ; C1 0F | Compare accumulator ((zero page,X))
    ASL $1792            ; 0E 92 17 | Arithmetic shift left (absolute)
    LDA #$A2             ; A9 A2 | Load immediate value into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_11D
; Address: $C2B04D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_11D:
    SBC $C08B,Y          ; F9 8B C0 | Subtract with carry (absolute,Y)
    AND $AA              ; 25 AA | Logical AND with accumulator (zero page)
    BPL $85              ; 10 85 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPY $20              ; C4 20 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_11E
; Address: $C2B057
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_11E:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BRA $02              ; 80 02 | Branch always
    DEY                  ; 88 | Decrement Y register
    STZ $64              ; 64 64 | Store zero to zero page
    AND ($0A,X)          ; 21 0A | Logical AND with accumulator ((zero page,X))
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    ORA $26              ; 05 26 | Logical OR with accumulator (zero page)
    ORA $8859,Y          ; 19 59 88 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    BIT $42              ; 24 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank04_DmaFunction_120
; Address: $C2B07C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_120:
    INC $2007,X          ; FE 07 20 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SBC $420B,Y          ; F9 0B 42 | Hardware register operation
    SEC                  ; 38 | Set carry flag
    REP #$11             ; C2 11 | Reset processor status bits
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT $A9              ; 24 A9 | Test bits in accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    WDM #$10             ; 42 10 | Reserved instruction

;------------------------------------------------------------------------------
; Bank04_DmaFunction_122
; Address: $C2B092
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_122:
    JSL $D31212          ; 22 12 12 D3 | Jump to subroutine long
    SBC $2127,X          ; FD 27 21 | PPU graphics register access
    ORA #$49             ; 09 49 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    ROR $E7F6,X          ; 7E F6 E7 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    EOR $20              ; 45 20 | Exclusive OR with accumulator (zero page)
    AND ($36,X)          ; 21 36 | Logical AND with accumulator ((zero page,X))
    INC $8410,X          ; FE 10 84 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_123
; Address: $C2B0AB
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_123:
    JSR $3105            ; 20 05 31 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    PEA #$A29D           ; F4 9D A2 | Push effective address to stack
    BIT $65              ; 24 65 | Test bits in accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    CPY #$F9             ; C0 F9 | Compare Y register (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX #$F2             ; A2 F2 | Load immediate value into X register
    ORA $2400,X          ; 1D 00 24 | Logical OR with accumulator (absolute,X)
    CPY $24              ; C4 24 | Compare Y register (zero page)
    WDM #$34             ; 42 34 | Reserved instruction
    AND ($29,X)          ; 21 29 | Logical AND with accumulator ((zero page,X))
    ASL $C1              ; 06 C1 | Arithmetic shift left (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    STA ($FB,X)          ; 81 FB | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_124
; Address: $C2B0CF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_124:
    JSR $11FE            ; 20 FE 11 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 20 05 F9 | Store accumulator to absolute long,X
    INC                  ; 1A | Increment accumulator
    EOR #$4D             ; 49 4D | Exclusive OR with accumulator (immediate)
    PHX                  ; DA | Push X register to stack
    STX $54              ; 86 54 | Store X register to zero page
    STY $20              ; 84 20 | Store Y register to zero page
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    BEQ $1F              ; F0 1F | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_125
; Address: $C2B0E9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_125:
    JSL $000FFE          ; 22 FE 0F 00 | Jump to subroutine long
    ORA #$C8             ; 09 C8 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_126
; Address: $C2B0F5
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_126:
    INC $020F,X          ; FE 0F 02 | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    WDM #$F4             ; 42 F4 | Reserved instruction
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BEQ $7F              ; F0 7F | Branch if equal
    BPL $40              ; 10 40 | Branch if positive
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA $4230,Y          ; 19 30 42 | Hardware register operation
    ROR $5A0B,X          ; 7E 0B 5A | Rotate right (absolute,X)
    BCC $9E              ; 90 9E | Branch if carry clear
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    ORA $4959,X          ; 1D 59 49 | Logical OR with accumulator (absolute,X)
    WDM #$12             ; 42 12 | Reserved instruction
    LDX #$7C             ; A2 7C | Load immediate value into X register
    SBC $17              ; E5 17 | Subtract with carry (zero page)
    BIT #$4D             ; 89 4D | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_127
; Address: $C2B121
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_127:
    JSL $402263          ; 22 63 22 40 | Jump to subroutine long
    ROR $2A3F,X          ; 7E 3F 2A | Rotate right (absolute,X)
    ORA ($89),Y          ; 11 89 | Logical OR with accumulator ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    WDM #$92             ; 42 92 | Reserved instruction
    BCC $3F              ; 90 3F | Branch if carry clear
    SBC ($8F,X)          ; E1 8F | Subtract with carry ((zero page,X))
    BRA $FC              ; 80 FC | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_128
; Address: $C2B139
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_128:
    JSR $09FF            ; 20 FF 09 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    INC $020F,X          ; FE 0F 02 | Increment (absolute,X)
    BPL $80              ; 10 80 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    BMI $40              ; 30 40 | Branch if negative
    STA ($91,X)          ; 81 91 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_129
; Address: $C2B154
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_129:
    JSR $3FF8            ; 20 F8 3F | Jump to subroutine
    EOR #$48             ; 49 48 | Exclusive OR with accumulator (immediate)
    BCC $E4              ; 90 E4 | Branch if carry clear
    BEQ $60              ; F0 60 | Branch if equal
    CMP $1589            ; CD 89 15 | Compare accumulator (absolute)
    BCS $A0              ; B0 A0 | Branch if carry set
    SBC $E889,X          ; FD 89 E8 | Subtract with carry (absolute,X)
    LDX #$53             ; A2 53 | Load immediate value into X register
    LDX $6567            ; AE 67 65 | Load from absolute address into X register
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_12A
; Address: $C2B173
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_12A:
    JSL $103E22          ; 22 22 3E 10 | Jump to subroutine long
    STA ($8F,X)          ; 81 8F | Store accumulator to (zero page,X)
    CPX $7B              ; E4 7B | Compare X register (zero page)
    SBC $4209,X          ; FD 09 42 | Hardware register operation
    LDA                  ; BF AB 72 09 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_12B
; Address: $C2B185
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_12B:
    BMI $01              ; 30 01 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    SBC $6209,Y          ; F9 09 62 | Subtract with carry (absolute,Y)
    ROR $F887,X          ; 7E 87 F8 | Rotate right (absolute,X)
    LDA                  ; BF 85 E4 27 | Load from absolute long,X into accumulator
    AND ($F9,X)          ; 21 F9 | Logical AND with accumulator ((zero page,X))
    EOR #$48             ; 49 48 | Exclusive OR with accumulator (immediate)
    WDM #$32             ; 42 32 | Reserved instruction
    BPL $F8              ; 10 F8 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    LDY $C0              ; A4 C0 | Load from zero page into Y register
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    SBC ($C0,X)          ; E1 C0 | Subtract with carry ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA ($83),Y          ; 11 83 | Logical OR with accumulator ((zero page),Y)
    BRA $20              ; 80 20 | Branch always
    AND ($FC,X)          ; 21 FC | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    WDM #$30             ; 42 30 | Reserved instruction
    LDA ($14,X)          ; A1 14 | Load from (zero page,X) into accumulator
    BPL $C1              ; 10 C1 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    EOR #$86             ; 49 86 | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    EOR $24              ; 45 24 | Exclusive OR with accumulator (zero page)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    WDM #$04             ; 42 04 | Reserved instruction

;------------------------------------------------------------------------------
; Bank04_DmaFunction_12C
; Address: $C2B1C5
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_12C:
    JSL $294128          ; 22 28 41 29 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP ($40,X)          ; C1 40 | Compare accumulator ((zero page,X))
    LDX #$BE             ; A2 BE | Load immediate value into X register
    EOR ($F2),Y          ; 51 F2 | Exclusive OR with accumulator ((zero page),Y)
    ADC $7AA9,X          ; 7D A9 7A | Add with carry (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    LSR $2E85,X          ; 5E 85 2E | Logical shift right (absolute,X)
    EOR $3C              ; 45 3C | Exclusive OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    STA ($B0,X)          ; 81 B0 | Store accumulator to (zero page,X)
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    BNE $7F              ; D0 7F | Branch if not equal
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ORA $8CC6            ; 0D C6 8C | Logical OR with accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC ($0F,X)          ; E1 0F | Subtract with carry ((zero page,X))
    EOR ($F8,X)          ; 41 F8 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_12D
; Address: $C2B201
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_12D:
    BVS $E5              ; 70 E5 | Branch if overflow set
    BVS $08              ; 70 08 | Branch if overflow set
    EOR ($C8,X)          ; 41 C8 | Exclusive OR with accumulator ((zero page,X))
    LDY $3F              ; A4 3F | Load from zero page into Y register
    AND #$49             ; 29 49 | Logical AND with accumulator (immediate)
    WDM #$10             ; 42 10 | Reserved instruction
    BPL $84              ; 10 84 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_12E
; Address: $C2B215
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_12E:
    JSR $005F            ; 20 5F 00 | Jump to subroutine
    INC $2F              ; E6 2F | Increment (zero page)
    ORA $7D40,Y          ; 19 40 7D | Logical OR with accumulator (absolute,Y)
    BCC $BF              ; 90 BF | Branch if carry clear
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    EOR ($F9,X)          ; 41 F9 | Exclusive OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    SEP #$17             ; E2 17 | Set processor status bits
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA #$C0             ; 09 C0 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA                  ; 9F 04 44 22 | Store accumulator to absolute long,X
    STA $040B,X          ; 9D 0B 04 | Store accumulator to absolute,X
    TAY                  ; A8 | Transfer accumulator to Y register
    SEP #$53             ; E2 53 | Set processor status bits
    STA ($FD,X)          ; 81 FD | Store accumulator to (zero page,X)
    AND $68              ; 25 68 | Logical AND with accumulator (zero page)
    ROL $0825,X          ; 3E 25 08 | Rotate left (absolute,X)
    LSR $EE              ; 46 EE | Logical shift right (zero page)
    BCC $BF              ; 90 BF | Branch if carry clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_12F
; Address: $C2B24E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_12F:
    JSR $B7C4            ; 20 C4 B7 | Jump to subroutine
    LDX #$F5             ; A2 F5 | Load immediate value into X register
    LDA #$48             ; A9 48 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_131
; Address: $C2B25C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_131:
    JSL $F60831          ; 22 31 08 F6 | Jump to subroutine long
    AND ($05,X)          ; 21 05 | Logical AND with accumulator ((zero page,X))
    LDA #$EF             ; A9 EF | Load immediate value into accumulator
    PLX                  ; FA | Pull X register from stack
    STZ $4554            ; 9C 54 45 | Store zero to absolute
    ROL                  ; 2A | Rotate left (accumulator)
    LDA ($80,X)          ; A1 80 | Load from (zero page,X) into accumulator
    BRA $3F              ; 80 3F | Branch always
    BVS $60              ; 70 60 | Branch if overflow set
    CMP $4988            ; CD 88 49 | Compare accumulator (absolute)
    WDM #$90             ; 42 90 | Reserved instruction
    CPY $71              ; C4 71 | Compare Y register (zero page)
    AND $09              ; 25 09 | Logical AND with accumulator (zero page)
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    ORA $1428,X          ; 1D 28 14 | Logical OR with accumulator (absolute,X)
    LDY $E0              ; A4 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    BCC $82              ; 90 82 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_132
; Address: $C2B28A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_132:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BVS $40              ; 70 40 | Branch if overflow set
    AND #$4E             ; 29 4E | Logical AND with accumulator (immediate)
    LDX #$20             ; A2 20 | Load immediate value into X register
    BEQ $1F              ; F0 1F | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BPL $FE              ; 10 FE | Branch if positive
    BPL $84              ; 10 84 | Branch if positive
    SBC $323F,Y          ; F9 3F 32 | Subtract with carry (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_133
; Address: $C2B2A5
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_133:
    STY $20              ; 84 20 | Store Y register to zero page
    CPX $F7              ; E4 F7 | Compare X register (zero page)
    LDA #$48             ; A9 48 | Load immediate value into accumulator
    CMP #$CF             ; C9 CF | Compare accumulator (immediate)
    PHX                  ; DA | Push X register to stack
    STA                  ; 9F 20 04 21 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    EOR ($C8,X)          ; 41 C8 | Exclusive OR with accumulator ((zero page,X))
    LDX #$1F             ; A2 1F | Load immediate value into X register
    LDA #$4F             ; A9 4F | Load immediate value into accumulator
    EOR $3F              ; 45 3F | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_134
; Address: $C2B2BE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_134:
    JSL $488FDF          ; 22 DF 8F 48 | Jump to subroutine long
    CPY $3E              ; C4 3E | Compare Y register (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    LDA $4C              ; A5 4C | Load from zero page into accumulator
    STY $73              ; 84 73 | Store Y register to zero page
    LDY #$3E             ; A0 3E | Load immediate value into Y register
    ORA $CE              ; 05 CE | Logical OR with accumulator (zero page)
    ORA #$90             ; 09 90 | Logical OR with accumulator (immediate)
    LDX $B203            ; AE 03 B2 | Load from absolute address into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_136
; Address: $C2B2DF
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_136:
    JSR $29FC            ; 20 FC 29 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    REP #$7F             ; C2 7F | Reset processor status bits
    ASL $8190            ; 0E 90 81 | Arithmetic shift left (absolute)
    BMI $0C              ; 30 0C | Branch if negative
    ROL $B1              ; 26 B1 | Rotate left (zero page)
    BCC $81              ; 90 81 | Branch if carry clear
    LDA                  ; BF 23 05 29 | Load from absolute long,X into accumulator
    ROR $0A41,X          ; 7E 41 0A | Rotate right (absolute,X)
    ASL $B8              ; 06 B8 | Arithmetic shift left (zero page)
    ADC #$29             ; 69 29 | Add with carry (immediate)
    SBC $2007,X          ; FD 07 20 | Subtract with carry (absolute,X)
    ROR $C801,X          ; 7E 01 C8 | Rotate right (absolute,X)
    LDA                  ; BF A4 C4 E4 | Load from absolute long,X into accumulator
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_137
; Address: $C2B316
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_137:
    LDA $3E              ; A5 3E | Load from zero page into accumulator
    LDA $2A              ; A5 2A | Load from zero page into accumulator
    ADC $57F9,X          ; 7D F9 57 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_138
; Address: $C2B31F
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_138:
    JSL $1E8110          ; 22 10 81 1E | Jump to subroutine long
    STA ($88),Y          ; 91 88 | Store accumulator to (zero page),Y
    PEA #$E0A5           ; F4 A5 E0 | Game work RAM access
    ORA $49              ; 05 49 | Logical OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    WDM #$2A             ; 42 2A | Reserved instruction
    LSR $AA93,X          ; 5E 93 AA | Logical shift right (absolute,X)
    BIT $F2              ; 24 F2 | Test bits in accumulator (zero page)
    BPL $F8              ; 10 F8 | Branch if positive
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    ORA $FC31,Y          ; 19 31 FC | Logical OR with accumulator (absolute,Y)
    LDX $11              ; A6 11 | Load from zero page into X register
    STA ($27),Y          ; 91 27 | Store accumulator to (zero page),Y
    BIT $2B              ; 24 2B | Test bits in accumulator (zero page)
    ADC $69              ; 65 69 | Add with carry (zero page)
    ADC $4246,Y          ; 79 46 42 | Hardware register operation
    LDX $2457,Y          ; BE 57 24 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_139
; Address: $C2B353
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_139:
    JSL $FEA955          ; 22 55 A9 FE | Jump to subroutine long
    BIT $14              ; 24 14 | Test bits in accumulator (zero page)
    SBC $924B,Y          ; F9 4B 92 | Subtract with carry (absolute,Y)
    INC $E494,X          ; FE 94 E4 | Increment (absolute,X)
    ORA ($C8,X)          ; 01 C8 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_13A
; Address: $C2B364
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_13A:
    JSL $8891F2          ; 22 F2 91 88 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    LDX #$94             ; A2 94 | Load immediate value into X register
    LDA $2BE582          ; AF 82 E5 2B | Load from absolute long address into accumulator
    EOR ($F9),Y          ; 51 F9 | Exclusive OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $8502,Y          ; BE 02 85 | Load from absolute,Y into X register
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_13B
; Address: $C2B381
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_13B:
    INC $8410,X          ; FE 10 84 | Increment (absolute,X)
    SBC ($0F,X)          ; E1 0F | Subtract with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    BMI $FE              ; 30 FE | Branch if negative
    ROR $FA24,X          ; 7E 24 FA | Rotate right (absolute,X)
    BIT #$DC             ; 89 DC | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_13D
; Address: $C2B399
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_13D:
    JSR $8951            ; 20 51 89 | Jump to subroutine
    CPX $1F              ; E4 1F | Compare X register (zero page)
    SBC $2027,X          ; FD 27 20 | Subtract with carry (absolute,X)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_13E
; Address: $C2B3A9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_13E:
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BEQ $7F              ; F0 7F | Branch if equal
    BPL $80              ; 10 80 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STA                  ; 9F 04 FC 03 | Store accumulator to absolute long,X
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    STX $448F            ; 8E 8F 44 | Store X register to absolute address
    BIT $FA              ; 24 FA | Test bits in accumulator (zero page)
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    CPY $22              ; C4 22 | Compare Y register (zero page)
    STA $222444          ; 8F 44 24 22 | Store accumulator to absolute long address
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_13F
; Address: $C2B3D5
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_13F:
    JSL $088FFE          ; 22 FE 8F 08 | Jump to subroutine long
    ORA #$C8             ; 09 C8 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    INC $020F,X          ; FE 0F 02 | Increment (absolute,X)
    BPL $80              ; 10 80 | Branch if positive
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $E503,X          ; FD 03 E5 | Subtract with carry (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL $E9              ; 06 E9 | Arithmetic shift left (zero page)
    WDM #$10             ; 42 10 | Reserved instruction
    STY $BFD0            ; 8C D0 BF | Store Y register to absolute address
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    ADC ($3E,X)          ; 61 3E | Add with carry ((zero page,X))
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    INC $0E2F,X          ; FE 2F 0E | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_140
; Address: $C2B406
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_140:
    JSR $1D9A            ; 20 9A 1D | Jump to subroutine
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    ORA $A6              ; 05 A6 | Logical OR with accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_141
; Address: $C2B41E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_141:
    JSL $03F800          ; 22 00 F8 03 | Jump to subroutine long
    REP #$11             ; C2 11 | Reset processor status bits
    STY $50              ; 84 50 | Store Y register to zero page
    BIT $41              ; 24 41 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_142
; Address: $C2B42B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_142:
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    AND $1242,X          ; 3D 42 12 | Logical AND with accumulator (absolute,X)
    LDY $FC              ; A4 FC | Load from zero page into Y register
    AND #$49             ; 29 49 | Logical AND with accumulator (immediate)
    STX $D1              ; 86 D1 | Store X register to zero page
    TXS                  ; 9A | Transfer X register to stack pointer
    CMP $22              ; C5 22 | Compare accumulator (zero page)
    ROR $28A9            ; 6E A9 28 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_143
; Address: $C2B440
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_143:
    JSL $5FC8A1          ; 22 A1 C8 5F | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    LDY $FE              ; A4 FE | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_144
; Address: $C2B44A
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_144:
    JSR $113E            ; 20 3E 11 | Jump to subroutine
    BIT #$4F             ; 89 4F | Test bits in accumulator (immediate)
    SEP #$13             ; E2 13 | Set processor status bits
    CPY $480F            ; CC 0F 48 | Compare Y register (absolute)
    EOR ($F8,X)          ; 41 F8 | Exclusive OR with accumulator ((zero page,X))
    SEP #$17             ; E2 17 | Set processor status bits
    LDA ($08,X)          ; A1 08 | Load from (zero page,X) into accumulator
    CMP $6F              ; C5 6F | Compare accumulator (zero page)
    BRA $FB              ; 80 FB | Branch always
    EOR $52AA,X          ; 5D AA 52 | Exclusive OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    LDA #$CA             ; A9 CA | Load immediate value into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$14             ; E2 14 | Set processor status bits
    LDY #$28             ; A0 28 | Load immediate value into Y register
    EOR $0C09            ; 4D 09 0C | Exclusive OR with accumulator (absolute)
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    REP #$1F             ; C2 1F | Reset processor status bits
    BEQ $07              ; F0 07 | Branch if equal
    LDX #$A8             ; A2 A8 | Load immediate value into X register
    AND ($FB,X)          ; 21 FB | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $FC              ; 10 FC | Branch if positive
    INC $9113,X          ; FE 13 91 | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    ROL $38              ; 26 38 | Rotate left (zero page)
    LDY #$82             ; A0 82 | Load immediate value into Y register
    BIT $23              ; 24 23 | Test bits in accumulator (zero page)
    INC $0F              ; E6 0F | Increment (zero page)
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    WDM #$10             ; 42 10 | Reserved instruction
    INC $0080,X          ; FE 80 00 | Increment (absolute,X)
    ROL $0901,X          ; 3E 01 09 | Rotate left (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    ORA $A7              ; 05 A7 | Logical OR with accumulator (zero page)
    INC $402F,X          ; FE 2F 40 | Increment (absolute,X)
    STY $FC              ; 84 FC | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_145
; Address: $C2B4B3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_145:
    AND $29              ; 25 29 | Logical AND with accumulator (zero page)
    EOR ($E8,X)          ; 41 E8 | Exclusive OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_146
; Address: $C2B4BC
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_146:
    EOR ($0F,X)          ; 41 0F | Exclusive OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($8E),Y          ; 11 8E | Logical OR with accumulator ((zero page),Y)
    TAX                  ; AA | Transfer accumulator to X register
    JMP $552CBF          ; 5C BF 2C 55 | Jump to address long
    LDA $3C0A,Y          ; B9 0A 3C | Load from absolute,Y into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    BPL $FA              ; 10 FA | Branch if positive
    ORA ($E8),Y          ; 11 E8 | Logical OR with accumulator ((zero page),Y)
    LDA ($E4,X)          ; A1 E4 | Load from (zero page,X) into accumulator
    AND ($D4,X)          ; 21 D4 | Logical AND with accumulator ((zero page,X))
    AND ($EA,X)          ; 21 EA | Logical AND with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    LDX #$94             ; A2 94 | Load immediate value into X register
    BIT $47              ; 24 47 | Test bits in accumulator (zero page)
    ORA $445C,Y          ; 19 5C 44 | Logical OR with accumulator (absolute,Y)
    CMP ($BE,X)          ; C1 BE | Compare accumulator ((zero page,X))
    CPY $829F            ; CC 9F 82 | Compare Y register (absolute)
    EOR #$79             ; 49 79 | Exclusive OR with accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    BVC $A6              ; 50 A6 | Branch if overflow clear
    AND $3D              ; 25 3D | Logical AND with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_147
; Address: $C2B4F3
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_147:
    JSR $F100            ; 20 00 F1 | Jump to subroutine
    BRA $F8              ; 80 F8 | Branch always
    STA $40              ; 85 40 | Store accumulator to zero page
    PHP                  ; 08 | Push processor status to stack
    WDM #$F0             ; 42 F0 | Reserved instruction
    LDA                  ; BF 10 84 20 | Load from absolute long,X into accumulator
    ADC ($C8,X)          ; 61 C8 | Add with carry ((zero page,X))
    STA ($88),Y          ; 91 88 | Store accumulator to (zero page),Y
    LDA                  ; BF 84 E6 E7 | Load from absolute long,X into accumulator
    LDA ($88,X)          ; A1 88 | Load from (zero page,X) into accumulator
    REP #$26             ; C2 26 | Reset processor status bits
    BPL $81              ; 10 81 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPX $FB              ; E4 FB | Compare X register (zero page)
    ORA ($88),Y          ; 11 88 | Logical OR with accumulator ((zero page),Y)
    CPY $14              ; C4 14 | Compare Y register (zero page)
    LDA ($0A,X)          ; A1 0A | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_148
; Address: $C2B526
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_148:
    JSR $8106            ; 20 06 81 | Jump to subroutine
    CPX $3F              ; E4 3F | Compare X register (zero page)
    ORA $554A,Y          ; 19 4A 55 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_14C
; Address: $C2B53D
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_14C:
    JSR $8108            ; 20 08 81 | Jump to subroutine
    INX                  ; E8 | Increment X register
    ADC #$01             ; 69 01 | Add with carry (immediate)
    LDY #$82             ; A0 82 | Load immediate value into Y register
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ORA ($51),Y          ; 11 51 | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    LDA ($0A,X)          ; A1 0A | Load from (zero page,X) into accumulator
    STA ($EF),Y          ; 91 EF | Store accumulator to (zero page),Y
    TAX                  ; AA | Transfer accumulator to X register
    ROL                  ; 2A | Rotate left (accumulator)
    BVC $10              ; 50 10 | Branch if overflow clear
    SBC ($09),Y          ; F1 09 | Subtract with carry ((zero page),Y)
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    EOR $29              ; 45 29 | Exclusive OR with accumulator (zero page)
    BIT $DA              ; 24 DA | Test bits in accumulator (zero page)
    BPL $81              ; 10 81 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    BIT $27              ; 24 27 | Test bits in accumulator (zero page)
    ADC #$4B             ; 69 4B | Add with carry (immediate)
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    BCC $82              ; 90 82 | Branch if carry clear
    PEA #$2023           ; F4 23 20 | Push effective address to stack
    CPX #$03             ; E0 03 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_14D
; Address: $C2B573
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_14D:
    JSL $C34290          ; 22 90 42 C3 | Jump to subroutine long
    WDM #$2C             ; 42 2C | Reserved instruction
    ASL $C9              ; 06 C9 | Arithmetic shift left (zero page)
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    ASL $50              ; 06 50 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_14E
; Address: $C2B58D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_14E:
    JSL $942108          ; 22 08 21 94 | Jump to subroutine long
    ORA ($85),Y          ; 11 85 | Logical OR with accumulator ((zero page),Y)
    BPL $20              ; 10 20 | Branch if positive
    AND ($3C,X)          ; 21 3C | Logical AND with accumulator ((zero page,X))
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    WDM #$10             ; 42 10 | Reserved instruction
    REP #$10             ; C2 10 | Reset processor status bits
    STZ $0420            ; 9C 20 04 | Store zero to absolute
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    EOR ($38,X)          ; 41 38 | Exclusive OR with accumulator ((zero page,X))
    ASL $11              ; 06 11 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    WDM #$38             ; 42 38 | Reserved instruction

;------------------------------------------------------------------------------
; Bank04_DmaFunction_14F
; Address: $C2B5AC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_14F:
    LDX #$31             ; A2 31 | Load immediate value into X register
    LDY $24              ; A4 24 | Load from zero page into Y register
    LDA #$5C             ; A9 5C | Load immediate value into accumulator
    EOR $0C              ; 45 0C | Exclusive OR with accumulator (zero page)
    WDM #$10             ; 42 10 | Reserved instruction

;------------------------------------------------------------------------------
; Bank04_DmaFunction_150
; Address: $C2B5B7
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_150:
    JSL $884108          ; 22 08 41 88 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    BPL $92              ; 10 92 | Branch if positive
    STZ $14              ; 64 14 | Store zero to zero page
    LDA ($0C,X)          ; A1 0C | Load from (zero page,X) into accumulator
    LDA ($88),Y          ; B1 88 | Load from (zero page),Y into accumulator
    RTI                  ; 40 | Return from interrupt
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    INC $F882,X          ; FE 82 F8 | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    LDA $AA              ; A5 AA | Load from zero page into accumulator
    PLB                  ; AB | Pull data bank register from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    EOR $E211,X          ; 5D 11 E2 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_151
; Address: $C2B5DF
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_151:
    JSL $045FE4          ; 22 E4 5F 04 | Jump to subroutine long
    ROL $D0              ; 26 D0 | Rotate left (zero page)
    STA                  ; 9F 08 44 24 | Store accumulator to absolute long,X
    STA ($88),Y          ; 91 88 | Store accumulator to (zero page),Y
    EOR ($12,X)          ; 41 12 | Exclusive OR with accumulator ((zero page,X))
    SBC ($52,X)          ; E1 52 | Subtract with carry ((zero page,X))
    PEA #$003F           ; F4 3F 00 | Push effective address to stack
    AND #$75             ; 29 75 | Logical AND with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT $2A              ; 24 2A | Test bits in accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    STA $27DF20          ; 8F 20 DF 27 | Store accumulator to absolute long address
    DEY                  ; 88 | Decrement Y register
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    ORA #$C8             ; 09 C8 | Logical OR with accumulator (immediate)
    EOR #$5E             ; 49 5E | Exclusive OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_152
; Address: $C2B619
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_152:
    JSR $3FF8            ; 20 F8 3F | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    DEC $22C7            ; CE C7 22 | Decrement (absolute)
    SBC ($81),Y          ; F1 81 | Subtract with carry ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    ASL $9B12            ; 0E 12 9B | Arithmetic shift left (absolute)
    LDY #$C4             ; A0 C4 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_153
; Address: $C2B62E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_153:
    BIT $3B              ; 24 3B | Test bits in accumulator (zero page)
    ORA #$1B             ; 09 1B | Logical OR with accumulator (immediate)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    EOR $8911            ; 4D 11 89 | Exclusive OR with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    WDM #$FF             ; 42 FF | Reserved instruction
    BMI $84              ; 30 84 | Branch if negative

;------------------------------------------------------------------------------
; Bank04_DmaFunction_154
; Address: $C2B63E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_154:
    JSR $A084            ; 20 84 A0 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    BPL $81              ; 10 81 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_156
; Address: $C2B65B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_156:
    JSR $3FF8            ; 20 F8 3F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_158
; Address: $C2B663
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_158:
    JSR $1082            ; 20 82 10 | Jump to subroutine
    ORA $0050,Y          ; 19 50 00 | Logical OR with accumulator (absolute,Y)
    ADC $488F,X          ; 7D 8F 48 | Add with carry (absolute,X)
    BEQ $BE              ; F0 BE | Branch if equal
    LDY $500B,X          ; BC 0B 50 | Load from absolute,X into Y register
    STA $4B              ; 85 4B | Store accumulator to zero page
    PHP                  ; 08 | Push processor status to stack
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    INC $7222,X          ; FE 22 72 | Increment (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $21              ; 05 21 | PPU graphics register access
    ROL $C841,X          ; 3E 41 C8 | Rotate left (absolute,X)
    BPL $F7              ; 10 F7 | Branch if positive
    DEX                  ; CA | Decrement X register
    EOR ($CA),Y          ; 51 CA | Exclusive OR with accumulator ((zero page),Y)
    LDX #$12             ; A2 12 | Load immediate value into X register
    STA $7CA8,X          ; 9D A8 7C | Store accumulator to absolute,X
    EOR $39              ; 45 39 | Exclusive OR with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $3C              ; A5 3C | Load from zero page into accumulator
    ROL $28C5            ; 2E C5 28 | Rotate left (absolute)
    BEQ $7B              ; F0 7B | Branch if equal
    BCC $ED              ; 90 ED | Branch if carry clear
    BIT $23              ; 24 23 | Test bits in accumulator (zero page)
    CMP ($0F,X)          ; C1 0F | Compare accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $489E,X          ; FE 9E 48 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_159
; Address: $C2B6B3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_159:
    PLP                  ; 28 | Pull processor status from stack
    SBC ($9F),Y          ; F1 9F | Subtract with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    CPX $3F              ; E4 3F | Compare X register (zero page)
    ORA ($89),Y          ; 11 89 | Logical OR with accumulator ((zero page),Y)
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_15A
; Address: $C2B6BE
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_15A:
    JSR $3FF8            ; 20 F8 3F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BEQ $97              ; F0 97 | Branch if equal
    TAX                  ; AA | Transfer accumulator to X register
    BVC $BF              ; 50 BF | Branch if overflow clear
    BIT $47              ; 24 47 | Test bits in accumulator (zero page)
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    INC $118E,X          ; FE 8E 11 | Increment (absolute,X)
    STX $24A8            ; 8E A8 24 | Store X register to absolute address
    AND #$89             ; 29 89 | Logical AND with accumulator (immediate)
    STA $44A8,X          ; 9D A8 44 | Store accumulator to absolute,X
    AND $3A              ; 25 3A | Logical AND with accumulator (zero page)
    EOR ($F9),Y          ; 51 F9 | Exclusive OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX #$12             ; A2 12 | Load immediate value into X register
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $A8              ; 05 A8 | Logical OR with accumulator (zero page)
    ASL $0DCC            ; 0E CC 0D | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_15B
; Address: $C2B6EA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_15B:
    JSL $CA8117          ; 22 17 81 CA | Jump to subroutine long
    BCS $34              ; B0 34 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $852FA5          ; 5C A5 2F 85 | Jump to address long
    NOP                  ; EA | No operation
    ORA ($F2),Y          ; 11 F2 | Logical OR with accumulator ((zero page),Y)
    BRA $FC              ; 80 FC | Branch always
    LDA $FA              ; A5 FA | Load from zero page into accumulator
    EOR $0BF9,X          ; 5D F9 0B | Exclusive OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_15C
; Address: $C2B705
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_15C:
    JSL $8B1F1A          ; 22 1A 1F 8B | Jump to subroutine long
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    STX $C4              ; 86 C4 | Store X register to zero page
    JMP ($F9A1)          ; 6C A1 F9 | Jump to address (absolute indirect)
    ADC $524A,X          ; 7D 4A 52 | Add with carry (absolute,X)
    LDX $24              ; A6 24 | Load from zero page into X register
    ORA $C9              ; 05 C9 | Logical OR with accumulator (zero page)
    ROR $AC50            ; 6E 50 AC | Rotate right (absolute)
    WDM #$D5             ; 42 D5 | Reserved instruction
    ORA ($80),Y          ; 11 80 | Logical OR with accumulator ((zero page),Y)
    LDY $2027,X          ; BC 27 20 | Load from absolute,X into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR ($0B),Y          ; 51 0B | Exclusive OR with accumulator ((zero page),Y)
    SBC ($14,X)          ; E1 14 | Subtract with carry ((zero page,X))
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_15D
; Address: $C2B731
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_15D:
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)
    INC $C103,X          ; FE 03 C1 | Increment (absolute,X)
    BPL $84              ; 10 84 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    JMP $402A65          ; 5C 65 2A 40 | Jump to address long
    ORA $28              ; 05 28 | Logical OR with accumulator (zero page)
    ROL $82              ; 26 82 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_15E
; Address: $C2B749
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_15E:
    JSR $4CA8            ; 20 A8 4C | Jump to subroutine
    ORA $88              ; 05 88 | Logical OR with accumulator (zero page)
    BIT $25              ; 24 25 | Test bits in accumulator (zero page)
    BPL $BC              ; 10 BC | Branch if positive
    ORA $49              ; 05 49 | Logical OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    PLX                  ; FA | Pull X register from stack
    BCC $44              ; 90 44 | Branch if carry clear
    LDY $22              ; A4 22 | Load from zero page into Y register
    CMP $5829            ; CD 29 58 | Compare accumulator (absolute)
    ROL $C102,X          ; 3E 02 C1 | Rotate left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_15F
; Address: $C2B76E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_15F:
    JSR $09E1            ; 20 E1 09 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    TAX                  ; AA | Transfer accumulator to X register
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BPL $BC              ; 10 BC | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_160
; Address: $C2B77D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_160:
    JSR $2FE5            ; 20 E5 2F | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    AND ($2A,X)          ; 21 2A | Logical AND with accumulator ((zero page,X))
    EOR ($E5),Y          ; 51 E5 | Exclusive OR with accumulator ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    JMP ($211F)          ; 6C 1F 21 | PPU graphics register access
    BEQ $3F              ; F0 3F | Branch if equal
    ORA $4B8F,X          ; 1D 8F 4B | Logical OR with accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SBC ($88),Y          ; F1 88 | Subtract with carry ((zero page),Y)
    PEA #$2025           ; F4 25 20 | Push effective address to stack
    STA ($F2,X)          ; 81 F2 | Store accumulator to (zero page,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $82              ; 80 82 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_161
; Address: $C2B79F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_161:
    JSR $FF02            ; 20 02 FF | Jump to subroutine
    STA ($E8,X)          ; 81 E8 | Store accumulator to (zero page,X)
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    STY $20              ; 84 20 | Store Y register to zero page
    EOR ($92),Y          ; 51 92 | Exclusive OR with accumulator ((zero page),Y)
    LDX $D554,Y          ; BE 54 D5 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_163
; Address: $C2B7BF
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_163:
    JSR $A1F2            ; 20 F2 A1 | Jump to subroutine
    INX                  ; E8 | Increment X register
    AND ($88),Y          ; 31 88 | Logical AND with accumulator ((zero page),Y)
    EOR ($4C),Y          ; 51 4C | Exclusive OR with accumulator ((zero page),Y)
    ROR $8312,X          ; 7E 12 83 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SBC ($33,X)          ; E1 33 | Subtract with carry ((zero page,X))
    EOR ($CF,X)          ; 41 CF | Exclusive OR with accumulator ((zero page,X))
    BIT $41              ; 24 41 | Test bits in accumulator (zero page)
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)
    INC $9113,X          ; FE 13 91 | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    BPL $4A              ; 10 4A | Branch if positive
    EOR ($F1),Y          ; 51 F1 | Exclusive OR with accumulator ((zero page),Y)
    CMP #$F7             ; C9 F7 | Compare accumulator (immediate)
    ORA #$42             ; 09 42 | Hardware register operation
    LDA $2A              ; A5 2A | Load from zero page into accumulator
    DEC                  ; 3A | Decrement accumulator
    AND ($F7,X)          ; 21 F7 | Logical AND with accumulator ((zero page,X))
    STA $E20440          ; 8F 40 04 E2 | Store accumulator to absolute long address
    LDY $F8              ; A4 F8 | Load from zero page into Y register
    AND #$48             ; 29 48 | Logical AND with accumulator (immediate)
    SBC $948F,Y          ; F9 8F 94 | Subtract with carry (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $84              ; 10 84 | Branch if positive
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    SBC $504B,Y          ; F9 4B 50 | Subtract with carry (absolute,Y)
    LDY $3F              ; A4 3F | Load from zero page into Y register
    ORA ($E2,X)          ; 01 E2 | Logical OR with accumulator ((zero page,X))
    ADC $0080,X          ; 7D 80 00 | Add with carry (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR $3E              ; 45 3E | Exclusive OR with accumulator (zero page)
    STA ($0A),Y          ; 91 0A | Store accumulator to (zero page),Y
    ADC $5C89,X          ; 7D 89 5C | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_164
; Address: $C2B829
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_164:
    JSR $01F8            ; 20 F8 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    INC $0003,X          ; FE 03 00 | Increment (absolute,X)
    LDA $94              ; A5 94 | Load from zero page into accumulator
    BRA $F8              ; 80 F8 | Branch always
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    BNE $BF              ; D0 BF | Branch if not equal
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_165
; Address: $C2B847
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_165:
    BIT #$C8             ; 89 C8 | Test bits in accumulator (immediate)
    EOR #$73             ; 49 73 | Exclusive OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $2E              ; 05 2E | Logical OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    BVC $D5              ; 50 D5 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    LDA $46              ; A5 46 | Load from zero page into accumulator
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    SBC $820B,Y          ; F9 0B 82 | Subtract with carry (absolute,Y)
    AND $6A              ; 25 6A | Logical AND with accumulator (zero page)
    BIT #$CA             ; 89 CA | Test bits in accumulator (immediate)
    LDX #$F2             ; A2 F2 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    ADC $522F,X          ; 7D 2F 52 | Add with carry (absolute,X)
    STA ($8C),Y          ; 91 8C | Store accumulator to (zero page),Y
    ORA ($89),Y          ; 11 89 | Logical OR with accumulator ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $44              ; 05 44 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_166
; Address: $C2B881
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_166:
    JSR $0844            ; 20 44 08 | Jump to subroutine
    LSR                  ; 4A | Logical shift right (accumulator)
    BVC $82              ; 50 82 | Branch if overflow clear
    XBA                  ; EB | Exchange accumulator bytes
    AND $712A            ; 2D 2A 71 | Logical AND with accumulator (absolute)
    ORA #$4A             ; 09 4A | Logical OR with accumulator (immediate)
    WDM #$13             ; 42 13 | Reserved instruction
    SEP #$0F             ; E2 0F | Set processor status bits
    RTI                  ; 40 | Return from interrupt
    BPL $4A              ; 10 4A | Branch if positive
    BNE $82              ; D0 82 | Branch if not equal
    LDA $25              ; A5 25 | Load from zero page into accumulator
    ORA $29              ; 05 29 | Logical OR with accumulator (zero page)
    EOR $4A09,Y          ; 59 09 4A | Exclusive OR with accumulator (absolute,Y)
    EOR ($0C,X)          ; 41 0C | Exclusive OR with accumulator ((zero page,X))
    SEP #$0F             ; E2 0F | Set processor status bits
    SBC $2527,X          ; FD 27 25 | Subtract with carry (absolute,X)
    STA ($E0,X)          ; 81 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank04_DmaFunction_167
; Address: $C2B8AD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_167:
    JSR $17E0            ; 20 E0 17 | Jump to subroutine
    LDA ($F8,X)          ; A1 F8 | Load from (zero page,X) into accumulator
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    ROR $E801,X          ; 7E 01 E8 | Rotate right (absolute,X)
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_168
; Address: $C2B8BB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_168:
    JSL $050040          ; 22 40 00 05 | Jump to subroutine long
    BCC $64              ; 90 64 | Branch if carry clear
    CPY $FE              ; C4 FE | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_16B
; Address: $C2B8CE
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_16B:
    JSR $0FE0            ; 20 E0 0F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $040F,X          ; FE 0F 04 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    DEC $DF              ; C6 DF | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BMI $84              ; 30 84 | Branch if negative
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BPL $80              ; 10 80 | Branch if positive
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    EOR ($C8,X)          ; 41 C8 | Exclusive OR with accumulator ((zero page,X))
    STA                  ; 9F 92 94 E4 | Store accumulator to absolute long,X
    BIT $25              ; 24 25 | Test bits in accumulator (zero page)
    AND #$49             ; 29 49 | Logical AND with accumulator (immediate)
    WDM #$10             ; 42 10 | Reserved instruction
    BPL $04              ; 10 04 | Branch if positive
    BPL $F8              ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_16C
; Address: $C2B905
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_16C:
    JSL $FF9112          ; 22 12 91 FF | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    TAX                  ; AA | Transfer accumulator to X register
    ADC $9FF4,X          ; 7D F4 9F | Add with carry (absolute,X)
    BRA $04              ; 80 04 | Branch always
    CPX $3F              ; E4 3F | Compare X register (zero page)
    ORA ($48),Y          ; 11 48 | Logical OR with accumulator ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_16D
; Address: $C2B91E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_16D:
    JSL $8009F1          ; 22 F1 09 80 | Jump to subroutine long
    BPL $42              ; 10 42 | Hardware register operation
    SED                  ; F8 | Set decimal mode flag
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    WDM #$10             ; 42 10 | Reserved instruction
    STY $E0              ; 84 E0 | Game work RAM access
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_16E
; Address: $C2B93C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_16E:
    JSL $FF9112          ; 22 12 91 FF | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    BPL $82              ; 10 82 | Branch if positive
    BPL $FC              ; 10 FC | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_16F
; Address: $C2B945
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_16F:
    JSR $90F8            ; 20 F8 90 | Jump to subroutine
    BCC $A4              ; 90 A4 | Branch if carry clear
    LDY $28              ; A4 28 | Load from zero page into Y register
    STA $09              ; 85 09 | Store accumulator to zero page
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_171
; Address: $C2B956
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_171:
    JSL $DF40F4          ; 22 F4 40 DF | Jump to subroutine long
    REP #$17             ; C2 17 | Reset processor status bits
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    AND $7F08,X          ; 3D 08 7F | Logical AND with accumulator (absolute,X)
    DEY                  ; 88 | Decrement Y register
    PLX                  ; FA | Pull X register from stack
    BCC $82              ; 90 82 | Branch if carry clear
    ORA #$3B             ; 09 3B | Logical OR with accumulator (immediate)
    STA $28              ; 85 28 | Store accumulator to zero page
    AND $AB              ; 25 AB | Logical AND with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    WDM #$36             ; 42 36 | Reserved instruction
    PLB                  ; AB | Pull data bank register from stack
    ROL                  ; 2A | Rotate left (accumulator)
    LDX #$12             ; A2 12 | Load immediate value into X register
    ORA $21F9,X          ; 1D F9 21 | PPU graphics register access
    SBC #$4F             ; E9 4F | Subtract with carry (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PLX                  ; FA | Pull X register from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $A614,X          ; FE 14 A6 | Increment (absolute,X)
    AND ($E9,X)          ; 21 E9 | Logical AND with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    ROL $02              ; 26 02 | Rotate left (zero page)
    LDA                  ; BF 12 95 A8 | Load from absolute long,X into accumulator
    AND $3E              ; 25 3E | Logical AND with accumulator (zero page)
    EOR ($89),Y          ; 51 89 | Exclusive OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX #$12             ; A2 12 | Load immediate value into X register
    STA                  ; 9F 00 1C F8 | Store accumulator to absolute long,X
    LDY $FD              ; A4 FD | Load from zero page into Y register
    AND ($68,X)          ; 21 68 | Logical AND with accumulator ((zero page,X))
    EOR $7AA8,X          ; 5D A8 7A | Exclusive OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    BIT $21              ; 24 21 | PPU graphics register access
    CMP #$4F             ; C9 4F | Compare accumulator (immediate)
    INY                  ; C8 | Increment Y register
    BRA $FF              ; 80 FF | Branch always
    STA ($88),Y          ; 91 88 | Store accumulator to (zero page),Y
    LSR $37              ; 46 37 | Logical shift right (zero page)
    LDX #$1F             ; A2 1F | Load immediate value into X register
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_172
; Address: $C2B9C4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_172:
    SBC $1003,X          ; FD 03 10 | Subtract with carry (absolute,X)
    INC $8400,X          ; FE 00 84 | Increment (absolute,X)
    SBC $503F,Y          ; F9 3F 50 | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_174
; Address: $C2B9D7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_174:
    JSR $423F            ; 20 3F 42 | Hardware register operation
    ROL $9112,X          ; 3E 12 91 | Rotate left (absolute,X)
    STA $23E444          ; 8F 44 E4 23 | Store accumulator to absolute long address
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    WDM #$12             ; 42 12 | Reserved instruction
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BEQ $87              ; F0 87 | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_175
; Address: $C2B9EB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_175:
    JSR $21FC            ; 20 FC 21 | PPU graphics register access
    PHP                  ; 08 | Push processor status to stack
    SEP #$1F             ; E2 1F | Set processor status bits
    BRA $FC              ; 80 FC | Branch always
    BVC $55              ; 50 55 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_176
; Address: $C2B9F9
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_176:
    JSL $0FFE08          ; 22 08 FE 0F | Jump to subroutine long
    BPL $F8              ; 10 F8 | Branch if positive
    LDY #$FE             ; A0 FE | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $EA              ; 05 EA | Logical OR with accumulator (zero page)
    INC $821F,X          ; FE 1F 82 | Increment (absolute,X)
    BPL $FA              ; 10 FA | Branch if positive
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    ORA #$21             ; 09 21 | PPU graphics register access
    PHP                  ; 08 | Push processor status to stack
    LDY #$00             ; A0 00 | Load immediate value into Y register
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT #$C0             ; 89 C0 | Test bits in accumulator (immediate)
    EOR ($82),Y          ; 51 82 | Exclusive OR with accumulator ((zero page),Y)
    LDY $14              ; A4 14 | Load from zero page into Y register
    SBC ($0F,X)          ; E1 0F | Subtract with carry ((zero page,X))
    EOR ($91,X)          ; 41 91 | Exclusive OR with accumulator ((zero page,X))
    ASL $1217,X          ; 1E 17 12 | Arithmetic shift left (absolute,X)
    ADC #$30             ; 69 30 | Add with carry (immediate)
    ADC $9005,X          ; 7D 05 90 | Add with carry (absolute,X)
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    BPL $01              ; 10 01 | Branch if positive
    STA $FF              ; 85 FF | Store accumulator to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($F2),Y          ; 11 F2 | Logical OR with accumulator ((zero page),Y)
    LDY $24              ; A4 24 | Load from zero page into Y register
    AND #$18             ; 29 18 | Logical AND with accumulator (immediate)
    LDA                  ; BF 5F 91 BE | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_177
; Address: $C2BA56
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_177:
    STZ $28              ; 64 28 | Store zero to zero page
    WDM #$FF             ; 42 FF | Reserved instruction
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR #$5F             ; 49 5F | Exclusive OR with accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    ROL $A117,X          ; 3E 17 A1 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ADC $093F,X          ; 7D 3F 09 | Add with carry (absolute,X)
    LDX $9884,Y          ; BE 84 98 | Load from absolute,Y into X register
    PLA                  ; 68 | Pull accumulator from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    CPX $44              ; E4 44 | Compare X register (zero page)
    ORA #$84             ; 09 84 | Logical OR with accumulator (immediate)
    INC $8113,X          ; FE 13 81 | Increment (absolute,X)
    BPL $04              ; 10 04 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_178
; Address: $C2BA77
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_178:
    PHP                  ; 08 | Push processor status to stack
    STA $FA4448          ; 8F 48 44 FA | Store accumulator to absolute long address
    STA ($F8),Y          ; 91 F8 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank04_DmaFunction_179
; Address: $C2BA81
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_179:
    JSR $117E            ; 20 7E 11 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    EOR #$38             ; 49 38 | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive
    CPY #$7F             ; C0 7F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_17A
; Address: $C2BA91
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_17A:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BPL $FC              ; 10 FC | Branch if positive
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))
    ROR $A254,X          ; 7E 54 A2 | Rotate right (absolute,X)
    LDY $24              ; A4 24 | Load from zero page into Y register
    EOR $32              ; 45 32 | Exclusive OR with accumulator (zero page)
    CPX #$8A             ; E0 8A | Compare X register (immediate)
    EOR ($D2),Y          ; 51 D2 | Exclusive OR with accumulator ((zero page),Y)
    STY $C2              ; 84 C2 | Store Y register to zero page
    SBC $F091,Y          ; F9 91 F0 | Subtract with carry (absolute,Y)
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)
    JMP $D454            ; 4C 54 D4 | Jump to address
    EOR #$55             ; 49 55 | Exclusive OR with accumulator (immediate)
    BCC $7D              ; 90 7D | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    TXA                  ; 8A | Transfer X register to accumulator
    LDY $4A              ; A4 4A | Load from zero page into Y register
    EOR $AA              ; 45 AA | Exclusive OR with accumulator (zero page)
    BCC $A2              ; 90 A2 | Branch if carry clear
    LDX $C3              ; A6 C3 | Load from zero page into X register
    STA ($84),Y          ; 91 84 | Store accumulator to (zero page),Y
    BIT $A8              ; 24 A8 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_17B
; Address: $C2BAD4
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_17B:
    SED                  ; F8 | Set decimal mode flag
    SBC $1043,Y          ; F9 43 10 | Subtract with carry (absolute,Y)
    BEQ $07              ; F0 07 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR ($88),Y          ; 51 88 | Exclusive OR with accumulator ((zero page),Y)
    CPY $C3              ; C4 C3 | Compare Y register (zero page)
    AND ($F8,X)          ; 21 F8 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    SBC $1243,Y          ; F9 43 12 | Subtract with carry (absolute,Y)
    INC $8C90,X          ; FE 90 8C | Increment (absolute,X)
    LDA                  ; BF 60 84 63 | Load from absolute long,X into accumulator
    LSR $E232            ; 4E 32 E2 | Logical shift right (absolute)
    SBC $450B,Y          ; F9 0B 45 | Subtract with carry (absolute,Y)
    BPL $42              ; 10 42 | Hardware register operation
    ADC $FC91,Y          ; 79 91 FC | Add with carry (absolute,Y)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    ROL $8D11,X          ; 3E 11 8D | Rotate left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    EOR $E0              ; 45 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    BEQ $87              ; F0 87 | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_17C
; Address: $C2BB09
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_17C:
    JSR $21FC            ; 20 FC 21 | PPU graphics register access
    PHP                  ; 08 | Push processor status to stack
    SEP #$1F             ; E2 1F | Set processor status bits
    BRA $FC              ; 80 FC | Branch always
    DEY                  ; 88 | Decrement Y register
    EOR #$D4             ; 49 D4 | Exclusive OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    WDM #$FA             ; 42 FA | Reserved instruction
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    LDX $3811,Y          ; BE 11 38 | Load from absolute,Y into X register
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    BPL $8A              ; 10 8A | Branch if positive
    STY $040D            ; 8C 0D 04 | Store Y register to absolute address
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    CPX $3F              ; E4 3F | Compare X register (zero page)
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    ASL $20A8            ; 0E A8 20 | Arithmetic shift left (absolute)
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_17D
; Address: $C2BB3D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_17D:
    JSR $43F9            ; 20 F9 43 | Jump to subroutine
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    CPY #$92             ; C0 92 | Compare Y register (immediate)
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    INY                  ; C8 | Increment Y register
    TAX                  ; AA | Transfer accumulator to X register
    BVC $85              ; 50 85 | Branch if overflow clear
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $FC              ; 90 FC | Branch if carry clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_17F
; Address: $C2BB55
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_17F:
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    LDA #$4A             ; A9 4A | Load immediate value into accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    CPX $2F              ; E4 2F | Compare X register (zero page)
    AND ($2A,X)          ; 21 2A | Logical AND with accumulator ((zero page,X))
    EOR ($09),Y          ; 51 09 | Exclusive OR with accumulator ((zero page),Y)
    BPL $82              ; 10 82 | Branch if positive
    BPL $84              ; 10 84 | Branch if positive
    BVC $C4              ; 50 C4 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_180
; Address: $C2BB6E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_180:
    JSL $110712          ; 22 12 07 11 | Jump to subroutine long
    PEA #$8A3D           ; F4 3D 8A | Push effective address to stack
    TXA                  ; 8A | Transfer X register to accumulator
    REP #$7F             ; C2 7F | Reset processor status bits

;------------------------------------------------------------------------------
; Bank04_DmaFunction_182
; Address: $C2BB80
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_182:
    JSR $0301            ; 20 01 03 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ADC $C50E,Y          ; 79 0E C5 | Add with carry (absolute,Y)
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    BEQ $67              ; F0 67 | Branch if equal
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    REP #$1F             ; C2 1F | Reset processor status bits
    STY $3C              ; 84 3C | Store Y register to zero page
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    BRA $FA              ; 80 FA | Branch always
    LDY #$7E             ; A0 7E | Load immediate value into Y register
    TAX                  ; AA | Transfer accumulator to X register
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    BPL $85              ; 10 85 | Branch if positive
    AND #$52             ; 29 52 | Logical AND with accumulator (immediate)
    ORA $9B              ; 05 9B | Logical OR with accumulator (zero page)
    BVC $DC              ; 50 DC | Branch if overflow clear
    ROL $55              ; 26 55 | Rotate left (zero page)
    LDA ($08,X)          ; A1 08 | Load from (zero page,X) into accumulator
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    SBC $4B03,Y          ; F9 03 4B | Subtract with carry (absolute,Y)
    DEC $8A1B,X          ; DE 1B 8A | Decrement (absolute,X)
    JMP $212424          ; 5C 24 24 21 | PPU graphics register access
    AND ($1A),Y          ; 31 1A | Logical AND with accumulator ((zero page),Y)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    SBC $027D,X          ; FD 7D 02 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_183
; Address: $C2BBCD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_183:
    JSR $FBE0            ; 20 E0 FB | Jump to subroutine
    EOR ($FC),Y          ; 51 FC | Exclusive OR with accumulator ((zero page),Y)
    PEA #$113F           ; F4 3F 11 | Push effective address to stack
    LDA #$6F             ; A9 6F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_184
; Address: $C2BBD8
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_184:
    ORA ($4E,X)          ; 01 4E | Logical OR with accumulator ((zero page,X))
    CMP ($11,X)          ; C1 11 | Compare accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ROR $BF14,X          ; 7E 14 BF | Rotate right (absolute,X)
    CMP $EF              ; C5 EF | Compare accumulator (zero page)
    BCS $BC              ; B0 BC | Branch if carry set
    BIT $4B6F            ; 2C 6F 4B | Test bits in accumulator (absolute)
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    PEA #$5279           ; F4 79 52 | Push effective address to stack
    SBC $5EAA,X          ; FD AA 5E | Subtract with carry (absolute,X)
    LDA                  ; BF AA D5 AF | Load from absolute long,X into accumulator
    PHA                  ; 48 | Push accumulator to stack
    SBC #$4B             ; E9 4B | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $E2              ; 10 E2 | Branch if positive
    LDY $F8              ; A4 F8 | Load from zero page into Y register
    EOR $2D              ; 45 2D | Exclusive OR with accumulator (zero page)
    ROR $9352,X          ; 7E 52 93 | Rotate right (absolute,X)
    STA                  ; 9F 90 E8 47 | Store accumulator to absolute long,X
    CPX $FC              ; E4 FC | Compare X register (zero page)
    ASL $2F54            ; 0E 54 2F | Arithmetic shift left (absolute)
    CMP ($EB),Y          ; D1 EB | Compare accumulator ((zero page),Y)
    LDX #$14             ; A2 14 | Load immediate value into X register
    LDA $640A,X          ; BD 0A 64 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_185
; Address: $C2BC20
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_185:
    JSR $3903            ; 20 03 39 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    LDA                  ; BF 07 35 A8 | Load from absolute long,X into accumulator
    EOR $7A0D,X          ; 5D 0D 7A | Exclusive OR with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    PHY                  ; 5A | Push Y register to stack
    TAX                  ; AA | Transfer accumulator to X register
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR ($3D,X)          ; 41 3D | Exclusive OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    STA $F259,Y          ; 99 59 F2 | Store accumulator to absolute,Y
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    EOR $7E28,X          ; 5D 28 7E | Exclusive OR with accumulator (absolute,X)
    ORA ($8A),Y          ; 11 8A | Logical OR with accumulator ((zero page),Y)
    STY $E2              ; 84 E2 | Store Y register to zero page
    CPY #$FD             ; C0 FD | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_186
; Address: $C2BC48
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_186:
    JSR $0B7F            ; 20 7F 0B | Jump to subroutine
    LDX $BF54            ; AE 54 BF | Load from absolute address into X register
    ROL                  ; 2A | Rotate left (accumulator)
    SBC $706A            ; ED 6A 70 | Subtract with carry (absolute)
    STX $EC              ; 86 EC | Store X register to zero page
    AND ($F9,X)          ; 21 F9 | Logical AND with accumulator ((zero page,X))
    EOR ($28),Y          ; 51 28 | Exclusive OR with accumulator ((zero page),Y)
    ROR $B002,X          ; 7E 02 B0 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_188
; Address: $C2BC66
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_188:
    JSL $408891          ; 22 91 88 40 | Jump to subroutine long
    WDM #$88             ; 42 88 | Reserved instruction
    BPL $87              ; 10 87 | Branch if positive
    BNE $BF              ; D0 BF | Branch if not equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX $37              ; E4 37 | Compare X register (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    WDM #$14             ; 42 14 | Reserved instruction

;------------------------------------------------------------------------------
; Bank04_DmaFunction_18A
; Address: $C2BC80
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_18A:
    JSR $0FE0            ; 20 E0 0F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $000F,X          ; FE 0F 00 | Increment (absolute,X)
    INC $E490,X          ; FE 90 E4 | Increment (absolute,X)
    BIT $F9              ; 24 F9 | Test bits in accumulator (zero page)
    BPL $F6              ; 10 F6 | Branch if positive
    CPY $FB              ; C4 FB | Compare Y register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_18B
; Address: $C2BC97
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_18B:
    PHP                  ; 08 | Push processor status to stack
    PHY                  ; 5A | Push Y register to stack
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    SBC $9652,Y          ; F9 52 96 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_18C
; Address: $C2BCA1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_18C:
    JSR $7FF8            ; 20 F8 7F | Jump to subroutine
    BIT $21              ; 24 21 | PPU graphics register access
    ORA $8789,Y          ; 19 89 87 | Logical OR with accumulator (absolute,Y)
    BRA $18              ; 80 18 | Branch always
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_18D
; Address: $C2BCB4
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_18D:
    WDM #$C8             ; 42 C8 | Reserved instruction
    WDM #$10             ; 42 10 | Reserved instruction
    TSX                  ; BA | Transfer stack pointer to X register
    BRA $F2              ; 80 F2 | Branch always
    LDY #$04             ; A0 04 | Load immediate value into Y register
    SBC $2F              ; E5 2F | Subtract with carry (zero page)
    BRA $FA              ; 80 FA | Branch always
    INC $5003,X          ; FE 03 50 | Increment (absolute,X)
    LDA                  ; BF 11 04 21 | Load from absolute long,X into accumulator
    EOR #$DA             ; 49 DA | Exclusive OR with accumulator (immediate)
    BIT $2D              ; 24 2D | Test bits in accumulator (zero page)
    CMP ($8F),Y          ; D1 8F | Compare accumulator ((zero page),Y)
    WDM #$C0             ; 42 C0 | Reserved instruction
    INC $A497,X          ; FE 97 A4 | Increment (absolute,X)
    AND $29              ; 25 29 | Logical AND with accumulator (zero page)
    EOR #$59             ; 49 59 | Exclusive OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_18E
; Address: $C2BCE8
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_18E:
    PHP                  ; 08 | Push processor status to stack
    BPL $FC              ; 10 FC | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    STY $3F              ; 84 3F | Store Y register to zero page
    PLP                  ; 28 | Pull processor status from stack
    EOR ($0A,X)          ; 41 0A | Exclusive OR with accumulator ((zero page,X))
    REP #$1F             ; C2 1F | Reset processor status bits
    SED                  ; F8 | Set decimal mode flag
    BRA $10              ; 80 10 | Branch always
    STA                  ; 9F AB C4 27 | Store accumulator to absolute long,X
    ROL                  ; 2A | Rotate left (accumulator)
    SBC ($09),Y          ; F1 09 | Subtract with carry ((zero page),Y)
    WDM #$FE             ; 42 FE | Reserved instruction
    STX $B8              ; 86 B8 | Store X register to zero page
    AND $5808            ; 2D 08 58 | Logical AND with accumulator (absolute)
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    PHA                  ; 48 | Push accumulator to stack
    CPX #$85             ; E0 85 | Compare X register (immediate)
    SBC ($80),Y          ; F1 80 | Subtract with carry ((zero page),Y)
    BEQ $8F              ; F0 8F | Branch if equal
    BIT $FA              ; 24 FA | Test bits in accumulator (zero page)
    ORA ($89),Y          ; 11 89 | Logical OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    CPX $A2              ; E4 A2 | Compare X register (zero page)
    CMP ($88),Y          ; D1 88 | Compare accumulator ((zero page),Y)
    ROR $2004,X          ; 7E 04 20 | Rotate right (absolute,X)
    STX $01C3            ; 8E C3 01 | Store X register to absolute address
    ORA ($F0),Y          ; 11 F0 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_18F
; Address: $C2BD38
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_18F:
    JSR $010E            ; 20 0E 01 | Jump to subroutine
    LDX $A517,Y          ; BE 17 A5 | Load from absolute,Y into X register
    PLP                  ; 28 | Pull processor status from stack
    EOR $E9              ; 45 E9 | Exclusive OR with accumulator (zero page)
    ORA #$FC             ; 09 FC | Logical OR with accumulator (immediate)
    BVC $99              ; 50 99 | Branch if overflow clear
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    STA $EA              ; 85 EA | Store accumulator to zero page
    INC $541E,X          ; FE 1E 54 | Increment (absolute,X)
    BRA $02              ; 80 02 | Branch always
    SBC $55AE,X          ; FD AE 55 | Subtract with carry (absolute,X)
    LDA $6DFA            ; AD FA 6D | Load from absolute address into accumulator
    AND #$5A             ; 29 5A | Logical AND with accumulator (immediate)
    ASL $0415,X          ; 1E 15 04 | Arithmetic shift left (absolute,X)
    STY $27              ; 84 27 | Store Y register to zero page
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    STA ($95),Y          ; 91 95 | Store accumulator to (zero page),Y
    PHP                  ; 08 | Push processor status to stack
    CMP ($08,X)          ; C1 08 | Compare accumulator ((zero page,X))
    EOR #$86             ; 49 86 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_190
; Address: $C2BD78
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_190:
    SBC $2AA0,X          ; FD A0 2A | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    WDM #$FD             ; 42 FD | Reserved instruction
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_191
; Address: $C2BD80
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_191:
    SBC ($0D),Y          ; F1 0D | Subtract with carry ((zero page),Y)
    WDM #$10             ; 42 10 | Reserved instruction
    SEP #$13             ; E2 13 | Set processor status bits
    STY $3A              ; 84 3A | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_192
; Address: $C2BD8B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_192:
    JSR $03FC            ; 20 FC 03 | Jump to subroutine
    BPL $81              ; 10 81 | Branch if positive
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_193
; Address: $C2BD93
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_193:
    JSR $0280            ; 20 80 02 | Jump to subroutine
    BPL $41              ; 10 41 | Branch if positive
    BCC $01              ; 90 01 | Branch if carry clear
    STY $44              ; 84 44 | Store Y register to zero page
    BIT $2C              ; 24 2C | Test bits in accumulator (zero page)
    DEX                  ; CA | Decrement X register
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    SBC $0127            ; ED 27 01 | Subtract with carry (absolute)
    STA ($88),Y          ; 91 88 | Store accumulator to (zero page),Y
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_194
; Address: $C2BDAA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_194:
    JSL $20B0D1          ; 22 D1 B0 20 | Jump to subroutine long
    ORA ($D9,X)          ; 01 D9 | Logical OR with accumulator ((zero page,X))
    ORA ($8A,X)          ; 01 8A | Logical OR with accumulator ((zero page,X))
    STZ $F2              ; 64 F2 | Store zero to zero page
    BCC $A0              ; 90 A0 | Branch if carry clear
    ASL $D5              ; 06 D5 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_195
; Address: $C2BDBE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_195:
    JSR $F888            ; 20 88 F8 | Jump to subroutine
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    PLP                  ; 28 | Pull processor status from stack
    ROL                  ; 2A | Rotate left (accumulator)
    STA                  ; 9F 20 F8 3F | Store accumulator to absolute long,X
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    EOR $40              ; 45 40 | Exclusive OR with accumulator (zero page)
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_196
; Address: $C2BDE0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_196:
    JSR $0700            ; 20 00 07 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    REP #$1F             ; C2 1F | Reset processor status bits
    BRA $00              ; 80 00 | Branch always
    STY $3F              ; 84 3F | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_197
; Address: $C2BDEC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_197:
    JSR $FFC0            ; 20 C0 FF | Jump to subroutine
    ORA ($80),Y          ; 11 80 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BRA $E1              ; 80 E1 | Branch always
    STY $40              ; 84 40 | Store Y register to zero page
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_198
; Address: $C2BDFA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_198:
    LDX #$FF             ; A2 FF | Load immediate value into X register
    DEY                  ; 88 | Decrement Y register
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    EOR ($48),Y          ; 51 48 | Exclusive OR with accumulator ((zero page),Y)
    WDM #$22             ; 42 22 | Reserved instruction
    STX $08              ; 86 08 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_199
; Address: $C2BE09
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_199:
    JSR $27E4            ; 20 E4 27 | Jump to subroutine
    ORA #$4A             ; 09 4A | Logical OR with accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $24              ; 84 24 | Store Y register to zero page
    AND $5D              ; 25 5D | Logical AND with accumulator (zero page)
    BPL $8E              ; 10 8E | Branch if positive
    BPL $84              ; 10 84 | Branch if positive
    SBC $510B,X          ; FD 0B 51 | Subtract with carry (absolute,X)
    DEY                  ; 88 | Decrement Y register
    WDM #$18             ; 42 18 | Reserved instruction
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_19B
; Address: $C2BE2C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_19B:
    JSL $BC417F          ; 22 7F 41 BC | Jump to subroutine long
    BPL $F2              ; 10 F2 | Branch if positive
    CPY $FD              ; C4 FD | Compare Y register (zero page)
    LDA ($1C,X)          ; A1 1C | Load from (zero page,X) into accumulator
    EOR ($49),Y          ; 51 49 | Exclusive OR with accumulator ((zero page),Y)
    INC $9113,X          ; FE 13 91 | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_19D
; Address: $C2BE47
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_19D:
    JSL $089112          ; 22 12 91 08 | Jump to subroutine long
    EOR $E8              ; 45 E8 | Exclusive OR with accumulator (zero page)
    BRA $04              ; 80 04 | Branch always
    EOR ($84,X)          ; 41 84 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INC $0080,X          ; FE 80 00 | Increment (absolute,X)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($22),Y          ; 11 22 | Logical OR with accumulator ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    LDA                  ; BF 88 7C 04 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_19E
; Address: $C2BE6A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_19E:
    JSR $81FF            ; 20 FF 81 | Jump to subroutine
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    LDY $F119            ; AC 19 F1 | Load from absolute address into Y register
    ORA $49              ; 05 49 | Logical OR with accumulator (zero page)
    CMP #$5F             ; C9 5F | Compare accumulator (immediate)
    LDX $3E              ; A6 3E | Load from zero page into X register
    AND $3F              ; 25 3F | Logical AND with accumulator (zero page)
    EOR #$6D             ; 49 6D | Exclusive OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    TXS                  ; 9A | Transfer X register to stack pointer
    PHX                  ; DA | Push X register to stack
    LDX $F7D8            ; AE D8 F7 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_19F
; Address: $C2BE85
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_19F:
    LDX #$F4             ; A2 F4 | Load immediate value into X register
    LDA $48              ; A5 48 | Load from zero page into accumulator
    ADC $C80A,X          ; 7D 0A C8 | Add with carry (absolute,X)
    WDM #$F2             ; 42 F2 | Reserved instruction
    AND $1261            ; 2D 61 12 | Logical AND with accumulator (absolute)
    AND $08              ; 25 08 | Logical AND with accumulator (zero page)
    AND #$28             ; 29 28 | Logical AND with accumulator (immediate)
    ROR $22B5,X          ; 7E B5 22 | Rotate right (absolute,X)
    LDA $22              ; A5 22 | Load from zero page into accumulator
    ORA ($15),Y          ; 11 15 | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    EOR $45              ; 45 45 | Exclusive OR with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    LDA ($E3,X)          ; A1 E3 | Load from (zero page,X) into accumulator
    RTI                  ; 40 | Return from interrupt
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    INC $C103,X          ; FE 03 C1 | Increment (absolute,X)
    BPL $18              ; 10 18 | Branch if positive
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BPL $F8              ; 10 F8 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1A0
; Address: $C2BEC4
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1A0:
    JSR $2603            ; 20 03 26 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    AND ($D1,X)          ; 21 D1 | Logical AND with accumulator ((zero page,X))
    BMI $41              ; 30 41 | Branch if negative
    BVC $CA              ; 50 CA | Branch if overflow clear
    LDX $74              ; A6 74 | Load from zero page into X register
    LDA $6EB5            ; AD B5 6E | Load from absolute address into accumulator
    ADC $E74A            ; 6D 4A E7 | Add with carry (absolute)
    AND ($86),Y          ; 31 86 | Logical AND with accumulator ((zero page),Y)
    BEQ $FF              ; F0 FF | Branch if equal
    RTI                  ; 40 | Return from interrupt
    REP #$FF             ; C2 FF | Reset processor status bits
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    BEQ $8F              ; F0 8F | Branch if equal
    LDY #$FC             ; A0 FC | Load immediate value into Y register
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    REP #$11             ; C2 11 | Reset processor status bits
    BPL $80              ; 10 80 | Branch if positive
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BPL $86              ; 10 86 | Branch if positive
    BMI $84              ; 30 84 | Branch if negative
    AND ($FC,X)          ; 21 FC | Logical AND with accumulator ((zero page,X))
    BIT #$49             ; 89 49 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1A1
; Address: $C2BF05
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1A1:
    LDY $DC              ; A4 DC | Load from zero page into Y register
    AND $522A,X          ; 3D 2A 52 | Logical AND with accumulator (absolute,X)
    LDA $648A,Y          ; B9 8A 64 | Load from absolute,Y into accumulator
    BIT $62              ; 24 62 | Test bits in accumulator (zero page)
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    AND ($0A,X)          ; 21 0A | Logical AND with accumulator ((zero page,X))
    LDA ($FE,X)          ; A1 FE | Load from (zero page,X) into accumulator
    PLA                  ; 68 | Pull accumulator from stack
    WDM #$A1             ; 42 A1 | Reserved instruction
    EOR ($8A),Y          ; 51 8A | Exclusive OR with accumulator ((zero page),Y)
    LDX #$5F             ; A2 5F | Load immediate value into X register
    LDA $0A              ; A5 0A | Load from zero page into accumulator
    LDX $1C0C,Y          ; BE 0C 1C | Load from absolute,Y into X register
    EOR ($30),Y          ; 51 30 | Exclusive OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ASL $83              ; 06 83 | Arithmetic shift left (zero page)
    CMP ($A0,X)          ; C1 A0 | Compare accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ORA ($05),Y          ; 11 05 | Logical OR with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    EOR ($30),Y          ; 51 30 | Exclusive OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    CPX #$08             ; E0 08 | Compare X register (immediate)
    CMP ($A0,X)          ; C1 A0 | Compare accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    BMI $28              ; 30 28 | Branch if negative
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1A2
; Address: $C2BF50
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1A2:
    JSR $C810            ; 20 10 C8 | Jump to subroutine
    CMP ($A0,X)          ; C1 A0 | Compare accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    STA ($5C,X)          ; 81 5C | Store accumulator to (zero page,X)
    ADC ($30),Y          ; 71 30 | Add with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    TXA                  ; 8A | Transfer X register to accumulator
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1A4
; Address: $C2BF68
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1A4:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CMP ($11,X)          ; C1 11 | Compare accumulator ((zero page,X))
    ORA $83              ; 05 83 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1A5
; Address: $C2BF72
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1A5:
    JSL $18288E          ; 22 8E 28 18 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    SEC                  ; 38 | Set carry flag
    EOR ($30),Y          ; 51 30 | Exclusive OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    STX $813A            ; 8E 3A 81 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1A6
; Address: $C2BF81
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1A6:
    BRA $88              ; 80 88 | Branch always
    STA ($40,X)          ; 81 40 | Store accumulator to (zero page,X)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    STA ($C1,X)          ; 81 C1 | Store accumulator to (zero page,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1A7
; Address: $C2BF90
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1A7:
    BMI $18              ; 30 18 | Branch if negative
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STY $51              ; 84 51 | Store Y register to zero page
    WDM #$08             ; 42 08 | Reserved instruction
    AND ($84,X)          ; 21 84 | Logical AND with accumulator ((zero page,X))
    BCC $0F              ; 90 0F | Branch if carry clear
    BPL $20              ; 10 20 | Branch if positive
    LDY #$40             ; A0 40 | Load immediate value into Y register
    EOR ($84,X)          ; 41 84 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($7F),Y          ; 11 7F | Logical OR with accumulator ((zero page),Y)
    ORA $2E3F,X          ; 1D 3F 2E | Logical OR with accumulator (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    BCC $20              ; 90 20 | Branch if carry clear
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    BIT $E8              ; 24 E8 | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    ADC ($41),Y          ; 71 41 | Add with carry ((zero page),Y)
    STY $10              ; 84 10 | Store Y register to zero page
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    ORA ($21),Y          ; 11 21 | PPU graphics register access
    EOR ($C7,X)          ; 41 C7 | Exclusive OR with accumulator ((zero page,X))
    ROL $4A              ; 26 4A | Rotate left (zero page)
    BIT $49              ; 24 49 | Test bits in accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $8E32,Y          ; 19 32 8E | Logical OR with accumulator (absolute,Y)
    BCC $40              ; 90 40 | Branch if carry clear
    STA ($02,X)          ; 81 02 | Store accumulator to (zero page,X)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    STA ($D4),Y          ; 91 D4 | Store accumulator to (zero page),Y
    ASL $84FC,X          ; 1E FC 84 | Arithmetic shift left (absolute,X)
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    AND ($41,X)          ; 21 41 | Logical AND with accumulator ((zero page,X))
    STX $8FFF            ; 8E FF 8F | Store X register to absolute address
    CLC                  ; 18 | Clear carry flag
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1A9
; Address: $C2BFF9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1A9:
    JSR $8241            ; 20 41 82 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    BPL $21              ; 10 21 | PPU graphics register access
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $80              ; 24 80 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1AA
; Address: $C2C00C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1AA:
    JSR $0280            ; 20 80 02 | Jump to subroutine
    INC $0207,X          ; FE 07 02 | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1AB
; Address: $C2C013
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1AB:
    JSL $002028          ; 22 28 20 00 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BVC $A0              ; 50 A0 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1AC
; Address: $C2C022
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1AC:
    JSR $4442            ; 20 42 44 | Jump to subroutine
    BCC $20              ; 90 20 | Branch if carry clear
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    STZ $55              ; 64 55 | Store zero to zero page
    PLP                  ; 28 | Pull processor status from stack
    LDY $8AE9            ; AC E9 8A | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    CMP ($12,X)          ; C1 12 | Compare accumulator ((zero page,X))
    ASL $0F04,X          ; 1E 04 0F | Arithmetic shift left (absolute,X)
    SBC #$09             ; E9 09 | Subtract with carry (immediate)
    BPL $08              ; 10 08 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    EOR ($84,X)          ; 41 84 | Exclusive OR with accumulator ((zero page,X))
    BCC $40              ; 90 40 | Branch if carry clear
    STA                  ; 9F 01 0C 20 | Store accumulator to absolute long,X
    RTI                  ; 40 | Return from interrupt
    BRA $70              ; 80 70 | Branch always
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ADC ($01),Y          ; 71 01 | Add with carry ((zero page),Y)
    BPL $C0              ; 10 C0 | Branch if positive
    CMP ($93,X)          ; C1 93 | Compare accumulator ((zero page,X))
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    BIT $C8              ; 24 C8 | Test bits in accumulator (zero page)
    CMP ($64),Y          ; D1 64 | Compare accumulator ((zero page),Y)
    EOR #$4C             ; 49 4C | Exclusive OR with accumulator (immediate)
    BPL $3E              ; 10 3E | Branch if positive
    REP #$83             ; C2 83 | Reset processor status bits
    BEQ $11              ; F0 11 | Branch if equal
    ASL $7E04,X          ; 1E 04 7E | Arithmetic shift left (absolute,X)
    AND $82              ; 25 82 | Logical AND with accumulator (zero page)
    CMP ($13,X)          ; C1 13 | Compare accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1AD
; Address: $C2C078
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1AD:
    STZ $80E0,X          ; 9E E0 80 | Store zero to absolute,X
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BVS $40              ; 70 40 | Branch if overflow set
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    STA ($41),Y          ; 91 41 | Store accumulator to (zero page),Y
    STA ($87,X)          ; 81 87 | Store accumulator to (zero page,X)
    BCC $40              ; 90 40 | Branch if carry clear
    AND $188B,Y          ; 39 8B 18 | Logical AND with accumulator (absolute,Y)
    CMP ($E1,X)          ; C1 E1 | Compare accumulator ((zero page,X))
    BIT #$0C             ; 89 0C | Test bits in accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    STY $04              ; 84 04 | Store Y register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    BPL $3C              ; 10 3C | Branch if positive
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    STA ($B3,X)          ; 81 B3 | Store accumulator to (zero page,X)
    DEY                  ; 88 | Decrement Y register
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1AE
; Address: $C2C0AE
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1AE:
    JSR $7E40            ; 20 40 7E | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $38              ; 10 38 | Branch if positive
    INY                  ; C8 | Increment Y register
    BPL $25              ; 10 25 | Branch if positive
    LSR                  ; 4A | Logical shift right (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    BMI $40              ; 30 40 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    BPL $20              ; 10 20 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CPX $08              ; E4 08 | Compare X register (zero page)
    ASL $4020,X          ; 1E 20 40 | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $88              ; 24 88 | Test bits in accumulator (zero page)
    ORA ($FC),Y          ; 11 FC | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1B0
; Address: $C2C0E9
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1B0:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    WDM #$41             ; 42 41 | Reserved instruction
    EOR ($42,X)          ; 41 42 | Hardware register operation
    WDM #$41             ; 42 41 | Reserved instruction
    EOR ($42,X)          ; 41 42 | Hardware register operation
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    WDM #$7E             ; 42 7E | Reserved instruction
    WDM #$40             ; 42 40 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $F0              ; F0 F0 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    WDM #$81             ; 42 81 | Reserved instruction
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    WDM #$3C             ; 42 3C | Reserved instruction
    WDM #$41             ; 42 41 | Reserved instruction
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    WDM #$7C             ; 42 7C | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $3A              ; F0 3A | Branch if equal
    LSR $82              ; 46 82 | Logical shift right (zero page)
    BRA $40              ; 80 40 | Branch always
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    REP #$BC             ; C2 BC | Reset processor status bits
    SEC                  ; 38 | Set carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    REP #$01             ; C2 01 | Reset processor status bits
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BMI $01              ; 30 01 | Branch if negative

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1B1
; Address: $C2C14B
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1B1:
    BMI $C0              ; 30 C0 | Branch if negative
    BRA $60              ; 80 60 | Branch always
    CLC                  ; 18 | Clear carry flag
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA $020274          ; 8F 74 02 02 | Store accumulator to absolute long address
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BRA $40              ; 80 40 | Branch always
    ROL $8080,X          ; 3E 80 80 | Rotate left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BRA $81              ; 80 81 | Branch always
    STA ($82,X)          ; 81 82 | Store accumulator to (zero page,X)
    SEC                  ; 38 | Set carry flag
    STA $85              ; 85 85 | Store accumulator to zero page
    BRA $80              ; 80 80 | Branch always
    BRA $81              ; 80 81 | Branch always
    STA ($82,X)          ; 81 82 | Store accumulator to (zero page,X)
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1B2
; Address: $C2C175
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1B2:
    JSR $2C23            ; 20 23 2C | Jump to subroutine
    BMI $40              ; 30 40 | Branch if negative
    BRA $80              ; 80 80 | Branch always
    BRA $40              ; 80 40 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    STX $7089            ; 8E 89 70 | Store X register to absolute address
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    EOR ($30),Y          ; 51 30 | Exclusive OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    EOR ($11,X)          ; 41 11 | Exclusive OR with accumulator ((zero page,X))
    ASL $83              ; 06 83 | Arithmetic shift left (zero page)
    CMP ($60,X)          ; C1 60 | Compare accumulator ((zero page,X))
    BMI $28              ; 30 28 | Branch if negative
    CPX $73              ; E4 73 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1B3
; Address: $C2C1C0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1B3:
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    BPL $78              ; 10 78 | Branch if positive
    ASL $47              ; 06 47 | Arithmetic shift left (zero page)
    STA $4087,X          ; 9D 87 40 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1B4
; Address: $C2C1CA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1B4:
    JSR $0810            ; 20 10 08 | Jump to subroutine
    WDM #$A1             ; 42 A1 | Reserved instruction
    BCC $87              ; 90 87 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1B5
; Address: $C2C1DA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1B5:
    JSR $8102            ; 20 02 81 | Jump to subroutine
    BCC $44              ; 90 44 | Branch if carry clear
    EOR ($30,X)          ; 41 30 | Exclusive OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1B6
; Address: $C2C1E2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1B6:
    JSL $9F2021          ; 22 21 20 9F | Jump to subroutine long
    BPL $42              ; 10 42 | Hardware register operation
    PHP                  ; 08 | Push processor status to stack
    AND ($84,X)          ; 21 84 | Logical AND with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP ($14,X)          ; C1 14 | Compare accumulator ((zero page,X))
    LDA $28              ; A5 28 | Load from zero page into accumulator
    AND #$49             ; 29 49 | Logical AND with accumulator (immediate)
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1B7
; Address: $C2C1F7
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1B7:
    JSL $C1D112          ; 22 12 D1 C1 | Jump to subroutine long
    ROL $1122            ; 2E 22 11 | Rotate left (absolute)
    BIT #$88             ; 89 88 | Test bits in accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    LDA ($0A,X)          ; A1 0A | Load from (zero page,X) into accumulator
    BPL $81              ; 10 81 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    JMP $410440          ; 5C 40 04 41 | Jump to address long
    RTI                  ; 40 | Return from interrupt
    ORA $44              ; 05 44 | Logical OR with accumulator (zero page)
    BPL $44              ; 10 44 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    BRA $08              ; 80 08 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1B8
; Address: $C2C223
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1B8:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BEQ $01              ; F0 01 | Branch if equal
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1B9
; Address: $C2C22E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1B9:
    JSR $3FF8            ; 20 F8 3F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive
    LDY #$08             ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1BB
; Address: $C2C23D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1BB:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    BPL $80              ; 10 80 | Branch if positive
    AND ($6A,X)          ; 21 6A | Logical AND with accumulator ((zero page,X))
    ORA #$3C             ; 09 3C | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$05             ; C0 05 | Compare Y register (immediate)
    ADC ($04),Y          ; 71 04 | Add with carry ((zero page),Y)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 02 15 04 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1BC
; Address: $C2C259
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1BC:
    JSL $0C0160          ; 22 60 01 0C | Jump to subroutine long
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    LDY $21              ; A4 21 | PPU graphics register access
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC ($08,X)          ; E1 08 | Subtract with carry ((zero page,X))
    DEC $51              ; C6 51 | Decrement (zero page)
    BIT $23              ; 24 23 | Test bits in accumulator (zero page)
    BRA $49              ; 80 49 | Branch always
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    LDY $20              ; A4 20 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1BD
; Address: $C2C27C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1BD:
    JSL $108210          ; 22 10 82 10 | Jump to subroutine long
    ORA ($70),Y          ; 11 70 | Logical OR with accumulator ((zero page),Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1BE
; Address: $C2C289
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1BE:
    JSR $2080            ; 20 80 20 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    EOR $10              ; 45 10 | Exclusive OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1BF
; Address: $C2C292
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1BF:
    PLP                  ; 28 | Pull processor status from stack
    LSR $0D              ; 46 0D | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    ORA ($8A),Y          ; 11 8A | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1C0
; Address: $C2C29E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1C0:
    JSR $C124            ; 20 24 C1 | Jump to subroutine
    BVS $80              ; 70 80 | Branch if overflow set
    BRA $08              ; 80 08 | Branch always
    CPX #$8F             ; E0 8F | Compare X register (immediate)
    LDA ($0A,X)          ; A1 0A | Load from (zero page,X) into accumulator
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)
    STY $42              ; 84 42 | Hardware register operation
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    SBC ($8B,X)          ; E1 8B | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1C2
; Address: $C2C2C0
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1C2:
    JSR $C1C0            ; 20 C0 C1 | Jump to subroutine
    ROR                  ; 6A | Rotate right (accumulator)
    BCC $82              ; 90 82 | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    STY $21              ; 84 21 | PPU graphics register access
    LDA ($0A,X)          ; A1 0A | Load from (zero page,X) into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $03              ; 80 03 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    BPL $45              ; 10 45 | Branch if positive
    BVS $02              ; 70 02 | Branch if overflow set
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    ORA #$92             ; 09 92 | Logical OR with accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INC $102F,X          ; FE 2F 10 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1C3
; Address: $C2C2E6
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1C3:
    JSR $2004            ; 20 04 20 | Jump to subroutine
    ORA ($88,X)          ; 01 88 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    STY $10              ; 84 10 | Store Y register to zero page
    STY $40              ; 84 40 | Store Y register to zero page
    ASL $A712,X          ; 1E 12 A7 | Arithmetic shift left (absolute,X)
    CPY #$43             ; C0 43 | Compare Y register (immediate)
    BCC $80              ; 90 80 | Branch if carry clear
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    ORA ($09),Y          ; 11 09 | Logical OR with accumulator ((zero page),Y)
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)
    STY $42              ; 84 42 | Hardware register operation
    CLC                  ; 18 | Clear carry flag
    STY $01              ; 84 01 | Store Y register to zero page
    BMI $FC              ; 30 FC | Branch if negative
    AND $29              ; 25 29 | Logical AND with accumulator (zero page)
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $3FEF,X          ; FE EF 3F | Increment (absolute,X)
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1C4
; Address: $C2C320
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1C4:
    JSR $0FE0            ; 20 E0 0F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    BPL $FC              ; 10 FC | Branch if positive
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1C5
; Address: $C2C330
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1C5:
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    BRA $FF              ; 80 FF | Branch always
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1C6
; Address: $C2C341
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1C6:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BEQ $7F              ; F0 7F | Branch if equal
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1C7
; Address: $C2C34C
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1C7:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $0003,X          ; FE 03 00 | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $0207,X          ; FD 07 02 | Subtract with carry (absolute,X)
    BPL $80              ; 10 80 | Branch if positive
    BIT $3E              ; 24 3E | Test bits in accumulator (zero page)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $F8              ; 50 F8 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    CMP #$87             ; C9 87 | Compare accumulator (immediate)
    BMI $80              ; 30 80 | Branch if negative
    BIT $90              ; 24 90 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    ORA #$24             ; 09 24 | Logical OR with accumulator (immediate)
    BCC $40              ; 90 40 | Branch if carry clear
    ORA ($82),Y          ; 11 82 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ROL $83C1            ; 2E C1 83 | Rotate left (absolute)
    DEX                  ; CA | Decrement X register
    BIT $15              ; 24 15 | Test bits in accumulator (zero page)
    ADC $94              ; 65 94 | Add with carry (zero page)
    ADC ($4A,X)          ; 61 4A | Add with carry ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    STY $0E              ; 84 0E | Store Y register to zero page
    BMI $20              ; 30 20 | Branch if negative
    STA ($08,X)          ; 81 08 | Store accumulator to (zero page,X)
    WDM #$07             ; 42 07 | Reserved instruction
    TXA                  ; 8A | Transfer X register to accumulator
    BCC $53              ; 90 53 | Branch if carry clear
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1C8
; Address: $C2C3B2
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1C8:
    JSR $20F0            ; 20 F0 20 | Jump to subroutine
    LSR $28              ; 46 28 | Logical shift right (zero page)
    AND ($85,X)          ; 21 85 | Logical AND with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    LDY $61              ; A4 61 | Load from zero page into Y register
    WDM #$04             ; 42 04 | Reserved instruction
    STA ($07),Y          ; 91 07 | Store accumulator to (zero page),Y
    SBC ($44),Y          ; F1 44 | Subtract with carry ((zero page),Y)
    BPL $42              ; 10 42 | Hardware register operation
    PHP                  ; 08 | Push processor status to stack
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    AND ($09,X)          ; 21 09 | Logical AND with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $23C9,X          ; 1E C9 23 | Arithmetic shift left (absolute,X)
    STA ($04,X)          ; 81 04 | Store accumulator to (zero page,X)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1C9
; Address: $C2C3D3
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1C9:
    JSR $0882            ; 20 82 08 | Jump to subroutine
    WDM #$84             ; 42 84 | Reserved instruction
    CPY #$83             ; C0 83 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    AND ($80,X)          ; 21 80 | Logical AND with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BVS $08              ; 70 08 | Branch if overflow set
    CPY $13              ; C4 13 | Compare Y register (zero page)
    WDM #$08             ; 42 08 | Reserved instruction
    ROL $80              ; 26 80 | Rotate left (zero page)
    STY $0F              ; 84 0F | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    ORA ($27,X)          ; 01 27 | Logical OR with accumulator ((zero page,X))
    BVS $8E              ; 70 8E | Branch if overflow set
    BPL $40              ; 10 40 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1CA
; Address: $C2C3FD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1CA:
    JSR $F881            ; 20 81 F8 | Jump to subroutine
    ADC ($11,X)          ; 61 11 | Add with carry ((zero page,X))
    EOR $C0              ; 45 C0 | Exclusive OR with accumulator (zero page)
    ORA #$9C             ; 09 9C | Logical OR with accumulator (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BPL $48              ; 10 48 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1CC
; Address: $C2C413
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1CC:
    JSL $044108          ; 22 08 41 04 | Jump to subroutine long
    ADC ($68),Y          ; 71 68 | Add with carry ((zero page),Y)
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1CD
; Address: $C2C421
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1CD:
    RTI                  ; 40 | Return from interrupt
    BMI $01              ; 30 01 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1CE
; Address: $C2C42C
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1CE:
    ORA $105C,Y          ; 19 5C 10 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    LDY $90              ; A4 90 | Load from zero page into Y register
    REP #$09             ; C2 09 | Reset processor status bits
    CMP ($03,X)          ; C1 03 | Compare accumulator ((zero page,X))
    BPL $71              ; 10 71 | Branch if positive
    BIT $4E              ; 24 4E | Test bits in accumulator (zero page)
    CPX #$81             ; E0 81 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    BPL $40              ; 10 40 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STY $3C              ; 84 3C | Store Y register to zero page
    ROL                  ; 2A | Rotate left (accumulator)
    STA $A268,Y          ; 99 68 A2 | Store accumulator to absolute,Y
    ORA #$2B             ; 09 2B | Logical OR with accumulator (immediate)
    CMP $0413            ; CD 13 04 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1CF
; Address: $C2C452
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1CF:
    JSR $8040            ; 20 40 80 | Jump to subroutine
    STA ($05,X)          ; 81 05 | Store accumulator to (zero page,X)
    ORA ($44),Y          ; 11 44 | Logical OR with accumulator ((zero page),Y)
    BPL $81              ; 10 81 | Branch if positive
    BNE $C1              ; D0 C1 | Branch if not equal
    ROL $FF70,X          ; 3E 70 FF | Rotate left (absolute,X)
    BPL $80              ; 10 80 | Branch if positive
    BVC $00              ; 50 00 | Branch if overflow clear
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1D0
; Address: $C2C46B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1D0:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1D2
; Address: $C2C472
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1D2:
    BPL $40              ; 10 40 | Branch if positive
    CPY #$C2             ; C0 C2 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    BCC $21              ; 90 21 | PPU graphics register access
    STX $14              ; 86 14 | Store X register to zero page
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    ASL $E0              ; 06 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BPL $80              ; 10 80 | Branch if positive
    BPL $FE              ; 10 FE | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BPL $80              ; 10 80 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1D4
; Address: $C2C4AB
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1D4:
    BRA $FF              ; 80 FF | Branch always
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1D5
; Address: $C2C4B0
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1D5:
    BRA $01              ; 80 01 | Branch always
    INC $960F,X          ; FE 0F 96 | Increment (absolute,X)
    BIT $49              ; 24 49 | Test bits in accumulator (zero page)
    STA ($A4),Y          ; 91 A4 | Store accumulator to (zero page),Y
    BVC $4A              ; 50 4A | Branch if overflow clear
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $01              ; 80 01 | Branch always
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    STY $04              ; 84 04 | Store Y register to zero page
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVS $10              ; 70 10 | Branch if overflow set
    ORA ($24),Y          ; 11 24 | Logical OR with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    BVS $E0              ; 70 E0 | Game work RAM access
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BPL $70              ; 10 70 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BPL $20              ; 10 20 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BMI $60              ; 30 60 | Branch if negative
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1D6
; Address: $C2C502
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1D6:
    JSR $0180            ; 20 80 01 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    AND ($42,X)          ; 21 42 | Hardware register operation
    STY $08              ; 84 08 | Store Y register to zero page
    ORA ($24),Y          ; 11 24 | Logical OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    LDY #$83             ; A0 83 | Load immediate value into Y register
    STY $7F01            ; 8C 01 7F | Store Y register to absolute address
    BCC $4F              ; 90 4F | Branch if carry clear
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BVC $10              ; 50 10 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1D7
; Address: $C2C51D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1D7:
    RTI                  ; 40 | Return from interrupt
    BMI $28              ; 30 28 | Branch if negative
    LDX #$20             ; A2 20 | Load immediate value into X register
    BPL $14              ; 10 14 | Branch if positive
    BMI $08              ; 30 08 | Branch if negative
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BRA $1C              ; 80 1C | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1D8
; Address: $C2C54F
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1D8:
    JSL $1A4162          ; 22 62 41 1A | Jump to subroutine long
    BIT $41              ; 24 41 | Test bits in accumulator (zero page)
    BIT $41              ; 24 41 | Test bits in accumulator (zero page)
    BIT $41              ; 24 41 | Test bits in accumulator (zero page)
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    REP #$F9             ; C2 F9 | Reset processor status bits
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    STA ($1E,X)          ; 81 1E | Store accumulator to (zero page,X)
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    ORA #$0C             ; 09 0C | Logical OR with accumulator (immediate)
    ASL $90              ; 06 90 | Arithmetic shift left (zero page)
    AND #$68             ; 29 68 | Logical AND with accumulator (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1D9
; Address: $C2C57B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1D9:
    JSR $8208            ; 20 08 82 | Jump to subroutine
    CPX #$08             ; E0 08 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    ORA #$4C             ; 09 4C | Logical OR with accumulator (immediate)
    ASL $90              ; 06 90 | Arithmetic shift left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA #$67             ; 09 67 | Logical OR with accumulator (immediate)
    BPL $0C              ; 10 0C | Branch if positive
    LDX #$20             ; A2 20 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    STY $40              ; 84 40 | Store Y register to zero page
    BPL $04              ; 10 04 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1DA
; Address: $C2C592
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1DA:
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    ASL $90              ; 06 90 | Arithmetic shift left (zero page)
    AND $8E69,Y          ; 39 69 8E | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1DB
; Address: $C2C59C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1DB:
    JSR $9388            ; 20 88 93 | Jump to subroutine
    CPX #$08             ; E0 08 | Compare X register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    ORA #$4C             ; 09 4C | Logical OR with accumulator (immediate)
    STA $50              ; 85 50 | Store accumulator to zero page
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    INC $0020,X          ; FE 20 00 | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1DE
; Address: $C2C5C3
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1DE:
    JSR $0208            ; 20 08 02 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BMI $05              ; 30 05 | Branch if negative
    BVC $00              ; 50 00 | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    STA $800800          ; 8F 00 08 80 | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    REP #$FF             ; C2 FF | Reset processor status bits
    BPL $02              ; 10 02 | Branch if positive
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1DF
; Address: $C2C5F9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1DF:
    JSR $0400            ; 20 00 04 | Jump to subroutine
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    CPY #$05             ; C0 05 | Compare Y register (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    STY $20              ; 84 20 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1E0
; Address: $C2C60B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1E0:
    PHP                  ; 08 | Push processor status to stack
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $05              ; 70 05 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1E1
; Address: $C2C616
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1E1:
    JSR $03F0            ; 20 F0 03 | Jump to subroutine
    ADC ($10,X)          ; 61 10 | Add with carry ((zero page,X))
    STA ($90,X)          ; 81 90 | Store accumulator to (zero page,X)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1E2
; Address: $C2C620
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1E2:
    JSR $0400            ; 20 00 04 | Jump to subroutine
    BRA $01              ; 80 01 | Branch always
    CPX #$05             ; E0 05 | Compare X register (immediate)
    BVC $3F              ; 50 3F | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    EOR #$88             ; 49 88 | Exclusive OR with accumulator (immediate)
    STY $44              ; 84 44 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    BPL $81              ; 10 81 | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    WDM #$20             ; 42 20 | Reserved instruction

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1E3
; Address: $C2C657
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1E3:
    JSL $240240          ; 22 40 02 24 | Jump to subroutine long
    BRA $06              ; 80 06 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    ORA $10E1,Y          ; 19 E1 10 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    WDM #$20             ; 42 20 | Reserved instruction

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1E4
; Address: $C2C669
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1E4:
    JSL $240240          ; 22 40 02 24 | Jump to subroutine long
    BRA $05              ; 80 05 | Branch always
    BVC $80              ; 50 80 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    STA ($E0,X)          ; 81 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1E5
; Address: $C2C67C
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1E5:
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    STA $800800          ; 8F 00 08 80 | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $06              ; F0 06 | Branch if equal
    BCC $00              ; 90 00 | Branch if carry clear
    SBC $00EF,Y          ; F9 EF 00 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BPL $84              ; 10 84 | Branch if positive
    BRA $04              ; 80 04 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1E6
; Address: $C2C6B1
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1E6:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    EOR $50              ; 45 50 | Exclusive OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    WDM #$24             ; 42 24 | Reserved instruction
    BIT $44              ; 24 44 | Test bits in accumulator (zero page)
    WDM #$08             ; 42 08 | Reserved instruction
    LSR $90              ; 46 90 | Logical shift right (zero page)
    EOR #$E0             ; 49 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    WDM #$24             ; 42 24 | Reserved instruction
    BIT $44              ; 24 44 | Test bits in accumulator (zero page)
    WDM #$08             ; 42 08 | Reserved instruction
    JMP $FC48            ; 4C 48 FC | Jump to address
    WDM #$88             ; 42 88 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $54              ; A5 54 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    SBC $33BF,X          ; FD BF 33 | Subtract with carry (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1E7
; Address: $C2C6FB
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1E7:
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$4A             ; 29 4A | Logical AND with accumulator (immediate)
    EOR ($28),Y          ; 51 28 | Exclusive OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $A2              ; 85 A2 | Store accumulator to zero page
    INX                  ; E8 | Increment X register
    LDX $8A28,Y          ; BE 28 8A | Load from absolute,Y into X register
    LDX #$28             ; A2 28 | Load immediate value into X register
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    WDM #$08             ; 42 08 | Reserved instruction
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    EOR ($14),Y          ; 51 14 | Exclusive OR with accumulator ((zero page),Y)
    EOR $D1              ; 45 D1 | Exclusive OR with accumulator (zero page)
    EOR ($1C,X)          ; 41 1C | Exclusive OR with accumulator ((zero page,X))
    CMP ($99,X)          ; C1 99 | Compare accumulator ((zero page,X))
    AND $16              ; 25 16 | Logical AND with accumulator (zero page)
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1E9
; Address: $C2C737
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1E9:
    RTI                  ; 40 | Return from interrupt
    BMI $01              ; 30 01 | Branch if negative
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    EOR #$E8             ; 49 E8 | Exclusive OR with accumulator (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    PLP                  ; 28 | Pull processor status from stack
    SEP #$10             ; E2 10 | Set processor status bits
    BRA $06              ; 80 06 | Branch always
    BIT $90              ; 24 90 | Test bits in accumulator (zero page)
    BRA $01              ; 80 01 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1EA
; Address: $C2C755
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1EA:
    RTI                  ; 40 | Return from interrupt
    BMI $01              ; 30 01 | Branch if negative
    BPL $40              ; 10 40 | Branch if positive
    BEQ $3F              ; F0 3F | Branch if equal
    BMI $C0              ; 30 C0 | Branch if negative
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    BCC $40              ; 90 40 | Branch if carry clear
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1EB
; Address: $C2C76D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1EB:
    JSR $E080            ; 20 80 E0 | Game work RAM access
    BPL $40              ; 10 40 | Branch if positive
    BEQ $01              ; F0 01 | Branch if equal
    INC $2008,X          ; FE 08 20 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    AND ($84,X)          ; 21 84 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1ED
; Address: $C2C78A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1ED:
    BMI $0E              ; 30 0E | Branch if negative
    CPX #$03             ; E0 03 | Compare X register (immediate)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BPL $FC              ; 10 FC | Branch if positive
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1EF
; Address: $C2C799
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1EF:
    JSR $2008            ; 20 08 20 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1F1
; Address: $C2C7A8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1F1:
    JSR $04FF            ; 20 FF 04 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    STA ($04,X)          ; 81 04 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1F2
; Address: $C2C7B2
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1F2:
    JSR $0481            ; 20 81 04 | Jump to subroutine
    BNE $81              ; D0 81 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    LDY #$80             ; A0 80 | Load immediate value into Y register
    INC $0803,X          ; FE 03 08 | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BVS $40              ; 70 40 | Branch if overflow set
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BPL $A0              ; 10 A0 | Branch if positive
    BRA $02              ; 80 02 | Branch always
    ORA #$44             ; 09 44 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    AND ($48,X)          ; 21 48 | Logical AND with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDA ($FF,X)          ; A1 FF | Load from (zero page,X) into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    LDY #$80             ; A0 80 | Load immediate value into Y register
    INC $0843,X          ; FE 43 08 | Increment (absolute,X)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    BPL $40              ; 10 40 | Branch if positive
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BPL $A0              ; 10 A0 | Branch if positive
    BRA $02              ; 80 02 | Branch always
    ORA #$44             ; 09 44 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    AND ($48,X)          ; 21 48 | Logical AND with accumulator ((zero page,X))
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    STY $84              ; 84 84 | Store Y register to zero page
    CPY $6028            ; CC 28 60 | Compare Y register (absolute)
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1F3
; Address: $C2C7FD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1F3:
    STX $86              ; 86 86 | Store X register to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPY $04              ; C4 04 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1F4
; Address: $C2C80C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1F4:
    JSR $3F20            ; 20 20 3F | Jump to subroutine
    ADC ($41,X)          ; 61 41 | Add with carry ((zero page,X))
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    CLC                  ; 18 | Clear carry flag
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1F5
; Address: $C2C819
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1F5:
    JSR $613F            ; 20 3F 61 | Jump to subroutine
    EOR ($81,X)          ; 41 81 | Exclusive OR with accumulator ((zero page,X))
    ORA $020E,Y          ; 19 0E 02 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CPX #$85             ; E0 85 | Compare X register (immediate)
    STA $80              ; 85 80 | Store accumulator to zero page
    BRA $80              ; 80 80 | Branch always
    CPX #$98             ; E0 98 | Compare X register (immediate)
    STX $80              ; 86 80 | Store X register to zero page
    BRA $80              ; 80 80 | Branch always
    BRA $20              ; 80 20 | Branch always
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    SBC ($07),Y          ; F1 07 | Subtract with carry ((zero page),Y)
    SBC ($8E,X)          ; E1 8E | Subtract with carry ((zero page,X))
    PEA #$103F           ; F4 3F 10 | Push effective address to stack
    SBC $440F,Y          ; F9 0F 44 | Subtract with carry (absolute,Y)
    INC $D103,X          ; FE 03 D1 | Increment (absolute,X)
    BVC $AA              ; 50 AA | Branch if overflow clear
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $D1              ; 06 D1 | Arithmetic shift left (zero page)
    BRA $F0              ; 80 F0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BPL $81              ; 10 81 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $84              ; 10 84 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1F6
; Address: $C2C85B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1F6:
    JSR $1104            ; 20 04 11 | Jump to subroutine
    BNE $80              ; D0 80 | Branch if not equal
    INX                  ; E8 | Increment X register
    BPL $88              ; 10 88 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BPL $80              ; 10 80 | Branch if positive
    STA $A3F7E2          ; 8F E2 F7 A3 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    SBC $4600,X          ; FD 00 46 | Subtract with carry (absolute,X)
    BCS $BF              ; B0 BF | Branch if carry set
    AND ($8C),Y          ; 31 8C | Logical AND with accumulator ((zero page),Y)
    BIT $67              ; 24 67 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1F8
; Address: $C2C886
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1F8:
    JSR $1102            ; 20 02 11 | Jump to subroutine
    EOR #$48             ; 49 48 | Exclusive OR with accumulator (immediate)
    WDM #$12             ; 42 12 | Reserved instruction
    NOP                  ; EA | No operation
    STA $826BF8          ; 8F F8 6B 82 | Store accumulator to absolute long address
    EOR ($F4),Y          ; 51 F4 | Exclusive OR with accumulator ((zero page),Y)
    LDA ($E0,X)          ; A1 E0 | Game work RAM access
    LDA                  ; BF 29 4A 49 | Load from absolute long,X into accumulator
    STA ($86),Y          ; 91 86 | Store accumulator to (zero page),Y
    PLA                  ; 68 | Pull accumulator from stack
    BRA $64              ; 80 64 | Branch always
    LDY $C0              ; A4 C0 | Load from zero page into Y register
    BRA $00              ; 80 00 | Branch always
    BPL $44              ; 10 44 | Branch if positive
    BPL $A1              ; 10 A1 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    WDM #$12             ; 42 12 | Reserved instruction

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1F9
; Address: $C2C8B4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1F9:
    JSR $C100            ; 20 00 C1 | Jump to subroutine
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1FA
; Address: $C2C8BE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1FA:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    INC $7FF1,X          ; FE F1 7F | Increment (absolute,X)
    BMI $A0              ; 30 A0 | Branch if negative
    STA ($14,X)          ; 81 14 | Store accumulator to (zero page,X)
    LDX #$10             ; A2 10 | Load immediate value into X register
    EOR #$88             ; 49 88 | Exclusive OR with accumulator (immediate)
    WDM #$08             ; 42 08 | Reserved instruction
    BPL $80              ; 10 80 | Branch if positive
    INC $9013,X          ; FE 13 90 | Increment (absolute,X)
    STX $25C4            ; 8E C4 25 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1FB
; Address: $C2C8DB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1FB:
    JSL $4AA97D          ; 22 7D A9 4A | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    INC                  ; 1A | Increment accumulator
    CMP ($8E),Y          ; D1 8E | Compare accumulator ((zero page),Y)
    PHX                  ; DA | Push X register to stack
    SBC $28FD,Y          ; F9 FD 28 | Subtract with carry (absolute,Y)
    ROR $8A3F,X          ; 7E 3F 8A | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1FC
; Address: $C2C8F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1FC:
    STA $44CF,Y          ; 99 CF 44 | Store accumulator to absolute,Y
    INC $77              ; E6 77 | Increment (zero page)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1FD
; Address: $C2C8FB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1FD:
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    LSR $B1              ; 46 B1 | Logical shift right (zero page)
    LDA                  ; BF 91 8C 68 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1FE
; Address: $C2C908
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1FE:
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    INC $8443,X          ; FE 43 84 | Increment (absolute,X)
    BPL $F1              ; 10 F1 | Branch if positive
    STZ $18              ; 64 18 | Store zero to zero page
    ROR $C0              ; 66 C0 | Rotate right (zero page)
    INC $FFFB,X          ; FE FB FF | Increment (absolute,X)
    LDA                  ; BF 7F FC EF | Load from absolute long,X into accumulator
    LDX $FFF9,Y          ; BE F9 FF | Load from absolute,Y into X register
    SBC $7FF7,X          ; FD F7 7F | Subtract with carry (absolute,X)
    BPL $80              ; 10 80 | Branch if positive
    BMI $60              ; 30 60 | Branch if negative
    STA ($08,X)          ; 81 08 | Store accumulator to (zero page,X)
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive
    BVC $80              ; 50 80 | Branch if overflow clear
    REP #$24             ; C2 24 | Reset processor status bits
    BIT $1181            ; 2C 81 11 | Test bits in accumulator (absolute)
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    LDX #$10             ; A2 10 | Load immediate value into X register
    STA ($48,X)          ; 81 48 | Store accumulator to (zero page,X)
    ASL $3FE2,X          ; 1E E2 3F | Arithmetic shift left (absolute,X)
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    INC $C103,X          ; FE 03 C1 | Increment (absolute,X)
    SBC ($80,X)          ; E1 80 | Subtract with carry ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $0418            ; 8C 18 04 | Store Y register to absolute address
    INC $0881,X          ; FE 81 08 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_1FF
; Address: $C2C95D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_1FF:
    JSR $9102            ; 20 02 91 | Jump to subroutine
    ASL $8050            ; 0E 50 80 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_200
; Address: $C2C969
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_200:
    PEA #$00FF           ; F4 FF 00 | Push effective address to stack
    ASL $B0              ; 06 B0 | Arithmetic shift left (zero page)
    LDA                  ; BF 05 2D 68 | Load from absolute long,X into accumulator
    EOR ($0B,X)          ; 41 0B | Exclusive OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    BPL $84              ; 10 84 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_201
; Address: $C2C97E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_201:
    JSR $2534            ; 20 34 25 | Jump to subroutine
    AND #$51             ; 29 51 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    WDM #$28             ; 42 28 | Reserved instruction

;------------------------------------------------------------------------------
; Bank04_DmaFunction_202
; Address: $C2C986
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_202:
    JSL $071191          ; 22 91 11 07 | Jump to subroutine long
    SBC $7E28,X          ; FD 28 7E | Subtract with carry (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_203
; Address: $C2C993
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_203:
    ROL $D8A3,X          ; 3E A3 D8 | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    LSR $71              ; 46 71 | Logical shift right (zero page)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_204
; Address: $C2C99D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_204:
    TAX                  ; AA | Transfer accumulator to X register
    STA ($9C),Y          ; 91 9C | Store accumulator to (zero page),Y
    WDM #$D4             ; 42 D4 | Reserved instruction
    LDA $A3F642          ; AF 42 F6 A3 | Load from absolute long address into accumulator
    BPL $FD              ; 10 FD | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    SBC $7E28,X          ; FD 28 7E | Subtract with carry (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_205
; Address: $C2C9B4
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_205:
    ROL $9913,X          ; 3E 13 99 | Rotate left (absolute,X)
    INC $73              ; E6 73 | Increment (zero page)
    BRA $DF              ; 80 DF | Branch always
    STA $A3F7E2          ; 8F E2 F7 A3 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    SBC $4600,X          ; FD 00 46 | Subtract with carry (absolute,X)
    AND ($9F),Y          ; 31 9F | Logical AND with accumulator ((zero page),Y)
    AND ($CC,X)          ; 21 CC | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    EOR $4288,Y          ; 59 88 42 | Hardware register operation
    STY $20              ; 84 20 | Store Y register to zero page
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    BPL $88              ; 10 88 | Branch if positive
    ORA $29              ; 05 29 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ROR $8610,X          ; 7E 10 86 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_206
; Address: $C2C9E3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_206:
    JSR $2204            ; 20 04 22 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    LSR $8210            ; 4E 10 82 | Logical shift right (absolute)
    BPL $E4              ; 10 E4 | Branch if positive
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_207
; Address: $C2C9FF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_207:
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ORA $0F22,X          ; 1D 22 0F | Logical OR with accumulator (absolute,X)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_208
; Address: $C2CA0F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_208:
    BRA $04              ; 80 04 | Branch always
    ROL $D0              ; 26 D0 | Rotate left (zero page)
    STA ($70,X)          ; 81 70 | Store accumulator to (zero page,X)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BCC $7F              ; 90 7F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_20A
; Address: $C2CA22
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_20A:
    PHP                  ; 08 | Push processor status to stack
    INC $020F,X          ; FE 0F 02 | Increment (absolute,X)
    BPL $90              ; 10 90 | Branch if positive
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR ($08),Y          ; 51 08 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    SEP #$1F             ; E2 1F | Set processor status bits
    REP #$27             ; C2 27 | Reset processor status bits
    BRA $00              ; 80 00 | Branch always
    BPL $80              ; 10 80 | Branch if positive
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    INC $4809,X          ; FE 09 48 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $E1              ; 80 E1 | Branch always
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)
    CPX $C1              ; E4 C1 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_20B
; Address: $C2CA61
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_20B:
    JSR $7FF8            ; 20 F8 7F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_20C
; Address: $C2CA69
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_20C:
    JSR $1102            ; 20 02 11 | Jump to subroutine
    AND ($88,X)          ; 21 88 | Logical AND with accumulator ((zero page,X))
    BRA $02              ; 80 02 | Branch always
    INX                  ; E8 | Increment X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)
    CPX $C1              ; E4 C1 | Compare X register (zero page)
    STA $41FFE2          ; 8F E2 FF 41 | Store accumulator to absolute long address
    BEQ $7F              ; F0 7F | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_20D
; Address: $C2CA8C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_20D:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ROR $BF14,X          ; 7E 14 BF | Rotate right (absolute,X)
    STA ($F8,X)          ; 81 F8 | Store accumulator to (zero page,X)
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    EOR $4FAA            ; 4D AA 4F | Exclusive OR with accumulator (absolute)
    LDX #$12             ; A2 12 | Load immediate value into X register
    LDA $8108,Y          ; B9 08 81 | Load from absolute,Y into accumulator
    LDX $8013,Y          ; BE 13 80 | Load from absolute,Y into X register
    BEQ $05              ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_20E
; Address: $C2CAA8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_20E:
    JSR $1F38            ; 20 38 1F | Jump to subroutine
    BRA $0E              ; 80 0E | Branch always
    LDY #$0B             ; A0 0B | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    ROR $9007,X          ; 7E 07 90 | Rotate right (absolute,X)
    ORA $24              ; 05 24 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_20F
; Address: $C2CAB8
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_20F:
    JSR $FFC1            ; 20 C1 FF | Jump to subroutine
    ORA #$48             ; 09 48 | Logical OR with accumulator (immediate)
    EOR ($1B,X)          ; 41 1B | Exclusive OR with accumulator ((zero page,X))
    STA                  ; 9F 03 F6 8F | Store accumulator to absolute long,X
    ASL $BE90,X          ; 1E 90 BE | Arithmetic shift left (absolute,X)
    CMP #$8D             ; C9 8D | Compare accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    LDX #$8A             ; A2 8A | Load immediate value into X register
    AND ($FB,X)          ; 21 FB | Logical AND with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    PLX                  ; FA | Pull X register from stack
    BRA $F2              ; 80 F2 | Branch always
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC $73              ; E5 73 | Subtract with carry (zero page)
    BRA $FF              ; 80 FF | Branch always
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    BCC $80              ; 90 80 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_210
; Address: $C2CAEF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_210:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    BPL $80              ; 10 80 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($88),Y          ; 11 88 | Logical OR with accumulator ((zero page),Y)
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_211
; Address: $C2CAFB
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_211:
    JSL $428811          ; 22 11 88 42 | Hardware register operation
    TYA                  ; 98 | Transfer Y register to accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    AND ($FA),Y          ; 31 FA | Logical AND with accumulator ((zero page),Y)
    LDA                  ; BF 23 80 F7 | Load from absolute long,X into accumulator
    LDY #$38             ; A0 38 | Load immediate value into Y register
    ORA $FC              ; 05 FC | Logical OR with accumulator (zero page)
    ASL $DF00            ; 0E 00 DF | Arithmetic shift left (absolute)
    PHB                  ; 8B | Push data bank register to stack
    LDX $FFF7,Y          ; BE F7 FF | Load from absolute,Y into X register
    STY $21              ; 84 21 | PPU graphics register access
    CPY $0B67            ; CC 67 0B | Compare Y register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    INC $803F,X          ; FE 3F 80 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_212
; Address: $C2CB2A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_212:
    PHP                  ; 08 | Push processor status to stack
    REP #$38             ; C2 38 | Reset processor status bits
    LDX $32              ; A6 32 | Load from zero page into X register
    AND $0D              ; 25 0D | Logical AND with accumulator (zero page)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_214
; Address: $C2CB43
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_214:
    JSR $0901            ; 20 01 09 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    INC $9013,X          ; FE 13 90 | Increment (absolute,X)
    CPX $3F              ; E4 3F | Compare X register (zero page)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ASL $63              ; 06 63 | Arithmetic shift left (zero page)
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    BPL $80              ; 10 80 | Branch if positive
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    LDA ($FF,X)          ; A1 FF | Load from (zero page,X) into accumulator
    RTI                  ; 40 | Return from interrupt
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    INC $C103,X          ; FE 03 C1 | Increment (absolute,X)
    EOR ($F0,X)          ; 41 F0 | Exclusive OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    SEP #$FF             ; E2 FF | Set processor status bits
    BIT #$CC             ; 89 CC | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_215
; Address: $C2CB82
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_215:
    JSL $CF9913          ; 22 13 99 CF | Jump to subroutine long
    ROL $F2              ; 26 F2 | Rotate left (zero page)
    BPL $F8              ; 10 F8 | Branch if positive
    BRA $20              ; 80 20 | Branch always
    STY $20              ; 84 20 | Store Y register to zero page
    BIT #$28             ; 89 28 | Test bits in accumulator (immediate)
    LDA ($02,X)          ; A1 02 | Load from (zero page,X) into accumulator
    PHA                  ; 48 | Push accumulator to stack
    AND $3FE8,X          ; 3D E8 3F | Logical AND with accumulator (absolute,X)
    ORA ($E9),Y          ; 11 E9 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_216
; Address: $C2CBA5
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_216:
    JSR $488B            ; 20 8B 48 | Jump to subroutine
    STA $0107FF          ; 8F FF 07 01 | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    INC $C21F,X          ; FE 1F C2 | Increment (absolute,X)
    BPL $96              ; 10 96 | Branch if positive
    LDY $25              ; A4 25 | Load from zero page into Y register
    SBC $006F            ; ED 6F 00 | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $84              ; 10 84 | Branch if positive
    BMI $84              ; 30 84 | Branch if negative
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    REP #$10             ; C2 10 | Reset processor status bits
    INC $803F,X          ; FE 3F 80 | Increment (absolute,X)
    BIT $21              ; 24 21 | PPU graphics register access
    ORA #$49             ; 09 49 | Logical OR with accumulator (immediate)
    INC $124F,X          ; FE 4F 12 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_217
; Address: $C2CBD4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_217:
    BCC $84              ; 90 84 | Branch if carry clear
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INC $3FE3,X          ; FE E3 3F | Increment (absolute,X)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INC $0103,X          ; FE 03 01 | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    WDM #$FF             ; 42 FF | Reserved instruction
    STA ($E0,X)          ; 81 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank04_DmaFunction_21A
; Address: $C2CBF8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_21A:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $820F,X          ; FE 0F 82 | Increment (absolute,X)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BEQ $9F              ; F0 9F | Branch if equal
    DEY                  ; 88 | Decrement Y register
    CPX $3F              ; E4 3F | Compare X register (zero page)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    BPL $00              ; 10 00 | Branch if positive
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_21B
; Address: $C2CC1B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_21B:
    DEY                  ; 88 | Decrement Y register
    REP #$00             ; C2 00 | Reset processor status bits
    SED                  ; F8 | Set decimal mode flag
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_21C
; Address: $C2CC24
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_21C:
    JSR $3FF8            ; 20 F8 3F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive
    BPL $81              ; 10 81 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_21D
; Address: $C2CC33
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_21D:
    JSR $2FF4            ; 20 F4 2F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    WDM #$10             ; 42 10 | Reserved instruction
    BPL $84              ; 10 84 | Branch if positive
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BPL $80              ; 10 80 | Branch if positive
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    INC $9113,X          ; FE 13 91 | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_21E
; Address: $C2CC56
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_21E:
    JSL $0FF911          ; 22 11 F9 0F | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    AND ($FB,X)          ; 21 FB | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA ($F0),Y          ; 91 F0 | Store accumulator to (zero page),Y
    ROL $2124,X          ; 3E 24 21 | PPU graphics register access
    SBC ($08),Y          ; F1 08 | Subtract with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_220
; Address: $C2CC71
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_220:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 80 04 24 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_221
; Address: $C2CC7C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_221:
    JSR $0901            ; 20 01 09 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    INC $7FFF,X          ; FE FF 7F | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    STZ $3A              ; 64 3A | Store zero to zero page
    REP #$12             ; C2 12 | Reset processor status bits
    LDA ($02,X)          ; A1 02 | Load from (zero page,X) into accumulator
    ORA #$48             ; 09 48 | Logical OR with accumulator (immediate)
    CPX $C3              ; E4 C3 | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_222
; Address: $C2CC95
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_222:
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    REP #$20             ; C2 20 | Reset processor status bits
    LSR $31              ; 46 31 | Logical shift right (zero page)
    STA ($07),Y          ; 91 07 | Store accumulator to (zero page),Y
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F 80 44 A4 | Store accumulator to absolute long,X
    ORA ($E9),Y          ; 11 E9 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_224
; Address: $C2CCB3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_224:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPX #$03             ; E0 03 | Compare X register (immediate)
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_225
; Address: $C2CCBE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_225:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_228
; Address: $C2CCD7
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_228:
    JSR $2100            ; 20 00 21 | PPU graphics register access
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    ORA $2A              ; 05 2A | Logical OR with accumulator (zero page)
    BVC $80              ; 50 80 | Branch if overflow clear
    STY $20              ; 84 20 | Store Y register to zero page
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ROR $0A              ; 66 0A | Rotate right (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    DEC $C2              ; C6 C2 | Decrement (zero page)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BPL $80              ; 10 80 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $40              ; 50 40 | Branch if overflow clear
    EOR ($06,X)          ; 41 06 | Exclusive OR with accumulator ((zero page,X))
    BRA $F9              ; 80 F9 | Branch always
    JMP $2264            ; 4C 64 22 | Jump to address
    STA $00CF,Y          ; 99 CF 00 | Store accumulator to absolute,Y
    ASL $70              ; 06 70 | Arithmetic shift left (zero page)
    BRA $FF              ; 80 FF | Branch always
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    INC $C21F,X          ; FE 1F C2 | Increment (absolute,X)
    STY $29              ; 84 29 | Store Y register to zero page
    AND $0865            ; 2D 65 08 | Logical AND with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $FE              ; 10 FE | Branch if positive
    STA $30F808          ; 8F 08 F8 30 | Store accumulator to absolute long address
    CPX #$3C             ; E0 3C | Compare X register (immediate)
    WDM #$81             ; 42 81 | Reserved instruction
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    STA ($42,X)          ; 81 42 | Hardware register operation
    BPL $1E              ; 10 1E | Branch if positive
    BVS $14              ; 70 14 | Branch if overflow set
    ROL $A969,X          ; 3E 69 A9 | Rotate left (absolute,X)
    STA ($6A),Y          ; 91 6A | Store accumulator to (zero page),Y
    BPL $1D              ; 10 1D | Branch if positive
    ADC ($10),Y          ; 71 10 | Add with carry ((zero page),Y)
    ASL $5131,X          ; 1E 31 51 | Arithmetic shift left (absolute,X)
    STA ($66),Y          ; 91 66 | Store accumulator to (zero page),Y
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_229
; Address: $C2CD55
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_229:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $91              ; 10 91 | Branch if positive
    BIT #$49             ; 89 49 | Test bits in accumulator (immediate)
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    BMI $20              ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank04_DmaFunction_22A
; Address: $C2CD65
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_22A:
    JSR $F23F            ; 20 3F F2 | Jump to subroutine
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $003F,Y          ; F9 3F 00 | Subtract with carry (absolute,Y)
    INC $E409,X          ; FE 09 E4 | Increment (absolute,X)
    STA                  ; 9F 40 FE 09 | Store accumulator to absolute long,X
    CPX $1F              ; E4 1F | Compare X register (zero page)
    AND ($03,X)          ; 21 03 | Logical AND with accumulator ((zero page,X))
    CMP #$0F             ; C9 0F | Compare accumulator (immediate)
    AND ($86,X)          ; 21 86 | Logical AND with accumulator ((zero page,X))
    WDM #$08             ; 42 08 | Reserved instruction
    LDA                  ; BF 84 14 52 | Load from absolute long,X into accumulator
    DEY                  ; 88 | Decrement Y register
    AND ($FE,X)          ; 21 FE | Logical AND with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    INC $E409,X          ; FE 09 E4 | Increment (absolute,X)
    STA                  ; 9F 40 FE 09 | Store accumulator to absolute long,X
    CPX $9F              ; E4 9F | Compare X register (zero page)
    SBC $8007,Y          ; F9 07 80 | Subtract with carry (absolute,Y)
    SBC $9027,Y          ; F9 27 90 | Subtract with carry (absolute,Y)
    SBC $C847,Y          ; F9 47 C8 | Subtract with carry (absolute,Y)
    CPY #$F1             ; C0 F1 | Compare Y register (immediate)
    EOR $10              ; 45 10 | Exclusive OR with accumulator (zero page)
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    SBC ($05),Y          ; F1 05 | Subtract with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_22B
; Address: $C2CDB8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_22B:
    ORA ($44),Y          ; 11 44 | Logical OR with accumulator ((zero page),Y)
    BPL $41              ; 10 41 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    PLX                  ; FA | Pull X register from stack
    LDA #$A4             ; A9 A4 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$A4             ; A9 A4 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_22C
; Address: $C2CDCC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_22C:
    AND #$BD             ; 29 BD | Logical AND with accumulator (immediate)
    EOR #$08             ; 49 08 | Exclusive OR with accumulator (immediate)
    AND ($E4,X)          ; 21 E4 | Logical AND with accumulator ((zero page,X))
    ORA #$61             ; 09 61 | Logical OR with accumulator (immediate)
    CPY $11              ; C4 11 | Compare Y register (zero page)
    PLX                  ; FA | Pull X register from stack
    EOR #$24             ; 49 24 | Exclusive OR with accumulator (immediate)
    STA ($44),Y          ; 91 44 | Store accumulator to (zero page),Y
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))
    CMP #$24             ; C9 24 | Compare accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_22D
; Address: $C2CDE8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_22D:
    DEC $FF              ; C6 FF | Decrement (zero page)
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    ORA ($C4),Y          ; 11 C4 | Logical OR with accumulator ((zero page),Y)
    ADC $94              ; 65 94 | Add with carry (zero page)
    LSR $1F              ; 46 1F | Logical shift right (zero page)
    SBC $97              ; E5 97 | Subtract with carry (zero page)
    EOR ($46),Y          ; 51 46 | Exclusive OR with accumulator ((zero page),Y)
    WDM #$08             ; 42 08 | Reserved instruction
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BPL $42              ; 10 42 | Hardware register operation
    PHP                  ; 08 | Push processor status to stack
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    ORA ($44),Y          ; 11 44 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_22E
; Address: $C2CE0C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_22E:
    JSR $1909            ; 20 09 19 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    STY $7F              ; 84 7F | Store Y register to zero page
    SBC $9027,Y          ; F9 27 90 | Subtract with carry (absolute,Y)
    SBC $5027,Y          ; F9 27 50 | Subtract with carry (absolute,Y)
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    REP #$DF             ; C2 DF | Reset processor status bits
    EOR ($FD,X)          ; 41 FD | Exclusive OR with accumulator ((zero page,X))
    ORA ($C4),Y          ; 11 C4 | Logical OR with accumulator ((zero page),Y)
    EOR ($05,X)          ; 41 05 | Exclusive OR with accumulator ((zero page,X))
    ORA $90E4,Y          ; 19 E4 90 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    BEQ $81              ; F0 81 | Branch if equal
    INY                  ; C8 | Increment Y register
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    STY $E8              ; 84 E8 | Store Y register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_22F
; Address: $C2CE3C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_22F:
    DEC $82              ; C6 82 | Decrement (zero page)
    ORA ($47),Y          ; 11 47 | Logical OR with accumulator ((zero page),Y)
    BIT #$34             ; 89 34 | Test bits in accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_231
; Address: $C2CE51
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_231:
    JSR $FC80            ; 20 80 FC | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BMI $60              ; 30 60 | Branch if negative
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BEQ $7F              ; F0 7F | Branch if equal
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BIT $48              ; 24 48 | Test bits in accumulator (zero page)
    BCC $3F              ; 90 3F | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_232
; Address: $C2CE75
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_232:
    JSR $07FE            ; 20 FE 07 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BMI $E0              ; 30 E0 | Game work RAM access
    BMI $FE              ; 30 FE | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_233
; Address: $C2CE85
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_233:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    INC $080F,X          ; FE 0F 08 | Increment (absolute,X)
    ORA ($C2,X)          ; 01 C2 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    STY $3FF8            ; 8C F8 3F | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_234
; Address: $C2CE96
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_234:
    JSL $100804          ; 22 04 08 10 | Jump to subroutine long
    BPL $60              ; 10 60 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    BRA $01              ; 80 01 | Branch always
    LDX #$20             ; A2 20 | Load immediate value into X register
    ORA $31              ; 05 31 | Logical OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    STA ($14,X)          ; 81 14 | Store accumulator to (zero page,X)
    BIT $C3              ; 24 C3 | Test bits in accumulator (zero page)
    BRA $08              ; 80 08 | Branch always
    WDM #$10             ; 42 10 | Reserved instruction
    WDM #$10             ; 42 10 | Reserved instruction
    ORA ($48),Y          ; 11 48 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_235
; Address: $C2CEC7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_235:
    RTI                  ; 40 | Return from interrupt
    REP #$FF             ; C2 FF | Reset processor status bits
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_236
; Address: $C2CECE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_236:
    JSR $C100            ; 20 00 C1 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CPY #$13             ; C0 13 | Compare Y register (immediate)
    ASL $0404            ; 0E 04 04 | Arithmetic shift left (absolute)
    STY $E001            ; 8C 01 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank04_DmaFunction_237
; Address: $C2CEDE
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_237:
    JSR $A438            ; 20 38 A4 | Jump to subroutine
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    STA $50              ; 85 50 | Store accumulator to zero page
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    BPL $00              ; 10 00 | Branch if positive
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPX #$53             ; E0 53 | Compare X register (immediate)
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_239
; Address: $C2CF08
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_239:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    LSR $0310            ; 4E 10 03 | Logical shift right (absolute)
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BVC $02              ; 50 02 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    ROR $0020,X          ; 7E 20 00 | Rotate right (absolute,X)
    ASL $0120            ; 0E 20 01 | Arithmetic shift left (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    WDM #$40             ; 42 40 | Reserved instruction
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_23B
; Address: $C2CF3A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_23B:
    JSR $51F0            ; 20 F0 51 | Jump to subroutine
    ORA $80              ; 05 80 | Logical OR with accumulator (zero page)
    STA $002704          ; 8F 04 27 00 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_23C
; Address: $C2CF45
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_23C:
    JSR $0400            ; 20 00 04 | Jump to subroutine
    BRA $01              ; 80 01 | Branch always
    CPX #$01             ; E0 01 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_23D
; Address: $C2CF4D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_23D:
    BPL $00              ; 10 00 | Branch if positive
    AND ($F8,X)          ; 21 F8 | Logical AND with accumulator ((zero page,X))
    WDM #$31             ; 42 31 | Reserved instruction

;------------------------------------------------------------------------------
; Bank04_DmaFunction_23E
; Address: $C2CF53
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_23E:
    JSL $CE5226          ; 22 26 52 CE | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BIT #$52             ; 89 52 | Test bits in accumulator (immediate)
    CMP #$60             ; C9 60 | Compare accumulator (immediate)
    BVC $02              ; 50 02 | Branch if overflow clear
    AND $88              ; 25 88 | Logical AND with accumulator (zero page)
    CPX #$08             ; E0 08 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_23F
; Address: $C2CF65
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_23F:
    JSR $8208            ; 20 08 82 | Jump to subroutine
    CPX #$08             ; E0 08 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    ORA #$4C             ; 09 4C | Logical OR with accumulator (immediate)
    STA $59              ; 85 59 | Store accumulator to zero page
    BVS $08              ; 70 08 | Branch if overflow set
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_241
; Address: $C2CF83
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_241:
    JSR $9388            ; 20 88 93 | Jump to subroutine
    CPX #$08             ; E0 08 | Compare X register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    ORA #$4C             ; 09 4C | Logical OR with accumulator (immediate)
    ORA $56              ; 05 56 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    STY $0830            ; 8C 30 08 | Store Y register to absolute address
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_245
; Address: $C2CFAC
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_245:
    JSR $C200            ; 20 00 C2 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    LDY #$04             ; A0 04 | Load immediate value into Y register
    SEP #$48             ; E2 48 | Set processor status bits
    BEQ $08              ; F0 08 | Branch if equal
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA ($40,X)          ; 81 40 | Store accumulator to (zero page,X)
    BPL $08              ; 10 08 | Branch if positive
    LDX #$12             ; A2 12 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_246
; Address: $C2CFD4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_246:
    BVC $43              ; 50 43 | Branch if overflow clear
    CPY #$0B             ; C0 0B | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_247
; Address: $C2CFE2
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_247:
    JSR $43E0            ; 20 E0 43 | Jump to subroutine
    ORA ($A8,X)          ; 01 A8 | Logical OR with accumulator ((zero page,X))
    STA $100E60          ; 8F 60 0E 10 | Store accumulator to absolute long address
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LSR $0231            ; 4E 31 02 | Logical shift right (absolute)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    SEP #$01             ; E2 01 | Set processor status bits
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    LSR $E131            ; 4E 31 E1 | Logical shift right (absolute)
    ROL $10              ; 26 10 | Rotate left (zero page)
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    STZ $C5A5,X          ; 9E A5 C5 | Store zero to absolute,X
    STX $1008            ; 8E 08 10 | Store X register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    JMP $100200          ; 5C 00 02 10 | Jump to address long
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    ASL $F000,X          ; 1E 00 F0 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_248
; Address: $C2D037
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_248:
    JSR $3FF8            ; 20 F8 3F | Jump to subroutine
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive
    BVS $F0              ; 70 F0 | Branch if overflow set
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_249
; Address: $C2D04B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_249:
    JSR $1100            ; 20 00 11 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_24A
; Address: $C2D05D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_24A:
    BMI $00              ; 30 00 | Branch if negative
    ADC ($02,X)          ; 61 02 | Add with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BCC $1F              ; 90 1F | Branch if carry clear
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    CPX $48              ; E4 48 | Compare X register (zero page)
    BEQ $24              ; F0 24 | Branch if equal
    EOR $C496            ; 4D 96 C4 | Exclusive OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_24B
; Address: $C2D078
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_24B:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    INC $0805,X          ; FE 05 08 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_24C
; Address: $C2D090
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_24C:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($41),Y          ; 11 41 | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_24D
; Address: $C2D0A5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_24D:
    BRA $00              ; 80 00 | Branch always
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BPL $50              ; 10 50 | Branch if positive
    BPL $03              ; 10 03 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    BMI $60              ; 30 60 | Branch if negative
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_24E
; Address: $C2D0C9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_24E:
    JSL $2027FC          ; 22 FC 27 20 | Jump to subroutine long
    ORA #$C8             ; 09 C8 | Logical OR with accumulator (immediate)
    BRA $F8              ; 80 F8 | Branch always
    EOR ($FC,X)          ; 41 FC | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_24F
; Address: $C2D0D7
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_24F:
    BVC $FE              ; 50 FE | Branch if overflow clear
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    SBC $FF1F,X          ; FD 1F FF | Subtract with carry (absolute,X)
    CMP ($1F,X)          ; C1 1F | Compare accumulator ((zero page,X))
    BEQ $01              ; F0 01 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $0204,X          ; 3E 04 02 | Rotate left (absolute,X)
    STA ($40,X)          ; 81 40 | Store accumulator to (zero page,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BPL $40              ; 10 40 | Branch if positive
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_250
; Address: $C2D119
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_250:
    JSR $4102            ; 20 02 41 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    BPL $00              ; 10 00 | Branch if positive
    ASL $90              ; 06 90 | Arithmetic shift left (zero page)
    ORA #$60             ; 09 60 | Logical OR with accumulator (immediate)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_251
; Address: $C2D12D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_251:
    JSR $4102            ; 20 02 41 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank04_DmaFunction_252
; Address: $C2D138
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_252:
    JSR $556F            ; 20 6F 55 | Jump to subroutine
    BVC $F2              ; 50 F2 | Branch if overflow clear
    WDM #$F6             ; 42 F6 | Reserved instruction
    ROL $A242            ; 2E 42 A2 | Rotate left (absolute)
    LDX $24              ; A6 24 | Load from zero page into X register
    ORA $44              ; 05 44 | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    EOR $5D55,X          ; 5D 55 5D | Exclusive OR with accumulator (absolute,X)
    AND $155D            ; 2D 5D 15 | Logical AND with accumulator (absolute)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    LDA $80              ; A5 80 | Load from zero page into accumulator
    ORA #$F4             ; 09 F4 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    STA ($9F,X)          ; 81 9F | Store accumulator to (zero page,X)
    AND #$55             ; 29 55 | Logical AND with accumulator (immediate)
    ADC $61              ; 65 61 | Add with carry (zero page)
    PHB                  ; 8B | Push data bank register to stack
    INC                  ; 1A | Increment accumulator
    RTI                  ; 40 | Return from interrupt
    EOR $70              ; 45 70 | Exclusive OR with accumulator (zero page)
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    BPL $FC              ; 10 FC | Branch if positive
    EOR ($F0,X)          ; 41 F0 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_253
; Address: $C2D196
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_253:
    BEQ $3F              ; F0 3F | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ASL $0B34            ; 0E 34 0B | Arithmetic shift left (absolute)
    BVS $25              ; 70 25 | Branch if overflow set
    BMI $01              ; 30 01 | Branch if negative
    BVC $99              ; 50 99 | Branch if overflow clear
    BMI $1B              ; 30 1B | Branch if negative
    BCC $A1              ; 90 A1 | Branch if carry clear
    BIT $8011            ; 2C 11 80 | Test bits in accumulator (absolute)
    BEQ $40              ; F0 40 | Branch if equal
    BIT $7006            ; 2C 06 70 | Test bits in accumulator (absolute)
    PLB                  ; AB | Pull data bank register from stack
    EOR ($2C,X)          ; 41 2C | Exclusive OR with accumulator ((zero page,X))
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    SBC $41              ; E5 41 | Subtract with carry (zero page)
    BIT $B01B            ; 2C 1B B0 | Test bits in accumulator (absolute)
    CPX $2C41            ; EC 41 2C | Compare X register (absolute)
    LDY #$85             ; A0 85 | Load immediate value into Y register
    BIT $3003            ; 2C 03 30 | Test bits in accumulator (absolute)
    BIT $9003            ; 2C 03 90 | Test bits in accumulator (absolute)
    CMP ($44,X)          ; C1 44 | Compare accumulator ((zero page,X))
    BCC $CC              ; 90 CC | Branch if carry clear
    BCC $DC              ; 90 DC | Branch if carry clear
    BMI $01              ; 30 01 | Branch if negative
    BCC $12              ; 90 12 | Branch if carry clear
    EOR $04              ; 45 04 | Exclusive OR with accumulator (zero page)
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    EOR $04              ; 45 04 | Exclusive OR with accumulator (zero page)
    BVS $15              ; 70 15 | Branch if overflow set
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    BCC $27              ; 90 27 | Branch if carry clear
    EOR $18              ; 45 18 | Exclusive OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    EOR $30              ; 45 30 | Exclusive OR with accumulator (zero page)
    ORA ($A0,X)          ; 01 A0 | Logical OR with accumulator ((zero page,X))
    CPX $1846            ; EC 46 18 | Compare X register (absolute)
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    PEA #$3046           ; F4 46 30 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_255
; Address: $C2D210
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_255:
    PLX                  ; FA | Pull X register from stack
    LSR $34              ; 46 34 | Logical shift right (zero page)
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    ASL $3447            ; 0E 47 34 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_257
; Address: $C2D221
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_257:
    JSR $A00C            ; 20 0C A0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BMI $05              ; 30 05 | Branch if negative
    BRA $F4              ; 80 F4 | Branch always
    BMI $4E              ; 30 4E | Branch if negative
    BCS $30              ; B0 30 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    BMI $06              ; 30 06 | Branch if negative
    BRA $37              ; 80 37 | Branch always
    EOR $0E24            ; 4D 24 0E | Exclusive OR with accumulator (absolute)
    LDY #$6D             ; A0 6D | Load immediate value into Y register
    EOR $0534            ; 4D 34 05 | Exclusive OR with accumulator (absolute)
    BCC $51              ; 90 51 | Branch if carry clear
    LSR $0434            ; 4E 34 04 | Logical shift right (absolute)
    BCS $9B              ; B0 9B | Branch if carry set
    LSR $0328            ; 4E 28 03 | Logical shift right (absolute)
    BVS $D2              ; 70 D2 | Branch if overflow set
    LSR $0D24            ; 4E 24 0D | Logical shift right (absolute)
    CPY #$EA             ; C0 EA | Compare Y register (immediate)
    LSR $032C            ; 4E 2C 03 | Logical shift right (absolute)
    BNE $C1              ; D0 C1 | Branch if not equal
    BIT $8001            ; 2C 01 80 | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    BRA $01              ; 80 01 | Branch always
    BVC $20              ; 50 20 | Branch if overflow clear
    BCS $21              ; B0 21 | PPU graphics register access
    BVC $24              ; 50 24 | Branch if overflow clear
    LDY #$3A             ; A0 3A | Load immediate value into Y register
    BVC $28              ; 50 28 | Branch if overflow clear
    ORA #$90             ; 09 90 | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_258
; Address: $C2D26B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_258:
    BVC $28              ; 50 28 | Branch if overflow clear
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    DEC $50              ; C6 50 | Decrement (zero page)
    SEC                  ; 38 | Set carry flag
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    BVC $1C              ; 50 1C | Branch if overflow clear
    ORA ($D0,X)          ; 01 D0 | Logical OR with accumulator ((zero page,X))
    CPX $50              ; E4 50 | Compare X register (zero page)
    BMI $01              ; 30 01 | Branch if negative
    BVS $F8              ; 70 F8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank04_DmaFunction_259
; Address: $C2D27F
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_259:
    BVC $1C              ; 50 1C | Branch if overflow clear
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BVC $24              ; 50 24 | Branch if overflow clear
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    EOR ($24),Y          ; 51 24 | Exclusive OR with accumulator ((zero page),Y)
    ORA $C0              ; 05 C0 | Logical OR with accumulator (zero page)
    BIT $51              ; 24 51 | Test bits in accumulator (zero page)
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    STX $51              ; 86 51 | Store X register to zero page
    CLC                  ; 18 | Clear carry flag
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    STY $1C51            ; 8C 51 1C | Store Y register to absolute address
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    EOR ($24),Y          ; 51 24 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    STA $3451,X          ; 9D 51 34 | Store accumulator to absolute,X
    PLX                  ; FA | Pull X register from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $0002            ; EE 02 00 | Increment (absolute)
    STZ $0003,X          ; 9E 03 00 | Store zero to absolute,X
    TSX                  ; BA | Transfer stack pointer to X register
    ADC #$05             ; 69 05 | Add with carry (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BIT $09              ; 24 09 | Test bits in accumulator (zero page)
    BMI $0A              ; 30 0A | Branch if negative
    JMP $99000B          ; 5C 0B 00 99 | Jump to address long
    ORA $AE00            ; 0D 00 AE | Logical OR with accumulator (absolute)
    ASL $C500            ; 0E 00 C5 | Arithmetic shift left (absolute)
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    LDA $AD0012          ; AF 12 00 AD | Load from absolute long address into accumulator
    ASL $0017,X          ; 1E 17 00 | Arithmetic shift left (absolute,X)
    ORA $6200,Y          ; 19 00 62 | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY $001D            ; CC 1D 00 | Compare Y register (absolute)
    SBC ($1E),Y          ; F1 1E | Subtract with carry ((zero page),Y)
    INX                  ; E8 | Increment X register
    BIT #$20             ; 89 20 | Test bits in accumulator (immediate)
    ADC ($22,X)          ; 61 22 | Add with carry ((zero page,X))
    EOR $0023            ; 4D 23 00 | Exclusive OR with accumulator (absolute)
    AND #$24             ; 29 24 | Logical AND with accumulator (immediate)
    ROL $00              ; 26 00 | Rotate left (zero page)
    SEP #$28             ; E2 28 | Set processor status bits
    SEC                  ; 38 | Set carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    LSR $002B,X          ; 5E 2B 00 | Logical shift right (absolute,X)
    BIT $C100            ; 2C 00 C1 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_25A
; Address: $C2D323
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_25A:
    AND $9000            ; 2D 00 90 | Logical AND with accumulator (absolute)
    ROL $6C00            ; 2E 00 6C | Rotate left (absolute)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    AND $0032,Y          ; 39 32 00 | Logical AND with accumulator (absolute,Y)
    BVC $D3              ; 50 D3 | Branch if overflow clear
    BVC $C8              ; 50 C8 | Branch if overflow clear
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    BVC $A3              ; 50 A3 | Branch if overflow clear
    BVC $B6              ; 50 B6 | Branch if overflow clear
    BVC $D9              ; 50 D9 | Branch if overflow clear
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    ASL $50              ; 06 50 | Arithmetic shift left (zero page)
    CMP $07              ; C5 07 | Compare accumulator (zero page)
    BVC $82              ; 50 82 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    BVC $4D              ; 50 4D | Branch if overflow clear
    ORA #$50             ; 09 50 | Logical OR with accumulator (immediate)
    LSR $500A,X          ; 5E 0A 50 | Logical shift right (absolute,X)
    AND ($0D),Y          ; 31 0D | Logical AND with accumulator ((zero page),Y)
    BVC $E2              ; 50 E2 | Branch if overflow clear
    ORA $E550            ; 0D 50 E5 | Logical OR with accumulator (absolute)
    ASL $3A50            ; 0E 50 3A | Arithmetic shift left (absolute)
    BPL $50              ; 10 50 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    ORA ($50),Y          ; 11 50 | Logical OR with accumulator ((zero page),Y)
    BIT #$12             ; 89 12 | Test bits in accumulator (immediate)
    BVC $BA              ; 50 BA | Branch if overflow clear
    BVC $FA              ; 50 FA | Branch if overflow clear
    BVC $F9              ; 50 F9 | Branch if overflow clear
    BVC $BC              ; 50 BC | Branch if overflow clear
    BVC $AB              ; 50 AB | Branch if overflow clear
    BVC $9F              ; 50 9F | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    BVC $3A              ; 50 3A | Branch if overflow clear
    ORA $2F50,Y          ; 19 50 2F | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    BVC $4B              ; 50 4B | Branch if overflow clear
    BVC $91              ; 50 91 | Branch if overflow clear
    BVC $5C              ; 50 5C | Branch if overflow clear
    ORA $A150,X          ; 1D 50 A1 | Logical OR with accumulator (absolute,X)
    ASL $AD50,X          ; 1E 50 AD | Arithmetic shift left (absolute,X)
    BVC $ED              ; 50 ED | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_25C
; Address: $C2D392
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_25C:
    JSL $234A50          ; 22 50 4A 23 | Jump to subroutine long
    BVC $19              ; 50 19 | Branch if overflow clear
    BIT $50              ; 24 50 | Test bits in accumulator (zero page)
    INX                  ; E8 | Increment X register
    BIT $50              ; 24 50 | Test bits in accumulator (zero page)
    LDA #$25             ; A9 25 | Load immediate value into accumulator
    BVC $B3              ; 50 B3 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_25D
; Address: $C2D3A1
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_25D:
    ROL $50              ; 26 50 | Rotate left (zero page)
    BVC $DB              ; 50 DB | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    BVC $19              ; 50 19 | Branch if overflow clear
    ROL                  ; 2A | Rotate left (accumulator)
    BVC $18              ; 50 18 | Branch if overflow clear
    BVC $05              ; 50 05 | Branch if overflow clear
    BIT $6D50            ; 2C 50 6D | Test bits in accumulator (absolute)
    BIT $F250            ; 2C 50 F2 | Test bits in accumulator (absolute)
    BIT $8F50            ; 2C 50 8F | Test bits in accumulator (absolute)
    AND $D250            ; 2D 50 D2 | Logical AND with accumulator (absolute)
    AND $8250            ; 2D 50 82 | Logical AND with accumulator (absolute)
    ROL $4150            ; 2E 50 41 | Rotate left (absolute)
    AND ($50),Y          ; 31 50 | Logical AND with accumulator ((zero page),Y)
    BVC $36              ; 50 36 | Branch if overflow clear
    BVC $F2              ; 50 F2 | Branch if overflow clear
    BVC $23              ; 50 23 | Branch if overflow clear
    DEC                  ; 3A | Decrement accumulator
    BVC $40              ; 50 40 | Branch if overflow clear
    BVC $3F              ; 50 3F | Branch if overflow clear
    ROL $1B50,X          ; 3E 50 1B | Rotate left (absolute,X)
    EOR ($50,X)          ; 41 50 | Exclusive OR with accumulator ((zero page,X))
    WDM #$50             ; 42 50 | Reserved instruction
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $50              ; 45 50 | Exclusive OR with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    BVC $9F              ; 50 9F | Branch if overflow clear
    JMP $B450            ; 4C 50 B4 | Jump to address
    BVC $BB              ; 50 BB | Branch if overflow clear
    BVC $41              ; 50 41 | Branch if overflow clear
    EOR $C850,Y          ; 59 50 C8 | Exclusive OR with accumulator (absolute,Y)
    BVC $60              ; 50 60 | Branch if overflow clear
    LSR $E150,X          ; 5E 50 E1 | Logical shift right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_25E
; Address: $C2D3F6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_25E:
    BVC $6F              ; 50 6F | Branch if overflow clear
    BVC $97              ; 50 97 | Branch if overflow clear
    ROR $50              ; 66 50 | Rotate right (zero page)
    BIT $68              ; 24 68 | Test bits in accumulator (zero page)
    BVC $AA              ; 50 AA | Branch if overflow clear
    ADC #$50             ; 69 50 | Add with carry (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_25F
; Address: $C2D405
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_25F:
    BVC $D9              ; 50 D9 | Branch if overflow clear
    JMP ($9B50)          ; 6C 50 9B | Jump to address (absolute indirect)
    ROR $1D50            ; 6E 50 1D | Rotate right (absolute)
    ADC ($50),Y          ; 71 50 | Add with carry ((zero page),Y)
    BVC $34              ; 50 34 | Branch if overflow clear
    BVC $79              ; 50 79 | Branch if overflow clear
    BVC $BF              ; 50 BF | Branch if overflow clear
    ADC $FD50,Y          ; 79 50 FD | Add with carry (absolute,Y)
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_260
; Address: $C2D41D
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_260:
    BVC $F1              ; 50 F1 | Branch if overflow clear
    BVC $35              ; 50 35 | Branch if overflow clear
    BVC $33              ; 50 33 | Branch if overflow clear
    STA ($50,X)          ; 81 50 | Store accumulator to (zero page,X)
    STA ($83,X)          ; 81 83 | Store accumulator to (zero page,X)
    BVC $8C              ; 50 8C | Branch if overflow clear
    STA $50              ; 85 50 | Store accumulator to zero page
    DEY                  ; 88 | Decrement Y register
    BVC $16              ; 50 16 | Branch if overflow clear
    PHB                  ; 8B | Push data bank register to stack
    BVC $1E              ; 50 1E | Branch if overflow clear
    STA $C650            ; 8D 50 C6 | Store accumulator to absolute address
    STA $921C50          ; 8F 50 1C 92 | Store accumulator to absolute long address
    BVC $6D              ; 50 6D | Branch if overflow clear
    BVC $91              ; 50 91 | Branch if overflow clear
    BVC $CC              ; 50 CC | Branch if overflow clear
    TYA                  ; 98 | Transfer Y register to accumulator
    BVC $D6              ; 50 D6 | Branch if overflow clear
    STA $0550,Y          ; 99 50 05 | Store accumulator to absolute,Y
    BVC $45              ; 50 45 | Branch if overflow clear
    STA $3450,X          ; 9D 50 34 | Store accumulator to absolute,X
    STA                  ; 9F 50 F1 A1 | Store accumulator to absolute long,X
    BVC $4D              ; 50 4D | Branch if overflow clear
    LDY $50              ; A4 50 | Load from zero page into Y register
    LDA ($A6,X)          ; A1 A6 | Load from (zero page,X) into accumulator
    BVC $86              ; 50 86 | Branch if overflow clear
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    PLB                  ; AB | Pull data bank register from stack
    BVC $87              ; 50 87 | Branch if overflow clear
    LDX $DE50            ; AE 50 DE | Load from absolute address into X register
    BCS $50              ; B0 50 | Branch if carry set
    LDA ($50),Y          ; B1 50 | Load from (zero page),Y into accumulator
    ADC #$B3             ; 69 B3 | Add with carry (immediate)
    BVC $6B              ; 50 6B | Branch if overflow clear
    BVC $1F              ; 50 1F | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    BVC $18              ; 50 18 | Branch if overflow clear
    BVC $33              ; 50 33 | Branch if overflow clear
    LDA $4A50,X          ; BD 50 4A | Load from absolute,X into accumulator
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    STA ($C2,X)          ; 81 C2 | Store accumulator to (zero page,X)
    BVC $CE              ; 50 CE | Branch if overflow clear
    CPY $50              ; C4 50 | Compare Y register (zero page)
    DEC $50              ; C6 50 | Decrement (zero page)
    INY                  ; C8 | Increment Y register
    BVC $34              ; 50 34 | Branch if overflow clear
    BVC $25              ; 50 25 | Branch if overflow clear
    DEC $9C50            ; CE 50 9C | Decrement (absolute)
    BNE $50              ; D0 50 | Branch if not equal
    BVC $10              ; 50 10 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank04_DmaFunction_261
; Address: $C2D495
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_261:
    BVC $C4              ; 50 C4 | Branch if overflow clear
    CLD                  ; D8 | Clear decimal mode flag
    BVC $D9              ; 50 D9 | Branch if overflow clear
    PHX                  ; DA | Push X register to stack
    BVC $78              ; 50 78 | Branch if overflow clear
    BVC $A8              ; 50 A8 | Branch if overflow clear
    SEP #$50             ; E2 50 | Set processor status bits
    LDX $50E4,Y          ; BE E4 50 | Load from absolute,Y into X register
    EOR ($E8),Y          ; 51 E8 | Exclusive OR with accumulator ((zero page),Y)
    BVC $60              ; 50 60 | Branch if overflow clear
    XBA                  ; EB | Exchange accumulator bytes
    BVC $E1              ; 50 E1 | Branch if overflow clear
    SBC $0D50            ; ED 50 0D | Subtract with carry (absolute)
    BEQ $50              ; F0 50 | Branch if equal
    EOR ($F2),Y          ; 51 F2 | Exclusive OR with accumulator ((zero page),Y)
    BVC $B5              ; 50 B5 | Branch if overflow clear
    PEA #$E650           ; F4 50 E6 | Push effective address to stack
    BVC $84              ; 50 84 | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    BVC $C4              ; 50 C4 | Branch if overflow clear
    PLX                  ; FA | Pull X register from stack
    BVC $4C              ; 50 4C | Branch if overflow clear
    BVC $B3              ; 50 B3 | Branch if overflow clear
    INC $4450,X          ; FE 50 44 | Increment (absolute,X)
    EOR ($E1),Y          ; 51 E1 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($2F),Y          ; 51 2F | Exclusive OR with accumulator ((zero page),Y)
    EOR ($73),Y          ; 51 73 | Exclusive OR with accumulator ((zero page),Y)
    ASL $51              ; 06 51 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    EOR ($E0),Y          ; 51 E0 | Game work RAM access
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR ($1F),Y          ; 51 1F | Exclusive OR with accumulator ((zero page),Y)
    ORA $6951            ; 0D 51 69 | Logical OR with accumulator (absolute)
    EOR ($13),Y          ; 51 13 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($51),Y          ; 11 51 | Logical OR with accumulator ((zero page),Y)
    EOR ($DD),Y          ; 51 DD | Exclusive OR with accumulator ((zero page),Y)
    EOR ($6A),Y          ; 51 6A | Exclusive OR with accumulator ((zero page),Y)
    EOR ($8B),Y          ; 51 8B | Exclusive OR with accumulator ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    EOR ($38),Y          ; 51 38 | Exclusive OR with accumulator ((zero page),Y)
    ORA $E751,X          ; 1D 51 E7 | Logical OR with accumulator (absolute,X)
    ASL $E351,X          ; 1E 51 E3 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_263
; Address: $C2D4F7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_263:
    JSL $24DE51          ; 22 51 DE 24 | Jump to subroutine long
    EOR ($29),Y          ; 51 29 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    EOR ($0D),Y          ; 51 0D | Exclusive OR with accumulator ((zero page),Y)
    ROL $EC51            ; 2E 51 EC | Rotate left (absolute)
    EOR ($FD),Y          ; 51 FD | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_264
; Address: $C2D509
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_264:
    AND ($51),Y          ; 31 51 | Logical AND with accumulator ((zero page),Y)
    CPY #$35             ; C0 35 | Compare Y register (immediate)
    EOR ($8F),Y          ; 51 8F | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    EOR ($A5),Y          ; 51 A5 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($87),Y          ; 51 87 | Exclusive OR with accumulator ((zero page),Y)
    ROL $AD51,X          ; 3E 51 AD | Rotate left (absolute,X)
    EOR ($5A),Y          ; 51 5A | Exclusive OR with accumulator ((zero page),Y)
    LSR $51              ; 46 51 | Logical shift right (zero page)
    CPY #$49             ; C0 49 | Compare Y register (immediate)
    EOR ($63),Y          ; 51 63 | Exclusive OR with accumulator ((zero page),Y)
    JMP $E851            ; 4C 51 E8 | Jump to address
    LSR $1D51            ; 4E 51 1D | Logical shift right (absolute)
    EOR ($67),Y          ; 51 67 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($7E),Y          ; 51 7E | Exclusive OR with accumulator ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack
    EOR ($99),Y          ; 51 99 | Exclusive OR with accumulator ((zero page),Y)
    LSR $D851,X          ; 5E 51 D8 | Logical shift right (absolute,X)
    ADC ($51,X)          ; 61 51 | Add with carry ((zero page,X))
    EOR ($E9),Y          ; 51 E9 | Exclusive OR with accumulator ((zero page),Y)
    ADC #$51             ; 69 51 | Add with carry (immediate)
    BPL $6C              ; 10 6C | Branch if positive
    EOR ($1F),Y          ; 51 1F | Exclusive OR with accumulator ((zero page),Y)
    EOR ($67),Y          ; 51 67 | Exclusive OR with accumulator ((zero page),Y)
    ADC ($51),Y          ; 71 51 | Add with carry ((zero page),Y)
    EOR ($19),Y          ; 51 19 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($6A),Y          ; 51 6A | Exclusive OR with accumulator ((zero page),Y)
    EOR ($40),Y          ; 51 40 | Exclusive OR with accumulator ((zero page),Y)
    ADC $0251,Y          ; 79 51 02 | Add with carry (absolute,Y)
    EOR ($75),Y          ; 51 75 | Exclusive OR with accumulator ((zero page),Y)
    ADC $3051,X          ; 7D 51 30 | Add with carry (absolute,X)
    EOR ($5C),Y          ; 51 5C | Exclusive OR with accumulator ((zero page),Y)
    STA ($51,X)          ; 81 51 | Store accumulator to (zero page,X)
    EOR ($09),Y          ; 51 09 | Exclusive OR with accumulator ((zero page),Y)
    STX $51              ; 86 51 | Store X register to zero page
    DEY                  ; 88 | Decrement Y register
    EOR ($78),Y          ; 51 78 | Exclusive OR with accumulator ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator
    EOR ($33),Y          ; 51 33 | Exclusive OR with accumulator ((zero page),Y)
    STX $B851            ; 8E 51 B8 | Store X register to absolute address
    BCC $51              ; 90 51 | Branch if carry clear
    ADC ($92,X)          ; 61 92 | Add with carry ((zero page,X))
    EOR ($98),Y          ; 51 98 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($63),Y          ; 51 63 | Exclusive OR with accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($B8),Y          ; 51 B8 | Exclusive OR with accumulator ((zero page),Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    EOR ($6E),Y          ; 51 6E | Exclusive OR with accumulator ((zero page),Y)
    STZ $1E51            ; 9C 51 1E | Store zero to absolute
    STA                  ; 9F 51 6C A1 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_265
; Address: $C2D582
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_265:
    EOR ($E3),Y          ; 51 E3 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($FC),Y          ; 51 FC | Exclusive OR with accumulator ((zero page),Y)
    LDX $51              ; A6 51 | Load from zero page into X register
    ADC $51A8            ; 6D A8 51 | Add with carry (absolute)
    BEQ $A9              ; F0 A9 | Branch if equal
    EOR ($10),Y          ; 51 10 | Exclusive OR with accumulator ((zero page),Y)
    LDA $4051            ; AD 51 40 | Load from absolute address into accumulator
    BCS $51              ; B0 51 | Branch if carry set
    BIT $B2              ; 24 B2 | Test bits in accumulator (zero page)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($64),Y          ; 51 64 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($3F),Y          ; 51 3F | Exclusive OR with accumulator ((zero page),Y)
    TSX                  ; BA | Transfer stack pointer to X register
    EOR ($0D),Y          ; 51 0D | Exclusive OR with accumulator ((zero page),Y)
    LDA $6351,X          ; BD 51 63 | Load from absolute,X into accumulator
    LDA                  ; BF 51 3C C2 | Load from absolute long,X into accumulator
    EOR ($6F),Y          ; 51 6F | Exclusive OR with accumulator ((zero page),Y)
    CPY $51              ; C4 51 | Compare Y register (zero page)
    EOR ($C6,X)          ; 41 C6 | Exclusive OR with accumulator ((zero page,X))
    EOR ($CB),Y          ; 51 CB | Exclusive OR with accumulator ((zero page),Y)
    INY                  ; C8 | Increment Y register
    EOR ($A1),Y          ; 51 A1 | Exclusive OR with accumulator ((zero page),Y)
    DEX                  ; CA | Decrement X register
    EOR ($56),Y          ; 51 56 | Exclusive OR with accumulator ((zero page),Y)
    CMP $6351            ; CD 51 63 | Compare accumulator (absolute)
    EOR ($F0),Y          ; 51 F0 | Exclusive OR with accumulator ((zero page),Y)
    CMP ($51),Y          ; D1 51 | Compare accumulator ((zero page),Y)
    INC $51D3,X          ; FE D3 51 | Increment (absolute,X)
    AND $51D6,X          ; 3D D6 51 | Logical AND with accumulator (absolute,X)
    CMP #$D8             ; C9 D8 | Compare accumulator (immediate)
    EOR ($66),Y          ; 51 66 | Exclusive OR with accumulator ((zero page),Y)
    PHX                  ; DA | Push X register to stack
    EOR ($EF),Y          ; 51 EF | Exclusive OR with accumulator ((zero page),Y)
    EOR ($30),Y          ; 51 30 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($7D),Y          ; 51 7D | Exclusive OR with accumulator ((zero page),Y)
    SBC ($51,X)          ; E1 51 | Subtract with carry ((zero page,X))
    EOR ($13),Y          ; 51 13 | Exclusive OR with accumulator ((zero page),Y)
    INC $51              ; E6 51 | Increment (zero page)
    CMP $E7              ; C5 E7 | Compare accumulator (zero page)
    EOR ($6A),Y          ; 51 6A | Exclusive OR with accumulator ((zero page),Y)
    SBC #$51             ; E9 51 | Subtract with carry (immediate)
    SBC $51EA,Y          ; F9 EA 51 | Subtract with carry (absolute,Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    SBC $B151            ; ED 51 B1 | Subtract with carry (absolute)
    INC $EF51            ; EE 51 EF | Increment (absolute)
    BEQ $51              ; F0 51 | Branch if equal
    AND $51F2            ; 2D F2 51 | Logical AND with accumulator (absolute)
    EOR ($65),Y          ; 51 65 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($A7),Y          ; 51 A7 | Exclusive OR with accumulator ((zero page),Y)
    SBC $B651,Y          ; F9 51 B6 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_266
; Address: $C2D5FA
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_266:
    EOR ($A5),Y          ; 51 A5 | Exclusive OR with accumulator ((zero page),Y)
    SBC $AF51,X          ; FD 51 AF | Subtract with carry (absolute,X)
    INC $4D51,X          ; FE 51 4D | Increment (absolute,X)
    ORA ($52,X)          ; 01 52 | Logical OR with accumulator ((zero page,X))
    AND $5203            ; 2D 03 52 | Logical AND with accumulator (absolute)
    ORA $5205,Y          ; 19 05 52 | Logical OR with accumulator (absolute,Y)
    PLA                  ; 68 | Pull accumulator from stack
    ASL $52              ; 06 52 | Arithmetic shift left (zero page)
    AND $5209,Y          ; 39 09 52 | Logical AND with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STZ $520E            ; 9C 0E 52 | Store zero to absolute
    LDA $EB5210          ; AF 10 52 EB | Load from absolute long address into accumulator
    INC                  ; 1A | Increment accumulator
    ORA #$1D             ; 09 1D | Logical OR with accumulator (immediate)
    BVS $20              ; 70 20 | Branch if overflow set
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_267
; Address: $C2D632
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_267:
    JSL $246B52          ; 22 52 6B 24 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    CMP $2A              ; C5 2A | Compare accumulator (zero page)
    BIT $9B52            ; 2C 52 9B | Test bits in accumulator (absolute)
    EOR #$32             ; 49 32 | Exclusive OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_268
; Address: $C2D650
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_268:
    DEC                  ; 3A | Decrement accumulator
    ROL $0252,X          ; 3E 52 02 | Rotate left (absolute,X)
    WDM #$52             ; 42 52 | Reserved instruction
    SEI                  ; 78 | Set interrupt disable flag
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $C552            ; 4D 52 C5 | Exclusive OR with accumulator (absolute)
    DEC $5251            ; CE 51 52 | Decrement (absolute)
    JMP ($5253)          ; 6C 53 52 | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_269
; Address: $C2D670
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_269:
    EOR ($56),Y          ; 51 56 | Exclusive OR with accumulator ((zero page),Y)
    SBC $5257,X          ; FD 57 52 | Subtract with carry (absolute,X)
    CPX #$58             ; E0 58 | Compare X register (immediate)
    ADC ($5C),Y          ; 71 5C | Add with carry ((zero page),Y)
    SBC $525E,Y          ; F9 5E 52 | Subtract with carry (absolute,Y)
    BIT #$65             ; 89 65 | Test bits in accumulator (immediate)
    BPL $68              ; 10 68 | Branch if positive
    ROR                  ; 6A | Rotate right (accumulator)
    ASL $6C              ; 06 6C | Arithmetic shift left (zero page)
    ROR $5152            ; 6E 52 51 | Rotate right (absolute)
    BVS $52              ; 70 52 | Branch if overflow set
    TAX                  ; AA | Transfer accumulator to X register
    LDX $75              ; A6 75 | Load from zero page into X register
    SEI                  ; 78 | Set interrupt disable flag
    LDY $5279,X          ; BC 79 52 | Load from absolute,X into Y register
    CPY $7B              ; C4 7B | Compare Y register (zero page)
    ADC $E752,X          ; 7D 52 E7 | Add with carry (absolute,X)
    BRA $52              ; 80 52 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_26A
; Address: $C2D6B2
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_26A:
    CLD                  ; D8 | Clear decimal mode flag
    PHB                  ; 8B | Push data bank register to stack
    STA $BF52            ; 8D 52 BF | Store accumulator to absolute address
    STX $5852            ; 8E 52 58 | Store X register to absolute address
    BEQ $94              ; F0 94 | Branch if equal
    LDX $96              ; A6 96 | Load from zero page into X register
    TYA                  ; 98 | Transfer Y register to accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    TXS                  ; 9A | Transfer X register to stack pointer
    STA $BA52,X          ; 9D 52 BA | Store accumulator to absolute,X
    LDY #$52             ; A0 52 | Load immediate value into Y register
    TXS                  ; 9A | Transfer X register to stack pointer
    LDX $52              ; A6 52 | Load from zero page into X register
    INC $52A8            ; EE A8 52 | Increment (absolute)
    PHP                  ; 08 | Push processor status to stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $4752            ; AD 52 47 | Load from absolute address into accumulator
    LDA $B1AD52          ; AF 52 AD B1 | Load from absolute long address into accumulator
    BIT $52B5            ; 2C B5 52 | Test bits in accumulator (absolute)
    STX $B6              ; 86 B6 | Store X register to zero page
    STY $B7              ; 84 B7 | Store Y register to zero page
    CLV                  ; B8 | Clear overflow flag
    TSX                  ; BA | Transfer stack pointer to X register
    AND ($BC),Y          ; 31 BC | Logical AND with accumulator ((zero page),Y)
    LDX $CD52,Y          ; BE 52 CD | Load from absolute,Y into X register
    LDA                  ; BF 52 62 C1 | Load from absolute long,X into accumulator
    LDA $52C2,Y          ; B9 C2 52 | Load from absolute,Y into accumulator
    CPY $52              ; C4 52 | Compare Y register (zero page)
    EOR ($C6),Y          ; 51 C6 | Exclusive OR with accumulator ((zero page),Y)
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    CMP $1952            ; CD 52 19 | Compare accumulator (absolute)
    BNE $52              ; D0 52 | Branch if not equal
    TXA                  ; 8A | Transfer X register to accumulator
    INC $D3              ; E6 D3 | Increment (zero page)
    ROL $D6              ; 26 D6 | Rotate left (zero page)
    LSR $52D7,X          ; 5E D7 52 | Logical shift right (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    CMP $BB52,Y          ; D9 52 BB | Compare accumulator (absolute,Y)
    PHX                  ; DA | Push X register to stack
    ORA ($DD,X)          ; 01 DD | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_26B
; Address: $C2D73A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_26B:
    DEC $0352,X          ; DE 52 03 | Decrement (absolute,X)
    CPX #$52             ; E0 52 | Compare X register (immediate)
    STA ($E1,X)          ; 81 E1 | Store accumulator to (zero page,X)
    PLA                  ; 68 | Pull accumulator from stack
    CPX $52              ; E4 52 | Compare X register (zero page)
    SBC $52              ; E5 52 | Subtract with carry (zero page)
    ROL $52E7,X          ; 3E E7 52 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_26C
; Address: $C2D74E
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_26C:
    LSR $E8              ; 46 E8 | Logical shift right (zero page)
    NOP                  ; EA | No operation
    SBC #$EB             ; E9 EB | Subtract with carry (immediate)
    BVS $ED              ; 70 ED | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    BEQ $52              ; F0 52 | Branch if equal
    SBC ($52),Y          ; F1 52 | Subtract with carry ((zero page),Y)
    BIT #$F2             ; 89 F2 | Test bits in accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    AND ($F9,X)          ; 21 F9 | Logical AND with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    LDA #$FB             ; A9 FB | Load immediate value into accumulator
    LDX $52FC            ; AE FC 52 | Load from absolute address into X register
    AND ($FE),Y          ; 31 FE | Logical AND with accumulator ((zero page),Y)
    INC $52FF            ; EE FF 52 | Increment (absolute)
    ORA ($53,X)          ; 01 53 | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    ORA $53              ; 05 53 | Logical OR with accumulator (zero page)
    STX $07              ; 86 07 | Store X register to zero page
    ORA #$53             ; 09 53 | Logical OR with accumulator (immediate)
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ORA $4453            ; 0D 53 44 | Logical OR with accumulator (absolute)
    LDX $5310,Y          ; BE 10 53 | Load from absolute,Y into X register
    SBC #$17             ; E9 17 | Subtract with carry (immediate)
    ORA $0053,Y          ; 19 53 00 | Logical OR with accumulator (absolute,Y)
    ORA $B553,X          ; 1D 53 B5 | Logical OR with accumulator (absolute,X)
    ASL $E753,X          ; 1E 53 E7 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_26D
; Address: $C2D7B5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_26D:
    JSR $BC53            ; 20 53 BC | Jump to subroutine
    AND ($53,X)          ; 21 53 | Logical AND with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_26E
; Address: $C2D7BB
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_26E:
    JSL $24B453          ; 22 53 B4 24 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    ROL $53              ; 26 53 | Rotate left (zero page)
    EOR ($29),Y          ; 51 29 | Exclusive OR with accumulator ((zero page),Y)
    BIT $5D53            ; 2C 53 5D | Test bits in accumulator (absolute)
    ROL $DC53            ; 2E 53 DC | Rotate left (absolute)
    BMI $53              ; 30 53 | Branch if negative
    ROL $5335            ; 2E 35 53 | Rotate left (absolute)
    EOR ($37),Y          ; 51 37 | Exclusive OR with accumulator ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    AND $B453,Y          ; 39 53 B4 | Logical AND with accumulator (absolute,Y)
    CMP $533D,X          ; DD 3D 53 | Compare accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STA ($42),Y          ; 91 42 | Hardware register operation
    STA $5344,X          ; 9D 44 53 | Store accumulator to absolute,X
    LDY #$46             ; A0 46 | Load immediate value into Y register
    JMP ($5348)          ; 6C 48 53 | Jump to address (absolute indirect)
    AND #$4A             ; 29 4A | Logical AND with accumulator (immediate)
    JMP $DD53            ; 4C 53 DD | Jump to address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_26F
; Address: $C2D7F7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_26F:
    EOR $EA53            ; 4D 53 EA | Exclusive OR with accumulator (absolute)
    SEP #$51             ; E2 51 | Set processor status bits
    LDX #$59             ; A2 59 | Load immediate value into X register
    LDY $535C,X          ; BC 5C 53 | Load from absolute,X into Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_271
; Address: $C2D81B
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_271:
    STZ $53              ; 64 53 | Store zero to zero page
    ROR $53              ; 66 53 | Rotate right (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ROR                  ; 6A | Rotate right (accumulator)
    AND $536C            ; 2D 6C 53 | Logical AND with accumulator (absolute)
    ADC $7153            ; 6D 53 71 | Add with carry (absolute)
    ADC ($53),Y          ; 71 53 | Add with carry ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator
    INC                  ; 1A | Increment accumulator
    SEP #$75             ; E2 75 | Set processor status bits
    DEX                  ; CA | Decrement X register
    ORA $5379,X          ; 1D 79 53 | Logical OR with accumulator (absolute,X)
    STZ $537A,X          ; 9E 7A 53 | Store zero to absolute,X
    ROR $537D,X          ; 7E 7D 53 | Rotate right (absolute,X)
    ADC $537E            ; 6D 7E 53 | Add with carry (absolute)
    DEC $537F,X          ; DE 7F 53 | Decrement (absolute,X)
    EOR ($83),Y          ; 51 83 | Exclusive OR with accumulator ((zero page),Y)
    STX $53              ; 86 53 | Store X register to zero page
    TXS                  ; 9A | Transfer X register to stack pointer
    DEY                  ; 88 | Decrement Y register
    BIT #$53             ; 89 53 | Test bits in accumulator (immediate)
    SBC $538A,Y          ; F9 8A 53 | Subtract with carry (absolute,Y)
    ROL $538C            ; 2E 8C 53 | Rotate left (absolute)
    CPY #$8D             ; C0 8D | Compare Y register (immediate)
    STA $90F053          ; 8F 53 F0 90 | Store accumulator to absolute long address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    STZ $3853            ; 9C 53 38 | Store zero to absolute
    STA $5953,X          ; 9D 53 59 | Store accumulator to absolute,X
    STZ $FA53,X          ; 9E 53 FA | Store zero to absolute,X
    STA                  ; 9F 53 B9 A1 | Store accumulator to absolute long,X
    PHB                  ; 8B | Push data bank register to stack
    LDY $53              ; A4 53 | Load from zero page into Y register
    LDA $53              ; A5 53 | Load from zero page into accumulator
    LDA #$53             ; A9 53 | Load immediate value into accumulator
    JMP $53AB            ; 4C AB 53 | Jump to address
    LDY $9053            ; AC 53 90 | Load from absolute address into Y register
    LDX $2053            ; AE 53 20 | Load from absolute address into X register
    BCS $53              ; B0 53 | Branch if carry set
    LDA ($53),Y          ; B1 53 | Load from (zero page),Y into accumulator
    CPY #$B3             ; C0 B3 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_272
; Address: $C2D8B4
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_272:
    LDA $1753,Y          ; B9 53 17 | Load from absolute,Y into accumulator
    BPL $BD              ; 10 BD | Branch if positive
    ROR $53BF,X          ; 7E BF 53 | Rotate right (absolute,X)
    STZ $53C0,X          ; 9E C0 53 | Store zero to absolute,X
    LDA $C1              ; A5 C1 | Load from zero page into accumulator
    REP #$53             ; C2 53 | Reset processor status bits
    INY                  ; C8 | Increment Y register
    REP #$53             ; C2 53 | Reset processor status bits
    DEY                  ; 88 | Decrement Y register
    EOR #$C5             ; 49 C5 | Exclusive OR with accumulator (immediate)
    JMP $F053C7          ; 5C C7 53 F0 | Jump to address long
    INY                  ; C8 | Increment Y register
    ROL $CA              ; 26 CA | Rotate left (zero page)
    ADC $53CC,X          ; 7D CC 53 | Add with carry (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP $7853            ; CD 53 78 | Compare accumulator (absolute)
    DEC $4A53            ; CE 53 4A | Decrement (absolute)
    EOR ($D0),Y          ; 51 D0 | Exclusive OR with accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    CMP ($53),Y          ; D1 53 | Compare accumulator ((zero page),Y)
    LSR $53D2            ; 4E D2 53 | Logical shift right (absolute)
    BVS $D3              ; 70 D3 | Branch if overflow set
    ORA $D4              ; 05 D4 | Logical OR with accumulator (zero page)
    ADC $53D5            ; 6D D5 53 | Add with carry (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_273
; Address: $C2D904
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_273:
    JSL $4153D8          ; 22 D8 53 41 | Jump to subroutine long
    CMP $1953,Y          ; D9 53 19 | Compare accumulator (absolute,Y)
    PHX                  ; DA | Push X register to stack
    SBC $53DA,X          ; FD DA 53 | Subtract with carry (absolute,X)
    EOR #$DE             ; 49 DE | Exclusive OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    SBC ($53,X)          ; E1 53 | Subtract with carry ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_274
; Address: $C2D925
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_274:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PHB                  ; 8B | Push data bank register to stack
    EOR $01              ; 45 01 | Exclusive OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    REP #$03             ; C2 03 | Reset processor status bits
    STY $0004            ; 8C 04 00 | Store Y register to absolute address
    EOR $0005            ; 4D 05 00 | Exclusive OR with accumulator (absolute)
    AND ($06,X)          ; 21 06 | Logical AND with accumulator ((zero page,X))
    INC $06              ; E6 06 | Increment (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    CPY $0A              ; C4 0A | Compare Y register (zero page)
    BCC $0B              ; 90 0B | Branch if carry clear
    XBA                  ; EB | Exchange accumulator bytes
    EOR $000D,X          ; 5D 0D 00 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_275
; Address: $C2D95F
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_275:
    ORA $4000            ; 0D 00 40 | Logical OR with accumulator (absolute)
    ASL $B500            ; 0E 00 B5 | Arithmetic shift left (absolute)
    ASL $3D00            ; 0E 00 3D | Arithmetic shift left (absolute)
    ADC #$10             ; 69 10 | Add with carry (immediate)
    BPL $00              ; 10 00 | Branch if positive
    STA $0011            ; 8D 11 00 | Store accumulator to absolute address
    CLC                  ; 18 | Clear carry flag
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    STZ $14              ; 64 14 | Store zero to zero page
    CPX #$14             ; E0 14 | Compare X register (immediate)
    EOR $0015,X          ; 5D 15 00 | Exclusive OR with accumulator (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    DEC $0016            ; CE 16 00 | Decrement (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    AND $0019            ; 2D 19 00 | Logical AND with accumulator (absolute)
    ORA $2300,Y          ; 19 00 23 | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    LDA $10001A          ; AF 1A 00 10 | Load from absolute long address into accumulator
    BVS $1B              ; 70 1B | Branch if overflow set
    CPY #$1B             ; C0 1B | Compare Y register (immediate)
    STA                  ; 9F 1C 00 20 | Store accumulator to absolute long,X
    ORA $F000,X          ; 1D 00 F0 | Logical OR with accumulator (absolute,X)
    ORA $EB00,X          ; 1D 00 EB | Logical OR with accumulator (absolute,X)
    ASL $D300,X          ; 1E 00 D3 | Arithmetic shift left (absolute,X)
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_276
; Address: $C2D9CB
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_276:
    JSR $8F00            ; 20 00 8F | Jump to subroutine
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LDA $0022,Y          ; B9 22 00 | Load from absolute,Y into accumulator
    SBC #$03             ; E9 03 | Subtract with carry (immediate)
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    INC $0B02            ; EE 02 0B | Increment (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    ORA $FC04,Y          ; 19 04 FC | Logical OR with accumulator (absolute,Y)
    ADC ($02),Y          ; 71 02 | Add with carry ((zero page),Y)
    ROL $4504,X          ; 3E 04 45 | Rotate left (absolute,X)
    EOR #$04             ; 49 04 | Exclusive OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $1C03,Y          ; 19 03 1C | Logical OR with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_277
; Address: $C2DA01
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_277:
    ADC #$04             ; 69 04 | Add with carry (immediate)
    BVS $04              ; 70 04 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    STA $02              ; 85 02 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_278
; Address: $C2DA0B
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_278:
    BRA $04              ; 80 04 | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    STY $9B02            ; 8C 02 9B | Store Y register to absolute address
    STZ $8F04,X          ; 9E 04 8F | Store zero to absolute,X
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    JMP $4E03            ; 4C 03 4E | Jump to address
    STA $5702,Y          ; 99 02 57 | Store accumulator to absolute,Y
    CMP $0C04,X          ; DD 04 0C | Compare accumulator (absolute,X)
    ADC $03              ; 65 03 | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    ORA $6D              ; 05 6D | Logical OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    PLB                  ; AB | Pull data bank register from stack
    PLY                  ; 7A | Pull Y register from stack
    LDX $B002            ; AE 02 B0 | Load from absolute address into X register
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ADC ($05),Y          ; 71 05 | Add with carry ((zero page),Y)
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ORA $C2              ; 05 C2 | Logical OR with accumulator (zero page)
    STA                  ; 9F 05 A1 05 | Store accumulator to absolute long,X
    LDA ($03),Y          ; B1 03 | Load from (zero page),Y into accumulator
    BCS $05              ; B0 05 | Branch if carry set
    CMP $05              ; C5 05 | Compare accumulator (zero page)
    ORA $D1              ; 05 D1 | Logical OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $DF              ; 06 DF | Arithmetic shift left (zero page)
    CPX $03              ; E4 03 | Compare X register (zero page)
    INC $03              ; E6 03 | Increment (zero page)
    STZ $1280,X          ; 9E 80 12 | Store zero to absolute,X
    BRA $1D              ; 80 1D | Branch always
    BRA $08              ; 80 08 | Branch always
    ORA $0404            ; 0D 04 04 | Logical OR with accumulator (absolute)
    BRA $0A              ; 80 0A | Branch always
    BRA $16              ; 80 16 | Branch always
    ASL $2480            ; 0E 80 24 | Arithmetic shift left (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    BRA $16              ; 80 16 | Branch always
    BRA $39              ; 80 39 | Branch always
    CLC                  ; 18 | Clear carry flag
    BRA $73              ; 80 73 | Branch always
    RTI                  ; 40 | Return from interrupt
    INC                  ; 1A | Increment accumulator
    BRA $22              ; 80 22 | Branch always
    BRA $78              ; 80 78 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_27A
; Address: $C2DAA7
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_27A:
    ROL $2880            ; 2E 80 28 | Rotate left (absolute)
    BIT $7F03            ; 2C 03 7F | Test bits in accumulator (absolute)
    BRA $42              ; 80 42 | Hardware register operation
    BRA $89              ; 80 89 | Branch always
    SEC                  ; 38 | Set carry flag
    BRA $9A              ; 80 9A | Branch always
    STA $4004,X          ; 9D 04 40 | Store accumulator to absolute,X
    BRA $42              ; 80 42 | Hardware register operation
    ROL $5680,X          ; 3E 80 56 | Rotate left (absolute,X)
    BRA $48              ; 80 48 | Branch always
    BRA $38              ; 80 38 | Branch always
    DEC $5A04,X          ; DE 04 5A | Decrement (absolute,X)
    EOR $3C03,X          ; 5D 03 3C | Exclusive OR with accumulator (absolute,X)
    LSR $6280            ; 4E 80 62 | Logical shift right (absolute)
    STZ $03              ; 64 03 | Store zero to zero page
    ROR $03              ; 66 03 | Rotate right (zero page)
    ADC #$03             ; 69 03 | Add with carry (immediate)
    ASL $7202            ; 0E 02 72 | Arithmetic shift left (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    BRA $5E              ; 80 5E | Branch always
    BRA $66              ; 80 66 | Branch always
    BRA $84              ; 80 84 | Branch always
    PLY                  ; 7A | Pull Y register from stack
    BRA $47              ; 80 47 | Branch always
    BVS $80              ; 70 80 | Branch if overflow set
    ADC $6C05            ; 6D 05 6C | Add with carry (absolute)
    BRA $78              ; 80 78 | Branch always
    ORA $9A              ; 05 9A | Logical OR with accumulator (zero page)
    ORA $A1              ; 05 A1 | Logical OR with accumulator (zero page)
    ORA $76              ; 05 76 | Logical OR with accumulator (zero page)
    BRA $8C              ; 80 8C | Branch always
    BRA $7C              ; 80 7C | Branch always
    BRA $9D              ; 80 9D | Branch always
    ORA $7E              ; 05 7E | Logical OR with accumulator (zero page)
    BRA $AC              ; 80 AC | Branch always
    ORA $AD              ; 05 AD | Logical OR with accumulator (zero page)
    ORA $82              ; 05 82 | Logical OR with accumulator (zero page)
    BRA $BA              ; 80 BA | Branch always
    CPY $8802            ; CC 02 88 | Compare Y register (absolute)
    BRA $C3              ; 80 C3 | Branch always
    BCC $80              ; 90 80 | Branch if carry clear
    STX $D580            ; 8E 80 D5 | Store X register to absolute address
    TXS                  ; 9A | Transfer X register to stack pointer
    BRA $06              ; 80 06 | Branch always
    ASL $DD              ; 06 DD | Arithmetic shift left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $E2              ; 80 E2 | Branch always
    ASL $1B              ; 06 1B | Arithmetic shift left (zero page)
    ROL $3C04            ; 2E 04 3C | Rotate left (absolute)
    EOR ($04),Y          ; 51 04 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_27B
; Address: $C2DB35
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_27B:
    ASL $2E03,X          ; 1E 03 2E | Arithmetic shift left (absolute,X)
    ROR $3104,X          ; 7E 04 31 | Rotate right (absolute,X)
    STX $9302            ; 8E 02 93 | Store X register to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    ROL $7602,X          ; 3E 02 76 | Rotate left (absolute,X)
    BRA $03              ; 80 03 | Branch always
    ORA $BA              ; 05 BA | Logical OR with accumulator (zero page)
    STA ($05),Y          ; 91 05 | Store accumulator to (zero page),Y
    ORA $53              ; 05 53 | Logical OR with accumulator (zero page)
    CMP $C902            ; CD 02 C9 | Compare accumulator (absolute)
    CMP $D403            ; CD 03 D4 | Compare accumulator (absolute)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL $DE              ; 06 DE | Arithmetic shift left (zero page)
    INC $02              ; E6 02 | Increment (zero page)
    PEA #$D003           ; F4 03 D0 | Push effective address to stack
    BRA $A6              ; 80 A6 | Branch always
    BRA $4E              ; 80 4E | Branch always
    STA ($DD,X)          ; 81 DD | Store accumulator to (zero page,X)
    BPL $04              ; 10 04 | Branch if positive
    LDX $C780            ; AE 80 C7 | Load from absolute address into X register
    TAX                  ; AA | Transfer accumulator to X register
    BRA $1D              ; 80 1D | Branch always
    BRA $B8              ; 80 B8 | Branch always
    BRA $B6              ; 80 B6 | Branch always
    BRA $3D              ; 80 3D | Branch always
    LDY $C280,X          ; BC 80 C2 | Load from absolute,X into Y register
    BRA $C0              ; 80 C0 | Branch always
    BRA $C8              ; 80 C8 | Branch always
    BRA $CE              ; 80 CE | Branch always
    BRA $CA              ; 80 CA | Branch always
    BRA $CC              ; 80 CC | Branch always
    BRA $6F              ; 80 6F | Branch always
    BCS $00              ; B0 00 | Branch if carry set
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    BRA $8E              ; 80 8E | Branch always
    DEC                  ; 3A | Decrement accumulator
    CPX #$80             ; E0 80 | Compare X register (immediate)
    INC $80              ; E6 80 | Increment (zero page)
    CPX $80              ; E4 80 | Compare X register (zero page)
    INC $EE80,X          ; FE 80 EE | Increment (absolute,X)
    BRA $EA              ; 80 EA | Branch always
    BRA $F4              ; 80 F4 | Branch always
    BRA $F0              ; 80 F0 | Branch always
    BRA $F2              ; 80 F2 | Branch always
    BRA $5F              ; 80 5F | Branch always
    STA                  ; 9F 02 FA 80 | Store accumulator to absolute long,X
    STA ($40,X)          ; 81 40 | Store accumulator to (zero page,X)
    STA ($0F,X)          ; 81 0F | Store accumulator to (zero page,X)
    LDA $810A02          ; AF 02 0A 81 | Load from absolute long address into accumulator
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_27C
; Address: $C2DBCC
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_27C:
    STA ($10,X)          ; 81 10 | Store accumulator to (zero page,X)
    STA ($16,X)          ; 81 16 | Store accumulator to (zero page,X)
    STA ($1C,X)          ; 81 1C | Store accumulator to (zero page,X)
    STA ($9C,X)          ; 81 9C | Store accumulator to (zero page,X)
    ASL $4C81,X          ; 1E 81 4C | Arithmetic shift left (absolute,X)
    STA ($99,X)          ; 81 99 | Store accumulator to (zero page,X)
    ORA $2A              ; 05 2A | Logical OR with accumulator (zero page)
    STA ($2E,X)          ; 81 2E | Store accumulator to (zero page,X)
    STA ($30,X)          ; 81 30 | Store accumulator to (zero page,X)
    STA ($3A,X)          ; 81 3A | Store accumulator to (zero page,X)
    STA ($32,X)          ; 81 32 | Store accumulator to (zero page,X)
    STA ($38,X)          ; 81 38 | Store accumulator to (zero page,X)
    STA ($C7,X)          ; 81 C7 | Store accumulator to (zero page,X)
    ROL $4A81,X          ; 3E 81 4A | Rotate left (absolute,X)
    STA ($42,X)          ; 81 42 | Hardware register operation
    STA ($48,X)          ; 81 48 | Store accumulator to (zero page,X)
    STA ($E7,X)          ; 81 E7 | Store accumulator to (zero page,X)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    ROL $8803            ; 2E 03 88 | Rotate left (absolute)
    LDY #$04             ; A0 04 | Load immediate value into Y register
    BCS $04              ; B0 04 | Branch if carry set
    CPY $05              ; C4 05 | Compare Y register (zero page)
    LDA $CE03,X          ; BD 03 CE | Load from absolute,X into accumulator
    CPX $05              ; E4 05 | Compare X register (zero page)
    BVC $81              ; 50 81 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    STA ($65,X)          ; 81 65 | Store accumulator to (zero page,X)
    STA ($6C,X)          ; 81 6C | Store accumulator to (zero page,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA ($5A,X)          ; 81 5A | Store accumulator to (zero page,X)
    STA ($5C,X)          ; 81 5C | Store accumulator to (zero page,X)
    STA ($6A,X)          ; 81 6A | Store accumulator to (zero page,X)
    STA ($73,X)          ; 81 73 | Store accumulator to (zero page,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_27D
; Address: $C2DC3A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_27D:
    STA ($62,X)          ; 81 62 | Store accumulator to (zero page,X)
    STA ($66,X)          ; 81 66 | Store accumulator to (zero page,X)
    STA ($68,X)          ; 81 68 | Store accumulator to (zero page,X)
    STA ($6C,X)          ; 81 6C | Store accumulator to (zero page,X)
    STA ($6E,X)          ; 81 6E | Store accumulator to (zero page,X)
    STA ($6A,X)          ; 81 6A | Store accumulator to (zero page,X)
    STA ($76,X)          ; 81 76 | Store accumulator to (zero page,X)
    STA ($B4,X)          ; 81 B4 | Store accumulator to (zero page,X)
    ORA $78              ; 05 78 | Logical OR with accumulator (zero page)
    STA ($C1,X)          ; 81 C1 | Store accumulator to (zero page,X)
    STA ($7C,X)          ; 81 7C | Store accumulator to (zero page,X)
    STA ($C8,X)          ; 81 C8 | Store accumulator to (zero page,X)
    DEY                  ; 88 | Decrement Y register
    STA ($8A,X)          ; 81 8A | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_27E
; Address: $C2DC5C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_27E:
    STA ($8C,X)          ; 81 8C | Store accumulator to (zero page,X)
    STA ($8E,X)          ; 81 8E | Store accumulator to (zero page,X)
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_27F
; Address: $C2DC65
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_27F:
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    LDA $03              ; A5 03 | Load from zero page into accumulator
    LDA $00CF04          ; AF 04 CF 00 | Load from absolute long address into accumulator
    ADC $6203,Y          ; 79 03 62 | Add with carry (absolute,Y)
    ORA $6F              ; 05 6F | Logical OR with accumulator (zero page)
    ORA $A8              ; 05 A8 | Logical OR with accumulator (zero page)
    CMP $02              ; C5 02 | Compare accumulator (zero page)
    ORA $E6              ; 05 E6 | Logical OR with accumulator (zero page)
    STA ($F7,X)          ; 81 F7 | Store accumulator to (zero page,X)
    STA ($1C,X)          ; 81 1C | Store accumulator to (zero page,X)
    STZ $A081,X          ; 9E 81 A0 | Store zero to absolute,X
    STA ($A6,X)          ; 81 A6 | Store accumulator to (zero page,X)
    STA ($06,X)          ; 81 06 | Store accumulator to (zero page,X)
    STA ($AE,X)          ; 81 AE | Store accumulator to (zero page,X)
    STA ($BC,X)          ; 81 BC | Store accumulator to (zero page,X)
    STA ($A4,X)          ; 81 A4 | Store accumulator to (zero page,X)
    ORA $B0              ; 05 B0 | Logical OR with accumulator (zero page)
    STA ($B8,X)          ; 81 B8 | Store accumulator to (zero page,X)
    STA ($6A,X)          ; 81 6A | Store accumulator to (zero page,X)
    LDY $BE02,X          ; BC 02 BE | Load from absolute,X into Y register
    STA ($C2,X)          ; 81 C2 | Store accumulator to (zero page,X)
    STA ($C4,X)          ; 81 C4 | Store accumulator to (zero page,X)
    STA ($D2,X)          ; 81 D2 | Store accumulator to (zero page,X)
    STA ($CA,X)          ; 81 CA | Store accumulator to (zero page,X)
    STA ($D0,X)          ; 81 D0 | Store accumulator to (zero page,X)
    STA ($A4,X)          ; 81 A4 | Store accumulator to (zero page,X)
    DEC $D881            ; CE 81 D8 | Decrement (absolute)
    STA ($D6,X)          ; 81 D6 | Store accumulator to (zero page,X)
    STA ($DC,X)          ; 81 DC | Store accumulator to (zero page,X)
    STA ($E2,X)          ; 81 E2 | Store accumulator to (zero page,X)
    STA ($E0,X)          ; 81 E0 | Game work RAM access
    STA ($F2,X)          ; 81 F2 | Store accumulator to (zero page,X)
    STA ($EC,X)          ; 81 EC | Store accumulator to (zero page,X)
    STA ($F0,X)          ; 81 F0 | Store accumulator to (zero page,X)
    STA ($F4,X)          ; 81 F4 | Store accumulator to (zero page,X)
    STA ($8B,X)          ; 81 8B | Store accumulator to (zero page,X)
    PLX                  ; FA | Pull X register from stack
    STA ($FC,X)          ; 81 FC | Store accumulator to (zero page,X)
    STA ($02,X)          ; 81 02 | Store accumulator to (zero page,X)
    ASL $82              ; 06 82 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    ORA $12              ; 05 12 | Logical OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_280
; Address: $C2DCE3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_280:
    LSR $2A04,X          ; 5E 04 2A | Logical shift right (absolute,X)
    LDX $3603,Y          ; BE 03 36 | Load from absolute,Y into X register
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA $97              ; 05 97 | Logical OR with accumulator (zero page)
    ORA $B6              ; 05 B6 | Logical OR with accumulator (zero page)
    ORA $5A              ; 05 5A | Logical OR with accumulator (zero page)
    JMP $A982            ; 4C 82 A9 | Jump to address
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_281
; Address: $C2DCFB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_281:
    JSR $2904            ; 20 04 29 | Jump to subroutine
    BIT $82              ; 24 82 | Test bits in accumulator (zero page)
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_282
; Address: $C2DD05
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_282:
    JSL $822682          ; 22 82 26 82 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    ROL $3482            ; 2E 82 34 | Rotate left (absolute)
    BMI $82              ; 30 82 | Branch if negative
    TXS                  ; 9A | Transfer X register to stack pointer
    STA ($05,X)          ; 81 05 | Store accumulator to (zero page,X)
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    ROL $4082,X          ; 3E 82 40 | Rotate left (absolute,X)
    ADC ($05,X)          ; 61 05 | Add with carry ((zero page,X))
    STA ($04,X)          ; 81 04 | Store accumulator to (zero page,X)
    SBC ($02),Y          ; F1 02 | Subtract with carry ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    AND $2F02            ; 2D 02 2F | Logical AND with accumulator (absolute)
    LDA $0904            ; AD 04 09 | Load from absolute address into accumulator
    ORA $48              ; 05 48 | Logical OR with accumulator (zero page)
    ORA $C3              ; 05 C3 | Logical OR with accumulator (zero page)
    ORA $5E              ; 05 5E | Logical OR with accumulator (zero page)
    LSR $5282            ; 4E 82 52 | Logical shift right (absolute)
    ADC $4502            ; 6D 02 45 | Add with carry (absolute)
    JMP $825A82          ; 5C 82 5A 82 | Jump to address long
    STX $04              ; 86 04 | Store X register to zero page
    ROR $A682            ; 6E 82 A6 | Rotate right (absolute)
    LDY $04              ; A4 04 | Load from zero page into Y register
    JMP ($0D82)          ; 6C 82 0D | Jump to address (absolute indirect)
    ORA $74              ; 05 74 | Logical OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ROR $8282,X          ; 7E 82 82 | Rotate right (absolute,X)
    BRA $82              ; 80 82 | Branch always
    STX $82              ; 86 82 | Store X register to zero page
    BVC $04              ; 50 04 | Branch if overflow clear
    LDY $8502            ; AC 02 85 | Load from absolute address into Y register
    STX $9E05            ; 8E 05 9E | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    SBC $AC05,X          ; FD 05 AC | Subtract with carry (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_284
; Address: $C2DD85
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_284:
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$05             ; C0 05 | Compare Y register (immediate)
    LDY $7482            ; AC 82 74 | Load from absolute address into Y register
    ORA $0503,X          ; 1D 03 05 | Logical OR with accumulator (absolute,X)
    PEA #$B704           ; F4 04 B7 | Push effective address to stack
    ORA $E2              ; 05 E2 | Logical OR with accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag
    INC $82              ; E6 82 | Increment (zero page)
    REP #$82             ; C2 82 | Reset processor status bits
    INY                  ; C8 | Increment Y register
    PHX                  ; DA | Push X register to stack
    DEC $D082            ; CE 82 D0 | Decrement (absolute)
    DEC $E282,X          ; DE 82 E2 | Decrement (absolute,X)
    CPY #$82             ; C0 82 | Compare Y register (immediate)
    ASL $83              ; 06 83 | Arithmetic shift left (zero page)
    NOP                  ; EA | No operation
    CPX $EE82            ; EC 82 EE | Compare X register (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    INC $B682,X          ; FE 82 B6 | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    ADC ($03,X)          ; 61 03 | Add with carry ((zero page,X))
    LDX $02              ; A6 02 | Load from zero page into X register
    BNE $02              ; D0 02 | Branch if not equal
    EOR $E302,Y          ; 59 02 E3 | Exclusive OR with accumulator (absolute,Y)
    DEC $02              ; C6 02 | Decrement (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $83              ; 10 83 | Branch if positive
    JMP ($1803)          ; 6C 03 18 | Jump to address (absolute indirect)
    CMP $A703,X          ; DD 03 A7 | Compare accumulator (absolute,X)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA $7E              ; 05 7E | Logical OR with accumulator (zero page)
    ROL $83              ; 26 83 | Rotate left (zero page)
    JMP $2483            ; 4C 83 24 | Jump to address
    BCC $04              ; 90 04 | Branch if carry clear
    EOR ($05),Y          ; 51 05 | Exclusive OR with accumulator ((zero page),Y)
    ROL $3083            ; 2E 83 30 | Rotate left (absolute)
    SEC                  ; 38 | Set carry flag
    ROL $8C83,X          ; 3E 83 8C | Rotate left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    WDM #$83             ; 42 83 | Reserved instruction
    PHA                  ; 48 | Push accumulator to stack
    STZ $8905,X          ; 9E 05 89 | Store zero to absolute,X
    LDY $C003,X          ; BC 03 C0 | Load from absolute,X into Y register
    CLV                  ; B8 | Clear overflow flag
    ORA $52              ; 05 52 | Logical OR with accumulator (zero page)
    ADC $5604,Y          ; 79 04 56 | Add with carry (absolute,Y)
    SBC ($04,X)          ; E1 04 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank04_DmaFunction_285
; Address: $C2DE2B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_285:
    LSR $7A83,X          ; 5E 83 7A | Logical shift right (absolute,X)
    ORA $5C              ; 05 5C | Logical OR with accumulator (zero page)
    STX $03              ; 86 03 | Store X register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_286
; Address: $C2DE35
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_286:
    PHP                  ; 08 | Push processor status to stack
    ORA $80              ; 05 80 | Logical OR with accumulator (zero page)
    ORA $2F              ; 05 2F | Logical OR with accumulator (zero page)
    ORA $9B              ; 05 9B | Logical OR with accumulator (zero page)
    ASL $88              ; 06 88 | Arithmetic shift left (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    STA $04              ; 85 04 | Store accumulator to zero page
    ROR $7483            ; 6E 83 74 | Rotate right (absolute)
    AND $7E05,X          ; 3D 05 7E | Logical AND with accumulator (absolute,X)
    STA                  ; 9F 04 7A 83 | Store accumulator to absolute long,X
    BRA $83              ; 80 83 | Branch always
    STY $83              ; 84 83 | Store Y register to zero page
    STX $02              ; 86 02 | Store X register to zero page
    STZ $8905            ; 9C 05 89 | Store zero to absolute
    ORA $98              ; 05 98 | Logical OR with accumulator (zero page)
    STY $8A83            ; 8C 83 8A | Store Y register to absolute address
    DEY                  ; 88 | Decrement Y register
    STA $5705            ; 8D 05 57 | Store accumulator to absolute address
    ORA $96              ; 05 96 | Logical OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    ORA $9C              ; 05 9C | Logical OR with accumulator (zero page)
    LDY #$83             ; A0 83 | Load immediate value into Y register
    LDY $83              ; A4 83 | Load from zero page into Y register
    LDA                  ; BF 05 AE 83 | Load from absolute long,X into accumulator
    LDX #$83             ; A2 83 | Load immediate value into X register
    BCS $83              ; B0 83 | Branch if carry set
    STA $FA03,X          ; 9D 03 FA | Store accumulator to absolute,X
    LDY $B683,X          ; BC 83 B6 | Load from absolute,X into Y register
    ROL $02              ; 26 02 | Rotate left (zero page)
    RTI                  ; 40 | Return from interrupt
    LDX $CE83,Y          ; BE 83 CE | Load from absolute,Y into X register
    ORA $C0              ; 05 C0 | Logical OR with accumulator (zero page)
    PLB                  ; AB | Pull data bank register from stack
    EOR $FE03,Y          ; 59 03 FE | Exclusive OR with accumulator (absolute,Y)
    BVS $02              ; 70 02 | Branch if overflow set
    DEC $83              ; C6 83 | Decrement (zero page)
    DEX                  ; CA | Decrement X register
    CLD                  ; D8 | Clear decimal mode flag
    DEC $F483,X          ; DE 83 F4 | Decrement (absolute,X)
    PHX                  ; DA | Push X register to stack
    LDX #$05             ; A2 05 | Load immediate value into X register
    AND $F602,X          ; 3D 02 F6 | Logical AND with accumulator (absolute,X)
    SEP #$83             ; E2 83 | Set processor status bits
    INC $83              ; E6 83 | Increment (zero page)
    LDA $DA02            ; AD 02 DA | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_287
; Address: $C2DEBD
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_287:
    INC $F083            ; EE 83 F0 | Increment (absolute)
    SED                  ; F8 | Set decimal mode flag
    STZ $B302            ; 9C 02 B3 | Store zero to absolute
    INC $FA83,X          ; FE 83 FA | Increment (absolute,X)
    DEX                  ; CA | Decrement X register
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    STY $22              ; 84 22 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    STY $18              ; 84 18 | Store Y register to zero page
    STY $0E              ; 84 0E | Store Y register to zero page
    STY $A7              ; 84 A7 | Store Y register to zero page
    STY $12              ; 84 12 | Store Y register to zero page
    STY $72              ; 84 72 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_289
; Address: $C2DEED
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_289:
    JSR $1E84            ; 20 84 1E | Jump to subroutine
    STY $D9              ; 84 D9 | Store Y register to zero page
    BIT $84              ; 24 84 | Test bits in accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    STY $2C              ; 84 2C | Store Y register to zero page
    STY $30              ; 84 30 | Store Y register to zero page
    STY $32              ; 84 32 | Store Y register to zero page
    STY $40              ; 84 40 | Store Y register to zero page
    STY $3A              ; 84 3A | Store Y register to zero page
    STY $3C              ; 84 3C | Store Y register to zero page
    STY $84              ; 84 84 | Store Y register to zero page
    STY $4C              ; 84 4C | Store Y register to zero page
    STY $4A              ; 84 4A | Store Y register to zero page
    STY $4C              ; 84 4C | Store Y register to zero page
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    STY $52              ; 84 52 | Store Y register to zero page
    STY $56              ; 84 56 | Store Y register to zero page
    STY $E4              ; 84 E4 | Store Y register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_28A
; Address: $C2DF1E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_28A:
    STY $94              ; 84 94 | Store Y register to zero page
    STZ $84              ; 64 84 | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    STY $4B              ; 84 4B | Store Y register to zero page
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    STY $6C              ; 84 6C | Store Y register to zero page
    STY $76              ; 84 76 | Store Y register to zero page
    STY $70              ; 84 70 | Store Y register to zero page
    STY $78              ; 84 78 | Store Y register to zero page
    STY $7C              ; 84 7C | Store Y register to zero page
    STY $8F              ; 84 8F | Store Y register to zero page
    STY $4D              ; 84 4D | Store Y register to zero page
    ORA $7C              ; 05 7C | Logical OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    STY $94              ; 84 94 | Store Y register to zero page
    STY $A8              ; 84 A8 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_28B
; Address: $C2DF42
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_28B:
    STY $36              ; 84 36 | Store Y register to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $20              ; 84 20 | Store Y register to zero page
    ORA $9C              ; 05 9C | Logical OR with accumulator (zero page)
    STY $D9              ; 84 D9 | Store Y register to zero page
    SBC ($03),Y          ; F1 03 | Subtract with carry ((zero page),Y)
    LDY $84              ; A4 84 | Load from zero page into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    STY $AC              ; 84 AC | Store Y register to zero page
    STY $AE              ; 84 AE | Store Y register to zero page
    STY $85              ; 84 85 | Store Y register to zero page
    ORA $B2              ; 05 B2 | Logical OR with accumulator (zero page)
    STY $43              ; 84 43 | Store Y register to zero page
    ORA $BC              ; 05 BC | Logical OR with accumulator (zero page)
    STY $BA              ; 84 BA | Store Y register to zero page
    STY $BE              ; 84 BE | Store Y register to zero page
    STY $C0              ; 84 C0 | Store Y register to zero page
    STY $C4              ; 84 C4 | Store Y register to zero page
    STY $42              ; 84 42 | Hardware register operation
    ORA $CE              ; 05 CE | Logical OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    STY $CC              ; 84 CC | Store Y register to zero page
    STY $86              ; 84 86 | Store Y register to zero page
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    STY $CE              ; 84 CE | Store Y register to zero page
    STY $D2              ; 84 D2 | Store Y register to zero page
    STY $EC              ; 84 EC | Store Y register to zero page
    STY $D8              ; 84 D8 | Store Y register to zero page
    STY $E4              ; 84 E4 | Store Y register to zero page
    STY $E0              ; 84 E0 | Game work RAM access
    STY $EA              ; 84 EA | Store Y register to zero page
    STY $E8              ; 84 E8 | Store Y register to zero page
    STY $EF              ; 84 EF | Store Y register to zero page
    ORA $51              ; 05 51 | Logical OR with accumulator (zero page)
    STY $F6              ; 84 F6 | Store Y register to zero page
    STY $FC              ; 84 FC | Store Y register to zero page
    STY $FA              ; 84 FA | Store Y register to zero page
    STY $02              ; 84 02 | Store Y register to zero page
    STA $00              ; 85 00 | Store accumulator to zero page
    STA $04              ; 85 04 | Store accumulator to zero page
    STA $06              ; 85 06 | Store accumulator to zero page
    STA $0A              ; 85 0A | Store accumulator to zero page
    STA $C0              ; 85 C0 | Store accumulator to zero page
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ROL $1405,X          ; 3E 05 14 | Rotate left (absolute,X)
    STA $1A              ; 85 1A | Store accumulator to zero page
    STA $1C              ; 85 1C | Store accumulator to zero page
    STA $1E              ; 85 1E | Store accumulator to zero page
    STA $EB              ; 85 EB | Store accumulator to zero page
    BIT $05              ; 24 05 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_28C
; Address: $C2DFB0
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_28C:
    ORA $32              ; 05 32 | Logical OR with accumulator (zero page)
    STA $24              ; 85 24 | Store accumulator to zero page
    STA $26              ; 85 26 | Store accumulator to zero page
    STA $2C              ; 85 2C | Store accumulator to zero page
    STA $30              ; 85 30 | Store accumulator to zero page
    STA $F0              ; 85 F0 | Store accumulator to zero page
    STA $C1              ; 85 C1 | Store accumulator to zero page
    SEC                  ; 38 | Set carry flag
    STA $40              ; 85 40 | Store accumulator to zero page
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ROL $4685,X          ; 3E 85 46 | Rotate left (absolute,X)
    STA $42              ; 85 42 | Hardware register operation
    STA $4E              ; 85 4E | Store accumulator to zero page
    PHA                  ; 48 | Push accumulator to stack
    STA $00              ; 85 00 | Store accumulator to zero page
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    STA $BE              ; 85 BE | Store accumulator to zero page
    PHA                  ; 48 | Push accumulator to stack
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    STA $54              ; 85 54 | Store accumulator to zero page
    STA $81              ; 85 81 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_28D
; Address: $C2DFE0
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_28D:
    STA $5C              ; 85 5C | Store accumulator to zero page
    STA $62              ; 85 62 | Store accumulator to zero page
    STA $82              ; 85 82 | Store accumulator to zero page
    ORA $3B              ; 05 3B | Logical OR with accumulator (zero page)
    ORA $66              ; 05 66 | Logical OR with accumulator (zero page)
    STA $D9              ; 85 D9 | Store accumulator to zero page
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    ORA $6C              ; 05 6C | Logical OR with accumulator (zero page)
    STA $70              ; 85 70 | Store accumulator to zero page
    STA $BB              ; 85 BB | Store accumulator to zero page
    CMP $7400,Y          ; D9 00 74 | Compare accumulator (absolute,Y)
    STA $61              ; 85 61 | Store accumulator to zero page
    PLY                  ; 7A | Pull Y register from stack
    STA $7E              ; 85 7E | Store accumulator to zero page
    STA $80              ; 85 80 | Store accumulator to zero page
    STA $98              ; 85 98 | Store accumulator to zero page
    ORA $84              ; 05 84 | Logical OR with accumulator (zero page)
    STA $65              ; 85 65 | Store accumulator to zero page
    DEY                  ; 88 | Decrement Y register
    STA $8C              ; 85 8C | Store accumulator to zero page
    STA $92              ; 85 92 | Store accumulator to zero page
    STA $90              ; 85 90 | Store accumulator to zero page
    STA $9A              ; 85 9A | Store accumulator to zero page
    STA $98              ; 85 98 | Store accumulator to zero page
    STA $D1              ; 85 D1 | Store accumulator to zero page
    STZ $A385            ; 9C 85 A3 | Store zero to absolute
    ORA $A4              ; 05 A4 | Logical OR with accumulator (zero page)
    STA $A6              ; 85 A6 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_28E
; Address: $C2E01E
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_28E:
    STA $AC              ; 85 AC | Store accumulator to zero page
    STA $AE              ; 85 AE | Store accumulator to zero page
    STA $B0              ; 85 B0 | Store accumulator to zero page
    STA $B2              ; 85 B2 | Store accumulator to zero page
    STA $36              ; 85 36 | Store accumulator to zero page
    ORA $B4              ; 05 B4 | Logical OR with accumulator (zero page)
    STA $B8              ; 85 B8 | Store accumulator to zero page
    STA $BC              ; 85 BC | Store accumulator to zero page
    STA $CB              ; 85 CB | Store accumulator to zero page
    REP #$85             ; C2 85 | Reset processor status bits
    CPY $85              ; C4 85 | Compare Y register (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    ORA $C8              ; 05 C8 | Logical OR with accumulator (zero page)
    STA $CC              ; 85 CC | Store accumulator to zero page
    STA $BF              ; 85 BF | Store accumulator to zero page
    STA $CE              ; 85 CE | Store accumulator to zero page
    STA $39              ; 85 39 | Store accumulator to zero page
    STA $DA              ; 85 DA | Store accumulator to zero page
    ORA $B5              ; 05 B5 | Logical OR with accumulator (zero page)
    DEC $E285,X          ; DE 85 E2 | Decrement (absolute,X)
    STA $E6              ; 85 E6 | Store accumulator to zero page
    STA $69              ; 85 69 | Store accumulator to zero page
    ORA $67              ; 05 67 | Logical OR with accumulator (zero page)
    ORA $DA              ; 05 DA | Logical OR with accumulator (zero page)
    INC $F285            ; EE 85 F2 | Increment (absolute)
    STA $AE              ; 85 AE | Store accumulator to zero page
    SBC $FA04,Y          ; F9 04 FA | Subtract with carry (absolute,Y)
    STA $F8              ; 85 F8 | Store accumulator to zero page
    STA $FC              ; 85 FC | Store accumulator to zero page
    STA $00              ; 85 00 | Store accumulator to zero page
    STX $C0              ; 86 C0 | Store X register to zero page
    STX $06              ; 86 06 | Store X register to zero page
    STX $DB              ; 86 DB | Store X register to zero page
    ASL $0C86            ; 0E 86 0C | Arithmetic shift left (absolute)
    STX $12              ; 86 12 | Store X register to zero page
    STX $14              ; 86 14 | Store X register to zero page
    STX $18              ; 86 18 | Store X register to zero page
    STX $B1              ; 86 B1 | Store X register to zero page
    ASL $2086,X          ; 1E 86 20 | Arithmetic shift left (absolute,X)
    STX $22              ; 86 22 | Store X register to zero page
    STX $C9              ; 86 C9 | Store X register to zero page
    PLB                  ; AB | Pull data bank register from stack
    ORA $2C              ; 05 2C | Logical OR with accumulator (zero page)
    STX $2E              ; 86 2E | Store X register to zero page
    STX $32              ; 86 32 | Store X register to zero page
    STX $36              ; 86 36 | Store X register to zero page
    STX $3A              ; 86 3A | Store X register to zero page
    STX $3E              ; 86 3E | Store X register to zero page
    STX $40              ; 86 40 | Store X register to zero page
    STX $44              ; 86 44 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_28F
; Address: $C2E094
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_28F:
    STX $A2              ; 86 A2 | Store X register to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    STX $4E              ; 86 4E | Store X register to zero page
    STX $1F              ; 86 1F | Store X register to zero page
    ORA $54              ; 05 54 | Logical OR with accumulator (zero page)
    STX $56              ; 86 56 | Store X register to zero page
    STX $5A              ; 86 5A | Store X register to zero page
    STX $5C              ; 86 5C | Store X register to zero page
    STX $DC              ; 86 DC | Store X register to zero page
    ORA $62              ; 05 62 | Logical OR with accumulator (zero page)
    STX $23              ; 86 23 | Store X register to zero page
    ORA $66              ; 05 66 | Logical OR with accumulator (zero page)
    STX $6C              ; 86 6C | Store X register to zero page
    STX $6E              ; 86 6E | Store X register to zero page
    STX $70              ; 86 70 | Store X register to zero page
    STX $74              ; 86 74 | Store X register to zero page
    STX $76              ; 86 76 | Store X register to zero page
    STX $FD              ; 86 FD | Store X register to zero page
    PLY                  ; 7A | Pull Y register from stack
    STX $7E              ; 86 7E | Store X register to zero page
    STX $F4              ; 86 F4 | Store X register to zero page
    ORA $84              ; 05 84 | Logical OR with accumulator (zero page)
    STX $65              ; 86 65 | Store X register to zero page
    ORA $8A              ; 05 8A | Logical OR with accumulator (zero page)
    STX $8E              ; 86 8E | Store X register to zero page
    STX $90              ; 86 90 | Store X register to zero page
    STX $94              ; 86 94 | Store X register to zero page
    STX $98              ; 86 98 | Store X register to zero page
    STX $9C              ; 86 9C | Store X register to zero page
    STX $A0              ; 86 A0 | Store X register to zero page
    STX $A4              ; 86 A4 | Store X register to zero page
    STX $01              ; 86 01 | Store X register to zero page
    ORA $56              ; 05 56 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $AE              ; 05 AE | Logical OR with accumulator (zero page)
    STX $B2              ; 86 B2 | Store X register to zero page
    STX $B4              ; 86 B4 | Store X register to zero page
    STX $B6              ; 86 B6 | Store X register to zero page
    STX $B8              ; 86 B8 | Store X register to zero page
    STX $BC              ; 86 BC | Store X register to zero page
    STX $C0              ; 86 C0 | Store X register to zero page
    STX $C4              ; 86 C4 | Store X register to zero page
    STX $C8              ; 86 C8 | Store X register to zero page
    STX $CA              ; 86 CA | Store X register to zero page
    STX $CE              ; 86 CE | Store X register to zero page
    STX $D2              ; 86 D2 | Store X register to zero page
    STX $D6              ; 86 D6 | Store X register to zero page
    STX $DA              ; 86 DA | Store X register to zero page
    STX $D5              ; 86 D5 | Store X register to zero page
    CPX #$86             ; E0 86 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_290
; Address: $C2E0FB
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_290:
    CPX $86              ; E4 86 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    STX $EC              ; 86 EC | Store X register to zero page
    STX $F0              ; 86 F0 | Store X register to zero page
    STX $FC              ; 86 FC | Store X register to zero page
    ORA $F6              ; 05 F6 | Logical OR with accumulator (zero page)
    STX $EB              ; 86 EB | Store X register to zero page
    ORA $FB              ; 05 FB | Logical OR with accumulator (zero page)
    STX $CF              ; 86 CF | Store X register to zero page
    INC $5405            ; EE 05 54 | Increment (absolute)
    ORA $11              ; 05 11 | Logical OR with accumulator (zero page)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ASL $1287            ; 0E 87 12 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    ROL $87              ; 26 87 | Rotate left (zero page)
    NOP                  ; EA | No operation
    BIT $CE87            ; 2C 87 CE | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $34              ; 05 34 | Logical OR with accumulator (zero page)
    CPX $04              ; E4 04 | Compare X register (zero page)
    SBC #$04             ; E9 04 | Subtract with carry (immediate)
    SBC $04              ; E5 04 | Subtract with carry (zero page)
    WDM #$87             ; 42 87 | Reserved instruction
    LSR $87              ; 46 87 | Logical shift right (zero page)
    ROL $4A05            ; 2E 05 4A | Rotate left (absolute)
    BVC $05              ; 50 05 | Branch if overflow clear
    JMP $4E87            ; 4C 87 4E | Jump to address
    DEC                  ; 3A | Decrement accumulator
    ORA $58              ; 05 58 | Logical OR with accumulator (zero page)
    SBC #$05             ; E9 05 | Subtract with carry (immediate)
    ORA $5C              ; 05 5C | Logical OR with accumulator (zero page)
    INX                  ; E8 | Increment X register
    NOP                  ; EA | No operation
    ORA $62              ; 05 62 | Logical OR with accumulator (zero page)
    ORA $66              ; 05 66 | Logical OR with accumulator (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    INC $04              ; E6 04 | Increment (zero page)
    ROR $7287            ; 6E 87 72 | Rotate right (absolute)
    ORA $7805,Y          ; 19 05 78 | Logical OR with accumulator (absolute,Y)
    ORA $29              ; 05 29 | Logical OR with accumulator (zero page)
    ORA $D2              ; 05 D2 | Logical OR with accumulator (zero page)
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    STX $9287            ; 8E 87 92 | Store X register to absolute address
    TXS                  ; 9A | Transfer X register to stack pointer
    STZ $AD87,X          ; 9E 87 AD | Store zero to absolute,X
    LDY $87              ; A4 87 | Load from zero page into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY $B087            ; AC 87 B0 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_291
; Address: $C2E199
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_291:
    CLV                  ; B8 | Clear overflow flag
    LDX $C287,Y          ; BE 87 C2 | Load from absolute,Y into X register
    DEC $87              ; C6 87 | Decrement (zero page)
    DEX                  ; CA | Decrement X register
    DEC $5F87            ; CE 87 5F | Decrement (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    SBC $FB03            ; ED 03 FB | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_292
; Address: $C2E1AF
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_292:
    JSL $02F402          ; 22 02 F4 02 | Jump to subroutine long
    ASL $F704            ; 0E 04 F7 | Arithmetic shift left (absolute)
    BIT $02              ; 24 02 | Test bits in accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    DEC                  ; 3A | Decrement accumulator
    BPL $03              ; 10 03 | Branch if positive
    CPY $4E00            ; CC 00 4E | Compare Y register (absolute)
    EOR $6104,X          ; 5D 04 61 | Exclusive OR with accumulator (absolute,X)
    BMI $02              ; 30 02 | Branch if negative
    AND $3103            ; 2D 03 31 | Logical AND with accumulator (absolute)
    STA $3F02            ; 8D 02 3F | Store accumulator to absolute address
    LDA $04              ; A5 04 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP ($04,X)          ; C1 04 | Compare accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    JMP $04EF03          ; 5C 03 EF 04 | Jump to address long
    LDY #$02             ; A0 02 | Load immediate value into Y register
    LDA ($02,X)          ; A1 02 | Load from (zero page,X) into accumulator
    LDX #$02             ; A2 02 | Load immediate value into X register
    LDY $02              ; A4 02 | Load from zero page into Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_293
; Address: $C2E207
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_293:
    BVS $03              ; 70 03 | Branch if overflow set
    WDM #$02             ; 42 02 | Reserved instruction
    ORA $3F              ; 05 3F | Logical OR with accumulator (zero page)
    ORA $45              ; 05 45 | Logical OR with accumulator (zero page)
    LSR $02              ; 46 02 | Logical shift right (zero page)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    BVS $05              ; 70 05 | Branch if overflow set
    ADC $BD05,X          ; 7D 05 BD | Add with carry (absolute,X)
    EOR $1502            ; 4D 02 15 | Exclusive OR with accumulator (absolute)
    LDY #$05             ; A0 05 | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $B2              ; 05 B2 | Logical OR with accumulator (zero page)
    EOR ($02),Y          ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
    LDA $C905,Y          ; B9 05 C9 | Load from absolute,Y into accumulator
    ORA $CF              ; 05 CF | Logical OR with accumulator (zero page)
    SBC $03              ; E5 03 | Subtract with carry (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    BRA $EE              ; 80 EE | Branch always
    NOP                  ; EA | No operation
    SBC $0C03,Y          ; F9 03 0C | Subtract with carry (absolute,Y)
    BRA $06              ; 80 06 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_294
; Address: $C2E256
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_294:
    BRA $14              ; 80 14 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $10              ; 80 10 | Branch always
    BRA $1F              ; 80 1F | Branch always
    ROR $1402            ; 6E 02 14 | Rotate right (absolute)
    BRA $34              ; 80 34 | Branch always
    BRA $0C              ; 80 0C | Branch always
    ASL $2903            ; 0E 03 29 | Arithmetic shift left (absolute)
    LSR $04              ; 46 04 | Logical shift right (zero page)
    PHA                  ; 48 | Push accumulator to stack
    ASL $7980,X          ; 1E 80 79 | Arithmetic shift left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    BRA $24              ; 80 24 | Branch always
    BRA $26              ; 80 26 | Branch always
    BRA $6E              ; 80 6E | Branch always
    BIT $3480            ; 2C 80 34 | Test bits in accumulator (absolute)
    BRA $30              ; 80 30 | Branch always
    BRA $8C              ; 80 8C | Branch always
    DEC                  ; 3A | Decrement accumulator
    BRA $91              ; 80 91 | Branch always
    BRA $3C              ; 80 3C | Branch always
    BRA $A1              ; 80 A1 | Branch always
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    PLB                  ; AB | Pull data bank register from stack
    BRA $46              ; 80 46 | Branch always
    BRA $97              ; 80 97 | Branch always
    LSR                  ; 4A | Logical shift right (accumulator)
    BRA $4C              ; 80 4C | Branch always
    BRA $9D              ; 80 9D | Branch always
    BRA $5E              ; 80 5E | Branch always
    BVC $80              ; 50 80 | Branch if overflow clear
    BRA $5A              ; 80 5A | Branch always
    BRA $67              ; 80 67 | Branch always
    JMP $02A780          ; 5C 80 A7 02 | Jump to address long
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_295
; Address: $C2E2B4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_295:
    BRA $62              ; 80 62 | Branch always
    BRA $64              ; 80 64 | Branch always
    BRA $4F              ; 80 4F | Branch always
    ORA $6A              ; 05 6A | Logical OR with accumulator (zero page)
    BRA $8D              ; 80 8D | Branch always
    STA ($03),Y          ; 91 03 | Store accumulator to (zero page),Y
    ROR $B980            ; 6E 80 B9 | Rotate right (absolute)
    BRA $74              ; 80 74 | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $A3              ; 80 A3 | Branch always
    ORA $9C              ; 05 9C | Logical OR with accumulator (zero page)
    BRA $84              ; 80 84 | Branch always
    BRA $B4              ; 80 B4 | Branch always
    CMP $00              ; C5 00 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_296
; Address: $C2E2D7
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_296:
    BCS $03              ; B0 03 | Branch if carry set
    BRA $80              ; 80 80 | Branch always
    LDA $03B805          ; AF 05 B8 03 | Load from absolute long address into accumulator
    STX $80              ; 86 80 | Store X register to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $CF              ; 80 CF | Branch always
    ORA $D7              ; 05 D7 | Logical OR with accumulator (zero page)
    ORA $D5              ; 05 D5 | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BRA $94              ; 80 94 | Branch always
    BRA $5E              ; 80 5E | Branch always
    BRA $EB              ; 80 EB | Branch always
    SBC $0902            ; ED 02 09 | Subtract with carry (absolute)
    SBC $3802,X          ; FD 02 38 | Subtract with carry (absolute,X)
    EOR $1B04            ; 4D 04 1B | Exclusive OR with accumulator (absolute)
    JMP ($2B04)          ; 6C 04 2B | Jump to address (absolute indirect)
    TXA                  ; 8A | Transfer X register to accumulator
    STA ($02),Y          ; 91 02 | Store accumulator to (zero page),Y
    STZ $A502,X          ; 9E 02 A5 | Store zero to absolute,X
    ORA $81              ; 05 81 | Logical OR with accumulator (zero page)
    ORA $BF              ; 05 BF | Logical OR with accumulator (zero page)
    CPY $02              ; C4 02 | Compare Y register (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ORA $BB              ; 05 BB | Logical OR with accumulator (zero page)
    ORA $54              ; 05 54 | Logical OR with accumulator (zero page)
    CMP $5805            ; CD 05 58 | Compare accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ORA $DC              ; 05 DC | Logical OR with accumulator (zero page)
    CPX #$03             ; E0 03 | Compare X register (immediate)
    SBC ($02,X)          ; E1 02 | Subtract with carry ((zero page,X))
    LDX #$80             ; A2 80 | Load immediate value into X register
    LDY #$80             ; A0 80 | Load immediate value into Y register
    LDY $80              ; A4 80 | Load from zero page into Y register
    SBC $0003,X          ; FD 03 00 | Subtract with carry (absolute,X)
    STA ($A8,X)          ; 81 A8 | Store accumulator to (zero page,X)
    BRA $B4              ; 80 B4 | Branch always
    BRA $69              ; 80 69 | Branch always
    LDY $B080            ; AC 80 B0 | Load from absolute address into Y register
    BRA $21              ; 80 21 | PPU graphics register access
    CPY $80              ; C4 80 | Compare Y register (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    BRA $42              ; 80 42 | Hardware register operation
    LDX $1480,Y          ; BE 80 14 | Load from absolute,Y into X register
    JMP $C604            ; 4C 04 C6 | Jump to address
    BRA $62              ; 80 62 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    BRA $D2              ; 80 D2 | Branch always
    BRA $83              ; 80 83 | Branch always
    BRA $30              ; 80 30 | Branch always

;------------------------------------------------------------------------------
; Bank04_DmaFunction_297
; Address: $C2E371
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_297:
    DEC $DA80,X          ; DE 80 DA | Decrement (absolute,X)
    BRA $E8              ; 80 E8 | Branch always
    BRA $DC              ; 80 DC | Branch always
    BRA $3D              ; 80 3D | Branch always
    SEP #$80             ; E2 80 | Set processor status bits
    CLV                  ; B8 | Clear overflow flag
    CPX $C880            ; EC 80 C8 | Compare X register (absolute)
    BRA $F6              ; 80 F6 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    BRA $06              ; 80 06 | Branch always
    STA ($6E,X)          ; 81 6E | Store accumulator to (zero page,X)
    ADC ($03),Y          ; 71 03 | Add with carry ((zero page),Y)
    ASL $0881            ; 0E 81 08 | Arithmetic shift left (absolute)
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    STA ($24,X)          ; 81 24 | Store accumulator to (zero page,X)
    STA ($B2,X)          ; 81 B2 | Store accumulator to (zero page,X)
    STA ($14,X)          ; 81 14 | Store accumulator to (zero page,X)
    STA ($1A,X)          ; 81 1A | Store accumulator to (zero page,X)
    STA ($22,X)          ; 81 22 | Store accumulator to (zero page,X)
    STA ($20,X)          ; 81 20 | Store accumulator to (zero page,X)
    STA ($28,X)          ; 81 28 | Store accumulator to (zero page,X)
    STA ($26,X)          ; 81 26 | Store accumulator to (zero page,X)
    STA ($AE,X)          ; 81 AE | Store accumulator to (zero page,X)
    BIT $B481            ; 2C 81 B4 | Test bits in accumulator (absolute)
    STA ($36,X)          ; 81 36 | Store accumulator to (zero page,X)
    STA ($40,X)          ; 81 40 | Store accumulator to (zero page,X)
    STA ($3C,X)          ; 81 3C | Store accumulator to (zero page,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    ORA $44              ; 05 44 | Logical OR with accumulator (zero page)
    STA ($5D,X)          ; 81 5D | Store accumulator to (zero page,X)
    LSR $81              ; 46 81 | Logical shift right (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    AND $03              ; 25 03 | Logical AND with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    LDA ($04),Y          ; B1 04 | Load from (zero page),Y into accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    STA                  ; 9F 03 AC 03 | Store accumulator to absolute long,X
    REP #$05             ; C2 05 | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    ORA $ED02,Y          ; 19 02 ED | Logical OR with accumulator (absolute,Y)
    ORA $CA              ; 05 CA | Logical OR with accumulator (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ROR $02              ; 66 02 | Rotate right (zero page)
    STA ($5E,X)          ; 81 5E | Store accumulator to (zero page,X)
    STA ($58,X)          ; 81 58 | Store accumulator to (zero page,X)
    STA ($59,X)          ; 81 59 | Store accumulator to (zero page,X)
    PHY                  ; 5A | Push Y register to stack
    ADC $7102,X          ; 7D 02 71 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_298
; Address: $C2E40B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_298:
    BVS $81              ; 70 81 | Branch if overflow set
    STZ $81              ; 64 81 | Store zero to zero page
    REP #$04             ; C2 04 | Reset processor status bits
    STY $7405            ; 8C 05 74 | Store Y register to absolute address
    STA ($7A,X)          ; 81 7A | Store accumulator to (zero page,X)
    STA ($8A,X)          ; 81 8A | Store accumulator to (zero page,X)
    LDY #$03             ; A0 03 | Load immediate value into Y register
    STA ($80,X)          ; 81 80 | Store accumulator to (zero page,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STA ($84,X)          ; 81 84 | Store accumulator to (zero page,X)
    STA ($86,X)          ; 81 86 | Store accumulator to (zero page,X)
    STA ($90,X)          ; 81 90 | Store accumulator to (zero page,X)
    STA ($5C,X)          ; 81 5C | Store accumulator to (zero page,X)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_299
; Address: $C2E43D
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_299:
    JSR $9503            ; 20 03 95 | Jump to subroutine
    ORA $3E              ; 05 3E | Logical OR with accumulator (zero page)
    LSR $03              ; 46 03 | Logical shift right (zero page)
    ORA $7B              ; 05 7B | Logical OR with accumulator (zero page)
    JMP ($BE05)          ; 6C 05 BE | Jump to address (absolute indirect)
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    NOP                  ; EA | No operation
    TXS                  ; 9A | Transfer X register to stack pointer
    STA ($FC,X)          ; 81 FC | Store accumulator to (zero page,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    STA ($A2,X)          ; 81 A2 | Store accumulator to (zero page,X)
    STA ($A8,X)          ; 81 A8 | Store accumulator to (zero page,X)
    STA ($9C,X)          ; 81 9C | Store accumulator to (zero page,X)
    STA ($A4,X)          ; 81 A4 | Store accumulator to (zero page,X)
    STA ($2C,X)          ; 81 2C | Store accumulator to (zero page,X)
    TAX                  ; AA | Transfer accumulator to X register
    STA ($3B,X)          ; 81 3B | Store accumulator to (zero page,X)
    LDY $B281            ; AC 81 B2 | Load from absolute address into Y register
    STA ($47,X)          ; 81 47 | Store accumulator to (zero page,X)
    STA ($BA,X)          ; 81 BA | Store accumulator to (zero page,X)
    STA ($C0,X)          ; 81 C0 | Store accumulator to (zero page,X)
    STA ($6D,X)          ; 81 6D | Store accumulator to (zero page,X)
    ADC $8304,X          ; 7D 04 83 | Add with carry (absolute,X)
    DEC $81              ; C6 81 | Decrement (zero page)
    INY                  ; C8 | Increment Y register
    STA ($CC,X)          ; 81 CC | Store accumulator to (zero page,X)
    STA ($A7,X)          ; 81 A7 | Store accumulator to (zero page,X)
    CPX $81              ; E4 81 | Compare X register (zero page)
    STA ($39,X)          ; 81 39 | Store accumulator to (zero page,X)
    PHX                  ; DA | Push X register to stack
    STA ($DE,X)          ; 81 DE | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    INX                  ; E8 | Increment X register
    STA ($EA,X)          ; 81 EA | Store accumulator to (zero page,X)
    STA ($EE,X)          ; 81 EE | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_29A
; Address: $C2E496
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_29A:
    STA ($F8,X)          ; 81 F8 | Store accumulator to (zero page,X)
    STA ($F6,X)          ; 81 F6 | Store accumulator to (zero page,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STA ($0E,X)          ; 81 0E | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    LDA $821A03          ; AF 03 1A 82 | Load from absolute long address into accumulator
    BPL $82              ; 10 82 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHX                  ; DA | Push X register to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $6A              ; 06 6A | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ROR $8D02,X          ; 7E 02 8D | Rotate right (absolute,X)
    LDX #$04             ; A2 04 | Load immediate value into X register
    BNE $00              ; D0 00 | Branch if not equal
    EOR ($05,X)          ; 41 05 | Exclusive OR with accumulator ((zero page,X))
    LDA $D003            ; AD 03 D0 | Load from absolute address into accumulator
    BVC $02              ; 50 02 | Branch if overflow clear
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_29C
; Address: $C2E4D3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_29C:
    JSR $4B82            ; 20 82 4B | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $2C              ; 05 2C | Logical OR with accumulator (zero page)
    ASL $3305,X          ; 1E 05 33 | Arithmetic shift left (absolute,X)
    ORA $89              ; 05 89 | Logical OR with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    WDM #$82             ; 42 82 | Reserved instruction
    LSR $82              ; 46 82 | Logical shift right (zero page)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_29E
; Address: $C2E4FD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_29E:
    TAX                  ; AA | Transfer accumulator to X register
    BVC $03              ; 50 03 | Branch if overflow clear
    STX $9803            ; 8E 03 98 | Store X register to absolute address
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_29F
; Address: $C2E50D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_29F:
    ROR $82              ; 66 82 | Rotate right (zero page)
    ROL $04              ; 26 04 | Rotate left (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $82              ; 64 82 | Store zero to zero page
    STA $826804          ; 8F 04 68 82 | Store accumulator to absolute long address
    ROR                  ; 6A | Rotate right (accumulator)
    BVS $82              ; 70 82 | Branch if overflow set
    TXA                  ; 8A | Transfer X register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    DEY                  ; 88 | Decrement Y register
    STY $82              ; 84 82 | Store Y register to zero page
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2A0
; Address: $C2E531
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2A0:
    STY $2582            ; 8C 82 25 | Store Y register to absolute address
    CLI                  ; 58 | Clear interrupt disable flag
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    ADC $9003,X          ; 7D 03 90 | Add with carry (absolute,X)
    CPX #$02             ; E0 02 | Compare X register (immediate)
    CPX $9002            ; EC 02 90 | Compare X register (absolute)
    STX $9082            ; 8E 82 90 | Store X register to absolute address
    STZ $9882            ; 9C 82 98 | Store zero to absolute
    LDY $82              ; A4 82 | Load from zero page into Y register
    LDY #$82             ; A0 82 | Load immediate value into Y register
    LDX $82              ; A6 82 | Load from zero page into X register
    ORA $F2              ; 05 F2 | Logical OR with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT $D602            ; 2C 02 D6 | Test bits in accumulator (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $CE              ; 05 CE | Logical OR with accumulator (zero page)
    LDX $B082            ; AE 82 B0 | Load from absolute address into X register
    ASL $BA04,X          ; 1E 04 BA | Arithmetic shift left (absolute,X)
    LDY $BE82,X          ; BC 82 BE | Load from absolute,X into Y register
    CPY $82              ; C4 82 | Compare Y register (zero page)
    DEX                  ; CA | Decrement X register
    CPY $D282            ; CC 82 D2 | Compare Y register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPX $82              ; E4 82 | Compare X register (zero page)
    CPX #$82             ; E0 82 | Compare X register (immediate)
    ORA $3C              ; 05 3C | Logical OR with accumulator (zero page)
    ORA $E8              ; 05 E8 | Logical OR with accumulator (zero page)
    DEC $82              ; C6 82 | Decrement (zero page)
    BEQ $82              ; F0 82 | Branch if equal
    PEA #$FA82           ; F4 82 FA | Push effective address to stack
    SBC ($03,X)          ; E1 03 | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    EOR $0D03            ; 4D 03 0D | Exclusive OR with accumulator (absolute)
    ORA $BF              ; 05 BF | Logical OR with accumulator (zero page)
    ASL $5B83            ; 0E 83 5B | Arithmetic shift left (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $1683,X          ; 1E 83 16 | Arithmetic shift left (absolute,X)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2A1
; Address: $C2E5C1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2A1:
    JSR $4A83            ; 20 83 4A | Jump to subroutine
    ORA $C5              ; 05 C5 | Logical OR with accumulator (zero page)
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2A2
; Address: $C2E5D1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2A2:
    JSL $832A83          ; 22 83 2A 83 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BIT $3283            ; 2C 83 32 | Test bits in accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator
    BPL $02              ; 10 02 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LSR $83              ; 46 83 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2A3
; Address: $C2E5ED
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2A3:
    ROL $03              ; 26 03 | Rotate left (zero page)
    LDA $DE04,Y          ; B9 04 DE | Load from absolute,Y into accumulator
    LSR $5083            ; 4E 83 50 | Logical shift right (absolute)
    DEY                  ; 88 | Decrement Y register
    ORA $5A              ; 05 5A | Logical OR with accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $05              ; 64 05 | Store zero to zero page
    STZ $02              ; 64 02 | Store zero to zero page
    BIT $03              ; 24 03 | Test bits in accumulator (zero page)
    STA $040305          ; 8F 05 03 04 | Store accumulator to absolute long address
    STZ $83              ; 64 83 | Store zero to zero page
    ROR $83              ; 66 83 | Rotate right (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    JMP ($7283)          ; 6C 83 72 | Jump to address (absolute indirect)
    BVS $83              ; 70 83 | Branch if overflow set
    CPY $D203            ; CC 03 D2 | Compare Y register (absolute)
    CMP ($05),Y          ; D1 05 | Compare accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    STX $83              ; 86 83 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    BCC $83              ; 90 83 | Branch if carry clear
    AND #$03             ; 29 03 | Logical AND with accumulator (immediate)
    STX $9283            ; 8E 83 92 | Store X register to absolute address
    ORA $AA              ; 05 AA | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    TXS                  ; 9A | Transfer X register to stack pointer
    STZ $6483,X          ; 9E 83 64 | Store zero to absolute,X
    LDX $83              ; A6 83 | Load from zero page into X register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY $5883            ; AC 83 58 | Load from absolute address into Y register
    CMP ($05,X)          ; C1 05 | Compare accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    CLV                  ; B8 | Clear overflow flag
    BMI $04              ; 30 04 | Branch if negative
    ROR $04              ; 66 04 | Rotate right (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    REP #$83             ; C2 83 | Reset processor status bits
    CLV                  ; B8 | Clear overflow flag
    CPY $83              ; C4 83 | Compare Y register (zero page)
    AND $D804            ; 2D 04 D8 | Logical AND with accumulator (absolute)
    ORA $C8              ; 05 C8 | Logical OR with accumulator (zero page)
    BNE $83              ; D0 83 | Branch if not equal
    CPY $CE83            ; CC 83 CE | Compare Y register (absolute)
    JMP $DC02            ; 4C 02 DC | Jump to address
    NOP                  ; EA | No operation
    CPY $03              ; C4 03 | Compare Y register (zero page)
    CPX #$83             ; E0 83 | Compare X register (immediate)
    CPX $83              ; E4 83 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    CPX $5783            ; EC 83 57 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2A4
; Address: $C2E695
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2A4:
    SBC $05              ; E5 05 | Subtract with carry (zero page)
    INY                  ; C8 | Increment Y register
    ORA $E9              ; 05 E9 | Logical OR with accumulator (zero page)
    ASL $84              ; 06 84 | Arithmetic shift left (zero page)
    ASL $4105            ; 0E 05 41 | Arithmetic shift left (absolute)
    STY $04              ; 84 04 | Store Y register to zero page
    STY $9B              ; 84 9B | Store Y register to zero page
    ORA $8A              ; 05 8A | Logical OR with accumulator (zero page)
    ORA $5E              ; 05 5E | Logical OR with accumulator (zero page)
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    STY $0A              ; 84 0A | Store Y register to zero page
    STY $10              ; 84 10 | Store Y register to zero page
    STY $DE              ; 84 DE | Store Y register to zero page
    ORA $82              ; 05 82 | Logical OR with accumulator (zero page)
    STY $CA              ; 84 CA | Store Y register to zero page
    INC                  ; 1A | Increment accumulator
    STY $60              ; 84 60 | Store Y register to zero page
    ORA $98              ; 05 98 | Logical OR with accumulator (zero page)
    AND ($05,X)          ; 21 05 | Logical AND with accumulator ((zero page,X))
    BEQ $02              ; F0 02 | Branch if equal
    LDX $05              ; A6 05 | Load from zero page into X register
    ROL $84              ; 26 84 | Rotate left (zero page)
    ROL $2884            ; 2E 84 28 | Rotate left (absolute)
    STY $36              ; 84 36 | Store Y register to zero page
    STY $1C              ; 84 1C | Store Y register to zero page
    STY $38              ; 84 38 | Store Y register to zero page
    STY $6E              ; 84 6E | Store Y register to zero page
    ORA $3E              ; 05 3E | Logical OR with accumulator (zero page)
    STY $42              ; 84 42 | Hardware register operation
    STY $46              ; 84 46 | Store Y register to zero page
    STY $8B              ; 84 8B | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    STY $4E              ; 84 4E | Store Y register to zero page
    STY $C6              ; 84 C6 | Store Y register to zero page
    JMP $845084          ; 5C 84 50 84 | Jump to address long
    CLI                  ; 58 | Clear interrupt disable flag
    STY $5A              ; 84 5A | Store Y register to zero page
    STY $43              ; 84 43 | Store Y register to zero page
    ORA $5E              ; 05 5E | Logical OR with accumulator (zero page)
    STY $62              ; 84 62 | Store Y register to zero page
    STY $66              ; 84 66 | Store Y register to zero page
    STY $80              ; 84 80 | Store Y register to zero page
    ROR                  ; 6A | Rotate right (accumulator)
    STY $6E              ; 84 6E | Store Y register to zero page
    STY $7E              ; 84 7E | Store Y register to zero page
    STY $72              ; 84 72 | Store Y register to zero page
    STY $74              ; 84 74 | Store Y register to zero page
    STY $7A              ; 84 7A | Store Y register to zero page
    STY $84              ; 84 84 | Store Y register to zero page
    STY $80              ; 84 80 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2A5
; Address: $C2E708
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2A5:
    STY $D8              ; 84 D8 | Store Y register to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    STY $8C              ; 84 8C | Store Y register to zero page
    STY $5C              ; 84 5C | Store Y register to zero page
    STX $9084            ; 8E 84 90 | Store X register to absolute address
    STY $96              ; 84 96 | Store Y register to zero page
    STY $7E              ; 84 7E | Store Y register to zero page
    ORA $9A              ; 05 9A | Logical OR with accumulator (zero page)
    STY $9C              ; 84 9C | Store Y register to zero page
    STZ $B084,X          ; 9E 84 B0 | Store zero to absolute,X
    STY $A0              ; 84 A0 | Store Y register to zero page
    STY $A2              ; 84 A2 | Store Y register to zero page
    STY $A6              ; 84 A6 | Store Y register to zero page
    STY $AA              ; 84 AA | Store Y register to zero page
    STY $4A              ; 84 4A | Store Y register to zero page
    ORA $B4              ; 05 B4 | Logical OR with accumulator (zero page)
    STY $BE              ; 84 BE | Store Y register to zero page
    ORA $D5              ; 05 D5 | Logical OR with accumulator (zero page)
    ORA $B8              ; 05 B8 | Logical OR with accumulator (zero page)
    STY $B6              ; 84 B6 | Store Y register to zero page
    STY $C2              ; 84 C2 | Store Y register to zero page
    STY $FE              ; 84 FE | Store Y register to zero page
    CMP $9004,Y          ; D9 04 90 | Compare accumulator (absolute,Y)
    ORA $C8              ; 05 C8 | Logical OR with accumulator (zero page)
    STY $C6              ; 84 C6 | Store Y register to zero page
    STY $AE              ; 84 AE | Store Y register to zero page
    ORA $25              ; 05 25 | Logical OR with accumulator (zero page)
    CPY $DC05            ; CC 05 DC | Compare Y register (absolute)
    STY $D4              ; 84 D4 | Store Y register to zero page
    STY $DA              ; 84 DA | Store Y register to zero page
    STY $F2              ; 84 F2 | Store Y register to zero page
    STY $DE              ; 84 DE | Store Y register to zero page
    STY $E2              ; 84 E2 | Store Y register to zero page
    STY $E6              ; 84 E6 | Store Y register to zero page
    STY $E3              ; 84 E3 | Store Y register to zero page
    ORA $EE              ; 05 EE | Logical OR with accumulator (zero page)
    STY $F0              ; 84 F0 | Store Y register to zero page
    STY $56              ; 84 56 | Store Y register to zero page
    PEA #$F884           ; F4 84 F8 | Push effective address to stack
    STY $FE              ; 84 FE | Store Y register to zero page
    STY $7C              ; 84 7C | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    STA $0E              ; 85 0E | Store accumulator to zero page
    STA $0C              ; 85 0C | Store accumulator to zero page
    STA $10              ; 85 10 | Store accumulator to zero page
    STA $49              ; 85 49 | Store accumulator to zero page
    ORA $B1              ; 05 B1 | Logical OR with accumulator (zero page)
    ORA $12              ; 05 12 | Logical OR with accumulator (zero page)
    STA $16              ; 85 16 | Store accumulator to zero page
    STA $18              ; 85 18 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2A6
; Address: $C2E77A
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2A6:
    STA $20              ; 85 20 | Store accumulator to zero page
    STA $FA              ; 85 FA | Store accumulator to zero page
    ORA $55              ; 05 55 | Logical OR with accumulator (zero page)
    EOR $6305,X          ; 5D 05 63 | Exclusive OR with accumulator (absolute,X)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    STA $2A              ; 85 2A | Store accumulator to zero page
    STA $28              ; 85 28 | Store accumulator to zero page
    STA $2E              ; 85 2E | Store accumulator to zero page
    STA $FB              ; 85 FB | Store accumulator to zero page
    ORA $C6              ; 05 C6 | Logical OR with accumulator (zero page)
    ORA $36              ; 05 36 | Logical OR with accumulator (zero page)
    STA $3A              ; 85 3A | Store accumulator to zero page
    STA $3C              ; 85 3C | Store accumulator to zero page
    STA $B3              ; 85 B3 | Store accumulator to zero page
    ORA $AA              ; 05 AA | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    STA $47              ; 85 47 | Store accumulator to zero page
    ORA $E7              ; 05 E7 | Logical OR with accumulator (zero page)
    ORA $44              ; 05 44 | Logical OR with accumulator (zero page)
    STA $D4              ; 85 D4 | Store accumulator to zero page
    LSR $4A85            ; 4E 85 4A | Logical shift right (absolute)
    STA $D4              ; 85 D4 | Store accumulator to zero page
    ORA $99              ; 05 99 | Logical OR with accumulator (zero page)
    STA $56              ; 85 56 | Store accumulator to zero page
    STA $58              ; 85 58 | Store accumulator to zero page
    STA $5A              ; 85 5A | Store accumulator to zero page
    STA $5E              ; 85 5E | Store accumulator to zero page
    STA $99              ; 85 99 | Store accumulator to zero page
    CMP ($03,X)          ; C1 03 | Compare accumulator ((zero page,X))
    STZ $85              ; 64 85 | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    STA $9E              ; 85 9E | Store accumulator to zero page
    ROR                  ; 6A | Rotate right (accumulator)
    STA $6E              ; 85 6E | Store accumulator to zero page
    STA $72              ; 85 72 | Store accumulator to zero page
    STA $4E              ; 85 4E | Store accumulator to zero page
    ORA $76              ; 05 76 | Logical OR with accumulator (zero page)
    STA $D0              ; 85 D0 | Store accumulator to zero page
    ORA $78              ; 05 78 | Logical OR with accumulator (zero page)
    STA $7C              ; 85 7C | Store accumulator to zero page
    STA $68              ; 85 68 | Store accumulator to zero page
    ORA $82              ; 05 82 | Logical OR with accumulator (zero page)
    STA $60              ; 85 60 | Store accumulator to zero page
    STX $85              ; 86 85 | Store X register to zero page
    SEP #$05             ; E2 05 | Set processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    STA $44              ; 85 44 | Store accumulator to zero page
    ORA $8E              ; 05 8E | Logical OR with accumulator (zero page)
    STA $94              ; 85 94 | Store accumulator to zero page
    STA $96              ; 85 96 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2A7
; Address: $C2E7E6
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2A7:
    STA $96              ; 85 96 | Store accumulator to zero page
    STZ $A085,X          ; 9E 85 A0 | Store zero to absolute,X
    STA $A2              ; 85 A2 | Store accumulator to zero page
    STA $AA              ; 85 AA | Store accumulator to zero page
    STA $A8              ; 85 A8 | Store accumulator to zero page
    STA $FF              ; 85 FF | Store accumulator to zero page
    ORA $AE              ; 05 AE | Logical OR with accumulator (zero page)
    LDA $B605,X          ; BD 05 B6 | Load from absolute,X into accumulator
    STA $BA              ; 85 BA | Store accumulator to zero page
    STA $BE              ; 85 BE | Store accumulator to zero page
    STA $C0              ; 85 C0 | Store accumulator to zero page
    STA $C6              ; 85 C6 | Store accumulator to zero page
    STA $1A              ; 85 1A | Store accumulator to zero page
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    STA $53              ; 85 53 | Store accumulator to zero page
    EOR $2205,Y          ; 59 05 22 | Exclusive OR with accumulator (absolute,Y)
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    STA $D4              ; 85 D4 | Store accumulator to zero page
    STA $D8              ; 85 D8 | Store accumulator to zero page
    STA $DC              ; 85 DC | Store accumulator to zero page
    STA $DA              ; 85 DA | Store accumulator to zero page
    STA $E0              ; 85 E0 | Game work RAM access
    STA $E4              ; 85 E4 | Store accumulator to zero page
    STA $1D              ; 85 1D | Store accumulator to zero page
    ORA $E8              ; 05 E8 | Logical OR with accumulator (zero page)
    STA $EA              ; 85 EA | Store accumulator to zero page
    STA $EC              ; 85 EC | Store accumulator to zero page
    STA $F0              ; 85 F0 | Store accumulator to zero page
    STA $F4              ; 85 F4 | Store accumulator to zero page
    STA $F6              ; 85 F6 | Store accumulator to zero page
    STA $D3              ; 85 D3 | Store accumulator to zero page
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    SBC ($05),Y          ; F1 05 | Subtract with carry ((zero page),Y)
    INC $0285,X          ; FE 85 02 | Increment (absolute,X)
    STX $F7              ; 86 F7 | Store X register to zero page
    ORA $E6              ; 05 E6 | Logical OR with accumulator (zero page)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    STX $08              ; 86 08 | Store X register to zero page
    STX $10              ; 86 10 | Store X register to zero page
    STX $E1              ; 86 E1 | Store X register to zero page
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    STX $30              ; 86 30 | Store X register to zero page
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    STX $1C              ; 86 1C | Store X register to zero page
    STX $84              ; 86 84 | Store X register to zero page
    ORA $24              ; 05 24 | Logical OR with accumulator (zero page)
    STX $26              ; 86 26 | Store X register to zero page
    STX $28              ; 86 28 | Store X register to zero page
    STX $37              ; 86 37 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2A8
; Address: $C2E859
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2A8:
    ROL                  ; 2A | Rotate left (accumulator)
    STX $30              ; 86 30 | Store X register to zero page
    STX $34              ; 86 34 | Store X register to zero page
    STX $38              ; 86 38 | Store X register to zero page
    STX $3C              ; 86 3C | Store X register to zero page
    STX $1B              ; 86 1B | Store X register to zero page
    ORA $42              ; 05 42 | Hardware register operation
    STX $46              ; 86 46 | Store X register to zero page
    STX $48              ; 86 48 | Store X register to zero page
    STX $4C              ; 86 4C | Store X register to zero page
    STX $50              ; 86 50 | Store X register to zero page
    STX $52              ; 86 52 | Store X register to zero page
    STX $B9              ; 86 B9 | Store X register to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    STX $FE              ; 86 FE | Store X register to zero page
    LSR $6086,X          ; 5E 86 60 | Logical shift right (absolute,X)
    STX $64              ; 86 64 | Store X register to zero page
    STX $DB              ; 86 DB | Store X register to zero page
    ORA $68              ; 05 68 | Logical OR with accumulator (zero page)
    STX $6A              ; 86 6A | Store X register to zero page
    STX $DD              ; 86 DD | Store X register to zero page
    ORA $72              ; 05 72 | Logical OR with accumulator (zero page)
    STX $78              ; 86 78 | Store X register to zero page
    STX $5C              ; 86 5C | Store X register to zero page
    ORA $F2              ; 05 F2 | Logical OR with accumulator (zero page)
    ORA $7C              ; 05 7C | Logical OR with accumulator (zero page)
    STX $80              ; 86 80 | Store X register to zero page
    STX $82              ; 86 82 | Store X register to zero page
    STX $86              ; 86 86 | Store X register to zero page
    STX $88              ; 86 88 | Store X register to zero page
    STX $8C              ; 86 8C | Store X register to zero page
    STX $D1              ; 86 D1 | Store X register to zero page
    STX $96              ; 86 96 | Store X register to zero page
    STX $9A              ; 86 9A | Store X register to zero page
    STX $9E              ; 86 9E | Store X register to zero page
    STX $A2              ; 86 A2 | Store X register to zero page
    STX $A6              ; 86 A6 | Store X register to zero page
    STX $A8              ; 86 A8 | Store X register to zero page
    STX $AA              ; 86 AA | Store X register to zero page
    STX $AC              ; 86 AC | Store X register to zero page
    STX $B0              ; 86 B0 | Store X register to zero page
    STX $06              ; 86 06 | Store X register to zero page
    ORA $E0              ; 05 E0 | Game work RAM access
    ORA $C0              ; 05 C0 | Logical OR with accumulator (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    STX $BE              ; 86 BE | Store X register to zero page
    STX $C2              ; 86 C2 | Store X register to zero page
    STX $C6              ; 86 C6 | Store X register to zero page
    STX $16              ; 86 16 | Store X register to zero page
    ORA $CC              ; 05 CC | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2A9
; Address: $C2E8C0
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2A9:
    STX $D0              ; 86 D0 | Store X register to zero page
    STX $D4              ; 86 D4 | Store X register to zero page
    STX $D8              ; 86 D8 | Store X register to zero page
    STX $35              ; 86 35 | Store X register to zero page
    ORA $DC              ; 05 DC | Logical OR with accumulator (zero page)
    STX $DE              ; 86 DE | Store X register to zero page
    STX $E2              ; 86 E2 | Store X register to zero page
    STX $E6              ; 86 E6 | Store X register to zero page
    STX $EA              ; 86 EA | Store X register to zero page
    STX $EE              ; 86 EE | Store X register to zero page
    STX $E7              ; 86 E7 | Store X register to zero page
    STX $F4              ; 86 F4 | Store X register to zero page
    STX $F8              ; 86 F8 | Store X register to zero page
    STX $FA              ; 86 FA | Store X register to zero page
    STX $1C              ; 86 1C | Store X register to zero page
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    STX $00              ; 86 00 | Store X register to zero page
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    CMP $0A00            ; CD 00 0A | Compare accumulator (absolute)
    AND $1005            ; 2D 05 10 | Logical AND with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CMP $1E04            ; CD 04 1E | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2AA
; Address: $C2E8FB
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2AA:
    JSR $2487            ; 20 87 24 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $3087            ; 2E 87 30 | Rotate left (absolute)
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    ORA $3E              ; 05 3E | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    ORA $D6              ; 05 D6 | Logical OR with accumulator (zero page)
    ORA $AF              ; 05 AF | Logical OR with accumulator (zero page)
    BPL $05              ; 10 05 | Branch if positive
    BVC $87              ; 50 87 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    ORA $5A              ; 05 5A | Logical OR with accumulator (zero page)
    CMP ($04),Y          ; D1 04 | Compare accumulator ((zero page),Y)
    LSR $6087,X          ; 5E 87 60 | Logical shift right (absolute,X)
    BEQ $05              ; F0 05 | Branch if equal
    BNE $04              ; D0 04 | Branch if not equal
    STZ $87              ; 64 87 | Store zero to zero page
    ROR                  ; 6A | Rotate right (accumulator)
    JMP ($7087)          ; 6C 87 70 | Jump to address (absolute indirect)
    LDY $7600            ; AC 00 76 | Load from absolute address into Y register
    ORA $7A              ; 05 7A | Logical OR with accumulator (zero page)
    ROR $8087,X          ; 7E 87 80 | Rotate right (absolute,X)
    STY $87              ; 84 87 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    STY $9087            ; 8C 87 90 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2AB
; Address: $C2E95B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2AB:
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $A087            ; 9C 87 A0 | Store zero to absolute
    LDX #$87             ; A2 87 | Load immediate value into X register
    LDX $87              ; A6 87 | Load from zero page into X register
    TAX                  ; AA | Transfer accumulator to X register
    LDX $B287            ; AE 87 B2 | Load from absolute address into X register
    TSX                  ; BA | Transfer stack pointer to X register
    LDY $C087,X          ; BC 87 C0 | Load from absolute,X into Y register
    CPY $87              ; C4 87 | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    CPY $D087            ; CC 87 D0 | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7F7F           ; F4 7F 7F | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $E5C0            ; 8D C0 E5 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2AC
; Address: $C2E98A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2AC:
    JSR $6F40            ; 20 40 6F | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2AD
; Address: $C2E995
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2AD:
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7F7F           ; F4 7F 7F | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $E39E            ; AD 9E E3 | Load from absolute address into accumulator
    ORA $E3A0            ; 0D A0 E3 | Logical OR with accumulator (absolute)
    ORA $E3A2            ; 0D A2 E3 | Logical OR with accumulator (absolute)
    ORA $E3A4            ; 0D A4 E3 | Logical OR with accumulator (absolute)
    ORA $E3A6            ; 0D A6 E3 | Logical OR with accumulator (absolute)
    ORA $E3A8            ; 0D A8 E3 | Logical OR with accumulator (absolute)
    ORA $E3AA            ; 0D AA E3 | Logical OR with accumulator (absolute)
    ORA $E3AC            ; 0D AC E3 | Logical OR with accumulator (absolute)
    ORA $E3AE            ; 0D AE E3 | Logical OR with accumulator (absolute)
    ORA $E3B0            ; 0D B0 E3 | Logical OR with accumulator (absolute)
    BNE $01              ; D0 01 | Branch if not equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2AE
; Address: $C2E9BD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2AE:
    STZ $E55C            ; 9C 5C E5 | Store zero to absolute
    STZ $E55E            ; 9C 5E E5 | Store zero to absolute
    STZ $E560            ; 9C 60 E5 | Store zero to absolute
    STZ $E562            ; 9C 62 E5 | Store zero to absolute
    STZ $E574            ; 9C 74 E5 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2AF
; Address: $C2E9CC
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2AF:
    STZ $E576            ; 9C 76 E5 | Store zero to absolute
    STZ $E578            ; 9C 78 E5 | Store zero to absolute
    STZ $E57A            ; 9C 7A E5 | Store zero to absolute
    STZ $E58C            ; 9C 8C E5 | Store zero to absolute
    STZ $E58E            ; 9C 8E E5 | Store zero to absolute
    STZ $E590            ; 9C 90 E5 | Store zero to absolute
    STZ $E592            ; 9C 92 E5 | Store zero to absolute
    STZ $E5A4            ; 9C A4 E5 | Store zero to absolute
    STZ $E5A6            ; 9C A6 E5 | Store zero to absolute
    STZ $E5A8            ; 9C A8 E5 | Store zero to absolute
    STZ $E5AA            ; 9C AA E5 | Store zero to absolute
    STZ $E344            ; 9C 44 E3 | Store zero to absolute
    STZ $E346            ; 9C 46 E3 | Store zero to absolute
    STZ $E348            ; 9C 48 E3 | Store zero to absolute
    STZ $E34A            ; 9C 4A E3 | Store zero to absolute
    STZ $E34C            ; 9C 4C E3 | Store zero to absolute
    STZ $E34E            ; 9C 4E E3 | Store zero to absolute
    STZ $E350            ; 9C 50 E3 | Store zero to absolute
    STZ $E352            ; 9C 52 E3 | Store zero to absolute
    STZ $E354            ; 9C 54 E3 | Store zero to absolute
    STZ $E356            ; 9C 56 E3 | Store zero to absolute
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $7EB491          ; 8F 91 B4 7E | Store accumulator to absolute long address
    LDA $7E99D9          ; AF D9 99 7E | Load from absolute long address into accumulator
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BNE $04              ; D0 04 | Branch if not equal
    JMP $C23CFE          ; 5C FE 3C C2 | Jump to address long
    STZ $E0CA            ; 9C CA E0 | Game work RAM access
    STZ $E0CC            ; 9C CC E0 | Game work RAM access
    STZ $E0CE            ; 9C CE E0 | Game work RAM access
    STZ $E0D0            ; 9C D0 E0 | Game work RAM access
    STZ $E0D2            ; 9C D2 E0 | Game work RAM access
    STZ $E0D4            ; 9C D4 E0 | Game work RAM access
    STZ $E0D6            ; 9C D6 E0 | Game work RAM access
    STZ $E0D8            ; 9C D8 E0 | Game work RAM access
    STZ $E0DA            ; 9C DA E0 | Game work RAM access
    STZ $E0DC            ; 9C DC E0 | Game work RAM access
    STZ $E0DE            ; 9C DE E0 | Game work RAM access
    STZ $E0E0            ; 9C E0 E0 | Game work RAM access
    STZ $E0E2            ; 9C E2 E0 | Game work RAM access
    STZ $E0E4            ; 9C E4 E0 | Game work RAM access
    STZ $E0E6            ; 9C E6 E0 | Game work RAM access
    STZ $E0E8            ; 9C E8 E0 | Game work RAM access
    STZ $E0EA            ; 9C EA E0 | Game work RAM access
    STZ $E0EC            ; 9C EC E0 | Game work RAM access
    STZ $E0EE            ; 9C EE E0 | Game work RAM access
    STZ $E0F0            ; 9C F0 E0 | Game work RAM access
    STZ $E0F2            ; 9C F2 E0 | Game work RAM access
    STZ $E0F4            ; 9C F4 E0 | Game work RAM access
    STZ $E0F6            ; 9C F6 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2B0
; Address: $C2EA64
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2B0:
    STZ $E0F8            ; 9C F8 E0 | Game work RAM access
    STZ $E0FA            ; 9C FA E0 | Game work RAM access
    STZ $E0FC            ; 9C FC E0 | Game work RAM access
    STZ $E0FE            ; 9C FE E0 | Game work RAM access
    STZ $E100            ; 9C 00 E1 | Store zero to absolute
    STZ $E102            ; 9C 02 E1 | Store zero to absolute
    STZ $E104            ; 9C 04 E1 | Store zero to absolute
    STZ $E106            ; 9C 06 E1 | Store zero to absolute
    STZ $E108            ; 9C 08 E1 | Store zero to absolute
    STZ $E10A            ; 9C 0A E1 | Store zero to absolute
    STZ $E10C            ; 9C 0C E1 | Store zero to absolute
    STZ $E10E            ; 9C 0E E1 | Store zero to absolute
    STZ $E110            ; 9C 10 E1 | Store zero to absolute
    STZ $E112            ; 9C 12 E1 | Store zero to absolute
    STZ $E114            ; 9C 14 E1 | Store zero to absolute
    STZ $E116            ; 9C 16 E1 | Store zero to absolute
    STZ $E118            ; 9C 18 E1 | Store zero to absolute
    STZ $E11A            ; 9C 1A E1 | Store zero to absolute
    STZ $E11C            ; 9C 1C E1 | Store zero to absolute
    STZ $E11E            ; 9C 1E E1 | Store zero to absolute
    STZ $E120            ; 9C 20 E1 | Store zero to absolute
    STZ $E122            ; 9C 22 E1 | Store zero to absolute
    STZ $E124            ; 9C 24 E1 | Store zero to absolute
    STZ $E126            ; 9C 26 E1 | Store zero to absolute
    STZ $E128            ; 9C 28 E1 | Store zero to absolute
    STZ $E12A            ; 9C 2A E1 | Store zero to absolute
    STZ $E12C            ; 9C 2C E1 | Store zero to absolute
    STZ $E12E            ; 9C 2E E1 | Store zero to absolute
    STZ $E130            ; 9C 30 E1 | Store zero to absolute
    STZ $E132            ; 9C 32 E1 | Store zero to absolute
    STZ $E134            ; 9C 34 E1 | Store zero to absolute
    STZ $E136            ; 9C 36 E1 | Store zero to absolute
    STZ $E138            ; 9C 38 E1 | Store zero to absolute
    STZ $E13A            ; 9C 3A E1 | Store zero to absolute
    STZ $E13C            ; 9C 3C E1 | Store zero to absolute
    STZ $E13E            ; 9C 3E E1 | Store zero to absolute
    STZ $E140            ; 9C 40 E1 | Store zero to absolute
    STZ $E142            ; 9C 42 E1 | Store zero to absolute
    STZ $E144            ; 9C 44 E1 | Store zero to absolute
    STZ $E146            ; 9C 46 E1 | Store zero to absolute
    STZ $E148            ; 9C 48 E1 | Store zero to absolute
    STZ $E14A            ; 9C 4A E1 | Store zero to absolute
    STZ $E14C            ; 9C 4C E1 | Store zero to absolute
    STZ $E14E            ; 9C 4E E1 | Store zero to absolute
    STZ $E150            ; 9C 50 E1 | Store zero to absolute
    STZ $E152            ; 9C 52 E1 | Store zero to absolute
    STZ $E154            ; 9C 54 E1 | Store zero to absolute
    STZ $E156            ; 9C 56 E1 | Store zero to absolute
    STZ $E158            ; 9C 58 E1 | Store zero to absolute
    STZ $E15A            ; 9C 5A E1 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2B1
; Address: $C2EAFA
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2B1:
    STZ $E15C            ; 9C 5C E1 | Store zero to absolute
    STZ $E15E            ; 9C 5E E1 | Store zero to absolute
    STZ $E160            ; 9C 60 E1 | Store zero to absolute
    STZ $E162            ; 9C 62 E1 | Store zero to absolute
    STZ $E164            ; 9C 64 E1 | Store zero to absolute
    STZ $E166            ; 9C 66 E1 | Store zero to absolute
    STZ $E168            ; 9C 68 E1 | Store zero to absolute
    STZ $E16A            ; 9C 6A E1 | Store zero to absolute
    STZ $E16C            ; 9C 6C E1 | Store zero to absolute
    STZ $E16E            ; 9C 6E E1 | Store zero to absolute
    STZ $E170            ; 9C 70 E1 | Store zero to absolute
    STZ $E172            ; 9C 72 E1 | Store zero to absolute
    STZ $E174            ; 9C 74 E1 | Store zero to absolute
    STZ $E176            ; 9C 76 E1 | Store zero to absolute
    STZ $E178            ; 9C 78 E1 | Store zero to absolute
    STZ $E17A            ; 9C 7A E1 | Store zero to absolute
    STZ $E17C            ; 9C 7C E1 | Store zero to absolute
    STZ $E17E            ; 9C 7E E1 | Store zero to absolute
    STZ $E180            ; 9C 80 E1 | Store zero to absolute
    STZ $E182            ; 9C 82 E1 | Store zero to absolute
    STZ $E184            ; 9C 84 E1 | Store zero to absolute
    STZ $E186            ; 9C 86 E1 | Store zero to absolute
    STZ $E188            ; 9C 88 E1 | Store zero to absolute
    STZ $E18A            ; 9C 8A E1 | Store zero to absolute
    STZ $E18C            ; 9C 8C E1 | Store zero to absolute
    STZ $E18E            ; 9C 8E E1 | Store zero to absolute
    STZ $E190            ; 9C 90 E1 | Store zero to absolute
    STZ $E192            ; 9C 92 E1 | Store zero to absolute
    STZ $E194            ; 9C 94 E1 | Store zero to absolute
    STZ $E196            ; 9C 96 E1 | Store zero to absolute
    STZ $E198            ; 9C 98 E1 | Store zero to absolute
    STZ $E19A            ; 9C 9A E1 | Store zero to absolute
    STZ $E19C            ; 9C 9C E1 | Store zero to absolute
    STZ $E19E            ; 9C 9E E1 | Store zero to absolute
    STZ $E1A0            ; 9C A0 E1 | Store zero to absolute
    STZ $E1A2            ; 9C A2 E1 | Store zero to absolute
    STZ $E1A4            ; 9C A4 E1 | Store zero to absolute
    STZ $E1A6            ; 9C A6 E1 | Store zero to absolute
    STZ $E1A8            ; 9C A8 E1 | Store zero to absolute
    STZ $E1AA            ; 9C AA E1 | Store zero to absolute
    STZ $E1AC            ; 9C AC E1 | Store zero to absolute
    STZ $E1AE            ; 9C AE E1 | Store zero to absolute
    STZ $E1B0            ; 9C B0 E1 | Store zero to absolute
    STZ $E1B2            ; 9C B2 E1 | Store zero to absolute
    STZ $E1B4            ; 9C B4 E1 | Store zero to absolute
    STZ $E1B6            ; 9C B6 E1 | Store zero to absolute
    STZ $E1B8            ; 9C B8 E1 | Store zero to absolute
    STZ $E1BA            ; 9C BA E1 | Store zero to absolute
    STZ $E1BC            ; 9C BC E1 | Store zero to absolute
    STZ $E1BE            ; 9C BE E1 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2B2
; Address: $C2EB90
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2B2:
    STZ $E1C0            ; 9C C0 E1 | Store zero to absolute
    STZ $E1C2            ; 9C C2 E1 | Store zero to absolute
    STZ $E1C4            ; 9C C4 E1 | Store zero to absolute
    STZ $E1C6            ; 9C C6 E1 | Store zero to absolute
    STZ $E1C8            ; 9C C8 E1 | Store zero to absolute
    STZ $E1CA            ; 9C CA E1 | Store zero to absolute
    STZ $E1CC            ; 9C CC E1 | Store zero to absolute
    STZ $E1CE            ; 9C CE E1 | Store zero to absolute
    STZ $E1D0            ; 9C D0 E1 | Store zero to absolute
    STZ $E1D2            ; 9C D2 E1 | Store zero to absolute
    STZ $E1D4            ; 9C D4 E1 | Store zero to absolute
    STZ $E1D6            ; 9C D6 E1 | Store zero to absolute
    STZ $E1D8            ; 9C D8 E1 | Store zero to absolute
    STZ $E1DA            ; 9C DA E1 | Store zero to absolute
    STZ $E1DC            ; 9C DC E1 | Store zero to absolute
    STZ $E1DE            ; 9C DE E1 | Store zero to absolute
    STZ $E1E0            ; 9C E0 E1 | Store zero to absolute
    STZ $E1E2            ; 9C E2 E1 | Store zero to absolute
    STZ $E1E4            ; 9C E4 E1 | Store zero to absolute
    STZ $E1E6            ; 9C E6 E1 | Store zero to absolute
    STZ $E1E8            ; 9C E8 E1 | Store zero to absolute
    STZ $E1EA            ; 9C EA E1 | Store zero to absolute
    STZ $E1EC            ; 9C EC E1 | Store zero to absolute
    STZ $E1EE            ; 9C EE E1 | Store zero to absolute
    STZ $E1F0            ; 9C F0 E1 | Store zero to absolute
    STZ $E1F2            ; 9C F2 E1 | Store zero to absolute
    STZ $E1F4            ; 9C F4 E1 | Store zero to absolute
    STZ $E1F6            ; 9C F6 E1 | Store zero to absolute
    STZ $E1F8            ; 9C F8 E1 | Store zero to absolute
    STZ $E1FA            ; 9C FA E1 | Store zero to absolute
    STZ $E1FC            ; 9C FC E1 | Store zero to absolute
    STZ $E1FE            ; 9C FE E1 | Store zero to absolute
    STZ $E200            ; 9C 00 E2 | Store zero to absolute
    STZ $E202            ; 9C 02 E2 | Store zero to absolute
    STZ $E204            ; 9C 04 E2 | Store zero to absolute
    STZ $E206            ; 9C 06 E2 | Store zero to absolute
    STZ $E208            ; 9C 08 E2 | Store zero to absolute
    STZ $E20A            ; 9C 0A E2 | Store zero to absolute
    STZ $E20C            ; 9C 0C E2 | Store zero to absolute
    STZ $E20E            ; 9C 0E E2 | Store zero to absolute
    STZ $E210            ; 9C 10 E2 | Store zero to absolute
    STZ $E212            ; 9C 12 E2 | Store zero to absolute
    STZ $E214            ; 9C 14 E2 | Store zero to absolute
    STZ $E216            ; 9C 16 E2 | Store zero to absolute
    STZ $E218            ; 9C 18 E2 | Store zero to absolute
    STZ $E21A            ; 9C 1A E2 | Store zero to absolute
    STZ $E21C            ; 9C 1C E2 | Store zero to absolute
    STZ $E21E            ; 9C 1E E2 | Store zero to absolute
    STZ $E220            ; 9C 20 E2 | Store zero to absolute
    STZ $E222            ; 9C 22 E2 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2B3
; Address: $C2EC26
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2B3:
    STZ $E224            ; 9C 24 E2 | Store zero to absolute
    STZ $E226            ; 9C 26 E2 | Store zero to absolute
    STZ $E228            ; 9C 28 E2 | Store zero to absolute
    STZ $E22A            ; 9C 2A E2 | Store zero to absolute
    STZ $E22C            ; 9C 2C E2 | Store zero to absolute
    STZ $E22E            ; 9C 2E E2 | Store zero to absolute
    STZ $E230            ; 9C 30 E2 | Store zero to absolute
    STZ $E232            ; 9C 32 E2 | Store zero to absolute
    STZ $E234            ; 9C 34 E2 | Store zero to absolute
    STZ $E236            ; 9C 36 E2 | Store zero to absolute
    STZ $E238            ; 9C 38 E2 | Store zero to absolute
    STZ $E23A            ; 9C 3A E2 | Store zero to absolute
    STZ $E23C            ; 9C 3C E2 | Store zero to absolute
    STZ $E23E            ; 9C 3E E2 | Store zero to absolute
    STZ $E240            ; 9C 40 E2 | Store zero to absolute
    STZ $E242            ; 9C 42 E2 | Store zero to absolute
    STZ $E244            ; 9C 44 E2 | Store zero to absolute
    STZ $E246            ; 9C 46 E2 | Store zero to absolute
    STZ $E248            ; 9C 48 E2 | Store zero to absolute
    STZ $E24A            ; 9C 4A E2 | Store zero to absolute
    STZ $E24C            ; 9C 4C E2 | Store zero to absolute
    STZ $E24E            ; 9C 4E E2 | Store zero to absolute
    STZ $E250            ; 9C 50 E2 | Store zero to absolute
    STZ $E252            ; 9C 52 E2 | Store zero to absolute
    STZ $E254            ; 9C 54 E2 | Store zero to absolute
    STZ $E256            ; 9C 56 E2 | Store zero to absolute
    STZ $E258            ; 9C 58 E2 | Store zero to absolute
    STZ $E25A            ; 9C 5A E2 | Store zero to absolute
    STZ $E25C            ; 9C 5C E2 | Store zero to absolute
    STZ $E25E            ; 9C 5E E2 | Store zero to absolute
    STZ $E260            ; 9C 60 E2 | Store zero to absolute
    STZ $E262            ; 9C 62 E2 | Store zero to absolute
    STZ $E264            ; 9C 64 E2 | Store zero to absolute
    STZ $E266            ; 9C 66 E2 | Store zero to absolute
    STZ $E268            ; 9C 68 E2 | Store zero to absolute
    STZ $E26A            ; 9C 6A E2 | Store zero to absolute
    STZ $E26C            ; 9C 6C E2 | Store zero to absolute
    STZ $E26E            ; 9C 6E E2 | Store zero to absolute
    STZ $E270            ; 9C 70 E2 | Store zero to absolute
    STZ $E272            ; 9C 72 E2 | Store zero to absolute
    STZ $E274            ; 9C 74 E2 | Store zero to absolute
    STZ $E276            ; 9C 76 E2 | Store zero to absolute
    STZ $E278            ; 9C 78 E2 | Store zero to absolute
    STZ $E27A            ; 9C 7A E2 | Store zero to absolute
    STZ $E27C            ; 9C 7C E2 | Store zero to absolute
    STZ $E27E            ; 9C 7E E2 | Store zero to absolute
    STZ $E280            ; 9C 80 E2 | Store zero to absolute
    STZ $E282            ; 9C 82 E2 | Store zero to absolute
    STZ $E284            ; 9C 84 E2 | Store zero to absolute
    STZ $E286            ; 9C 86 E2 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2B4
; Address: $C2ECBC
; Size: 128 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2B4:
    STZ $E288            ; 9C 88 E2 | Store zero to absolute
    STZ $E28A            ; 9C 8A E2 | Store zero to absolute
    STZ $E28C            ; 9C 8C E2 | Store zero to absolute
    STZ $E28E            ; 9C 8E E2 | Store zero to absolute
    STZ $E290            ; 9C 90 E2 | Store zero to absolute
    STZ $E292            ; 9C 92 E2 | Store zero to absolute
    STZ $E294            ; 9C 94 E2 | Store zero to absolute
    STZ $E296            ; 9C 96 E2 | Store zero to absolute
    STZ $E298            ; 9C 98 E2 | Store zero to absolute
    STZ $E29A            ; 9C 9A E2 | Store zero to absolute
    STZ $E29C            ; 9C 9C E2 | Store zero to absolute
    STZ $E29E            ; 9C 9E E2 | Store zero to absolute
    STZ $E2A0            ; 9C A0 E2 | Store zero to absolute
    STZ $E2A2            ; 9C A2 E2 | Store zero to absolute
    STZ $E2A4            ; 9C A4 E2 | Store zero to absolute
    STZ $E2A6            ; 9C A6 E2 | Store zero to absolute
    STZ $E2A8            ; 9C A8 E2 | Store zero to absolute
    STZ $E2AA            ; 9C AA E2 | Store zero to absolute
    STZ $E2AC            ; 9C AC E2 | Store zero to absolute
    STZ $E2AE            ; 9C AE E2 | Store zero to absolute
    STZ $E2B0            ; 9C B0 E2 | Store zero to absolute
    STZ $E2B2            ; 9C B2 E2 | Store zero to absolute
    STZ $E2B4            ; 9C B4 E2 | Store zero to absolute
    STZ $E2B6            ; 9C B6 E2 | Store zero to absolute
    STZ $E2B8            ; 9C B8 E2 | Store zero to absolute
    STZ $E2BA            ; 9C BA E2 | Store zero to absolute
    STZ $E2BC            ; 9C BC E2 | Store zero to absolute
    STZ $E2BE            ; 9C BE E2 | Store zero to absolute
    STZ $E2C0            ; 9C C0 E2 | Store zero to absolute
    STZ $E2C2            ; 9C C2 E2 | Store zero to absolute
    STZ $E2C4            ; 9C C4 E2 | Store zero to absolute
    STZ $E2C6            ; 9C C6 E2 | Store zero to absolute
    STZ $E2C8            ; 9C C8 E2 | Store zero to absolute
    STZ $E2CA            ; 9C CA E2 | Store zero to absolute
    STZ $E2CC            ; 9C CC E2 | Store zero to absolute
    STZ $E2CE            ; 9C CE E2 | Store zero to absolute
    STZ $E2D0            ; 9C D0 E2 | Store zero to absolute
    LDX #$08             ; A2 08 | Load immediate value into X register
    STX $18              ; 86 18 | Store X register to zero page
    LDA $E2D2,X          ; BD D2 E2 | Load from absolute,X into accumulator
    BEQ $0E              ; F0 0E | Branch if equal
    LDA $E39E,X          ; BD 9E E3 | Load from absolute,X into accumulator
    ORA $E3A8,X          ; 1D A8 E3 | Logical OR with accumulator (absolute,X)
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2B6
; Address: $C2ED40
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2B6:
    JSR $6DF7            ; 20 F7 6D | Jump to subroutine
    LDX $18              ; A6 18 | Load from zero page into X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $E5              ; 10 E5 | Branch if positive

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2B7
; Address: $C2ED49
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2B7:
    LDA $E2D2            ; AD D2 E2 | Load from absolute address into accumulator
    BEQ $15              ; F0 15 | Branch if equal
    LDA $E31E            ; AD 1E E3 | Load from absolute address into accumulator
    AND $E3BA            ; 2D BA E3 | Logical AND with accumulator (absolute)
    STA $7E7F9C          ; 8F 9C 7F 7E | Store accumulator to absolute long address
    LDA $E328            ; AD 28 E3 | Load from absolute address into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    STA $7E7FA4          ; 8F A4 7F 7E | Store accumulator to absolute long address
    LDA $E2D4            ; AD D4 E2 | Load from absolute address into accumulator
    BEQ $15              ; F0 15 | Branch if equal
    LDA $E320            ; AD 20 E3 | Load from absolute address into accumulator
    AND $E3BA            ; 2D BA E3 | Logical AND with accumulator (absolute)
    STA $7E7F9E          ; 8F 9E 7F 7E | Store accumulator to absolute long address
    LDA $E32A            ; AD 2A E3 | Load from absolute address into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    STA $7E7FA6          ; 8F A6 7F 7E | Store accumulator to absolute long address
    LDA $E2D6            ; AD D6 E2 | Load from absolute address into accumulator
    BEQ $15              ; F0 15 | Branch if equal
    LDA $E322            ; AD 22 E3 | Load from absolute address into accumulator
    AND $E3BA            ; 2D BA E3 | Logical AND with accumulator (absolute)
    STA $7E7FA0          ; 8F A0 7F 7E | Store accumulator to absolute long address
    LDA $E32C            ; AD 2C E3 | Load from absolute address into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    STA $7E7FA8          ; 8F A8 7F 7E | Store accumulator to absolute long address
    LDA $E2D8            ; AD D8 E2 | Load from absolute address into accumulator
    BEQ $15              ; F0 15 | Branch if equal
    LDA $E324            ; AD 24 E3 | Load from absolute address into accumulator
    AND $E3BA            ; 2D BA E3 | Logical AND with accumulator (absolute)
    STA $7E7FA2          ; 8F A2 7F 7E | Store accumulator to absolute long address
    LDA $E32E            ; AD 2E E3 | Load from absolute address into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    STA $7E7FAA          ; 8F AA 7F 7E | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2B9
; Address: $C2EDB6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2B9:
    LDA $E39E,X          ; BD 9E E3 | Load from absolute,X into accumulator
    BEQ $3B              ; F0 3B | Branch if equal
    BMI $18              ; 30 18 | Branch if negative
    LDA $E332,X          ; BD 32 E3 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $E39E,X          ; 7D 9E E3 | Add with carry (absolute,X)
    STA $E332,X          ; 9D 32 E3 | Store accumulator to absolute,X
    XBA                  ; EB | Exchange accumulator bytes
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $26              ; F0 26 | Branch if equal
    STA $1C              ; 85 1C | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2BA
; Address: $C2EDD2
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2BA:
    JMP $6E9E            ; 4C 9E 6E | Jump to address
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    STA $1C              ; 85 1C | Store accumulator to zero page
    LDA $E332,X          ; BD 32 E3 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    STA $E332,X          ; 9D 32 E3 | Store accumulator to absolute,X
    XBA                  ; EB | Exchange accumulator bytes
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    STA $1C              ; 85 1C | Store accumulator to zero page
    JMP $6ED5            ; 4C D5 6E | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2BB
; Address: $C2EDF7
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2BB:
    LDA $E3A8,X          ; BD A8 E3 | Load from absolute,X into accumulator
    BEQ $3B              ; F0 3B | Branch if equal
    BMI $18              ; 30 18 | Branch if negative
    LDA $E332,X          ; BD 32 E3 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $E3A8,X          ; 7D A8 E3 | Add with carry (absolute,X)
    STA $E332,X          ; 9D 32 E3 | Store accumulator to absolute,X
    XBA                  ; EB | Exchange accumulator bytes
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $26              ; F0 26 | Branch if equal
    STA $1C              ; 85 1C | Store accumulator to zero page
    JMP $6E67            ; 4C 67 6E | Jump to address
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    STA $1C              ; 85 1C | Store accumulator to zero page
    LDA $E332,X          ; BD 32 E3 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    STA $E332,X          ; 9D 32 E3 | Store accumulator to absolute,X
    XBA                  ; EB | Exchange accumulator bytes
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    STA $1C              ; 85 1C | Store accumulator to zero page
    JMP $6E38            ; 4C 38 6E | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2BC
; Address: $C2EE38
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2BC:
    LDA $E33C            ; AD 3C E3 | Load from absolute address into accumulator
    BNE $29              ; D0 29 | Branch if not equal
    LDA $E376,X          ; BD 76 E3 | Load from absolute,X into accumulator
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2BD
; Address: $C2EE41
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2BD:
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    SEC                  ; 38 | Set carry flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $E376,X          ; 9D 76 E3 | Store accumulator to absolute,X
    STA $16              ; 85 16 | Store accumulator to zero page
    LDA $E328,X          ; BD 28 E3 | Load from absolute,X into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    STA $E328,X          ; 9D 28 E3 | Store accumulator to absolute,X
    STA $E362,X          ; 9D 62 E3 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2C0
; Address: $C2EE67
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2C0:
    LDA $E340            ; AD 40 E3 | Load from absolute address into accumulator
    BNE $31              ; D0 31 | Branch if not equal
    LDA $E376,X          ; BD 76 E3 | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $1C              ; 65 1C | Add with carry (zero page)
    SEC                  ; 38 | Set carry flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $E376,X          ; 9D 76 E3 | Store accumulator to absolute,X
    CLC                  ; 18 | Clear carry flag
    ADC $E3B8            ; 6D B8 E3 | Add with carry (absolute)
    STA $16              ; 85 16 | Store accumulator to zero page
    LDA $E328,X          ; BD 28 E3 | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $1C              ; 65 1C | Add with carry (zero page)
    STA $E328,X          ; 9D 28 E3 | Store accumulator to absolute,X
    CLC                  ; 18 | Clear carry flag
    ADC $E3B8            ; 6D B8 E3 | Add with carry (absolute)
    STA $E362,X          ; 9D 62 E3 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2C3
; Address: $C2EE9E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2C3:
    LDA $E33E            ; AD 3E E3 | Load from absolute address into accumulator
    BNE $31              ; D0 31 | Branch if not equal
    LDA $E36C,X          ; BD 6C E3 | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $1C              ; 65 1C | Add with carry (zero page)
    SEC                  ; 38 | Set carry flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2C4
; Address: $C2EEAE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2C4:
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $E36C,X          ; 9D 6C E3 | Store accumulator to absolute,X
    CLC                  ; 18 | Clear carry flag
    ADC $E3B6            ; 6D B6 E3 | Add with carry (absolute)
    STA $14              ; 85 14 | Store accumulator to zero page
    LDA $E31E,X          ; BD 1E E3 | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $1C              ; 65 1C | Add with carry (zero page)
    STA $E31E,X          ; 9D 1E E3 | Store accumulator to absolute,X
    CLC                  ; 18 | Clear carry flag
    ADC $E3B6            ; 6D B6 E3 | Add with carry (absolute)
    STA $E358,X          ; 9D 58 E3 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2C7
; Address: $C2EED5
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2C7:
    LDA $E342            ; AD 42 E3 | Load from absolute address into accumulator
    BNE $2B              ; D0 2B | Branch if not equal
    LDX $18              ; A6 18 | Load from zero page into X register
    LDA $E36C,X          ; BD 6C E3 | Load from absolute,X into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    SEC                  ; 38 | Set carry flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $E36C,X          ; 9D 6C E3 | Store accumulator to absolute,X
    STA $14              ; 85 14 | Store accumulator to zero page
    LDA $E31E,X          ; BD 1E E3 | Load from absolute,X into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    STA $E31E,X          ; 9D 1E E3 | Store accumulator to absolute,X
    STA $E358,X          ; 9D 58 E3 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2CA
; Address: $C2EF06
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2CA:
    DEX                  ; CA | Decrement X register
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    SBC ($4E,X)          ; E1 4E | Subtract with carry ((zero page,X))
    SBC ($90,X)          ; E1 90 | Subtract with carry ((zero page,X))
    SBC ($D2,X)          ; E1 D2 | Subtract with carry ((zero page,X))
    SBC ($12,X)          ; E1 12 | Subtract with carry ((zero page,X))
    SEP #$52             ; E2 52 | Set processor status bits
    SEP #$92             ; E2 92 | Set processor status bits
    SEP #$A6             ; E2 A6 | Set processor status bits
    CLC                  ; 18 | Clear carry flag
    CPX #$08             ; E0 08 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2CC
; Address: $C2EF1E
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2CC:
    INC $E344,X          ; FE 44 E3 | Increment (absolute,X)
    LDA $16              ; A5 16 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $E3C6            ; 8D C6 E3 | Store accumulator to absolute address
    LDA $E36C,X          ; BD 6C E3 | Load from absolute,X into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $E3C4            ; 8D C4 E3 | Store accumulator to absolute address
    LDA                  ; BF 06 6F C1 | Load from absolute long,X into accumulator
    STA $E3C8            ; 8D C8 E3 | Store accumulator to absolute address
    LDA $E3B2            ; AD B2 E3 | Load from absolute address into accumulator
    INC                  ; 1A | Increment accumulator
    STA $E5C0            ; 8D C0 E5 | Store accumulator to absolute address
    LDX $18              ; A6 18 | Load from zero page into X register
    LDA $E3E2            ; AD E2 E3 | Load from absolute address into accumulator
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E472            ; CD 72 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B2            ; AD B2 E4 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    JMP $7003            ; 4C 03 70 | Jump to address
    LDA $E3E4            ; AD E4 E3 | Load from absolute address into accumulator
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E474            ; CD 74 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B4            ; AD B4 E4 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$02             ; A0 02 | Load immediate value into Y register
    JMP $7003            ; 4C 03 70 | Jump to address
    LDA $E3E6            ; AD E6 E3 | Load from absolute address into accumulator
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E476            ; CD 76 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B6            ; AD B6 E4 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$04             ; A0 04 | Load immediate value into Y register
    JMP $7003            ; 4C 03 70 | Jump to address
    LDA $E3E8            ; AD E8 E3 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2CD
; Address: $C2EF8D
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2CD:
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E478            ; CD 78 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B8            ; AD B8 E4 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$06             ; A0 06 | Load immediate value into Y register
    JMP $7003            ; 4C 03 70 | Jump to address
    LDA $E3EA            ; AD EA E3 | Load from absolute address into accumulator
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E47A            ; CD 7A E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4BA            ; AD BA E4 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$08             ; A0 08 | Load immediate value into Y register
    JMP $7003            ; 4C 03 70 | Jump to address
    LDA $E3EC            ; AD EC E3 | Load from absolute address into accumulator
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E47C            ; CD 7C E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4BC            ; AD BC E4 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$0A             ; A0 0A | Load immediate value into Y register
    JMP $7003            ; 4C 03 70 | Jump to address
    LDA $E3EE            ; AD EE E3 | Load from absolute address into accumulator
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E47E            ; CD 7E E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4BE            ; AD BE E4 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    JMP $7003            ; 4C 03 70 | Jump to address
    LDA $E3F0            ; AD F0 E3 | Load from absolute address into accumulator
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E480            ; CD 80 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4C0            ; AD C0 E4 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$0E             ; A0 0E | Load immediate value into Y register
    JMP $7003            ; 4C 03 70 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2CE
; Address: $C2F003
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2CE:
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC #$62             ; 69 62 | Add with carry (immediate)
    STA $08              ; 85 08 | Store accumulator to zero page
    LDA $E3C4            ; AD C4 E3 | Load from absolute address into accumulator
    STA $0A              ; 85 0A | Store accumulator to zero page
    LDA $E3C6            ; AD C6 E3 | Load from absolute address into accumulator
    STA $0C              ; 85 0C | Store accumulator to zero page
    LDA $E3C8            ; AD C8 E3 | Load from absolute address into accumulator
    STA $04              ; 85 04 | Store accumulator to zero page
    LDA $E412,Y          ; B9 12 E4 | Load from absolute,Y into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $E422,Y          ; B9 22 E4 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $02              ; 85 02 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2CF
; Address: $C2F02A
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2CF:
    JSR $A703            ; 20 03 A7 | Jump to subroutine
    LDA $E402,Y          ; B9 02 E4 | Load from absolute,Y into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $706C            ; 4C 6C 70 | Jump to address
    LDA $E5B8            ; AD B8 E5 | Load from absolute address into accumulator
    DEC                  ; 3A | Decrement accumulator
    STA $26              ; 85 26 | Store accumulator to zero page
    LDA $E5BA            ; AD BA E5 | Load from absolute address into accumulator
    DEC                  ; 3A | Decrement accumulator
    STA $28              ; 85 28 | Store accumulator to zero page
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $E452,Y          ; 79 52 E4 | Add with carry (absolute,Y)
    STA $0C              ; 85 0C | Store accumulator to zero page
    LDA $0A              ; A5 0A | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E432,Y          ; F9 32 E4 | Subtract with carry (absolute,Y)
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    STA $E3D0            ; 8D D0 E3 | Store accumulator to absolute address
    LDA $E5C0            ; AD C0 E5 | Load from absolute address into accumulator
    STA $24              ; 85 24 | Store accumulator to zero page
    LDA $E3F2,Y          ; B9 F2 E3 | Load from absolute,Y into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    PHY                  ; 5A | Push Y register to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2D0
; Address: $C2F06C
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2D0:
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    CMP $E452,Y          ; D9 52 E4 | Compare accumulator (absolute,Y)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $70BD            ; 4C BD 70 | Jump to address
    LDA $E4D2,Y          ; B9 D2 E4 | Load from absolute,Y into accumulator
    STA $E3D6            ; 8D D6 E3 | Store accumulator to absolute address
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BNE $05              ; D0 05 | Branch if not equal
    STA $E3D6            ; 8D D6 E3 | Store accumulator to absolute address
    LDA $E4E2,Y          ; B9 E2 E4 | Load from absolute,Y into accumulator
    STA $E3DA            ; 8D DA E3 | Store accumulator to absolute address
    LDA $E4F2,Y          ; B9 F2 E4 | Load from absolute,Y into accumulator
    STA $E3DE            ; 8D DE E3 | Store accumulator to absolute address
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BNE $0D              ; D0 0D | Branch if not equal
    PHY                  ; 5A | Push Y register to stack
    LDA $E5B4            ; AD B4 E5 | Load from absolute address into accumulator
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $E3DE            ; 8D DE E3 | Store accumulator to absolute address
    PLY                  ; 7A | Pull Y register from stack
    LDA $E452,Y          ; B9 52 E4 | Load from absolute,Y into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $0C              ; E5 0C | Subtract with carry (zero page)
    CMP #$21             ; C9 21 | PPU graphics register access
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $71B4            ; 4C B4 71 | Jump to address
    AND $1E              ; 25 1E | Logical AND with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $E452,Y          ; 79 52 E4 | Add with carry (absolute,Y)
    STA $0C              ; 85 0C | Store accumulator to zero page
    JMP $7131            ; 4C 31 71 | Jump to address
    LDA $E462,Y          ; B9 62 E4 | Load from absolute,Y into accumulator
    CMP $0C              ; C5 0C | Compare accumulator (zero page)
    BCC $2B              ; 90 2B | Branch if carry clear
    LDA $E502,Y          ; B9 02 E5 | Load from absolute,Y into accumulator
    STA $E3D6            ; 8D D6 E3 | Store accumulator to absolute address
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BNE $06              ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2D1
; Address: $C2F0CF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2D1:
    JSR $A7DD            ; 20 DD A7 | Jump to subroutine
    STA $E3D6            ; 8D D6 E3 | Store accumulator to absolute address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $E3DA            ; 8D DA E3 | Store accumulator to absolute address
    LDA $E512,Y          ; B9 12 E5 | Load from absolute,Y into accumulator
    STA $E3DE            ; 8D DE E3 | Store accumulator to absolute address
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BNE $06              ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2D3
; Address: $C2F0EC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2D3:
    JMP $7131            ; 4C 31 71 | Jump to address
    LDA $E522,Y          ; B9 22 E5 | Load from absolute,Y into accumulator
    STA $E3D6            ; 8D D6 E3 | Store accumulator to absolute address
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BNE $06              ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2D4
; Address: $C2F0FA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2D4:
    JSR $A78C            ; 20 8C A7 | Jump to subroutine
    STA $E3D6            ; 8D D6 E3 | Store accumulator to absolute address
    LDA $E532,Y          ; B9 32 E5 | Load from absolute,Y into accumulator
    STA $E3DA            ; 8D DA E3 | Store accumulator to absolute address
    LDA $E542,Y          ; B9 42 E5 | Load from absolute,Y into accumulator
    STA $E3DE            ; 8D DE E3 | Store accumulator to absolute address
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BNE $06              ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2D5
; Address: $C2F111
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2D5:
    JSR $A776            ; 20 76 A7 | Jump to subroutine
    STA $E3DE            ; 8D DE E3 | Store accumulator to absolute address
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E462,Y          ; F9 62 E4 | Subtract with carry (absolute,Y)
    CMP #$21             ; C9 21 | PPU graphics register access
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $71B4            ; 4C B4 71 | Jump to address
    AND $1E              ; 25 1E | Logical AND with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA $E462,Y          ; B9 62 E4 | Load from absolute,Y into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    STZ $E3CA            ; 9C CA E3 | Store zero to absolute
    STZ $E3CC            ; 9C CC E3 | Store zero to absolute
    STZ $E3CE            ; 9C CE E3 | Store zero to absolute
    LDA $E5C0            ; AD C0 E5 | Load from absolute address into accumulator
    STA $20              ; 85 20 | Store accumulator to zero page
    LDA $0A              ; A5 0A | Load from zero page into accumulator
    CMP $E432,Y          ; D9 32 E4 | Compare accumulator (absolute,Y)
    BCC $14              ; 90 14 | Branch if carry clear
    CMP $E442,Y          ; D9 42 E4 | Compare accumulator (absolute,Y)
    BEQ $35              ; F0 35 | Branch if equal
    BCC $33              ; 90 33 | Branch if carry clear
    LDA $0A              ; A5 0A | Load from zero page into accumulator
    STA $E3D4            ; 8D D4 E3 | Store accumulator to absolute address
    LDA $20              ; A5 20 | Load from zero page into accumulator
    STA $E3CE            ; 8D CE E3 | Store accumulator to absolute address
    JMP $71AB            ; 4C AB 71 | Jump to address
    STA $E3D0            ; 8D D0 E3 | Store accumulator to absolute address
    LDA $E432,Y          ; B9 32 E4 | Load from absolute,Y into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $0A              ; E5 0A | Subtract with carry (zero page)
    STA $E3CA            ; 8D CA E3 | Store accumulator to absolute address
    LDA $20              ; A5 20 | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2D6
; Address: $C2F169
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2D6:
    SBC $E3CA            ; ED CA E3 | Subtract with carry (absolute)
    BCS $08              ; B0 08 | Branch if carry set
    LDA $20              ; A5 20 | Load from zero page into accumulator
    STA $E3CA            ; 8D CA E3 | Store accumulator to absolute address
    JMP $71AB            ; 4C AB 71 | Jump to address
    STA $20              ; 85 20 | Store accumulator to zero page
    LDA $0A              ; A5 0A | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $E3CA            ; 6D CA E3 | Add with carry (absolute)
    STA $0A              ; 85 0A | Store accumulator to zero page
    LDA $0A              ; A5 0A | Load from zero page into accumulator
    STA $E3D2            ; 8D D2 E3 | Store accumulator to absolute address
    LDA $E442,Y          ; B9 42 E4 | Load from absolute,Y into accumulator
    INC                  ; 1A | Increment accumulator
    SEC                  ; 38 | Set carry flag
    SBC $0A              ; E5 0A | Subtract with carry (zero page)
    STA $E3CC            ; 8D CC E3 | Store accumulator to absolute address
    LDA $20              ; A5 20 | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E3CC            ; ED CC E3 | Subtract with carry (absolute)
    BCS $08              ; B0 08 | Branch if carry set
    LDA $20              ; A5 20 | Load from zero page into accumulator
    STA $E3CC            ; 8D CC E3 | Store accumulator to absolute address
    JMP $71AB            ; 4C AB 71 | Jump to address
    STA $20              ; 85 20 | Store accumulator to zero page
    LDA $0A              ; A5 0A | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $E3CC            ; 6D CC E3 | Add with carry (absolute)
    STA $0A              ; 85 0A | Store accumulator to zero page
    BRA $A2              ; 80 A2 | Branch always
    LDA $E3F2,Y          ; B9 F2 E3 | Load from absolute,Y into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    PHY                  ; 5A | Push Y register to stack
    ORA $7AA8            ; 0D A8 7A | Logical OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2D7
; Address: $C2F1B5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2D7:
    PHY                  ; 5A | Push Y register to stack
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E5B4            ; AD B4 E5 | Load from absolute address into accumulator
    STA $004202          ; 8F 02 42 00 | Store accumulator to absolute long address
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    STA $004203          ; 8F 03 42 00 | Store accumulator to absolute long address
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    REP #$20             ; C2 20 | Reset processor status bits
    LDA $004216          ; AF 16 42 00 | Load from absolute long address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2D8
; Address: $C2F1D4
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2D8:
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    BCC $02              ; 90 02 | Branch if carry clear
    INC $02              ; E6 02 | Increment (zero page)
    LDA $E432,Y          ; B9 32 E4 | Load from absolute,Y into accumulator
    STA $E5C2            ; 8D C2 E5 | Store accumulator to absolute address
    LDA $E3CA            ; AD CA E3 | Load from absolute address into accumulator
    BEQ $08              ; F0 08 | Branch if equal
    STA $24              ; 85 24 | Store accumulator to zero page
    LDA $E3D6            ; AD D6 E3 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2D9
; Address: $C2F1EC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2D9:
    JSR $7229            ; 20 29 72 | Jump to subroutine
    LDA $E3CC            ; AD CC E3 | Load from absolute address into accumulator
    BEQ $26              ; F0 26 | Branch if equal
    STA $24              ; 85 24 | Store accumulator to zero page
    LDA $E3D2            ; AD D2 E3 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E5C2            ; ED C2 E5 | Subtract with carry (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $E3DA            ; AD DA E3 | Load from absolute address into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2DA
; Address: $C2F207
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2DA:
    JSR $7229            ; 20 29 72 | Jump to subroutine
    BRA $0E              ; 80 0E | Branch always
    INC $04              ; E6 04 | Increment (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    DEC $24              ; C6 24 | Decrement (zero page)
    BNE $F2              ; D0 F2 | Branch if not equal
    LDA $E3CE            ; AD CE E3 | Load from absolute address into accumulator
    BEQ $08              ; F0 08 | Branch if equal
    STA $24              ; 85 24 | Store accumulator to zero page
    LDA $E3D6            ; AD D6 E3 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2DB
; Address: $C2F224
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2DB:
    JSR $7229            ; 20 29 72 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2DC
; Address: $C2F22B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2DC:
    INC $04              ; E6 04 | Increment (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    DEC $24              ; C6 24 | Decrement (zero page)
    BNE $F4              ; D0 F4 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2DD
; Address: $C2F236
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2DD:
    PHY                  ; 5A | Push Y register to stack
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E5B4            ; AD B4 E5 | Load from absolute address into accumulator
    STA $004202          ; 8F 02 42 00 | Store accumulator to absolute long address
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2DE
; Address: $C2F243
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2DE:
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    STA $004203          ; 8F 03 42 00 | Store accumulator to absolute long address
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    REP #$20             ; C2 20 | Reset processor status bits
    LDA $004216          ; AF 16 42 00 | Load from absolute long address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    BCC $02              ; 90 02 | Branch if carry clear
    INC $02              ; E6 02 | Increment (zero page)
    ASL $26              ; 06 26 | Arithmetic shift left (zero page)
    LDA $E3D0            ; AD D0 E3 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    INC $04              ; E6 04 | Increment (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $06              ; F0 06 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $EC              ; 80 EC | Branch always
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2DF
; Address: $C2F27A
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2DF:
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Store accumulator to absolute long address
    LDA $E5B4            ; AD B4 E5 | Load from absolute address into accumulator
    STA $004203          ; 8F 03 42 00 | Store accumulator to absolute long address
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    REP #$20             ; C2 20 | Reset processor status bits
    LDA $004216          ; AF 16 42 00 | Load from absolute long address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    BCC $02              ; 90 02 | Branch if carry clear
    INC $02              ; E6 02 | Increment (zero page)
    LDA $E432,Y          ; B9 32 E4 | Load from absolute,Y into accumulator
    STA $E5C2            ; 8D C2 E5 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2E0
; Address: $C2F2A7
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2E0:
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $779E            ; 4C 9E 77 | Jump to address
    LDA $E3CA            ; AD CA E3 | Load from absolute address into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    STA $24              ; 85 24 | Store accumulator to zero page
    LDA $E3D0            ; AD D0 E3 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E5C2            ; ED C2 E5 | Subtract with carry (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $E3D6            ; AD D6 E3 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2E1
; Address: $C2F2C5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2E1:
    JSR $7774            ; 20 74 77 | Jump to subroutine
    LDA $E3CC            ; AD CC E3 | Load from absolute address into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7338            ; 4C 38 73 | Jump to address
    STA $24              ; 85 24 | Store accumulator to zero page
    LDA $E3D2            ; AD D2 E3 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E5C2            ; ED C2 E5 | Subtract with carry (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $E3DA            ; AD DA E3 | Load from absolute address into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal
    LDA $E3DA            ; AD DA E3 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2E2
; Address: $C2F2E5
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2E2:
    JSR $7774            ; 20 74 77 | Jump to subroutine
    JMP $7338            ; 4C 38 73 | Jump to address
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $26              ; 90 26 | Branch if carry clear
    LDA $24              ; A5 24 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 4E 73 C1 | Load from absolute long,X into accumulator
    STA $001D9A          ; 8F 9A 1D 00 | Store accumulator to absolute long address
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    STA $001D9C          ; 8F 9C 1D 00 | Store accumulator to absolute long address
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2E3
; Address: $C2F311
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2E3:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX $04              ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2E4
; Address: $C2F319
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2E4:
    JSR $A80A            ; 20 0A A8 | Jump to subroutine
    BRA $18              ; 80 18 | Branch always
    LDA $24              ; A5 24 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 92 73 C1 | Load from absolute long,X into accumulator
    STA $001D9A          ; 8F 9A 1D 00 | Store accumulator to absolute long address
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    STA $001D9C          ; 8F 9C 1D 00 | Store accumulator to absolute long address
    LDX $04              ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2E5
; Address: $C2F333
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2E5:
    JSR $A80A            ; 20 0A A8 | Jump to subroutine
    STX $04              ; 86 04 | Store X register to zero page
    LDA $E3CE            ; AD CE E3 | Load from absolute address into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    STA $24              ; 85 24 | Store accumulator to zero page
    LDA $E3D4            ; AD D4 E3 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E5C2            ; ED C2 E5 | Subtract with carry (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $E3DE            ; AD DE E3 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2E7
; Address: $C2F354
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2E7:
    PLY                  ; 7A | Pull Y register from stack
    LSR $1F75,X          ; 5E 75 1F | Logical shift right (absolute,X)
    WDM #$75             ; 42 75 | Reserved instruction
    ROL $75              ; 26 75 | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $AF74            ; EE 74 AF | Increment (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    ROR $3F74,X          ; 7E 74 3F | Rotate right (absolute,X)
    LSR $74              ; 46 74 | Logical shift right (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    XBA                  ; EB | Exchange accumulator bytes
    ASL $CF74            ; 0E 74 CF | Arithmetic shift left (absolute)
    STZ $5F75,X          ; 9E 75 5F | Store zero to absolute,X
    ROR $75              ; 66 75 | Rotate right (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL $EF75            ; 2E 75 EF | Rotate left (absolute)
    PHX                  ; DA | Push X register to stack
    LDX $7F74,Y          ; BE 74 7F | Load from absolute,Y into X register
    LDX #$74             ; A2 74 | Load immediate value into X register
    STX $74              ; 86 74 | Store X register to zero page
    ROR                  ; 6A | Rotate right (accumulator)
    LSR $0F74            ; 4E 74 0F | Logical shift right (absolute)
    PLX                  ; FA | Pull X register from stack
    DEC $9F73,X          ; DE 73 9F | Decrement (absolute,X)
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2E9
; Address: $C2F3E4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2E9:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2EA
; Address: $C2F400
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2EA:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2EB
; Address: $C2F41C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2EB:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2EC
; Address: $C2F438
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2EC:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2ED
; Address: $C2F44C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2ED:
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2EE
; Address: $C2F454
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2EE:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2EF
; Address: $C2F470
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2EF:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2F0
; Address: $C2F48C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2F0:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2F1
; Address: $C2F4A8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2F1:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2F2
; Address: $C2F4B6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2F2:
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2F3
; Address: $C2F4C4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2F3:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2F4
; Address: $C2F4E0
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2F4:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2F5
; Address: $C2F4FC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2F5:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2F6
; Address: $C2F518
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2F6:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2F7
; Address: $C2F524
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2F7:
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2F8
; Address: $C2F534
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2F8:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2F9
; Address: $C2F550
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2F9:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2FA
; Address: $C2F56C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2FA:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2FB
; Address: $C2F588
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2FB:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2FC
; Address: $C2F58E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2FC:
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2FE
; Address: $C2F5A5
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2FE:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_2FF
; Address: $C2F5C1
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_2FF:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_300
; Address: $C2F5DD
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_300:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_301
; Address: $C2F5F9
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_301:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_302
; Address: $C2F615
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_302:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_303
; Address: $C2F631
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_303:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_304
; Address: $C2F64D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_304:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_306
; Address: $C2F669
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_306:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_307
; Address: $C2F685
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_307:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_308
; Address: $C2F6A1
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_308:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_309
; Address: $C2F6BD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_309:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_30A
; Address: $C2F6D1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_30A:
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_30B
; Address: $C2F6D9
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_30B:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_30C
; Address: $C2F6F5
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_30C:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_30D
; Address: $C2F711
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_30D:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_30E
; Address: $C2F72D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_30E:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_30F
; Address: $C2F73B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_30F:
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_310
; Address: $C2F749
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_310:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_311
; Address: $C2F765
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_311:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_312
; Address: $C2F774
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_312:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    STA $10              ; 85 10 | Store accumulator to zero page
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    LDY $04              ; A4 04 | Load from zero page into Y register
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $0A              ; 90 0A | Branch if carry clear
    LDA $24              ; A5 24 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    BIT #$7C             ; 89 7C | Test bits in accumulator (immediate)
    STY $04              ; 84 04 | Store Y register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_313
; Address: $C2F794
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_313:
    LDA $24              ; A5 24 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    CMP $847C            ; CD 7C 84 | Compare accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_315
; Address: $C2F7A1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_315:
    BEQ $10              ; F0 10 | Branch if equal
    STA $24              ; 85 24 | Store accumulator to zero page
    LDA $E3D0            ; AD D0 E3 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E5C2            ; ED C2 E5 | Subtract with carry (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $E3D6            ; AD D6 E3 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_316
; Address: $C2F7B0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_316:
    JSR $7C5F            ; 20 5F 7C | Jump to subroutine
    LDA $E3CC            ; AD CC E3 | Load from absolute address into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7823            ; 4C 23 78 | Jump to address
    STA $24              ; 85 24 | Store accumulator to zero page
    LDA $E3D2            ; AD D2 E3 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E5C2            ; ED C2 E5 | Subtract with carry (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $E3DA            ; AD DA E3 | Load from absolute address into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal
    LDA $E3DA            ; AD DA E3 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_317
; Address: $C2F7D0
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_317:
    JSR $7C5F            ; 20 5F 7C | Jump to subroutine
    JMP $7823            ; 4C 23 78 | Jump to address
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $26              ; 90 26 | Branch if carry clear
    LDA $24              ; A5 24 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 39 78 C1 | Load from absolute long,X into accumulator
    STA $001D9A          ; 8F 9A 1D 00 | Store accumulator to absolute long address
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    STA $001D9C          ; 8F 9C 1D 00 | Store accumulator to absolute long address
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_318
; Address: $C2F7FC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_318:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX $04              ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_319
; Address: $C2F804
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_319:
    JSR $A80A            ; 20 0A A8 | Jump to subroutine
    BRA $18              ; 80 18 | Branch always
    LDA $24              ; A5 24 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 7D 78 C1 | Load from absolute long,X into accumulator
    STA $001D9A          ; 8F 9A 1D 00 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank04_DmaFunction_31A
; Address: $C2F815
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_31A:
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    STA $001D9C          ; 8F 9C 1D 00 | Store accumulator to absolute long address
    LDX $04              ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_31B
; Address: $C2F81E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_31B:
    JSR $A80A            ; 20 0A A8 | Jump to subroutine
    STX $04              ; 86 04 | Store X register to zero page
    LDA $E3CE            ; AD CE E3 | Load from absolute address into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    STA $24              ; 85 24 | Store accumulator to zero page
    LDA $E3D4            ; AD D4 E3 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E5C2            ; ED C2 E5 | Subtract with carry (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $E3DE            ; AD DE E3 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_31D
; Address: $C2F839
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_31D:
    LSR $817C,X          ; 5E 7C 81 | Logical shift right (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    WDM #$7C             ; 42 7C | Reserved instruction
    ADC $7A              ; 65 7A | Add with carry (zero page)
    ROL $7C              ; 26 7C | Rotate left (zero page)
    EOR #$7A             ; 49 7A | Exclusive OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $EE7A            ; 2D 7A EE | Logical AND with accumulator (absolute)
    ORA ($7A),Y          ; 11 7A | Logical OR with accumulator ((zero page),Y)
    ADC $7BB6,Y          ; 79 B6 7B | Add with carry (absolute,Y)
    CMP $9A79,Y          ; D9 79 9A | Compare accumulator (absolute,Y)
    LDA $7E79,X          ; BD 79 7E | Load from absolute,X into accumulator
    LDA ($79,X)          ; A1 79 | Load from (zero page,X) into accumulator
    STA $79              ; 85 79 | Store accumulator to zero page
    LSR $7B              ; 46 7B | Logical shift right (zero page)
    ADC #$79             ; 69 79 | Add with carry (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    EOR $0E79            ; 4D 79 0E | Exclusive OR with accumulator (absolute)
    AND ($79),Y          ; 31 79 | Logical AND with accumulator ((zero page),Y)
    PLY                  ; 7A | Pull Y register from stack
    ADC $7AD6,Y          ; 79 D6 7A | Add with carry (absolute,Y)
    SBC $BA78,Y          ; F9 78 BA | Subtract with carry (absolute,Y)
    PLY                  ; 7A | Pull Y register from stack
    CMP $9E78,X          ; DD 78 9E | Compare accumulator (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    CMP ($78,X)          ; C1 78 | Compare accumulator ((zero page,X))
    BIT #$7A             ; 89 7A | Test bits in accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    ADC $2E7A            ; 6D 7A 2E | Add with carry (absolute)
    EOR ($7A),Y          ; 51 7A | Exclusive OR with accumulator ((zero page),Y)
    PLY                  ; 7A | Pull Y register from stack
    ORA $DA7A,Y          ; 19 7A DA | Logical OR with accumulator (absolute,Y)
    SBC $BE79,X          ; FD 79 BE | Subtract with carry (absolute,X)
    SBC ($79,X)          ; E1 79 | Subtract with carry ((zero page,X))
    LDX #$7B             ; A2 7B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_31E
; Address: $C2F899
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_31E:
    CMP $79              ; C5 79 | Compare accumulator (zero page)
    STX $7B              ; 86 7B | Store X register to zero page
    LDA #$79             ; A9 79 | Load immediate value into accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    STA $4E79            ; 8D 79 4E | Store accumulator to absolute address
    ADC ($79),Y          ; 71 79 | Add with carry ((zero page),Y)
    ADC $7B16,Y          ; 79 16 7B | Add with carry (absolute,Y)
    AND $FA79,Y          ; 39 79 FA | Logical AND with accumulator (absolute,Y)
    PLY                  ; 7A | Pull Y register from stack
    ORA $DE79,X          ; 1D 79 DE | Logical OR with accumulator (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    ORA ($79,X)          ; 01 79 | Logical OR with accumulator ((zero page,X))
    REP #$7A             ; C2 7A | Reset processor status bits
    SBC $78              ; E5 78 | Subtract with carry (zero page)
    LDX $7A              ; A6 7A | Load from zero page into X register
    CMP #$78             ; C9 78 | Compare accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_31F
; Address: $C2F8CF
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_31F:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_320
; Address: $C2F8EB
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_320:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_321
; Address: $C2F907
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_321:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_322
; Address: $C2F923
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_322:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_323
; Address: $C2F93F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_323:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_324
; Address: $C2F95B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_324:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_326
; Address: $C2F977
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_326:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_327
; Address: $C2F993
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_327:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_328
; Address: $C2F9AF
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_328:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_329
; Address: $C2F9CB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_329:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank04_DmaFunction_32A
; Address: $C2F9DF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_32A:
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_32B
; Address: $C2F9E7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_32B:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_32C
; Address: $C2FA03
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_32C:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_32D
; Address: $C2FA1F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_32D:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_32E
; Address: $C2FA3B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_32E:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_32F
; Address: $C2FA49
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_32F:
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_330
; Address: $C2FA57
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_330:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_331
; Address: $C2FA73
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_331:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_333
; Address: $C2FA90
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_333:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_334
; Address: $C2FAAC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_334:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_335
; Address: $C2FAB5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_335:
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_336
; Address: $C2FAC8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_336:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_337
; Address: $C2FAE4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_337:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_338
; Address: $C2FB00
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_338:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_33A
; Address: $C2FB21
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_33A:
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_33B
; Address: $C2FB38
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_33B:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_33C
; Address: $C2FB54
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_33C:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_33D
; Address: $C2FB70
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_33D:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_33E
; Address: $C2FB8C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_33E:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_33F
; Address: $C2FBA8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_33F:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_340
; Address: $C2FBC4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_340:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_341
; Address: $C2FBE0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_341:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_343
; Address: $C2FBFC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_343:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_344
; Address: $C2FC18
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_344:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_345
; Address: $C2FC34
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_345:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_346
; Address: $C2FC50
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_346:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_348
; Address: $C2FC63
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_348:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    STA $10              ; 85 10 | Store accumulator to zero page
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    LDY $04              ; A4 04 | Load from zero page into Y register
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $0A              ; 90 0A | Branch if carry clear
    LDA $24              ; A5 24 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    BIT #$7C             ; 89 7C | Test bits in accumulator (immediate)
    STY $04              ; 84 04 | Store Y register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_349
; Address: $C2FC7F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_349:
    LDA $24              ; A5 24 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    CMP $847C            ; CD 7C 84 | Compare accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_34A
; Address: $C2FC89
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_34A:
    CPX #$7E             ; E0 7E | Compare X register (immediate)
    SBC ($7D),Y          ; F1 7D | Subtract with carry ((zero page),Y)
    ROR $7DE3,X          ; 7E E3 7D | Rotate right (absolute,X)
    CPY $7E              ; C4 7E | Compare Y register (zero page)
    ADC $7EB6,X          ; 7D B6 7E | Add with carry (absolute,X)
    ADC $7EA8,X          ; 7D A8 7E | Add with carry (absolute,X)
    LDA $9A7D,Y          ; B9 7D 9A | Load from absolute,Y into accumulator
    ROR $7DAB,X          ; 7E AB 7D | Rotate right (absolute,X)
    STY $9D7E            ; 8C 7E 9D | Store Y register to absolute address
    ADC $7E7E,X          ; 7D 7E 7E | Add with carry (absolute,X)
    STA $7E707D          ; 8F 7D 70 7E | Store accumulator to absolute long address
    STA ($7D,X)          ; 81 7D | Store accumulator to (zero page,X)
    ROR $7D73,X          ; 7E 73 7D | Rotate right (absolute,X)
    ROR $7D65,X          ; 7E 65 7D | Rotate right (absolute,X)
    LSR $7E              ; 46 7E | Logical shift right (zero page)
    ADC $7E38,X          ; 7D 38 7E | Add with carry (absolute,X)
    EOR #$7D             ; 49 7D | Exclusive OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ROR $7D3B,X          ; 7E 3B 7D | Rotate right (absolute,X)
    ROR $7D2D,X          ; 7E 2D 7D | Rotate right (absolute,X)
    ASL $1F7E            ; 0E 7E 1F | Arithmetic shift left (absolute)
    ADC $7E00,X          ; 7D 00 7E | Add with carry (absolute,X)
    ORA ($7D),Y          ; 11 7D | Logical OR with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    ADC $7ED9,X          ; 7D D9 7E | Add with carry (absolute,X)
    NOP                  ; EA | No operation
    ADC $7ECB,X          ; 7D CB 7E | Add with carry (absolute,X)
    ADC $7EBD,X          ; 7D BD 7E | Add with carry (absolute,X)
    DEC $AF7D            ; CE 7D AF | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_34B
; Address: $C2FCDC
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_34B:
    ROR $7DC0,X          ; 7E C0 7D | Rotate right (absolute,X)
    LDA ($7E,X)          ; A1 7E | Load from (zero page,X) into accumulator
    ADC $7E93,X          ; 7D 93 7E | Add with carry (absolute,X)
    LDY $7D              ; A4 7D | Load from zero page into Y register
    STA $7E              ; 85 7E | Store accumulator to zero page
    ADC $7E77,X          ; 7D 77 7E | Add with carry (absolute,X)
    DEY                  ; 88 | Decrement Y register
    ADC $7E69,X          ; 7D 69 7E | Add with carry (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    ADC $7E5B,X          ; 7D 5B 7E | Add with carry (absolute,X)
    JMP ($4D7D)          ; 6C 7D 4D | Jump to address (absolute indirect)
    ROR $7D5E,X          ; 7E 5E 7D | Rotate right (absolute,X)
    ROR $7D50,X          ; 7E 50 7D | Rotate right (absolute,X)
    AND ($7E),Y          ; 31 7E | Logical AND with accumulator ((zero page),Y)
    WDM #$7D             ; 42 7D | Reserved instruction
    ROR $7D34,X          ; 7E 34 7D | Rotate right (absolute,X)
    ROR $7D26,X          ; 7E 26 7D | Rotate right (absolute,X)
    ROR $7D18,X          ; 7E 18 7D | Rotate right (absolute,X)
    SBC $A57D,Y          ; F9 7D A5 | Subtract with carry (absolute,Y)
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_34C
; Address: $C2FD49
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_34C:
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank04_DmaFunction_34D
; Address: $C2FDA2
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_34D:
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_34F
; Address: $C2FDF9
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_34F:
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank04_DmaFunction_350
; Address: $C2FE4F
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_350:
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_351
; Address: $C2FEA7
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_351:
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $12              ; A5 12 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_352
; Address: $C2FEE1
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_352:
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Store accumulator to absolute long address
    LDA $E5B4            ; AD B4 E5 | Load from absolute address into accumulator
    STA $004203          ; 8F 03 42 00 | Store accumulator to absolute long address
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    REP #$20             ; C2 20 | Reset processor status bits
    LDA $004216          ; AF 16 42 00 | Load from absolute long address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_353
; Address: $C2FF02
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_353:
    STA $00              ; 85 00 | Store accumulator to zero page
    BCC $02              ; 90 02 | Branch if carry clear
    INC $02              ; E6 02 | Increment (zero page)
    LDA $26              ; A5 26 | Load from zero page into accumulator
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    STA $26              ; 85 26 | Store accumulator to zero page
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7F65            ; 4C 65 7F | Jump to address
    LDA $E3D0            ; AD D0 E3 | Load from absolute address into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $1A              ; 90 1A | Branch if carry clear
    TXA                  ; 8A | Transfer X register to accumulator
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_354
; Address: $C2FF28
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_354:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    INC $04              ; E6 04 | Increment (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $28              ; F0 28 | Branch if equal
    TXA                  ; 8A | Transfer X register to accumulator
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_355
; Address: $C2FF42
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_355:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Load from absolute,Y into accumulator
    INC $04              ; E6 04 | Increment (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $0E              ; F0 0E | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Load from absolute,Y into accumulator
    INC $04              ; E6 04 | Increment (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BNE $D8              ; D0 D8 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_356
; Address: $C2FF65
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_356:
    LDA $E3D0            ; AD D0 E3 | Load from absolute address into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_357
; Address: $C2FF6A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_357:
    BCC $1A              ; 90 1A | Branch if carry clear
    TXA                  ; 8A | Transfer X register to accumulator
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_358
; Address: $C2FF72
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_358:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    INC $04              ; E6 04 | Increment (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $28              ; F0 28 | Branch if equal
    TXA                  ; 8A | Transfer X register to accumulator
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank04_DmaFunction_359
; Address: $C2FF8C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_359:
    JSL $7FFDA2          ; 22 A2 FD 7F | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    INC $04              ; E6 04 | Increment (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $0E              ; F0 0E | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Load from absolute,Y into accumulator
    INC $04              ; E6 04 | Increment (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BNE $D8              ; D0 D8 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank04_DmaFunction_35A
; Address: $C2FFAF
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_35A:
    LDA $E4C2,Y          ; B9 C2 E4 | Load from absolute,Y into accumulator
    STA $2A              ; 85 2A | Store accumulator to zero page
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Store accumulator to absolute long address
    LDA $E5B4            ; AD B4 E5 | Load from absolute address into accumulator
    STA $004203          ; 8F 03 42 00 | Store accumulator to absolute long address
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    REP #$20             ; C2 20 | Reset processor status bits
    LDA $004216          ; AF 16 42 00 | Load from absolute long address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank04_DmaFunction_35B
; Address: $C2FFD4
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank04_DmaFunction_35B:
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    BCC $02              ; 90 02 | Branch if carry clear
    INC $02              ; E6 02 | Increment (zero page)
    LDA $26              ; A5 26 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $26              ; 85 26 | Store accumulator to zero page
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    PEA #$607F           ; F4 7F 60 | Push effective address to stack
    BRA $5F              ; 80 5F | Branch always
    STA ($BA,X)          ; 81 BA | Store accumulator to (zero page,X)
    STY $70              ; 84 70 | Store Y register to zero page
    STA $CB              ; 85 CB | Store accumulator to zero page
    STX $26              ; 86 26 | Store X register to zero page
