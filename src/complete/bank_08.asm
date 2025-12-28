;==============================================================================
; Dragon Quest III - Bank $08
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $C40000-$C47FFF
; Instructions: 12376
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_08"

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_000
; Address: $C48025
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_000:
    ADC ($01),Y          ; 71 01 | Add with carry ((zero page),Y)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BIT $50              ; 24 50 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    LDY #$26             ; A0 26 | Load immediate value into Y register
    BRA $9A              ; 80 9A | Branch always
    WDM #$42             ; 42 42 | Hardware register operation
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BPL $72              ; 10 72 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_001
; Address: $C48052
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_001:
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLV                  ; B8 | Clear overflow flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BPL $29              ; 10 29 | Branch if positive
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BMI $80              ; 30 80 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $40              ; 10 40 | Branch if positive
    EOR $0080            ; 4D 80 00 | Exclusive OR with accumulator (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BPL $10              ; 10 10 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    LDA ($06),Y          ; B1 06 | Read graphics status
    ADC $0103,Y          ; 79 03 01 | Add with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_002
; Address: $C480A9
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_002:
    BRA $00              ; 80 00 | Branch always
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA $0D83            ; 0D 83 0D | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BIT $4070            ; 2C 70 40 | Test bits in accumulator (absolute)
    LDA $BB0508          ; AF 08 05 BB | Read graphics status
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BMI $23              ; 30 23 | Branch if negative
    CPY #$8C             ; C0 8C | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_003
; Address: $C480D6
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_003:
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    LDA                  ; BF 07 00 B8 | Read graphics status
    INC                  ; 1A | Increment accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    LDY #$09             ; A0 09 | Load immediate value into Y register
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $11              ; 80 11 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BCC $C0              ; 90 C0 | Branch if carry clear
    LDA ($0C),Y          ; B1 0C | Read graphics status
    LDA $6A04,Y          ; B9 04 6A | Read graphics status
    BPL $08              ; 10 08 | Branch if positive
    LDY #$86             ; A0 86 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    BPL $08              ; 10 08 | Branch if positive
    ASL $0A43            ; 0E 43 0A | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BEQ $00              ; F0 00 | Branch if equal
    BCS $0D              ; B0 0D | Branch if carry set
    TSX                  ; BA | Transfer stack pointer to X register
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_005
; Address: $C4813B
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_005:
    JSR $0180            ; 20 80 01 | Jump to subroutine
    BNE $10              ; D0 10 | Branch if not equal
    SBC ($10),Y          ; F1 10 | Subtract with carry ((zero page),Y)
    ADC ($20,X)          ; 61 20 | Add with carry ((zero page,X))
    CPY $17              ; C4 17 | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    ADC $0401,Y          ; 79 01 04 | Add with carry (absolute,Y)
    ASL $0600            ; 0E 00 06 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    BCS $C0              ; B0 C0 | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    JMP $3000            ; 4C 00 30 | Jump to address
    BMI $30              ; 30 30 | Branch if negative
    BMI $10              ; 30 10 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDA $FF0F,X          ; BD 0F FF | Read graphics status
    ORA ($42,X)          ; 01 42 | Hardware register operation
    STY $08              ; 84 08 | Store Y register to zero page
    BPL $22              ; 10 22 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    BPL $00              ; 10 00 | Branch if positive
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    LDY #$11             ; A0 11 | Load immediate value into Y register
    ASL $1EC6            ; 0E C6 1E | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BVC $90              ; 50 90 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    LDA ($0A),Y          ; B1 0A | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BVC $13              ; 50 13 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_006
; Address: $C481AA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_006:
    JSR $8040            ; 20 40 80 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BVC $10              ; 50 10 | Branch if overflow clear
    ORA $1587,X          ; 1D 87 15 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $0800            ; 0E 00 08 | Arithmetic shift left (absolute)
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_007
; Address: $C481C6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_007:
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ADC $6A33,Y          ; 79 33 6A | Add with carry (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CLC                  ; 18 | Clear carry flag
    LDY #$0F             ; A0 0F | Load immediate value into Y register
    BPL $10              ; 10 10 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_008
; Address: $C481D9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_008:
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($96,X)          ; 01 96 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ADC $0501,X          ; 7D 01 05 | Add with carry (absolute,X)
    ORA #$60             ; 09 60 | Logical OR with accumulator (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    LDA                  ; BF 0C 00 B9 | Read graphics status
    INC                  ; 1A | Increment accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_009
; Address: $C481F4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_009:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    BCC $1F              ; 90 1F | Branch if carry clear
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    EOR $1983            ; 4D 83 19 | Exclusive OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ROR $0601,X          ; 7E 01 06 | Rotate right (absolute,X)
    STY $90              ; 84 90 | Store Y register to zero page
    CMP ($C9,X)          ; C1 C9 | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    PLP                  ; 28 | Pull processor status from stack
    DEC                  ; 3A | Decrement accumulator
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    BRA $8E              ; 80 8E | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_00A
; Address: $C48222
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_00A:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    CMP ($32,X)          ; C1 32 | Compare accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $1200,X          ; 1D 00 12 | Logical OR with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $C1              ; 80 C1 | Branch always
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    BRA $8C              ; 80 8C | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_00B
; Address: $C48246
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_00B:
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    EOR ($1C,X)          ; 41 1C | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $01              ; 80 01 | Branch always
    ORA $0F00,X          ; 1D 00 0F | Logical OR with accumulator (absolute,X)
    BVS $40              ; 70 40 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    ASL $0AB7,X          ; 1E B7 0A | Arithmetic shift left (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BEQ $10              ; F0 10 | Branch if equal
    CPY #$43             ; C0 43 | Compare Y register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    BPL $20              ; 10 20 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    EOR ($32,X)          ; 41 32 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA ($01,X)          ; 81 01 | Update graphics data
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    ORA $F080            ; 0D 80 F0 | Logical OR with accumulator (absolute)
    LDY $000D,X          ; BC 0D 00 | Load from absolute,X into Y register
    LDA                  ; BF 15 6A 02 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    STA ($02,X)          ; 81 02 | Update graphics data
    CPY $0F              ; C4 0F | Compare Y register (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ORA $19D3            ; 0D D3 19 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    REP #$0C             ; C2 0C | Reset processor status bits
    EOR $011E            ; 4D 1E 01 | Exclusive OR with accumulator (absolute)
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ROL $00              ; 26 00 | Rotate left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    BVC $30              ; 50 30 | Branch if overflow clear
    BCC $21              ; 90 21 | PPU graphics register access
    EOR $1CE7            ; 4D E7 1C | Exclusive OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ASL $E058            ; 0E 58 E0 | Game work RAM access
    BRA $B8              ; 80 B8 | Branch always
    BPL $01              ; 10 01 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BMI $10              ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_00C
; Address: $C482D2
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_00C:
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BNE $19              ; D0 19 | Branch if not equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $01              ; 84 01 | Store Y register to zero page
    ORA #$27             ; 09 27 | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP $08              ; C5 08 | Compare accumulator (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    BEQ $12              ; F0 12 | Branch if equal
    CPY #$4B             ; C0 4B | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_00D
; Address: $C482FE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_00D:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    STA $188F,X          ; 9D 8F 18 | Update graphics data
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $01              ; 85 01 | Update graphics data
    ORA #$2F             ; 09 2F | Logical OR with accumulator (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($CA,X)          ; 01 CA | Logical OR with accumulator ((zero page,X))
    ASL $B900            ; 0E 00 B9 | Arithmetic shift left (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ROR                  ; 6A | Rotate right (accumulator)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_00F
; Address: $C48324
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_00F:
    JSR $0810            ; 20 10 08 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ORA $23C3            ; 0D C3 23 | Logical OR with accumulator (absolute)
    STX $01              ; 86 01 | Store X register to zero page
    ORA #$2D             ; 09 2D | Logical OR with accumulator (immediate)
    BCC $20              ; 90 20 | Branch if carry clear
    ORA ($C4,X)          ; 01 C4 | Logical OR with accumulator ((zero page,X))
    ASL $B314            ; 0E 14 B3 | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BPL $E2              ; 10 E2 | Branch if positive
    EOR ($D3,X)          ; 41 D3 | Exclusive OR with accumulator ((zero page,X))
    ORA $0800,Y          ; 19 00 08 | Logical OR with accumulator (absolute,Y)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ASL $60A8            ; 0E A8 60 | Arithmetic shift left (absolute)
    STA ($B5,X)          ; 81 B5 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_010
; Address: $C4835D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_010:
    BPL $04              ; 10 04 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $C0              ; 10 C0 | Branch if positive
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $10              ; 10 10 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_011
; Address: $C48370
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_011:
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    LDY $4190            ; AC 90 41 | Load from absolute address into Y register
    CMP $0F              ; C5 0F | Compare accumulator (zero page)
    AND ($6A,X)          ; 21 6A | Logical AND with accumulator ((zero page,X))
    BVC $33              ; 50 33 | Branch if overflow clear
    CPY #$4B             ; C0 4B | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_012
; Address: $C48392
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_012:
    JSL $185020          ; 22 20 50 18 | Jump to subroutine long
    BPL $00              ; 10 00 | Branch if positive
    EOR $1EC3,X          ; 5D C3 1E | Exclusive OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT #$01             ; 89 01 | Test bits in accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    LDA                  ; BF 0C 00 4D | Read graphics status
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROL $00              ; 26 00 | Rotate left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    STA ($23),Y          ; 91 23 | Update graphics data
    EOR $1CE7            ; 4D E7 1C | Exclusive OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    AND $1900,X          ; 3D 00 19 | Logical AND with accumulator (absolute,X)
    CPY $01C0            ; CC C0 01 | Compare Y register (absolute)
    ORA #$B5             ; 09 B5 | Logical OR with accumulator (immediate)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $E0              ; 10 E0 | Game work RAM access
    EOR ($80,X)          ; 41 80 | Exclusive OR with accumulator ((zero page,X))
    LDA ($01,X)          ; A1 01 | Read graphics status
    BPL $10              ; 10 10 | Branch if positive
    BPL $21              ; 10 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_013
; Address: $C483E2
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_013:
    ORA ($D6,X)          ; 01 D6 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    CPY $30              ; C4 30 | Compare Y register (zero page)
    LDA $090411          ; AF 11 04 09 | Read graphics status
    ORA ($6A,X)          ; 01 6A | Logical OR with accumulator ((zero page,X))
    BRA $21              ; 80 21 | PPU graphics register access
    BPL $60              ; 10 60 | Branch if positive
    LSR $80              ; 46 80 | Logical shift right (zero page)
    BIT $0F              ; 24 0F | Test bits in accumulator (zero page)
    BIT $10              ; 24 10 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    ROL                  ; 2A | Rotate left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    STY $0B01            ; 8C 01 0B | Store Y register to absolute address
    ASL $20BC,X          ; 1E BC 20 | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $09              ; 84 09 | Store Y register to zero page
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BVC $20              ; 50 20 | Branch if overflow clear
    BPL $30              ; 10 30 | Branch if positive
    LSR $378F            ; 4E 8F 37 | Logical shift right (absolute)
    PHP                  ; 08 | Push processor status to stack
    STA $0B01            ; 8D 01 0B | Update graphics data
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    BNE $04              ; D0 04 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    BPL $40              ; 10 40 | Branch if positive
    BRA $1A              ; 80 1A | Branch always
    ORA $F002,Y          ; 19 02 F0 | Logical OR with accumulator (absolute,Y)
    BPL $2F              ; 10 2F | Branch if positive
    LDY #$31             ; A0 31 | Load immediate value into Y register
    BPL $55              ; 10 55 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    STX $0B01            ; 8E 01 0B | Store X register to absolute address
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CPY $50              ; C4 50 | Compare Y register (zero page)
    LDA                  ; BF 12 1E 0B | Read graphics status
    INC                  ; 1A | Increment accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_014
; Address: $C48466
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_014:
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BPL $20              ; 10 20 | Branch if positive
    STY $4400            ; 8C 00 44 | Store Y register to absolute address
    BVC $21              ; 50 21 | PPU graphics register access
    BVC $10              ; 50 10 | Branch if overflow clear
    EOR $C5              ; 45 C5 | Exclusive OR with accumulator (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    STA $3C0B01          ; 8F 01 0B 3C | Update graphics data
    ASL $80DC,X          ; 1E DC 80 | Arithmetic shift left (absolute,X)
    CMP $0015            ; CD 15 00 | Compare accumulator (absolute)
    BIT $C002            ; 2C 02 C0 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BPL $28              ; 10 28 | Branch if positive
    BRA $10              ; 80 10 | Branch always
    STA $3CE7,X          ; 9D E7 3C | Update graphics data
    ASL $90              ; 06 90 | Arithmetic shift left (zero page)
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LSR $503D,X          ; 5E 3D 50 | Logical shift right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ORA $3C66            ; 0D 66 3C | Logical OR with accumulator (absolute)
    PEA #$2008           ; F4 08 20 | Push effective address to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    BPL $37              ; 10 37 | Branch if positive
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA ($A0),Y          ; 11 A0 | Logical OR with accumulator ((zero page),Y)
    BEQ $33              ; F0 33 | Branch if equal
    PLP                  ; 28 | Pull processor status from stack
    STA ($01),Y          ; 91 01 | Update graphics data
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ORA $10DC,Y          ; 19 DC 10 | Logical OR with accumulator (absolute,Y)
    CMP #$13             ; C9 13 | Compare accumulator (immediate)
    CPX $27              ; E4 27 | Compare X register (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BMI $5D              ; 30 5D | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    LSR $1700            ; 4E 00 17 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_015
; Address: $C484F0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_015:
    INY                  ; C8 | Increment Y register
    CPX #$06             ; E0 06 | Compare X register (immediate)
    ASL $1E6A,X          ; 1E 6A 1E | Arithmetic shift left (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PEA #$D008           ; F4 08 D0 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BPL $20              ; 10 20 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    STA $D7              ; 85 D7 | Update graphics data
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    BEQ $42              ; F0 42 | Hardware register operation
    ORA $B50A,X          ; 1D 0A B5 | Logical OR with accumulator (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    JMP $1008            ; 4C 08 10 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_016
; Address: $C48523
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_016:
    REP #$84             ; C2 84 | Reset processor status bits
    ORA #$E4             ; 09 E4 | Logical OR with accumulator (immediate)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($50),Y          ; 11 50 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_017
; Address: $C4852C
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_017:
    JSR $1150            ; 20 50 11 | Jump to subroutine
    NOP                  ; EA | No operation
    PHP                  ; 08 | Push processor status to stack
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    BRA $42              ; 80 42 | Hardware register operation
    DEX                  ; CA | Decrement X register
    PLP                  ; 28 | Pull processor status from stack
    ORA ($AE,X)          ; 01 AE | Logical OR with accumulator ((zero page,X))
    BVC $13              ; 50 13 | Branch if overflow clear
    CPX #$4A             ; E0 4A | Compare X register (immediate)
    BRA $2B              ; 80 2B | Branch always
    LDX #$10             ; A2 10 | Load immediate value into X register
    BEQ $10              ; F0 10 | Branch if equal
    BPL $50              ; 10 50 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BMI $10              ; 30 10 | Branch if negative
    LSR $2DD7,X          ; 5E D7 2D | Logical shift right (absolute,X)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    BIT $F0              ; 24 F0 | Test bits in accumulator (zero page)
    BMI $82              ; 30 82 | Branch if negative
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    ASL $27BA,X          ; 1E BA 27 | Arithmetic shift left (absolute,X)
    STY $1009            ; 8C 09 10 | Store Y register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_018
; Address: $C4856D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_018:
    CPY $0098            ; CC 98 00 | Compare Y register (absolute)
    STZ $10              ; 64 10 | Store zero to zero page
    AND ($12,X)          ; 21 12 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_019
; Address: $C48575
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_019:
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    STZ $37              ; 64 37 | Store zero to zero page
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    JMP $AC2800          ; 5C 00 28 AC | Jump to address long
    RTI                  ; 40 | Return from interrupt
    CMP $14              ; C5 14 | Compare accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($6A,X)          ; 21 6A | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BEQ $E0              ; F0 E0 | Game work RAM access
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BPL $30              ; 10 30 | Branch if positive
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BCC $20              ; 90 20 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    ORA $C5              ; 05 C5 | Logical OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $E0C8,Y          ; 19 C8 E0 | Game work RAM access
    EOR ($BC,X)          ; 41 BC | Exclusive OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    BCC $20              ; 90 20 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_01A
; Address: $C485BC
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_01A:
    JSR $2202            ; 20 02 22 | Jump to subroutine
    BPL $29              ; 10 29 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    ASL $84              ; 06 84 | Arithmetic shift left (zero page)
    ASL $0800,X          ; 1E 00 08 | Arithmetic shift left (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CMP ($C2),Y          ; D1 C2 | Compare accumulator ((zero page),Y)
    ORA $B7              ; 05 B7 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_01B
; Address: $C485D9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_01B:
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BRA $19              ; 80 19 | Branch always
    DEY                  ; 88 | Decrement Y register
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $45              ; 10 45 | Branch if positive
    EOR $2A              ; 45 2A | Exclusive OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_01C
; Address: $C485ED
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_01C:
    STA $1001,Y          ; 99 01 10 | Update graphics data
    BRA $00              ; 80 00 | Branch always
    BEQ $E0              ; F0 E0 | Game work RAM access
    ORA $E40A,Y          ; 19 0A E4 | Logical OR with accumulator (absolute,Y)
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    CPY $11F8            ; CC F8 11 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_01D
; Address: $C48600
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_01D:
    JSR $8FC0            ; 20 C0 8F | Jump to subroutine
    ORA $F0CC,Y          ; 19 CC F0 | Logical OR with accumulator (absolute,Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($60),Y          ; 11 60 | Logical OR with accumulator ((zero page),Y)
    BPL $10              ; 10 10 | Branch if positive
    BPL $59              ; 10 59 | Branch if positive
    DEX                  ; CA | Decrement X register
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ADC #$00             ; 69 00 | Add with carry (immediate)
    INY                  ; C8 | Increment Y register
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    CLC                  ; 18 | Clear carry flag
    BPL $57              ; 10 57 | Branch if positive
    JMP $E012B9          ; 5C B9 12 E0 | Game work RAM access
    LSR                  ; 4A | Logical shift right (accumulator)
    BRA $2B              ; 80 2B | Branch always
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    AND #$30             ; 29 30 | Logical AND with accumulator (immediate)
    BPL $1D              ; 10 1D | Branch if positive
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ROR $1900            ; 6E 00 19 | Rotate right (absolute)
    BIT $82D1            ; 2C D1 82 | Test bits in accumulator (absolute)
    LDA ($0A),Y          ; B1 0A | Read graphics status
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BMI $10              ; 30 10 | Branch if negative
    BPL $5E              ; 10 5E | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    STZ $0E01            ; 9C 01 0E | Store zero to absolute
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_01F
; Address: $C4866F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_01F:
    JSL $0089C0          ; 22 C0 89 00 | Jump to subroutine long
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    BVC $11              ; 50 11 | Branch if overflow clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $1101,X          ; 9D 01 11 | Update graphics data
    LDX #$00             ; A2 00 | Load immediate value into X register
    AND $1104            ; 2D 04 11 | Logical AND with accumulator (absolute)
    LDY $0C1C,X          ; BC 1C 0C | Load from absolute,X into Y register
    ADC $16              ; 65 16 | Add with carry (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$90             ; 09 90 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_021
; Address: $C4869E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_021:
    PLP                  ; 28 | Pull processor status from stack
    BPL $55              ; 10 55 | Branch if positive
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    STZ $1001,X          ; 9E 01 10 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_022
; Address: $C486AD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_022:
    JSR $B503            ; 20 03 B5 | Jump to subroutine
    ORA #$6A             ; 09 6A | Logical OR with accumulator (immediate)
    CPY $0004            ; CC 04 00 | Compare Y register (absolute)
    ROL $00              ; 26 00 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_024
; Address: $C486C2
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_024:
    JSR $002B            ; 20 2B 00 | Jump to subroutine
    BPL $5D              ; 10 5D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    STA                  ; 9F 01 1E 72 | Update graphics data
    ASL $55              ; 06 55 | Arithmetic shift left (zero page)
    STY $4551            ; 8C 51 45 | Store Y register to absolute address
    BCS $3A              ; B0 3A | Branch if carry set
    LDY $2602,X          ; BC 02 26 | Load from absolute,X into Y register
    BCS $48              ; B0 48 | Branch if carry set
    BCC $01              ; 90 01 | Branch if carry clear
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    AND ($28,X)          ; 21 28 | Logical AND with accumulator ((zero page,X))
    LDY #$25             ; A0 25 | Load immediate value into Y register
    INC                  ; 1A | Increment accumulator
    ADC $005F            ; 6D 5F 00 | Add with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    TAX                  ; AA | Transfer accumulator to X register
    AND $4140            ; 2D 40 41 | Logical AND with accumulator (absolute)
    CMP $061A            ; CD 1A 06 | Compare accumulator (absolute)
    BIT $C001            ; 2C 01 C0 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_027
; Address: $C4870D
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_027:
    JSR $1010            ; 20 10 10 | Jump to subroutine
    REP #$28             ; C2 28 | Reset processor status bits
    ASL $A1              ; 06 A1 | Arithmetic shift left (zero page)
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    CMP ($43,X)          ; C1 43 | Compare accumulator ((zero page,X))
    LDA $0C1E,Y          ; B9 1E 0C | Read graphics status
    CPX $11              ; E4 11 | Compare X register (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BRA $82              ; 80 82 | Branch always
    BVC $00              ; 50 00 | Branch if overflow clear
    BVC $10              ; 50 10 | Branch if overflow clear
    STX $C0              ; 86 C0 | Store X register to zero page
    LDX #$01             ; A2 01 | Load immediate value into X register
    BIT $0510            ; 2C 10 05 | Test bits in accumulator (absolute)
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    LDA                  ; BF CF 2F 0C | Read graphics status
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BVC $13              ; 50 13 | Branch if overflow clear
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    INC                  ; 1A | Increment accumulator
    SBC ($14),Y          ; F1 14 | Subtract with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    BEQ $FF              ; F0 FF | Branch if equal
    ORA ($A3),Y          ; 11 A3 | Logical OR with accumulator ((zero page),Y)
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_028
; Address: $C48765
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_028:
    JSR $C2D1            ; 20 D1 C2 | Jump to subroutine
    LDY $0319,X          ; BC 19 03 | Load from absolute,X into Y register
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_02A
; Address: $C4877A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_02A:
    JSR $2060            ; 20 60 20 | Jump to subroutine
    BPL $10              ; 10 10 | Branch if positive
    EOR ($D4,X)          ; 41 D4 | Exclusive OR with accumulator ((zero page,X))
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    LDY $01              ; A4 01 | Load from zero page into Y register
    ORA ($96),Y          ; 11 96 | Logical OR with accumulator ((zero page),Y)
    ADC ($43),Y          ; 71 43 | Add with carry ((zero page),Y)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ORA #$1D             ; 09 1D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_02C
; Address: $C48796
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_02C:
    JSR $4020            ; 20 20 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive
    BPL $5D              ; 10 5D | Branch if positive
    AND $0600            ; 2D 00 06 | Logical AND with accumulator (absolute)
    LDA $01              ; A5 01 | Read graphics status
    STZ $00              ; 64 00 | Store zero to zero page
    AND $10DC            ; 2D DC 10 | Logical AND with accumulator (absolute)
    WDM #$B2             ; 42 B2 | Reserved instruction
    STA $05              ; 85 05 | Update graphics data
    ROR                  ; 6A | Rotate right (accumulator)
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    BCC $C1              ; 90 C1 | Branch if carry clear
    STA ($06,X)          ; 81 06 | Update graphics data
    AND $1FFE            ; 2D FE 1F | Logical AND with accumulator (absolute)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND $21A0,Y          ; 39 A0 21 | PPU graphics register access
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    LDX $01              ; A6 01 | Load from zero page into X register
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    BCS $C2              ; B0 C2 | Branch if carry set
    SEC                  ; 38 | Set carry flag
    CPX $0C              ; E4 0C | Compare X register (zero page)
    ADC #$7E             ; 69 7E | Add with carry (immediate)
    LDY $19              ; A4 19 | Load from zero page into Y register
    STA ($E6),Y          ; 91 E6 | Update graphics data
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_02D
; Address: $C487E5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_02D:
    JSL $1F1F1F          ; 22 1F 1F 1F | Jump to subroutine long
    BNE $D1              ; D0 D1 | Branch if not equal
    BVC $21              ; 50 21 | PPU graphics register access
    TAX                  ; AA | Transfer accumulator to X register
    PHX                  ; DA | Push X register to stack
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_02E
; Address: $C487F9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_02E:
    JSR $0373            ; 20 73 03 | Jump to subroutine
    LDY $0804,X          ; BC 04 08 | Load from absolute,X into Y register
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    DEC                  ; 3A | Decrement accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_02F
; Address: $C48812
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_02F:
    AND $9E              ; 25 9E | Logical AND with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($35,X)          ; 01 35 | Logical OR with accumulator ((zero page,X))
    JMP $8321            ; 4C 21 83 | Jump to address
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ORA $D432,X          ; 1D 32 D4 | Logical OR with accumulator (absolute,X)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $40              ; 10 40 | Branch if positive
    STX $80              ; 86 80 | Store X register to zero page
    AND $F3              ; 25 F3 | Logical AND with accumulator (zero page)
    BMI $01              ; 30 01 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_030
; Address: $C48835
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_030:
    PLP                  ; 28 | Pull processor status from stack
    BVC $10              ; 50 10 | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    ASL $A9              ; 06 A9 | Arithmetic shift left (zero page)
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    LDA $DC2C00          ; AF 00 2C DC | Read graphics status
    BCS $82              ; B0 82 | Branch if carry set
    DEC $18              ; C6 18 | Decrement (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $5D              ; 10 5D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    TAX                  ; AA | Transfer accumulator to X register
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    JMP $D1CC80          ; 5C 80 CC D1 | Jump to address long
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    REP #$3C             ; C2 3C | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_031
; Address: $C48875
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_031:
    JSR $8C0C            ; 20 0C 8C | Jump to subroutine
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($50),Y          ; 11 50 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    BEQ $1F              ; F0 1F | Branch if equal
    ASL $01AB            ; 0E AB 01 | Arithmetic shift left (absolute)
    EOR $0320,Y          ; 59 20 03 | Exclusive OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    CMP ($03,X)          ; C1 03 | Compare accumulator ((zero page,X))
    CPY $0028            ; CC 28 00 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_033
; Address: $C48898
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_033:
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    BIT $01A5            ; 2C A5 01 | Test bits in accumulator (absolute)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_034
; Address: $C488A4
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_034:
    JSR $1030            ; 20 30 10 | Jump to subroutine
    LSR $500B,X          ; 5E 0B 50 | Logical shift right (absolute,X)
    ASL $AC              ; 06 AC | Arithmetic shift left (zero page)
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    AND ($44),Y          ; 31 44 | Logical AND with accumulator ((zero page),Y)
    EOR $0106            ; 4D 06 01 | Exclusive OR with accumulator (absolute)
    STZ $04              ; 64 04 | Store zero to zero page
    PHP                  ; 08 | Push processor status to stack
    BPL $40              ; 10 40 | Branch if positive
    LSR $80              ; 46 80 | Logical shift right (zero page)
    ORA ($22),Y          ; 11 22 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    LDY #$21             ; A0 21 | PPU graphics register access
    BPL $10              ; 10 10 | Branch if positive
    TXS                  ; 9A | Transfer X register to stack pointer
    LSR $3A              ; 46 3A | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    LDA $1501            ; AD 01 15 | Read graphics status
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    CPY $0320            ; CC 20 03 | Compare Y register (absolute)
    INY                  ; C8 | Increment Y register
    ASL $A918,X          ; 1E 18 A9 | Arithmetic shift left (absolute,X)
    AND $01              ; 25 01 | Logical AND with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    AND ($22),Y          ; 31 22 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    BPL $11              ; 10 11 | Branch if positive
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $30              ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_035
; Address: $C488EF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_035:
    JSR $5610            ; 20 10 56 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    LDX $1401            ; AE 01 14 | Load from absolute address into X register
    CPX $00              ; E4 00 | Compare X register (zero page)
    AND $D0              ; 25 D0 | Logical AND with accumulator (zero page)
    LDY #$C3             ; A0 C3 | Load immediate value into Y register
    DEC $1D              ; C6 1D | Decrement (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_036
; Address: $C4890A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_036:
    BRA $8D              ; 80 8D | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    CMP ($37,X)          ; C1 37 | Compare accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    LDA $3B1501          ; AF 01 15 3B | Read graphics status
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    EOR ($06,X)          ; 41 06 | Exclusive OR with accumulator ((zero page,X))
    EOR ($34,X)          ; 41 34 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_037
; Address: $C48938
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_037:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    EOR $3CC7,X          ; 5D C7 3C | Exclusive OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BCS $01              ; B0 01 | Branch if carry set
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    LDY $0640,X          ; BC 40 06 | Load from absolute,X into Y register
    DEC                  ; 3A | Decrement accumulator
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$46             ; A0 46 | Load immediate value into Y register
    ORA $01A4,X          ; 1D A4 01 | Logical OR with accumulator (absolute,X)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_038
; Address: $C4895D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_038:
    JSR $1190            ; 20 90 11 | Jump to subroutine
    ROL $00              ; 26 00 | Rotate left (zero page)
    ASL $01B1            ; 0E B1 01 | Arithmetic shift left (absolute)
    ROL $DC              ; 26 DC | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_039
; Address: $C4896C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_039:
    JSR $BDC3            ; 20 C3 BD | Jump to subroutine
    LDA                  ; BF 17 60 02 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    LDX $40              ; A6 40 | Load from zero page into X register
    BRA $02              ; 80 02 | Branch always
    LDY $12              ; A4 12 | Load from zero page into Y register
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    AND ($50,X)          ; 21 50 | Logical AND with accumulator ((zero page,X))
    EOR $28DB            ; 4D DB 28 | Exclusive OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    BMI $04              ; 30 04 | Branch if negative
    CMP ($82),Y          ; D1 82 | Compare accumulator ((zero page),Y)
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_03A
; Address: $C48994
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_03A:
    ASL $B205,X          ; 1E 05 B2 | Arithmetic shift left (absolute,X)
    ROL $36              ; 26 36 | Rotate left (zero page)
    JMP ($0804)          ; 6C 04 08 | Jump to address (absolute indirect)
    BPL $20              ; 10 20 | Branch if positive
    BRA $8D              ; 80 8D | Branch always
    WDM #$11             ; 42 11 | Reserved instruction
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BCC $20              ; 90 20 | Branch if carry clear
    CMP $36              ; C5 36 | Compare accumulator (zero page)
    ASL $B3              ; 06 B3 | Arithmetic shift left (zero page)
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    ORA ($5A,X)          ; 01 5A | Logical OR with accumulator ((zero page,X))
    STA ($02,X)          ; 81 02 | Update graphics data
    LDX $0020,Y          ; BE 20 00 | Load from absolute,Y into X register
    CLC                  ; 18 | Clear carry flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    BRA $10              ; 80 10 | Branch always
    STA $87C7            ; 8D C7 87 | Update graphics data
    ASL $B4              ; 06 B4 | Arithmetic shift left (zero page)
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_03B
; Address: $C489D7
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_03B:
    JSL $102D01          ; 22 01 2D 10 | Jump to subroutine long
    ADC ($49,X)          ; 61 49 | Add with carry ((zero page,X))
    ORA $5000,Y          ; 19 00 50 | Logical OR with accumulator (absolute,Y)
    ASL $0202,X          ; 1E 02 02 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BPL $40              ; 10 40 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    BPL $4D              ; 10 4D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_03D
; Address: $C48A03
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_03D:
    JSR $790C            ; 20 0C 79 | Jump to subroutine
    ROL $0F              ; 26 0F | Rotate left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_03E
; Address: $C48A0D
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_03E:
    EOR ($80,X)          ; 41 80 | Exclusive OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    BVC $31              ; 50 31 | Branch if overflow clear
    BCC $20              ; 90 20 | Branch if carry clear
    CMP $3C              ; C5 3C | Compare accumulator (zero page)
    ASL $B6              ; 06 B6 | Arithmetic shift left (zero page)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA ($47,X)          ; 01 47 | Logical OR with accumulator ((zero page,X))
    CMP ($C3,X)          ; C1 C3 | Compare accumulator ((zero page,X))
    LDA $1C21,Y          ; B9 21 1C | Read graphics status
    CPX $11              ; E4 11 | Compare X register (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BVS $08              ; 70 08 | Branch if overflow set
    CPY #$21             ; C0 21 | PPU graphics register access
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BPL $10              ; 10 10 | Branch if positive
    EOR #$C5             ; 49 C5 | Exclusive OR with accumulator (immediate)
    STZ $00              ; 64 00 | Store zero to zero page
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    STA ($C2,X)          ; 81 C2 | Update graphics data
    CMP $1E              ; C5 1E | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_03F
; Address: $C48A50
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_03F:
    JSL $040201          ; 22 01 02 04 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_040
; Address: $C48A60
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_040:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    CMP $5ACB,X          ; DD CB 5A | Compare accumulator (absolute,X)
    ASL $B8              ; 06 B8 | Arithmetic shift left (zero page)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    CMP $0014            ; CD 14 00 | Compare accumulator (absolute)
    AND $692D,X          ; 3D 2D 69 | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    EOR $0080            ; 4D 80 00 | Exclusive OR with accumulator (absolute)
    AND ($0F,X)          ; 21 0F | Logical AND with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_041
; Address: $C48A85
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_041:
    JSR $1004            ; 20 04 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    LDA $1701,Y          ; B9 01 17 | Read graphics status
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_042
; Address: $C48A93
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_042:
    BIT $0371            ; 2C 71 03 | Test bits in accumulator (absolute)
    LDA $0018,X          ; BD 18 00 | Read graphics status
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    CPY #$8B             ; C0 8B | Compare Y register (immediate)
    STZ $00              ; 64 00 | Store zero to zero page
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_043
; Address: $C48AAA
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_043:
    JSR $1050            ; 20 50 10 | Jump to subroutine
    EOR $4BC7            ; 4D C7 4B | Exclusive OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    LDA $00              ; A5 00 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    LDA $BF001E          ; AF 1E 00 BF | Read graphics status
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $A0              ; 10 A0 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $02              ; 80 02 | Branch always
    LDY $03              ; A4 03 | Load from zero page into Y register
    BMI $30              ; 30 30 | Branch if negative
    ORA $0010,Y          ; 19 10 00 | Logical OR with accumulator (absolute,Y)
    EOR $28C3            ; 4D C3 28 | Exclusive OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($97,X)          ; 01 97 | Logical OR with accumulator ((zero page,X))
    BVS $01              ; 70 01 | Branch if overflow set
    ORA $2104,Y          ; 19 04 21 | PPU graphics register access
    DEC $0017            ; CE 17 00 | Decrement (absolute)
    LDA $682D,Y          ; B9 2D 68 | Read graphics status
    DEX                  ; CA | Decrement X register
    BPL $E8              ; 10 E8 | Branch if positive
    WDM #$A0             ; 42 A0 | Reserved instruction
    LDY $214F,X          ; BC 4F 21 | PPU graphics register access
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive
    BPL $5F              ; 10 5F | Branch if positive
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    LDY $1701,X          ; BC 01 17 | Load from absolute,X into Y register
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BEQ $40              ; F0 40 | Branch if equal
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BMI $21              ; 30 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_044
; Address: $C48B10
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_044:
    RTI                  ; 40 | Return from interrupt
    BRA $09              ; 80 09 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $78              ; 10 78 | Branch if positive
    ORA ($55),Y          ; 11 55 | Logical OR with accumulator ((zero page),Y)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDA $1901,X          ; BD 01 19 | Read graphics status
    LDX #$01             ; A2 01 | Load immediate value into X register
    BVC $70              ; 50 70 | Branch if overflow clear
    ADC ($49,X)          ; 61 49 | Add with carry ((zero page,X))
    ORA $42              ; 05 42 | Hardware register operation
    ORA ($6C,X)          ; 01 6C | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_048
; Address: $C48B3F
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_048:
    JSR $6611            ; 20 11 66 | Jump to subroutine
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    LDX $2001,Y          ; BE 01 20 | Load from absolute,Y into X register
    LDY $2A03            ; AC 03 2A | Load from absolute address into Y register
    CPX #$71             ; E0 71 | Compare X register (immediate)
    CMP ($3A,X)          ; C1 3A | Compare accumulator ((zero page,X))
    ASL $1D              ; 06 1D | Arithmetic shift left (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BRA $09              ; 80 09 | Branch always
    BPL $20              ; 10 20 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    LSR $10              ; 46 10 | Logical shift right (zero page)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BMI $50              ; 30 50 | Branch if negative
    ORA ($8E),Y          ; 11 8E | Logical OR with accumulator ((zero page),Y)
    ASL $BF              ; 06 BF | Arithmetic shift left (zero page)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    LDA ($01,X)          ; A1 01 | Read graphics status
    AND $8144,X          ; 3D 44 81 | Logical AND with accumulator (absolute,X)
    WDM #$BA             ; 42 BA | Reserved instruction
    LDY $0112,X          ; BC 12 01 | Load from absolute,X into Y register
    BCS $60              ; B0 60 | Branch if carry set
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_049
; Address: $C48B7E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_049:
    JSR $95C0            ; 20 C0 95 | Jump to subroutine
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BMI $11              ; 30 11 | Branch if negative

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_04A
; Address: $C48B8B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_04A:
    EOR $3CD7            ; 4D D7 3C | Exclusive OR with accumulator (absolute)
    ASL $C0              ; 06 C0 | Arithmetic shift left (zero page)
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    ROR $01              ; 66 01 | Rotate right (zero page)
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    BNE $25              ; D0 25 | Branch if not equal
    BMI $6A              ; 30 6A | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BPL $60              ; 10 60 | Branch if positive
    CPY $1218            ; CC 18 12 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_04B
; Address: $C48BAB
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_04B:
    JSR $18A0            ; 20 A0 18 | Jump to subroutine
    BVC $21              ; 50 21 | PPU graphics register access
    EOR $0800,X          ; 5D 00 08 | Exclusive OR with accumulator (absolute,X)
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    AND ($43,X)          ; 21 43 | Logical AND with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    STZ $A9              ; 64 A9 | Store zero to zero page
    AND $0A              ; 25 0A | Logical AND with accumulator (zero page)
    LSR $70              ; 46 70 | Logical shift right (zero page)
    CLC                  ; 18 | Clear carry flag
    LDA ($60,X)          ; A1 60 | Read graphics status
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($F1),Y          ; 11 F1 | Logical OR with accumulator ((zero page),Y)
    CPX #$21             ; E0 21 | PPU graphics register access
    LDY #$20             ; A0 20 | Load immediate value into Y register
    LSR $00              ; 46 00 | Logical shift right (zero page)
    REP #$01             ; C2 01 | Reset processor status bits
    ASL $02E7,X          ; 1E E7 02 | Arithmetic shift left (absolute,X)
    BPL $04              ; 10 04 | Branch if positive
    CPY #$32             ; C0 32 | Compare Y register (immediate)
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BRA $10              ; 80 10 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_04C
; Address: $C48BED
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_04C:
    JSR $8400            ; 20 00 84 | Jump to subroutine
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    BVC $25              ; 50 25 | Branch if overflow clear
    STA $46              ; 85 46 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    ADC ($83,X)          ; 61 83 | Add with carry ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    PHY                  ; 5A | Push Y register to stack
    PLA                  ; 68 | Pull accumulator from stack
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_04D
; Address: $C48C15
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_04D:
    AND $01E4            ; 2D E4 01 | Logical AND with accumulator (absolute)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    CPY #$21             ; C0 21 | PPU graphics register access
    LSR $8CD7,X          ; 5E D7 8C | Logical shift right (absolute,X)
    ASL $C4              ; 06 C4 | Arithmetic shift left (zero page)
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    PEA #$4B06           ; F4 06 4B | Push effective address to stack
    CPX #$61             ; E0 61 | Compare X register (immediate)
    CPY $44              ; C4 44 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_04F
; Address: $C48C35
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_04F:
    ORA #$80             ; 09 80 | Logical OR with accumulator (immediate)
    AND $C0              ; 25 C0 | Logical AND with accumulator (zero page)
    BMI $30              ; 30 30 | Branch if negative
    BMI $03              ; 30 03 | Branch if negative
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_050
; Address: $C48C43
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_050:
    JSR $D75D            ; 20 5D D7 | Jump to subroutine
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    CMP $01              ; C5 01 | Compare accumulator (zero page)
    ORA $01B0,Y          ; 19 B0 01 | Logical OR with accumulator (absolute,Y)
    LDY $A1              ; A4 A1 | Load from zero page into Y register
    CMP $0028            ; CD 28 00 | Compare accumulator (absolute)
    BIT $0264            ; 2C 64 02 | Test bits in accumulator (absolute)
    BCC $09              ; 90 09 | Branch if carry clear
    BPL $80              ; 10 80 | Branch if positive
    JMP $0080            ; 4C 80 00 | Jump to address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_051
; Address: $C48C63
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_051:
    JSR $5000            ; 20 00 50 | Jump to subroutine
    AND ($50,X)          ; 21 50 | Logical AND with accumulator ((zero page,X))
    BPL $5D              ; 10 5D | Branch if positive
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    STY $5802            ; 8C 02 58 | Store Y register to absolute address
    STZ $81              ; 64 81 | Store zero to zero page
    CPY $19C0            ; CC C0 19 | Compare Y register (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BEQ $E2              ; F0 E2 | Branch if equal
    AND $80              ; 25 80 | Logical AND with accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_052
; Address: $C48C87
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_052:
    JSR $0202            ; 20 02 02 | Jump to subroutine
    BPL $20              ; 10 20 | Branch if positive
    LDY #$16             ; A0 16 | Load immediate value into Y register
    LDA $44DB            ; AD DB 44 | Read graphics status
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_053
; Address: $C48C9A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_053:
    STA ($82,X)          ; 81 82 | Update graphics data
    LDA $143C,Y          ; B9 3C 14 | Read graphics status
    CPX $11              ; E4 11 | Compare X register (zero page)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_054
; Address: $C48CA3
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_054:
    LDY $51              ; A4 51 | Load from zero page into Y register
    LDA ($26,X)          ; A1 26 | Read graphics status
    STA $350A            ; 8D 0A 35 | Update graphics data
    CPY #$D9             ; C0 D9 | Compare Y register (immediate)
    BVC $25              ; 50 25 | Branch if overflow clear
    ORA $C5              ; 05 C5 | Logical OR with accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    INY                  ; C8 | Increment Y register
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ADC #$00             ; 69 00 | Add with carry (immediate)
    BRA $BE              ; 80 BE | Branch always
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $D269,Y          ; 19 69 D2 | Logical OR with accumulator (absolute,Y)
    LDY $49              ; A4 49 | Load from zero page into Y register
    LSR $83              ; 46 83 | Logical shift right (zero page)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    STA                  ; 9F E8 00 30 | Update graphics data
    LDA                  ; BF F4 01 08 | Read graphics status
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    EOR ($30,X)          ; 41 30 | Exclusive OR with accumulator ((zero page,X))
    LDX #$05             ; A2 05 | Load immediate value into X register
    DEC $21              ; C6 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_055
; Address: $C48CEA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_055:
    JSL $080201          ; 22 01 02 08 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_056
; Address: $C48CFA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_056:
    JSR $1090            ; 20 90 10 | Jump to subroutine
    EOR $6ED7,X          ; 5D D7 6E | Exclusive OR with accumulator (absolute,X)
    ASL $CA              ; 06 CA | Arithmetic shift left (zero page)
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    LDA ($02,X)          ; A1 02 | Read graphics status
    BPL $C1              ; 10 C1 | Branch if positive
    BNE $43              ; D0 43 | Branch if not equal
    LDY $6A30,X          ; BC 30 6A | Load from absolute,X into Y register
    DEC                  ; 3A | Decrement accumulator
    STY $D121            ; 8C 21 D1 | Store Y register to absolute address
    CMP ($C5,X)          ; C1 C5 | Compare accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BVC $2F              ; 50 2F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_057
; Address: $C48D1B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_057:
    JSR $2222            ; 20 22 22 | Jump to subroutine
    BCC $31              ; 90 31 | Branch if carry clear
    BCC $22              ; 90 22 | Branch if carry clear
    INC                  ; 1A | Increment accumulator
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    STY $7805            ; 8C 05 78 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_058
; Address: $C48D2D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_058:
    CPY $81              ; C4 81 | Compare Y register (zero page)
    CMP ($5A,X)          ; C1 5A | Compare accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CPY #$A2             ; C0 A2 | Compare Y register (immediate)
    BRA $21              ; 80 21 | PPU graphics register access
    BPL $13              ; 10 13 | Branch if positive
    BMI $A0              ; 30 A0 | Branch if negative

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_059
; Address: $C48D44
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_059:
    JSR $6AA0            ; 20 A0 6A | Jump to subroutine
    EOR #$DA             ; 49 DA | Exclusive OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CPY $5901            ; CC 01 59 | Compare Y register (absolute)
    CLV                  ; B8 | Clear overflow flag
    ORA ($5A,X)          ; 01 5A | Logical OR with accumulator ((zero page,X))
    CMP ($43,X)          ; C1 43 | Compare accumulator ((zero page,X))
    CPY $0032            ; CC 32 00 | Compare Y register (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    AND $01A5            ; 2D A5 01 | Logical AND with accumulator (absolute)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ROR                  ; 6A | Rotate right (accumulator)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    EOR $6ED7,X          ; 5D D7 6E | Exclusive OR with accumulator (absolute,X)
    ASL $CD              ; 06 CD | Arithmetic shift left (zero page)
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ADC #$6C             ; 69 6C | Add with carry (immediate)
    REP #$D0             ; C2 D0 | Reset processor status bits
    ROL                  ; 2A | Rotate left (accumulator)
    AND ($02),Y          ; 31 02 | Logical AND with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_05A
; Address: $C48D8E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_05A:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    EOR $FA87            ; 4D 87 FA | Exclusive OR with accumulator (absolute)
    DEC $2101            ; CE 01 21 | PPU graphics register access
    ROL $4404            ; 2E 04 44 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_05B
; Address: $C48D9C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_05B:
    JSR $02F1            ; 20 F1 02 | Jump to subroutine
    LDA $1233,Y          ; B9 33 12 | Read graphics status
    CPX $10              ; E4 10 | Compare X register (zero page)
    PHY                  ; 5A | Push Y register to stack
    BNE $A2              ; D0 A2 | Branch if not equal
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    CPX #$02             ; E0 02 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_05D
; Address: $C48DB4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_05D:
    CPY #$11             ; C0 11 | Compare Y register (immediate)
    ORA $50C5,Y          ; 19 C5 50 | Logical OR with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    LSR $B7              ; 46 B7 | Logical shift right (zero page)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    RTI                  ; 40 | Return from interrupt
    ASL $0233            ; 0E 33 02 | Arithmetic shift left (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    JMP $351A            ; 4C 1A 35 | Jump to address
    BPL $02              ; 10 02 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_05E
; Address: $C48DD4
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_05E:
    JSL $E0FF12          ; 22 12 FF E0 | Game work RAM access
    BEQ $FF              ; F0 FF | Branch if equal
    BNE $01              ; D0 01 | Branch if not equal
    EOR $D154,Y          ; 59 54 D1 | Exclusive OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA $5A              ; 05 5A | Logical OR with accumulator (zero page)
    ASL $3804            ; 0E 04 38 | Arithmetic shift left (absolute)
    LDY #$25             ; A0 25 | Load immediate value into Y register
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    DEX                  ; CA | Decrement X register
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    BVC $29              ; 50 29 | Branch if overflow clear
    BPL $20              ; 10 20 | Branch if positive
    PHY                  ; 5A | Push Y register to stack
    CMP $0050,Y          ; D9 50 00 | Compare accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    CMP ($01),Y          ; D1 01 | Compare accumulator ((zero page),Y)
    ORA $78              ; 05 78 | Logical OR with accumulator (zero page)
    LDY $40F1            ; AC F1 40 | Load from absolute address into Y register
    LDX $0024,Y          ; BE 24 00 | Load from absolute,Y into X register
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BPL $4D              ; 10 4D | Branch if positive
    INY                  ; C8 | Increment Y register
    ASL $D2              ; 06 D2 | Arithmetic shift left (zero page)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_05F
; Address: $C48E31
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_05F:
    LDA ($83,X)          ; A1 83 | Read graphics status
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_060
; Address: $C48E3E
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_060:
    BRA $8D              ; 80 8D | Branch always
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BNE $E8              ; D0 E8 | Branch if not equal
    BVC $25              ; 50 25 | Branch if overflow clear
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $D3              ; 06 D3 | Arithmetic shift left (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $E178            ; 6E 78 E1 | Rotate right (absolute)
    STZ $0A              ; 64 0A | Store zero to zero page
    BPL $13              ; 10 13 | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    BNE $01              ; D0 01 | Branch if not equal
    DEC $01              ; C6 01 | Decrement (zero page)
    BCC $F3              ; 90 F3 | Branch if carry clear
    LDY #$21             ; A0 21 | PPU graphics register access
    LSR $F0AC,X          ; 5E AC F0 | Logical shift right (absolute,X)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDX $04              ; A6 04 | Load from zero page into X register
    EOR #$CC             ; 49 CC | Exclusive OR with accumulator (immediate)
    SBC ($C3),Y          ; F1 C3 | Subtract with carry ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    CPX #$4B             ; E0 4B | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BIT $11              ; 24 11 | Test bits in accumulator (zero page)
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    ORA ($F0),Y          ; 11 F0 | Logical OR with accumulator ((zero page),Y)
    BVC $25              ; 50 25 | Branch if overflow clear
    LSR $825B            ; 4E 5B 82 | Logical shift right (absolute)
    ASL $D5              ; 06 D5 | Arithmetic shift left (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BPL $04              ; 10 04 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    SBC ($42),Y          ; F1 42 | Hardware register operation
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    ROL                  ; 2A | Rotate left (accumulator)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    AND ($11,X)          ; 21 11 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_061
; Address: $C48EB5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_061:
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    CPX #$35             ; E0 35 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_062
; Address: $C48EC1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_062:
    JSR $0008            ; 20 08 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    WDM #$84             ; 42 84 | Reserved instruction
    DEX                  ; CA | Decrement X register
    PLP                  ; 28 | Pull processor status from stack
    AND #$58             ; 29 58 | Logical AND with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_063
; Address: $C48ECF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_063:
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    BRA $00              ; 80 00 | Branch always
    AND $01              ; 25 01 | Logical AND with accumulator (zero page)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $40              ; 10 40 | Branch if positive
    BMI $F0              ; 30 F0 | Branch if negative
    LSR $08FF,X          ; 5E FF 08 | Logical shift right (absolute,X)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    WDM #$84             ; 42 84 | Reserved instruction
    DEX                  ; CA | Decrement X register
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_064
; Address: $C48EF4
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_064:
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    CPX #$4A             ; E0 4A | Compare X register (immediate)
    BIT $00A5            ; 2C A5 00 | Test bits in accumulator (absolute)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BEQ $5F              ; F0 5F | Branch if equal
    BNE $07              ; D0 07 | Branch if not equal
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    PEA #$5206           ; F4 06 52 | Push effective address to stack
    BMI $82              ; 30 82 | Branch if negative
    WDM #$C7             ; 42 C7 | Reserved instruction
    ORA $5100,X          ; 1D 00 51 | Logical OR with accumulator (absolute,X)
    BIT $02              ; 24 02 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ADC $9D              ; 65 9D | Add with carry (zero page)
    ASL $D8              ; 06 D8 | Arithmetic shift left (zero page)
    ORA ($6A,X)          ; 01 6A | Logical OR with accumulator ((zero page,X))
    BVS $17              ; 70 17 | Branch if overflow set
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_065
; Address: $C48F36
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_065:
    CPY $0046            ; CC 46 00 | Compare Y register (absolute)
    EOR $6402,Y          ; 59 02 64 | Exclusive OR with accumulator (absolute,Y)
    ORA #$90             ; 09 90 | Logical OR with accumulator (immediate)
    AND $40              ; 25 40 | Logical AND with accumulator (zero page)
    BRA $2C              ; 80 2C | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_066
; Address: $C48F4B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_066:
    JSR $5E20            ; 20 20 5E | Jump to subroutine
    INY                  ; C8 | Increment Y register
    ASL $D9              ; 06 D9 | Arithmetic shift left (zero page)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_067
; Address: $C48F5A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_067:
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    ROL $80              ; 26 80 | Rotate left (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_068
; Address: $C48F6F
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_068:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPY #$06             ; C0 06 | Compare Y register (immediate)
    BPL $DA              ; 10 DA | Branch if positive
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    BNE $02              ; D0 02 | Branch if not equal
    LSR $B168            ; 4E 68 B1 | Logical shift right (absolute)
    STY $BB              ; 84 BB | Store Y register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($20,X)          ; A1 20 | Read graphics status
    ORA ($5D),Y          ; 11 5D | Logical OR with accumulator ((zero page),Y)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ASL $01DB            ; 0E DB 01 | Arithmetic shift left (absolute)
    ROL $AE              ; 26 AE | Rotate left (zero page)
    ASL $4D              ; 06 4D | Arithmetic shift left (zero page)
    LDY $C1              ; A4 C1 | Load from zero page into Y register
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    ASL $1BA8,X          ; 1E A8 1B | Arithmetic shift left (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_069
; Address: $C48FAD
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_069:
    PHP                  ; 08 | Push processor status to stack
    CPX #$C5             ; E0 C5 | Compare X register (immediate)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_06B
; Address: $C48FB7
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_06B:
    JSL $D02111          ; 22 11 21 D0 | Jump to subroutine long
    AND ($53,X)          ; 21 53 | Logical AND with accumulator ((zero page,X))
    LDX $0082            ; AE 82 00 | Load from absolute address into X register
    PHP                  ; 08 | Push processor status to stack
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    ADC #$40             ; 69 40 | Add with carry (immediate)
    CMP ($83,X)          ; C1 83 | Compare accumulator ((zero page,X))
    BNE $48              ; D0 48 | Branch if not equal
    DEC $30              ; C6 30 | Decrement (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    JMP $E3D331          ; 5C 31 D3 E3 | Jump to address long
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BCC $20              ; 90 20 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_06C
; Address: $C48FE0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_06C:
    AND ($59,X)          ; 21 59 | Logical AND with accumulator ((zero page,X))
    CMP $1801,X          ; DD 01 18 | Compare accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $DC0A,X          ; 9D 0A DC | Update graphics data
    BEQ $3F              ; F0 3F | Branch if equal
    STX $04              ; 86 04 | Store X register to zero page
    ROR                  ; 6A | Rotate right (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR #$A0             ; 49 A0 | Exclusive OR with accumulator (immediate)
    LSR $4D              ; 46 4D | Logical shift right (zero page)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_06D
; Address: $C49003
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_06D:
    JSL $FFFFF0          ; 22 F0 FF FF | Jump to subroutine long
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $01DE            ; 0D DE 01 | Logical OR with accumulator (absolute)
    BIT $F6              ; 24 F6 | Test bits in accumulator (zero page)
    BMI $7C              ; 30 7C | Branch if negative
    LDA ($40,X)          ; A1 40 | Read graphics status
    DEC $052D            ; CE 2D 05 | Decrement (absolute)
    AND $CA01            ; 2D 01 CA | Logical AND with accumulator (absolute)
    CPY $1008            ; CC 08 10 | Compare Y register (absolute)
    LDY #$CC             ; A0 CC | Load immediate value into Y register
    STY $6600            ; 8C 00 66 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $30              ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_06E
; Address: $C4902A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_06E:
    JSR $5BC7            ; 20 C7 5B | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    LSR $05              ; 46 05 | Logical shift right (zero page)
    CPX #$01             ; E0 01 | Compare X register (immediate)
    EOR $CB              ; 45 CB | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_06F
; Address: $C4903B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_06F:
    ASL $2A69,X          ; 1E 69 2A | Arithmetic shift left (absolute,X)
    ORA ($64,X)          ; 01 64 | Logical OR with accumulator ((zero page,X))
    BVC $10              ; 50 10 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ORA $AA              ; 05 AA | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC ($31,X)          ; 61 31 | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_070
; Address: $C4904F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_070:
    ADC ($96,X)          ; 61 96 | Add with carry ((zero page,X))
    PHX                  ; DA | Push X register to stack
    ASL $E0              ; 06 E0 | Game work RAM access
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    CPY $09              ; C4 09 | Compare Y register (zero page)
    ADC #$D0             ; 69 D0 | Add with carry (immediate)
    CMP ($50),Y          ; D1 50 | Compare accumulator ((zero page),Y)
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    JMP ($0808)          ; 6C 08 08 | Jump to address (absolute indirect)
    BPL $40              ; 10 40 | Branch if positive
    BRA $8D              ; 80 8D | Branch always
    WDM #$00             ; 42 00 | Reserved instruction
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_071
; Address: $C49073
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_071:
    JSR $E7F0            ; 20 F0 E7 | Jump to subroutine
    INC $05DC,X          ; FE DC 05 | Increment (absolute,X)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    STX $01              ; 86 01 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_072
; Address: $C49081
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_072:
    JSL $3CBAC3          ; 22 C3 BA 3C | Jump to subroutine long
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    ROL $40              ; 26 40 | Rotate left (zero page)
    BRA $00              ; 80 00 | Branch always
    BMI $C0              ; 30 C0 | Branch if negative
    EOR $D2C7,X          ; 5D C7 D2 | Exclusive OR with accumulator (absolute,X)
    ASL $E2              ; 06 E2 | Arithmetic shift left (zero page)
    ORA ($27,X)          ; 01 27 | Logical OR with accumulator ((zero page,X))
    ROL $4E09            ; 2E 09 4E | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    STY $CE              ; 84 CE | Store Y register to zero page
    ROL $B200,X          ; 3E 00 B2 | Rotate left (absolute,X)
    ROL $0201            ; 2E 01 02 | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BCS $45              ; B0 45 | Branch if carry set
    PHB                  ; 8B | Push data bank register to stack
    AND $00F0            ; 2D F0 00 | Logical AND with accumulator (absolute)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BVC $29              ; 50 29 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_073
; Address: $C490BD
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_073:
    CMP ($21,X)          ; C1 21 | PPU graphics register access
    EOR $C897,X          ; 5D 97 C8 | Exclusive OR with accumulator (absolute,X)
    ASL $E3              ; 06 E3 | Arithmetic shift left (zero page)
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ASL $6E              ; 06 6E | Arithmetic shift left (zero page)
    PEA #$0551           ; F4 51 05 | Push effective address to stack
    CMP #$48             ; C9 48 | Compare accumulator (immediate)
    ROL $01              ; 26 01 | Rotate left (zero page)
    INY                  ; C8 | Increment Y register
    BRA $10              ; 80 10 | Branch always
    BRA $4C              ; 80 4C | Branch always
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_074
; Address: $C490E0
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_074:
    JSR $9020            ; 20 20 90 | Jump to subroutine
    AND ($06,X)          ; 21 06 | Logical AND with accumulator ((zero page,X))
    CMP $0078,Y          ; D9 78 00 | Compare accumulator (absolute,Y)
    ASL $E4              ; 06 E4 | Arithmetic shift left (zero page)
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    LDY #$58             ; A0 58 | Load immediate value into Y register
    LDX #$C0             ; A2 C0 | Load immediate value into X register
    LDX $0034,Y          ; BE 34 00 | Load from absolute,Y into X register
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BEQ $11              ; F0 11 | Branch if equal
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    EOR ($A8),Y          ; 51 A8 | Exclusive OR with accumulator ((zero page),Y)
    BCC $10              ; 90 10 | Branch if carry clear
    EOR $C2D7            ; 4D D7 C2 | Exclusive OR with accumulator (absolute)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    SBC $01              ; E5 01 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_075
; Address: $C49111
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_075:
    JSR $8208            ; 20 08 82 | Jump to subroutine
    JMP ($4462)          ; 6C 62 44 | Jump to address (absolute indirect)
    DEC $3A              ; C6 3A | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_077
; Address: $C49121
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_077:
    JSR $8040            ; 20 40 80 | Jump to subroutine
    BEQ $1F              ; F0 1F | Branch if equal
    BPL $11              ; 10 11 | Branch if positive
    BPL $20              ; 10 20 | Branch if positive
    BPL $11              ; 10 11 | Branch if positive
    STA $96D7,X          ; 9D D7 96 | Update graphics data
    ASL $E6              ; 06 E6 | Arithmetic shift left (zero page)
    ORA ($2B,X)          ; 01 2B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_079
; Address: $C49139
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_079:
    JSR $85A3            ; 20 A3 85 | Jump to subroutine
    ASL $0124            ; 0E 24 01 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_07A
; Address: $C49145
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_07A:
    JSR $4040            ; 20 40 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BVS $40              ; 70 40 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_07B
; Address: $C49152
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_07B:
    JSL $5ED75D          ; 22 5D D7 5E | Jump to subroutine long
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($2A,X)          ; 01 2A | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHY                  ; 5A | Push Y register to stack
    BIT $8502            ; 2C 02 85 | Test bits in accumulator (absolute)
    LSR $18              ; 46 18 | Logical shift right (zero page)
    ADC #$2A             ; 69 2A | Add with carry (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    BRA $84              ; 80 84 | Branch always
    JMP $0011            ; 4C 11 00 | Jump to address
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    EOR ($28),Y          ; 51 28 | Exclusive OR with accumulator ((zero page),Y)
    BVC $20              ; 50 20 | Branch if overflow clear
    TAX                  ; AA | Transfer accumulator to X register
    XBA                  ; EB | Exchange accumulator bytes
    STY $0600            ; 8C 00 06 | Store Y register to absolute address
    INX                  ; E8 | Increment X register
    ORA ($2B,X)          ; 01 2B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_07C
; Address: $C49180
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_07C:
    JSL $688C0B          ; 22 0B 8C 68 | Jump to subroutine long
    ADC ($89,X)          ; 61 89 | Add with carry ((zero page,X))
    BCS $4B              ; B0 4B | Branch if carry set
    STZ $13              ; 64 13 | Store zero to zero page
    PHY                  ; 5A | Push Y register to stack
    SEC                  ; 38 | Set carry flag
    BVS $F0              ; 70 F0 | Branch if overflow set
    SEP #$C5             ; E2 C5 | Set processor status bits
    PHB                  ; 8B | Push data bank register to stack
    BPL $00              ; 10 00 | Branch if positive
    LDA ($29,X)          ; A1 29 | Read graphics status
    LDY #$20             ; A0 20 | Load immediate value into Y register
    SBC $82              ; E5 82 | Subtract with carry (zero page)
    PHP                  ; 08 | Push processor status to stack
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    ASL $08C0,X          ; 1E C0 08 | Arithmetic shift left (absolute,X)
    ADC $01A4,X          ; 7D A4 01 | Add with carry (absolute,X)
    STA $C4              ; 85 C4 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_07E
; Address: $C491B4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_07E:
    SBC ($C3),Y          ; F1 C3 | Subtract with carry ((zero page),Y)
    STY $09              ; 84 09 | Store Y register to zero page
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($53),Y          ; 11 53 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_07F
; Address: $C491BF
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_07F:
    JSL $062160          ; 22 60 21 06 | Jump to subroutine long
    CMP $0064,Y          ; D9 64 00 | Compare accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    NOP                  ; EA | No operation
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    ORA #$5A             ; 09 5A | Logical OR with accumulator (immediate)
    CPY $8501            ; CC 01 85 | Compare Y register (absolute)
    DEC                  ; 3A | Decrement accumulator
    BMI $17              ; 30 17 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ROR                  ; 6A | Rotate right (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BRA $20              ; 80 20 | Branch always
    BNE $0F              ; D0 0F | Branch if not equal
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    BVC $71              ; 50 71 | Branch if overflow clear
    BNE $21              ; D0 21 | PPU graphics register access
    ADC $0400,X          ; 7D 00 04 | Add with carry (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    BIT $82              ; 24 82 | Test bits in accumulator (zero page)
    DEX                  ; CA | Decrement X register
    JMP $BC00            ; 4C 00 BC | Jump to address
    AND #$58             ; 29 58 | Logical AND with accumulator (immediate)
    BCS $60              ; B0 60 | Branch if carry set
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_080
; Address: $C491FF
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_080:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    BIT $1187            ; 2C 87 11 | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BEQ $20              ; F0 20 | Branch if equal
    ROR $96EF            ; 6E EF 96 | Rotate right (absolute)
    CPX $3901            ; EC 01 39 | Compare X register (absolute)
    NOP                  ; EA | No operation
    SEI                  ; 78 | Set interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    SEP #$44             ; E2 44 | Set processor status bits
    CMP ($43),Y          ; D1 43 | Compare accumulator ((zero page),Y)
    ASL $1C31            ; 0E 31 1C | Arithmetic shift left (absolute)
    BVS $08              ; 70 08 | Branch if overflow set
    BPL $80              ; 10 80 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_082
; Address: $C49230
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_082:
    AND $55              ; 25 55 | Logical AND with accumulator (zero page)
    PHX                  ; DA | Push X register to stack
    PLX                  ; FA | Pull X register from stack
    SBC $6A01            ; ED 01 6A | Subtract with carry (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_083
; Address: $C4923C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_083:
    BMI $B2              ; 30 B2 | Branch if negative
    ROL $B400,X          ; 3E 00 B4 | Rotate left (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_084
; Address: $C49247
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_084:
    ORA #$40             ; 09 40 | Logical OR with accumulator (immediate)
    ASL $4B              ; 06 4B | Arithmetic shift left (zero page)
    BIT $0112            ; 2C 12 01 | Test bits in accumulator (absolute)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_085
; Address: $C49253
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_085:
    JSR $1160            ; 20 60 11 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    INC $2B01            ; EE 01 2B | Increment (absolute)
    DEC $0C              ; C6 0C | Decrement (zero page)
    BVC $90              ; 50 90 | Branch if overflow clear
    STA ($43),Y          ; 91 43 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    BPL $20              ; 10 20 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    ROL                  ; 2A | Rotate left (accumulator)
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $29              ; 10 29 | Branch if positive
    BCC $B2              ; 90 B2 | Branch if carry clear
    EOR $0400,X          ; 5D 00 04 | Exclusive OR with accumulator (absolute,X)
    ORA ($EC,X)          ; 01 EC | Logical OR with accumulator ((zero page,X))
    LDY $350D            ; AC 0D 35 | Load from absolute address into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    REP #$CE             ; C2 CE | Reset processor status bits
    ROL $025A            ; 2E 5A 02 | Rotate left (absolute)
    JMP ($12D9)          ; 6C D9 12 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_086
; Address: $C49293
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_086:
    JSR $96C0            ; 20 C0 96 | Jump to subroutine
    AND $01CD            ; 2D CD 01 | Logical AND with accumulator (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    CPY #$76             ; C0 76 | Compare Y register (immediate)
    LSR $5E5B            ; 4E 5B 5E | Logical shift right (absolute)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BEQ $01              ; F0 01 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_087
; Address: $C492A7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_087:
    BIT $0BF4            ; 2C F4 0B | Test bits in accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    REP #$C3             ; C2 C3 | Reset processor status bits
    LSR $6932            ; 4E 32 69 | Logical shift right (absolute)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_088
; Address: $C492B5
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_088:
    JSR $5218            ; 20 18 52 | Jump to subroutine
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($5D,X)          ; 21 5D | Logical AND with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ADC ($28,X)          ; 61 28 | Add with carry ((zero page,X))
    BRA $60              ; 80 60 | Branch always
    ORA $D9              ; 05 D9 | Logical OR with accumulator (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ASL $F1              ; 06 F1 | Arithmetic shift left (zero page)
    ORA ($2D,X)          ; 01 2D | Logical OR with accumulator ((zero page,X))
    JMP ($570C)          ; 6C 0C 57 | Jump to address (absolute indirect)
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_089
; Address: $C492E7
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_089:
    INX                  ; E8 | Increment X register
    BCC $A6              ; 90 A6 | Branch if carry clear
    TXS                  ; 9A | Transfer X register to stack pointer
    EOR $00AA,Y          ; 59 AA 00 | Exclusive OR with accumulator (absolute,Y)
    ASL $F2              ; 06 F2 | Arithmetic shift left (zero page)
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    LSR $6461,X          ; 5E 61 64 | Logical shift right (absolute,X)
    ORA #$CB             ; 09 CB | Logical OR with accumulator (immediate)
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BRA $25              ; 80 25 | Branch always
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    BVS $F0              ; 70 F0 | Branch if overflow set
    DEC $40FF,X          ; DE FF 40 | Decrement (absolute,X)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    LDY $C234,X          ; BC 34 C2 | Load from absolute,X into Y register
    EOR #$C3             ; 49 C3 | Exclusive OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    ADC #$07             ; 69 07 | Add with carry (immediate)
    EOR $041C,Y          ; 59 1C 04 | Exclusive OR with accumulator (absolute,Y)
    BVS $90              ; 70 90 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_08B
; Address: $C4932C
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_08B:
    JSR $2021            ; 20 21 20 | Jump to subroutine
    AND ($21,X)          ; 21 21 | PPU graphics register access
    LDA ($50),Y          ; B1 50 | Read graphics status
    JMP $0204            ; 4C 04 02 | Jump to address
    PEA #$BF01           ; F4 01 BF | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROL $0201            ; 2E 01 02 | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BVS $02              ; 70 02 | Branch if overflow set
    BEQ $BF              ; F0 BF | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    CPY #$83             ; C0 83 | Compare Y register (immediate)
    STY $55B3            ; 8C B3 55 | Store Y register to absolute address
    ASL $6402            ; 0E 02 64 | Arithmetic shift left (absolute)
    ORA #$80             ; 09 80 | Logical OR with accumulator (immediate)
    CPX #$87             ; E0 87 | Compare X register (immediate)
    ASL $1200            ; 0E 00 12 | Arithmetic shift left (absolute)
    BPL $22              ; 10 22 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_08C
; Address: $C49379
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_08C:
    JSL $6378E1          ; 22 E1 78 63 | Jump to subroutine long
    SBC ($5A),Y          ; F1 5A | Subtract with carry ((zero page),Y)
    CPY $09              ; C4 09 | Compare Y register (zero page)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BNE $E7              ; D0 E7 | Branch if not equal
    CMP $FFFF,X          ; DD FF FF | Compare accumulator (absolute,X)
    JMP $097024          ; 5C 24 70 09 | Jump to address long
    BVS $86              ; 70 86 | Branch if overflow set
    BPL $2E              ; 10 2E | Branch if positive
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    LDY #$85             ; A0 85 | Load immediate value into Y register
    CPY $50D3            ; CC D3 50 | Compare Y register (absolute)
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    BPL $E0              ; 10 E0 | Game work RAM access
    BMI $31              ; 30 31 | Branch if negative
    BPL $F8              ; 10 F8 | Branch if positive
    CPY #$F2             ; C0 F2 | Compare Y register (immediate)
    JMP $F70212          ; 5C 12 02 F7 | Jump to address long
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $64C2            ; 0D C2 64 | Logical OR with accumulator (absolute)
    ORA $0215,X          ; 1D 15 02 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_08D
; Address: $C493DD
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_08D:
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BPL $C0              ; 10 C0 | Branch if positive
    STY $09              ; 84 09 | Store Y register to zero page
    BMI $33              ; 30 33 | Branch if negative
    BCC $38              ; 90 38 | Branch if carry clear
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BCC $01              ; 90 01 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ADC ($43,X)          ; 61 43 | Add with carry ((zero page,X))
    REP #$0A             ; C2 0A | Reset processor status bits
    ORA $D001,X          ; 1D 01 D0 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_08E
; Address: $C49404
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_08E:
    JSR $4020            ; 20 20 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    BPL $F0              ; 10 F0 | Branch if positive
    BIT $0201            ; 2C 01 02 | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    CPY #$12             ; C0 12 | Compare Y register (immediate)
    ADC ($84,X)          ; 61 84 | Add with carry ((zero page,X))
    REP #$17             ; C2 17 | Reset processor status bits
    ORA $0401,X          ; 1D 01 04 | Logical OR with accumulator (absolute,X)
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_08F
; Address: $C4942A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_08F:
    JSR $8040            ; 20 40 80 | Jump to subroutine
    BPL $10              ; 10 10 | Branch if positive
    BCC $38              ; 90 38 | Branch if carry clear
    BVC $F0              ; 50 F0 | Branch if overflow clear
    LDY $0202,X          ; BC 02 02 | Load from absolute,X into Y register
    SBC $3F01,Y          ; F9 01 3F | Subtract with carry (absolute,Y)
    BVC $00              ; 50 00 | Branch if overflow clear
    BEQ $81              ; F0 81 | Branch if equal
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    BEQ $4C              ; F0 4C | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BIT $50              ; 24 50 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_090
; Address: $C4946D
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_090:
    CLV                  ; B8 | Clear overflow flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    LDY #$26             ; A0 26 | Load immediate value into Y register
    BRA $9A              ; 80 9A | Branch always
    BVC $31              ; 50 31 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    BPL $FB              ; 10 FB | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVC $40              ; 50 40 | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    LDY #$26             ; A0 26 | Load immediate value into Y register
    BRA $9A              ; 80 9A | Branch always
    BVC $31              ; 50 31 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    BPL $FC              ; 10 FC | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_091
; Address: $C494B2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_091:
    JSR $CF43            ; 20 43 CF | Jump to subroutine
    BPL $FD              ; 10 FD | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_092
; Address: $C494D7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_092:
    JSR $CF43            ; 20 43 CF | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    BPL $FE              ; 10 FE | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_094
; Address: $C49511
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_094:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_095
; Address: $C49521
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_095:
    JSR $CF43            ; 20 43 CF | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_096
; Address: $C49546
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_096:
    JSR $CF43            ; 20 43 CF | Jump to subroutine
    BVC $55              ; 50 55 | Branch if overflow clear
    BPL $01              ; 10 01 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_097
; Address: $C4956B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_097:
    JSR $CF43            ; 20 43 CF | Jump to subroutine
    LDY #$AA             ; A0 AA | Load immediate value into Y register
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    BPL $02              ; 10 02 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_098
; Address: $C49590
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_098:
    JSR $CF43            ; 20 43 CF | Jump to subroutine
    BEQ $FF              ; F0 FF | Branch if equal
    BPL $03              ; 10 03 | Branch if positive
    ASL $E896            ; 0E 96 E8 | Arithmetic shift left (absolute)
    ORA #$BA             ; 09 BA | Logical OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    LDY $2A11,X          ; BC 11 2A | Load from absolute,X into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    PHP                  ; 08 | Push processor status to stack
    CPY #$21             ; C0 21 | PPU graphics register access
    AND ($27,X)          ; 21 27 | Logical AND with accumulator ((zero page,X))
    BVC $65              ; 50 65 | Branch if overflow clear
    EOR $C5              ; 45 C5 | Exclusive OR with accumulator (zero page)
    LSR $0401,X          ; 5E 01 04 | Logical shift right (absolute,X)
    AND ($82,X)          ; 21 82 | Logical AND with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    STA $CC              ; 85 CC | Update graphics data
    STZ $00              ; 64 00 | Store zero to zero page
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $40              ; 10 40 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    SBC ($EE,X)          ; E1 EE | Subtract with carry ((zero page,X))
    LDY $0602,X          ; BC 02 06 | Load from absolute,X into Y register
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    SEP #$D5             ; E2 D5 | Set processor status bits
    CPY $78              ; C4 78 | Compare Y register (zero page)
    STX $20              ; 86 20 | Store X register to zero page
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CPX #$C2             ; E0 C2 | Compare X register (immediate)
    ADC $CB              ; 65 CB | Add with carry (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $23              ; 30 23 | Branch if negative
    BIT $B3F0            ; 2C F0 B3 | Test bits in accumulator (absolute)
    ROL $96CF            ; 2E CF 96 | Rotate left (absolute)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    CPY $D210            ; CC 10 D2 | Compare Y register (absolute)
    BNE $A2              ; D0 A2 | Branch if not equal
    DEX                  ; CA | Decrement X register
    BCS $96              ; B0 96 | Branch if carry set
    STA $02              ; 85 02 | Update graphics data
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_099
; Address: $C4962D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_099:
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    SBC ($42),Y          ; F1 42 | Hardware register operation
    STX $8D              ; 86 8D | Store X register to zero page

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_09A
; Address: $C49633
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_09A:
    JSL $0001E2          ; 22 E2 01 00 | Jump to subroutine long
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    BVC $71              ; 50 71 | Branch if overflow clear
    ASL $5ECF            ; 0E CF 5E | Arithmetic shift left (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CPY $09              ; C4 09 | Compare Y register (zero page)
    BVC $98              ; 50 98 | Branch if overflow clear
    STA $FF73C3          ; 8F C3 73 FF | Update graphics data
    ASL $0201,X          ; 1E 01 02 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $8E              ; 06 8E | Arithmetic shift left (zero page)
    ASL $0030,X          ; 1E 30 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_09B
; Address: $C4965C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_09B:
    JSL $180022          ; 22 22 00 18 | Jump to subroutine long
    BMI $CB              ; 30 CB | Branch if negative
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL $283F            ; 0E 3F 28 | Arithmetic shift left (absolute)
    ORA $85              ; 05 85 | Logical OR with accumulator (zero page)
    CMP ($32),Y          ; D1 32 | Compare accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CMP $0131,Y          ; D9 31 01 | Compare accumulator (absolute,Y)
    BPL $50              ; 10 50 | Branch if positive
    LDY $88              ; A4 88 | Load from zero page into Y register
    BRA $00              ; 80 00 | Branch always
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_09D
; Address: $C49687
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_09D:
    ASL $BCEB            ; 0E EB BC | Arithmetic shift left (absolute)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    LDA                  ; BF F0 0A 34 | Read graphics status
    BVS $63              ; 70 63 | Branch if overflow set
    EOR #$B8             ; 49 B8 | Exclusive OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    SBC $2012,Y          ; F9 12 20 | Subtract with carry (absolute,Y)
    CPY #$97             ; C0 97 | Compare Y register (immediate)
    JMP $3311            ; 4C 11 33 | Jump to address
    ORA ($13),Y          ; 11 13 | Logical OR with accumulator ((zero page),Y)
    ORA ($68),Y          ; 11 68 | Logical OR with accumulator ((zero page),Y)
    LDA $2C4B            ; AD 4B 2C | Read graphics status
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $1C              ; 84 1C | Store Y register to zero page
    BPL $C4              ; 10 C4 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ROR $D5FF            ; 6E FF D5 | Rotate right (absolute)
    ASL $7002            ; 0E 02 70 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_09E
; Address: $C496C2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_09E:
    ADC ($C0),Y          ; 71 C0 | Add with carry ((zero page),Y)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_09F
; Address: $C496CA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_09F:
    JSR $2210            ; 20 10 22 | Jump to subroutine
    ORA ($70),Y          ; 11 70 | Logical OR with accumulator ((zero page),Y)
    STY $03              ; 84 03 | Store Y register to zero page
    BVC $C3              ; 50 C3 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    INC $D5              ; E6 D5 | Increment (zero page)
    CPY $FFFF            ; CC FF FF | Compare Y register (absolute)
    ORA $061D            ; 0D 1D 06 | Logical OR with accumulator (absolute)
    BVS $00              ; 70 00 | Branch if overflow set
    STA ($CB),Y          ; 91 CB | Update graphics data
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    BPL $20              ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0A0
; Address: $C496F2
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0A0:
    JSR $0058            ; 20 58 00 | Jump to subroutine
    BEQ $FF              ; F0 FF | Branch if equal
    STY $1C              ; 84 1C | Store Y register to zero page
    SBC $3F01,Y          ; F9 01 3F | Subtract with carry (absolute,Y)
    STZ $00              ; 64 00 | Store zero to zero page
    CMP ($83,X)          ; C1 83 | Compare accumulator ((zero page,X))
    AND $14              ; 25 14 | Logical AND with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BPL $C0              ; 10 C0 | Branch if positive
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDY $00              ; A4 00 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0A1
; Address: $C49715
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0A1:
    JSR $5020            ; 20 20 50 | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    BEQ $9A              ; F0 9A | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $DE00,Y          ; B9 00 DE | Read graphics status
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    ORA ($4D,X)          ; 01 4D | Logical OR with accumulator ((zero page,X))
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    ORA ($97,X)          ; 01 97 | Logical OR with accumulator ((zero page,X))
    ORA ($BC,X)          ; 01 BC | Logical OR with accumulator ((zero page,X))
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BVC $02              ; 50 02 | Branch if overflow clear
    TXS                  ; 9A | Transfer X register to stack pointer
    LDA                  ; BF 02 E4 02 | Read graphics status
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ROL $5303            ; 2E 03 53 | Rotate left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    STA $C203,X          ; 9D 03 C2 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0A2
; Address: $C4975A
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0A2:
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    LDY #$04             ; A0 04 | Load immediate value into Y register
    CMP $04              ; C5 04 | Compare accumulator (zero page)
    NOP                  ; EA | No operation
    ORA $34              ; 05 34 | Logical OR with accumulator (zero page)
    ORA $59              ; 05 59 | Logical OR with accumulator (zero page)
    ORA $7E              ; 05 7E | Logical OR with accumulator (zero page)
    ORA $A3              ; 05 A3 | Logical OR with accumulator (zero page)
    ORA $C8              ; 05 C8 | Logical OR with accumulator (zero page)
    ORA $ED              ; 05 ED | Logical OR with accumulator (zero page)
    ORA $12              ; 05 12 | Logical OR with accumulator (zero page)
    ASL $37              ; 06 37 | Arithmetic shift left (zero page)
    ASL $5C              ; 06 5C | Arithmetic shift left (zero page)
    ASL $81              ; 06 81 | Arithmetic shift left (zero page)
    ASL $A6              ; 06 A6 | Arithmetic shift left (zero page)
    ASL $CB              ; 06 CB | Arithmetic shift left (zero page)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    ASL $15              ; 06 15 | Arithmetic shift left (zero page)
    DEC                  ; 3A | Decrement accumulator
    STY $07              ; 84 07 | Store Y register to zero page
    LDA #$07             ; A9 07 | Read graphics status
    DEC $F307            ; CE 07 F3 | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    AND $6208,X          ; 3D 08 62 | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDY $D108            ; AC 08 D1 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$40             ; 09 40 | Logical OR with accumulator (immediate)
    ORA #$65             ; 09 65 | Logical OR with accumulator (immediate)
    ORA #$8A             ; 09 8A | Logical OR with accumulator (immediate)
    ORA #$AF             ; 09 AF | Logical OR with accumulator (immediate)
    ORA #$D4             ; 09 D4 | Logical OR with accumulator (immediate)
    ORA #$F9             ; 09 F9 | Logical OR with accumulator (immediate)
    ORA #$1E             ; 09 1E | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $B20A            ; 8D 0A B2 | Update graphics data
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($0B,X)          ; 21 0B | Logical AND with accumulator ((zero page,X))
    LSR $0B              ; 46 0B | Logical shift right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0A4
; Address: $C497C8
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0A4:
    BIT $0C              ; 24 0C | Test bits in accumulator (zero page)
    EOR #$0C             ; 49 0C | Exclusive OR with accumulator (immediate)
    ROR $930C            ; 6E 0C 93 | Rotate right (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $020C,X          ; DD 0C 02 | Compare accumulator (absolute,X)
    ORA $0D27            ; 0D 27 0D | Logical OR with accumulator (absolute)
    JMP $710D            ; 4C 0D 71 | Jump to address
    ORA $0D96            ; 0D 96 0D | Logical OR with accumulator (absolute)
    ORA $0DE0            ; 0D E0 0D | Logical OR with accumulator (absolute)
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $0E4F            ; 0E 4F 0E | Arithmetic shift left (absolute)
    ASL $0E99            ; 0E 99 0E | Arithmetic shift left (absolute)
    LDX $E30E,Y          ; BE 0E E3 | Load from absolute,Y into X register
    ASL $0F08            ; 0E 08 0F | Arithmetic shift left (absolute)
    AND $520F            ; 2D 0F 52 | Logical AND with accumulator (absolute)
    STZ $C10F            ; 9C 0F C1 | Store zero to absolute
    INC $0F              ; E6 0F | Increment (zero page)
    BPL $30              ; 10 30 | Branch if positive
    BPL $55              ; 10 55 | Branch if positive
    BPL $7A              ; 10 7A | Branch if positive
    BPL $9F              ; 10 9F | Branch if positive
    BPL $C4              ; 10 C4 | Branch if positive
    BPL $E9              ; 10 E9 | Branch if positive
    BPL $0E              ; 10 0E | Branch if positive
    ORA ($33),Y          ; 11 33 | Logical OR with accumulator ((zero page),Y)
    ORA ($58),Y          ; 11 58 | Logical OR with accumulator ((zero page),Y)
    ORA ($7D),Y          ; 11 7D | Logical OR with accumulator ((zero page),Y)
    ORA ($A2),Y          ; 11 A2 | Logical OR with accumulator ((zero page),Y)
    ORA ($C7),Y          ; 11 C7 | Logical OR with accumulator ((zero page),Y)
    ORA ($EC),Y          ; 11 EC | Logical OR with accumulator ((zero page),Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BRA $12              ; 80 12 | Branch always
    LDA $12              ; A5 12 | Read graphics status
    DEX                  ; CA | Decrement X register
    AND $5E13,Y          ; 39 13 5E | Logical AND with accumulator (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP $F213            ; CD 13 F2 | Compare accumulator (absolute)
    ADC ($14,X)          ; 61 14 | Add with carry ((zero page,X))
    STX $14              ; 86 14 | Store X register to zero page
    PLB                  ; AB | Pull data bank register from stack
    BNE $14              ; D0 14 | Branch if not equal
    INC                  ; 1A | Increment accumulator
    STZ $15              ; 64 15 | Store zero to zero page
    BIT #$15             ; 89 15 | Test bits in accumulator (immediate)
    LDX $D315            ; AE 15 D3 | Load from absolute address into X register
    SED                  ; F8 | Set decimal mode flag
    ORA $4216,X          ; 1D 16 42 | Hardware register operation
    STY $B116            ; 8C 16 B1 | Store Y register to absolute address
    STA $00C2            ; 8D C2 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0A5
; Address: $C4986C
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0A5:
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA #$8D             ; A9 8D | Read graphics status
    REP #$07             ; C2 07 | Reset processor status bits
    STA $8D71            ; 8D 71 8D | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    INC $01FF,X          ; FE FF 01 | Increment (absolute,X)
    ASL $0023            ; 0E 23 00 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA #$8D             ; A9 8D | Read graphics status
    REP #$07             ; C2 07 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA #$8D             ; A9 8D | Read graphics status
    REP #$07             ; C2 07 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($AB,X)          ; 01 AB | Logical OR with accumulator ((zero page,X))
    BMI $38              ; 30 38 | Branch if negative
    ROL $01BF,X          ; 3E BF 01 | Rotate left (absolute,X)
    ASL $0023,X          ; 1E 23 00 | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA #$8D             ; A9 8D | Read graphics status
    REP #$07             ; C2 07 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0A7
; Address: $C498EB
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0A7:
    JSR $3E38            ; 20 38 3E | Jump to subroutine
    LDA                  ; BF 11 1E 23 | Read graphics status
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA #$8D             ; A9 8D | Read graphics status
    REP #$07             ; C2 07 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($BB,X)          ; 01 BB | Logical OR with accumulator ((zero page,X))
    BPL $38              ; 10 38 | Branch if positive
    ROL $11BF,X          ; 3E BF 11 | Rotate left (absolute,X)
    ASL $020C,X          ; 1E 0C 02 | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $6602            ; 0D 02 66 | Logical OR with accumulator (absolute)
    STX $51C2            ; 8E C2 51 | Store X register to absolute address
    ORA ($9A,X)          ; 01 9A | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$0B             ; 09 0B | Logical OR with accumulator (immediate)
    STA ($F8,X)          ; 81 F8 | Update graphics data
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $0102            ; 0D 02 01 | Logical OR with accumulator (absolute)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    ROL $96              ; 26 96 | Rotate left (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $820B,Y          ; 19 0B 82 | Logical OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $0102            ; 0E 02 01 | Arithmetic shift left (absolute)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    PHX                  ; DA | Push X register to stack
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    AND ($0B),Y          ; 31 0B | Logical AND with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $6602            ; 0E 02 66 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0A8
; Address: $C4996C
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0A8:
    STX $51C2            ; 8E C2 51 | Store X register to absolute address
    ROL $98              ; 26 98 | Rotate left (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    STA ($F8,X)          ; 81 F8 | Update graphics data
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BPL $02              ; 10 02 | Branch if positive
    ASL $6602            ; 0E 02 66 | Arithmetic shift left (absolute)
    STX $51C2            ; 8E C2 51 | Store X register to absolute address
    ORA $D3              ; 05 D3 | Logical OR with accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    ASL $6602            ; 0E 02 66 | Arithmetic shift left (absolute)
    STX $51C2            ; 8E C2 51 | Store X register to absolute address
    ASL $58              ; 06 58 | Arithmetic shift left (zero page)
    STA $8D71,Y          ; 99 71 8D | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    LDA $8D71A4          ; AF A4 71 8D | Read graphics status
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    STY $F8              ; 84 F8 | Store Y register to zero page
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    LDA $71              ; A5 71 | Read graphics status
    STA $8A88            ; 8D 88 8A | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    STA $F8              ; 85 F8 | Update graphics data
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    LDX $71              ; A6 71 | Load from zero page into X register
    STA $8A88            ; 8D 88 8A | Update graphics data
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0A9
; Address: $C49A0D
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0A9:
    STX $F8              ; 86 F8 | Store X register to zero page
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $6602            ; 0D 02 66 | Logical OR with accumulator (absolute)
    STX $51C2            ; 8E C2 51 | Store X register to absolute address
    ORA $99F8            ; 0D F8 99 | Logical OR with accumulator (absolute)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $8713            ; 0D 13 87 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $6602            ; 0E 02 66 | Arithmetic shift left (absolute)
    STX $51C2            ; 8E C2 51 | Store X register to absolute address
    ASL $9BED            ; 0E ED 9B | Arithmetic shift left (absolute)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    INC                  ; 1A | Increment accumulator
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    ROR $9C              ; 66 9C | Rotate right (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ASL $6602            ; 0E 02 66 | Arithmetic shift left (absolute)
    STX $51C2            ; 8E C2 51 | Store X register to absolute address
    BPL $44              ; 10 44 | Branch if positive
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $0200            ; 0D 00 02 | Logical OR with accumulator (absolute)
    BIT #$F8             ; 89 F8 | Test bits in accumulator (immediate)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $0202,Y          ; 19 02 02 | Logical OR with accumulator (absolute,Y)
    ASL $6602            ; 0E 02 66 | Arithmetic shift left (absolute)
    STX $51C2            ; 8E C2 51 | Store X register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $A0              ; E5 A0 | Subtract with carry (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0AA
; Address: $C49A99
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0AA:
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    STY $F8              ; 84 F8 | Store Y register to zero page
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ASL $6602            ; 0E 02 66 | Arithmetic shift left (absolute)
    STX $51C2            ; 8E C2 51 | Store X register to absolute address
    LDX #$71             ; A2 71 | Load immediate value into X register
    STA $8A88            ; 8D 88 8A | Update graphics data
    INC                  ; 1A | Increment accumulator
    STA $F8              ; 85 F8 | Update graphics data
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $6602            ; 0E 02 66 | Arithmetic shift left (absolute)
    STX $51C2            ; 8E C2 51 | Store X register to absolute address
    EOR ($A3,X)          ; 41 A3 | Exclusive OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BPL $00              ; 10 00 | Branch if positive
    ROL $1B              ; 26 1B | Rotate left (zero page)
    STX $F8              ; 86 F8 | Store X register to zero page
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $6602            ; 0D 02 66 | Logical OR with accumulator (absolute)
    STX $51C2            ; 8E C2 51 | Store X register to absolute address
    ORA ($E3),Y          ; 11 E3 | Logical OR with accumulator ((zero page),Y)
    STA $8D71,X          ; 9D 71 8D | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND ($23,X)          ; 21 23 | Logical AND with accumulator ((zero page,X))
    STY $F8              ; 84 F8 | Store Y register to zero page
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $0302,X          ; 1D 02 03 | Logical OR with accumulator (absolute,X)
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    SEP #$9F             ; E2 9F | Set processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    STA $F8              ; 85 F8 | Update graphics data
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $0102,X          ; 1E 02 01 | Arithmetic shift left (absolute,X)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    BIT $93              ; 24 93 | Test bits in accumulator (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    PHB                  ; 8B | Push data bank register to stack
    ORA $102B,X          ; 1D 2B 10 | Logical OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0AB
; Address: $C49B33
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0AB:
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ASL $2402            ; 0E 02 24 | Arithmetic shift left (absolute)
    REP #$51             ; C2 51 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    PHB                  ; 8B | Push data bank register to stack
    ASL $108B,X          ; 1E 8B 10 | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0AC
; Address: $C49B52
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0AC:
    JSR $0302            ; 20 02 03 | Jump to subroutine
    BPL $11              ; 10 11 | Branch if positive
    CPX #$93             ; E0 93 | Compare X register (immediate)
    REP #$51             ; C2 51 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    STA $00008B          ; 8F 8B 00 00 | Update graphics data
    BRA $78              ; 80 78 | Branch always
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    EOR $C294,X          ; 5D 94 C2 | Exclusive OR with accumulator (absolute,X)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    LDA $00008A          ; AF 8A 00 00 | Read graphics status
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0AD
; Address: $C49B8C
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0AD:
    JSL $010102          ; 22 02 01 01 | Jump to subroutine long
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    STA $C294            ; 8D 94 C2 | Update graphics data
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    STY $8D71            ; 8C 71 8D | Store Y register to absolute address
    STY $0000            ; 8C 00 00 | Store Y register to absolute address
    ORA $104B,X          ; 1D 4B 10 | Logical OR with accumulator (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $02              ; 10 02 | Branch if positive
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    REP #$51             ; C2 51 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BIT $02              ; 24 02 | Test bits in accumulator (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    STA $7191            ; 8D 91 71 | Update graphics data
    STA $8A88            ; 8D 88 8A | Update graphics data
    ASL $504B            ; 0E 4B 50 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0AE
; Address: $C49BDE
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0AE:
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    BPL $96              ; 10 96 | Branch if positive
    REP #$51             ; C2 51 | Reset processor status bits
    AND #$22             ; 29 22 | Logical AND with accumulator (immediate)
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    AND $020D            ; 2D 0D 02 | Logical AND with accumulator (absolute)
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ORA $1002,Y          ; 19 02 10 | Logical OR with accumulator (absolute,Y)
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0AF
; Address: $C49C0C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0AF:
    JSL $8D7190          ; 22 90 71 8D | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $8001            ; 0D 01 80 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    BPL $96              ; 10 96 | Branch if positive
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0B0
; Address: $C49C29
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0B0:
    JSL $8D7190          ; 22 90 71 8D | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $8002            ; 0D 02 80 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROL $02              ; 26 02 | Rotate left (zero page)
    BPL $96              ; 10 96 | Branch if positive
    REP #$51             ; C2 51 | Reset processor status bits
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    AND $0215            ; 2D 15 02 | Logical AND with accumulator (absolute)
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROL $02              ; 26 02 | Rotate left (zero page)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ORA $1002,Y          ; 19 02 10 | Logical OR with accumulator (absolute,Y)
    REP #$51             ; C2 51 | Reset processor status bits
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROL $02              ; 26 02 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0B1
; Address: $C49C76
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0B1:
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    BPL $96              ; 10 96 | Branch if positive
    REP #$51             ; C2 51 | Reset processor status bits
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BPL $96              ; 10 96 | Branch if positive
    REP #$51             ; C2 51 | Reset processor status bits
    STZ $7190,X          ; 9E 90 71 | Store zero to absolute,X
    STA $8A88            ; 8D 88 8A | Update graphics data
    AND $021D            ; 2D 1D 02 | Logical AND with accumulator (absolute)
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ORA $1002,Y          ; 19 02 10 | Logical OR with accumulator (absolute,Y)
    REP #$51             ; C2 51 | Reset processor status bits
    STZ $7190,X          ; 9E 90 71 | Store zero to absolute,X
    STA $8A88            ; 8D 88 8A | Update graphics data
    ORA $8001,X          ; 1D 01 80 | Logical OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    BPL $96              ; 10 96 | Branch if positive
    REP #$51             ; C2 51 | Reset processor status bits
    STZ $7190,X          ; 9E 90 71 | Store zero to absolute,X
    STA $8A88            ; 8D 88 8A | Update graphics data
    ORA $8002,X          ; 1D 02 80 | Logical OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ORA $1002,X          ; 1D 02 10 | Logical OR with accumulator (absolute,X)
    REP #$51             ; C2 51 | Reset processor status bits
    BIT $9095            ; 2C 95 90 | Test bits in accumulator (absolute)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ROL $024A            ; 2E 4A 02 | Rotate left (absolute)
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ASL $021F,X          ; 1E 1F 02 | Arithmetic shift left (absolute,X)
    BPL $96              ; 10 96 | Branch if positive
    REP #$51             ; C2 51 | Reset processor status bits
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0B2
; Address: $C49D20
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0B2:
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    BPL $96              ; 10 96 | Branch if positive
    REP #$51             ; C2 51 | Reset processor status bits
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    LSR                  ; 4A | Logical shift right (accumulator)
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    ORA $1002,X          ; 1D 02 10 | Logical OR with accumulator (absolute,X)
    REP #$51             ; C2 51 | Reset processor status bits
    AND $909E            ; 2D 9E 90 | Logical AND with accumulator (absolute)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    CLC                  ; 18 | Clear carry flag
    ROL $02FA            ; 2E FA 02 | Rotate left (absolute)
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $021F,X          ; 1E 1F 02 | Arithmetic shift left (absolute,X)
    BPL $96              ; 10 96 | Branch if positive
    REP #$51             ; C2 51 | Reset processor status bits
    STZ $7190,X          ; 9E 90 71 | Store zero to absolute,X
    STA $8A88            ; 8D 88 8A | Update graphics data
    CLC                  ; 18 | Clear carry flag
    PLX                  ; FA | Pull X register from stack
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    BPL $96              ; 10 96 | Branch if positive
    REP #$51             ; C2 51 | Reset processor status bits
    STZ $7190,X          ; 9E 90 71 | Store zero to absolute,X
    STA $8A88            ; 8D 88 8A | Update graphics data
    CLC                  ; 18 | Clear carry flag
    PLX                  ; FA | Pull X register from stack
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0B3
; Address: $C49D99
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0B3:
    JSL $BA0223          ; 22 23 02 BA | Jump to subroutine long
    REP #$51             ; C2 51 | Reset processor status bits
    ROL $8D71            ; 2E 71 8D | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0B4
; Address: $C49DA4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0B4:
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BMI $29              ; 30 29 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    PEA #$0400           ; F4 00 04 | Push effective address to stack
    EOR ($1E,X)          ; 41 1E | Exclusive OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0B5
; Address: $C49DB6
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0B5:
    JSL $910223          ; 22 23 02 91 | Jump to subroutine long
    REP #$51             ; C2 51 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    EOR ($02),Y          ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
    BRA $F8              ; 80 F8 | Branch always
    EOR ($1E,X)          ; 41 1E | Exclusive OR with accumulator ((zero page,X))
    BIT $0202            ; 2C 02 02 | Test bits in accumulator (absolute)
    BIT $25              ; 24 25 | Test bits in accumulator (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $3053            ; 0E 53 30 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    AND $0B02            ; 2D 02 0B | Logical AND with accumulator (absolute)
    AND ($98),Y          ; 31 98 | Logical AND with accumulator ((zero page),Y)
    REP #$51             ; C2 51 | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROL $0202            ; 2E 02 02 | Rotate left (absolute)
    ROL $27              ; 26 27 | Rotate left (zero page)
    LSR $C298            ; 4E 98 C2 | Logical shift right (absolute)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ORA $8F92,Y          ; 19 92 8F | Logical OR with accumulator (absolute,Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $305B            ; 0E 5B 30 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0B6
; Address: $C49E2F
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0B6:
    REP #$51             ; C2 51 | Reset processor status bits
    INC                  ; 1A | Increment accumulator
    STA ($93,X)          ; 81 93 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BVC $F8              ; 50 F8 | Branch if overflow clear
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BMI $02              ; 30 02 | Branch if negative
    STA $51C2            ; 8D C2 51 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BIT $0020            ; 2C 20 00 | Test bits in accumulator (absolute)
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND ($02),Y          ; 31 02 | Logical AND with accumulator ((zero page),Y)
    ORA ($2A,X)          ; 01 2A | Logical OR with accumulator ((zero page,X))
    STA $51C2,Y          ; 99 C2 51 | Update graphics data
    ASL $912D,X          ; 1E 2D 91 | Arithmetic shift left (absolute,X)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $406B            ; 0D 6B 40 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BIT $022D            ; 2C 2D 02 | Test bits in accumulator (absolute)
    STA $51C2,Y          ; 99 C2 51 | Update graphics data
    AND $7191            ; 2D 91 71 | Logical AND with accumulator (absolute)
    STA $8A88            ; 8D 88 8A | Update graphics data
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0B7
; Address: $C49E95
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0B7:
    BVC $F8              ; 50 F8 | Branch if overflow clear
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ROL $2302            ; 2E 02 23 | Rotate left (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0B8
; Address: $C49EA6
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0B8:
    JSR $90AA            ; 20 AA 90 | Jump to subroutine
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $8002            ; 0D 02 80 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$51             ; C2 51 | Reset processor status bits
    TAX                  ; AA | Transfer accumulator to X register
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0B9
; Address: $C49ECD
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0B9:
    ORA $8001            ; 0D 01 80 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BMI $02              ; 30 02 | Branch if negative
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$51             ; C2 51 | Reset processor status bits
    TAX                  ; AA | Transfer accumulator to X register
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    ORA $8002            ; 0D 02 80 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND ($02),Y          ; 31 02 | Logical AND with accumulator ((zero page),Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$51             ; C2 51 | Reset processor status bits
    AND ($AA,X)          ; 21 AA | Logical AND with accumulator ((zero page,X))
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$51             ; C2 51 | Reset processor status bits
    TAX                  ; AA | Transfer accumulator to X register
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$51             ; C2 51 | Reset processor status bits
    TAX                  ; AA | Transfer accumulator to X register
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$51             ; C2 51 | Reset processor status bits
    TAX                  ; AA | Transfer accumulator to X register
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ADC $9A              ; 65 9A | Add with carry (zero page)
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0BB
; Address: $C49F7D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0BB:
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$51             ; C2 51 | Reset processor status bits
    BMI $94              ; 30 94 | Branch if negative
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0BC
; Address: $C49F9A
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0BC:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$51             ; C2 51 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    AND ($02),Y          ; 31 02 | Logical AND with accumulator ((zero page),Y)
    BRA $78              ; 80 78 | Branch always
    STA ($0E,X)          ; 81 0E | Update graphics data
    SEC                  ; 38 | Set carry flag
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    LDX $C29B            ; AE 9B C2 | Load from absolute address into X register
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ROL $DC              ; 26 DC | Rotate left (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    BRA $F8              ; 80 F8 | Branch always
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    AND $0B02,Y          ; 39 02 0B | Logical AND with accumulator (absolute,Y)
    STZ $51C2            ; 9C C2 51 | Store zero to absolute
    PLP                  ; 28 | Pull processor status from stack
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $78              ; 80 78 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ORA $36              ; 05 36 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0BD
; Address: $C49FFD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0BD:
    JSL $51C29C          ; 22 9C C2 51 | Jump to subroutine long
    ORA $92DE,X          ; 1D DE 92 | Logical OR with accumulator (absolute,X)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    BRA $F8              ; 80 F8 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0BE
; Address: $C4A012
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0BE:
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    STZ $51C2            ; 9C C2 51 | Store zero to absolute
    BIT $71              ; 24 71 | Test bits in accumulator (zero page)
    STA $8D71            ; 8D 71 8D | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    INC                  ; 1A | Increment accumulator
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STZ $51C2            ; 9C C2 51 | Store zero to absolute
    AND $71              ; 25 71 | Logical AND with accumulator (zero page)
    STA $8D71            ; 8D 71 8D | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $8002,Y          ; 19 02 80 | Logical OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND $0402,X          ; 3D 02 04 | Logical AND with accumulator (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    STZ $51C2            ; 9C C2 51 | Store zero to absolute
    BMI $71              ; 30 71 | Branch if negative
    STA $8D71            ; 8D 71 8D | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    AND ($0D),Y          ; 31 0D | Logical AND with accumulator ((zero page),Y)
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROL $0402,X          ; 3E 02 04 | Rotate left (absolute,X)
    LDY $C29C,X          ; BC 9C C2 | Load from absolute,X into Y register
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    AND ($71),Y          ; 31 71 | Logical AND with accumulator ((zero page),Y)
    STA $8D71            ; 8D 71 8D | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $8002,Y          ; 19 02 80 | Logical OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $51C2            ; 8D C2 51 | Update graphics data
    LDA #$71             ; A9 71 | Read graphics status
    STA $8A88            ; 8D 88 8A | Update graphics data
    BVC $00              ; 50 00 | Branch if overflow clear
    BRA $F8              ; 80 F8 | Branch always
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $00C2            ; 8D C2 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0BF
; Address: $C4A0CE
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0BF:
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $00C2            ; 8D C2 00 | Update graphics data
    LDA ($A9,X)          ; A1 A9 | Read graphics status
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    STZ $00C2            ; 9C C2 00 | Store zero to absolute
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $18              ; 80 18 | Branch always
    STA $00C2,X          ; 9D C2 00 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$00             ; C2 00 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $9D              ; 66 9D | Rotate right (zero page)
    REP #$00             ; C2 00 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    STA $00C2,X          ; 9D C2 00 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA ($97),Y          ; 91 97 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0C0
; Address: $C4A195
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0C0:
    REP #$00             ; C2 00 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    EOR ($0E,X)          ; 41 0E | Exclusive OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    STA                  ; 9F C2 00 00 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $28              ; 80 28 | Branch always
    ASL $0023            ; 0E 23 00 | Arithmetic shift left (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    STA $00C2,X          ; 9D C2 00 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $00C2            ; 8D C2 00 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $00C2            ; 8D C2 00 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LDY $C29C,X          ; BC 9C C2 | Load from absolute,X into Y register
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$7B             ; C2 7B | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0C1
; Address: $C4A24D
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0C1:
    ORA $0200,Y          ; 19 00 02 | Logical OR with accumulator (absolute,Y)
    BRA $38              ; 80 38 | Branch always
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$7C             ; C2 7C | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    INC                  ; 1A | Increment accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$7D             ; C2 7D | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$7F             ; C2 7F | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$80             ; C2 80 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $0200,X          ; 1D 00 02 | Logical OR with accumulator (absolute,X)
    BRA $38              ; 80 38 | Branch always
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$81             ; C2 81 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $0200,X          ; 1E 00 02 | Arithmetic shift left (absolute,X)
    BRA $38              ; 80 38 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0C2
; Address: $C4A2E5
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0C2:
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STA $82C2,X          ; 9D C2 82 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BMI $38              ; 30 38 | Branch if negative
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    AND $0039,Y          ; 39 39 00 | Logical AND with accumulator (absolute,Y)
    REP #$83             ; C2 83 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BMI $38              ; 30 38 | Branch if negative
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    DEC $C29D,X          ; DE 9D C2 | Decrement (absolute,X)
    STY $00              ; 84 00 | Store Y register to zero page
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BPL $38              ; 10 38 | Branch if positive
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    STA $8EC2            ; 8D C2 8E | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    WDM #$3B             ; 42 3B | Reserved instruction
    STA $8EC2            ; 8D C2 8E | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    WDM #$3C             ; 42 3C | Reserved instruction
    STA $8EC2            ; 8D C2 8E | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0C3
; Address: $C4A391
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0C3:
    BRA $38              ; 80 38 | Branch always
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    WDM #$3D             ; 42 3D | Reserved instruction
    AND $A700,X          ; 3D 00 A7 | Logical AND with accumulator (absolute,X)
    STA $8EC2            ; 8D C2 8E | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    WDM #$3E             ; 42 3E | Reserved instruction
    ROL $A700,X          ; 3E 00 A7 | Rotate left (absolute,X)
    STA $8EC2            ; 8D C2 8E | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    WDM #$3F             ; 42 3F | Reserved instruction
    STA $8EC2            ; 8D C2 8E | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    STZ $85C2,X          ; 9E C2 85 | Store zero to absolute,X
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STZ $87C2,X          ; 9E C2 87 | Store zero to absolute,X
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA                  ; 9F C2 11 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0C4
; Address: $C4A434
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0C4:
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    STA $8DC2            ; 8D C2 8D | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA $41              ; 05 41 | Logical OR with accumulator (zero page)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    STA                  ; 9F C2 00 00 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $18              ; 80 18 | Branch always
    BPL $23              ; 10 23 | Branch if positive
    STA $05C2            ; 8D C2 05 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR $0100            ; 4E 00 01 | Logical shift right (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$07             ; C2 07 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$07             ; C2 07 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0C5
; Address: $C4A4C6
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0C5:
    STA $8D71,Y          ; 99 71 8D | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$07             ; C2 07 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $719B            ; ED 9B 71 | Subtract with carry (absolute)
    STA $8A88            ; 8D 88 8A | Update graphics data
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$07             ; C2 07 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA $71              ; A5 71 | Read graphics status
    STA $8A88            ; 8D 88 8A | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$07             ; C2 07 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$07             ; C2 07 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $A0              ; E5 A0 | Subtract with carry (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STZ $00              ; 64 00 | Store zero to zero page
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$07             ; C2 07 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($A3,X)          ; 41 A3 | Exclusive OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0C6
; Address: $C4A561
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0C6:
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $07C2,Y          ; 99 C2 07 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $7191            ; 2D 91 71 | Logical AND with accumulator (absolute)
    STA $8A88            ; 8D 88 8A | Update graphics data
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0C7
; Address: $C4A57E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0C7:
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR $C298            ; 4E 98 C2 | Logical shift right (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $888D71          ; 8F 71 8D 88 | Update graphics data
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    EOR $0500,Y          ; 59 00 05 | Exclusive OR with accumulator (absolute,Y)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0C8
; Address: $C4A5A7
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0C8:
    JSL $07C29C          ; 22 9C C2 07 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    EOR $0100,X          ; 5D 00 01 | Exclusive OR with accumulator (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$07             ; C2 07 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $94              ; 30 94 | Branch if negative
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($73,X)          ; 01 73 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LDA $0500            ; AD 00 05 | Read graphics status
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    BPL $96              ; 10 96 | Branch if positive
    REP #$08             ; C2 08 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0C9
; Address: $C4A5F6
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0C9:
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    CPY $C29F            ; CC 9F C2 | Compare Y register (absolute)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PEA #$0500           ; F4 00 05 | Push effective address to stack
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    DEC $C29D,X          ; DE 9D C2 | Decrement (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    BPL $96              ; 10 96 | Branch if positive
    REP #$08             ; C2 08 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F C2 06 01 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    SBC $0400,Y          ; F9 00 04 | Subtract with carry (absolute,Y)
    LDY #$C2             ; A0 C2 | Load immediate value into Y register
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0CB
; Address: $C4A683
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0CB:
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LDY #$C2             ; A0 C2 | Load immediate value into Y register
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LDY #$C2             ; A0 C2 | Load immediate value into Y register
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    LDA ($C2,X)          ; A1 C2 | Read graphics status
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    SBC $0400,X          ; FD 00 04 | Subtract with carry (absolute,X)
    LDA ($C2,X)          ; A1 C2 | Read graphics status
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CMP $A1              ; C5 A1 | Compare accumulator (zero page)
    REP #$06             ; C2 06 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0CC
; Address: $C4A70E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0CC:
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LDX #$C2             ; A2 C2 | Load immediate value into X register
    ORA $0001            ; 0D 01 00 | Logical OR with accumulator (absolute)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0CD
; Address: $C4A72C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0CD:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    INC $0400,X          ; FE 00 04 | Increment (absolute,X)
    BPL $96              ; 10 96 | Branch if positive
    REP #$06             ; C2 06 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0CE
; Address: $C4A743
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0CE:
    JSL $8D7190          ; 22 90 71 8D | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    STZ $06C2            ; 9C C2 06 | Store zero to absolute
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$09             ; C2 09 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    PLP                  ; 28 | Pull processor status from stack
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    BRA $30              ; 80 30 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0CF
; Address: $C4A795
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0CF:
    STA $0EC2            ; 8D C2 0E | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA ($97),Y          ; 91 97 | Update graphics data
    REP #$0F             ; C2 0F | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    EOR ($0E,X)          ; 41 0E | Exclusive OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    BIT $93              ; 24 93 | Test bits in accumulator (zero page)
    REP #$10             ; C2 10 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BIT $3880            ; 2C 80 38 | Test bits in accumulator (absolute)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    LDY $C29C,X          ; BC 9C C2 | Load from absolute,X into Y register
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    REP #$11             ; C2 11 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0D0
; Address: $C4A820
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0D0:
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    LDX #$C2             ; A2 C2 | Load immediate value into X register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX #$C2             ; A2 C2 | Load immediate value into X register
    EOR $0001            ; 4D 01 00 | Exclusive OR with accumulator (absolute)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$15             ; C2 15 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $94              ; 30 94 | Branch if negative
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($73,X)          ; 01 73 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $0201            ; 0D 01 02 | Logical OR with accumulator (absolute)
    REP #$13             ; C2 13 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $7191            ; 8D 91 71 | Update graphics data
    STA $8A88            ; 8D 88 8A | Update graphics data
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $0B01            ; 0E 01 0B | Arithmetic shift left (absolute)
    AND ($98),Y          ; 31 98 | Logical AND with accumulator ((zero page),Y)
    REP #$08             ; C2 08 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    STA $76C2            ; 8D C2 76 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0D1
; Address: $C4A8BA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0D1:
    ORA ($35,X)          ; 01 35 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0D2
; Address: $C4A8C5
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0D2:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    WDM #$02             ; 42 02 | Reserved instruction
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    PHP                  ; 08 | Push processor status to stack
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BMI $00              ; 30 00 | Branch if negative
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    EOR $02              ; 45 02 | Exclusive OR with accumulator (zero page)
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0D3
; Address: $C4A94F
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0D3:
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR $02              ; 46 02 | Logical shift right (zero page)
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($3B,X)          ; 01 3B | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    AND $003C,Y          ; 39 3C 00 | Logical AND with accumulator (absolute,Y)
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    DEC                  ; 3A | Decrement accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($45,X)          ; 01 45 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($47,X)          ; 01 47 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0D4
; Address: $C4A9E6
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0D4:
    AND $0000,X          ; 3D 00 00 | Logical AND with accumulator (absolute,X)
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    JMP $0002            ; 4C 02 00 | Jump to address
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    EOR $0002            ; 4D 02 00 | Exclusive OR with accumulator (absolute)
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR $0002            ; 4E 02 00 | Logical shift right (absolute)
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($42,X)          ; 01 42 | Hardware register operation
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    WDM #$00             ; 42 00 | Reserved instruction
    BRA $38              ; 80 38 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0D5
; Address: $C4AA7E
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0D5:
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BVC $02              ; 50 02 | Branch if overflow clear
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    PHP                  ; 08 | Push processor status to stack
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    EOR ($02),Y          ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    LSR $3C              ; 46 3C | Logical shift right (zero page)
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $76C2            ; 8D C2 76 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROL $C2A3,X          ; 3E A3 C2 | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0D6
; Address: $C4AB21
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0D6:
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROL $02              ; 26 02 | Rotate left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$51             ; C2 51 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $F8              ; 80 F8 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    INC $0100,X          ; FE 00 01 | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$06             ; C2 06 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0D7
; Address: $C4AB97
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0D7:
    BIT $0200            ; 2C 00 02 | Test bits in accumulator (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$7C             ; C2 7C | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    AND $0200            ; 2D 00 02 | Logical AND with accumulator (absolute)
    BRA $38              ; 80 38 | Branch always
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    INC $0000            ; EE 00 00 | Increment (absolute)
    STA $14C2            ; 8D C2 14 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    STA $07C2            ; 8D C2 07 | Update graphics data
    STA $8D71            ; 8D 71 8D | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    LDX $21FC,Y          ; BE FC 21 | PPU graphics register access
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    STA $07C2            ; 8D C2 07 | Update graphics data
    STA $8D71            ; 8D 71 8D | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    LDX $01FC,Y          ; BE FC 01 | Load from absolute,Y into X register
    ASL $0075            ; 0E 75 00 | Arithmetic shift left (absolute)
    BPL $96              ; 10 96 | Branch if positive
    REP #$07             ; C2 07 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCC $71              ; 90 71 | Branch if carry clear
    STA $8A88            ; 8D 88 8A | Update graphics data
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    REP #$07             ; C2 07 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0D8
; Address: $C4AC43
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0D8:
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BMI $38              ; 30 38 | Branch if negative
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $0200,X          ; 7E 00 02 | Rotate right (absolute,X)
    LSR $C298            ; 4E 98 C2 | Logical shift right (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $888D71          ; 8F 71 8D 88 | Update graphics data
    TXA                  ; 8A | Transfer X register to accumulator
    BMI $38              ; 30 38 | Branch if negative
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    REP #$07             ; C2 07 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($92,X)          ; 01 92 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    EOR ($0E,X)          ; 41 0E | Exclusive OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA                  ; 9F C2 91 00 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $92C2            ; 8D C2 92 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $93C2            ; 8D C2 93 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $94C2            ; 8D C2 94 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0D9
; Address: $C4ACF2
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0D9:
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA #$8D             ; A9 8D | Read graphics status
    REP #$95             ; C2 95 | Reset processor status bits
    STA $8D71            ; 8D 71 8D | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $98C2            ; 8D C2 98 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    REP #$99             ; C2 99 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$9B             ; C2 9B | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ROL $0000            ; 2E 00 00 | Rotate left (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $9EC2            ; 8D C2 9E | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $9FC2            ; 8D C2 9F | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0DA
; Address: $C4AD9B
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0DA:
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $A0C2            ; 8D C2 A0 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    JMP $A1C2A3          ; 5C A3 C2 A1 | Jump to address long
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR $46              ; 46 46 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    REP #$A2             ; C2 A2 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ADC ($A3),Y          ; 71 A3 | Add with carry ((zero page),Y)
    REP #$A6             ; C2 A6 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $A9C2            ; 8D C2 A9 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0DB
; Address: $C4AE3F
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0DB:
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    DEC $C29D,X          ; DE 9D C2 | Decrement (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $ABC2            ; 8D C2 AB | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $AEC2            ; 8D C2 AE | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $AFC2            ; 8D C2 AF | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $B0C2,X          ; 9D C2 B0 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $BDC2            ; 8D C2 BD | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $BFC2,X          ; 9D C2 BF | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0DC
; Address: $C4AEFC
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0DC:
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    STA                  ; 9F C2 BF 00 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $18              ; 80 18 | Branch always
    STA $C7C2            ; 8D C2 C7 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $CAC2,X          ; 9D C2 CA | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $CFC2            ; 8D C2 CF | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $D1C2,X          ; 9D C2 D1 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    EOR $45              ; 45 45 | Exclusive OR with accumulator (zero page)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    STA $D5C2,X          ; 9D C2 D5 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0DD
; Address: $C4AFB1
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0DD:
    SEC                  ; 38 | Set carry flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR $46              ; 46 46 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    REP #$D9             ; C2 D9 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR $46              ; 46 46 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDY $C2A3            ; AC A3 C2 | Load from absolute address into Y register
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $DFC2            ; 8D C2 DF | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    STA                  ; 9F C2 E0 00 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $18              ; 80 18 | Branch always
    ADC $9A              ; 65 9A | Add with carry (zero page)
    REP #$E4             ; C2 E4 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    REP #$E4             ; C2 E4 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0DE
; Address: $C4B058
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0DE:
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    EOR $45              ; 45 45 | Exclusive OR with accumulator (zero page)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    STA $E8C2,X          ; 9D C2 E8 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR $46              ; 46 46 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    STZ $EEC2            ; 9C C2 EE | Store zero to absolute
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR $46              ; 46 46 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    STA $EEC2,Y          ; 99 C2 EE | Update graphics data
    AND $7191            ; 2D 91 71 | Logical AND with accumulator (absolute)
    STA $8A88            ; 8D 88 8A | Update graphics data
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$F3             ; C2 F3 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LSR $46              ; 46 46 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDA #$8D             ; A9 8D | Read graphics status
    REP #$F6             ; C2 F6 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0DF
; Address: $C4B0F7
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0DF:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $F6C2,X          ; 9D C2 F6 | Update graphics data
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA #$8D             ; A9 8D | Read graphics status
    REP #$FC             ; C2 FC | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $00C2            ; 8D C2 00 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$01             ; C2 01 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $96              ; 26 96 | Rotate left (zero page)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BPL $96              ; 10 96 | Branch if positive
    REP #$02             ; C2 02 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0E0
; Address: $C4B186
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0E0:
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    STA $16C2            ; 8D C2 16 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    STA $17C2            ; 8D C2 17 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    STA $17C2            ; 8D C2 17 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $17C2            ; 8D C2 17 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $1AC2            ; 8D C2 1A | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $1AC2            ; 8D C2 1A | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0E1
; Address: $C4B232
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0E1:
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LDA #$00             ; A9 00 | Read graphics status
    STA $1AC2            ; 8D C2 1A | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LDY $0000,X          ; BC 00 00 | Load from absolute,X into Y register
    STA $1BC2            ; 8D C2 1B | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    STA $1CC2            ; 8D C2 1C | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    INC $00              ; E6 00 | Increment (zero page)
    STA $1DC2            ; 8D C2 1D | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    STA $1EC2            ; 8D C2 1E | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $1FC2            ; 8D C2 1F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0E2
; Address: $C4B2D5
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0E2:
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $20C2            ; 8D C2 20 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    SBC $0000            ; ED 00 00 | Subtract with carry (absolute)
    STA $21C2            ; 8D C2 21 | PPU graphics register access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $22C2            ; 8D C2 22 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    STA $23C2            ; 8D C2 23 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $24C2            ; 8D C2 24 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $25C2            ; 8D C2 25 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0E3
; Address: $C4B383
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0E3:
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $26C2            ; 8D C2 26 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $27C2            ; 8D C2 27 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $28C2            ; 8D C2 28 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $29C2            ; 8D C2 29 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BPL $01              ; 10 01 | Branch if positive
    STA $2AC2            ; 8D C2 2A | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0E4
; Address: $C4B421
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0E4:
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    STA $2AC2            ; 8D C2 2A | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $2AC2            ; 8D C2 2A | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $2AC2            ; 8D C2 2A | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $2AC2            ; 8D C2 2A | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $2AC2            ; 8D C2 2A | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    REP #$2B             ; C2 2B | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0E5
; Address: $C4B4C0
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0E5:
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    REP #$2B             ; C2 2B | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $2DC2            ; 8D C2 2D | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $0001,Y          ; 19 01 00 | Logical OR with accumulator (absolute,Y)
    STA $2EC2            ; 8D C2 2E | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $0001,X          ; 1D 01 00 | Logical OR with accumulator (absolute,X)
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0E6
; Address: $C4B551
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0E6:
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $0001,X          ; 1E 01 00 | Arithmetic shift left (absolute,X)
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0E7
; Address: $C4B59A
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0E7:
    JSR $0001            ; 20 01 00 | Jump to subroutine
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0E8
; Address: $C4B5D4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0E8:
    JSL $000001          ; 22 01 00 00 | Jump to subroutine long
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0E9
; Address: $C4B5E2
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0E9:
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND $01              ; 25 01 | Logical AND with accumulator (zero page)
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROL $01              ; 26 01 | Rotate left (zero page)
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0EA
; Address: $C4B673
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0EA:
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    STA $2FC2            ; 8D C2 2F | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $30C2            ; 8D C2 30 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$89             ; C2 89 | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BMI $00              ; 30 00 | Branch if negative
    BRA $38              ; 80 38 | Branch always
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    REP #$8A             ; C2 8A | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0EB
; Address: $C4B702
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0EB:
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $8003            ; 0D 03 80 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$8B             ; C2 8B | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    LDA #$8D             ; A9 8D | Read graphics status
    REP #$8C             ; C2 8C | Reset processor status bits
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $8E              ; 66 8E | Rotate right (zero page)
    REP #$06             ; C2 06 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $38              ; 80 38 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $3A00,X          ; 1D 00 3A | Logical OR with accumulator (absolute,X)
    STA ($00),Y          ; 91 00 | Update graphics data
    LDX $CB00            ; AE 00 CB | Load from absolute address into X register
    INX                  ; E8 | Increment X register
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0EC
; Address: $C4B77E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0EC:
    JSL $013F01          ; 22 01 3F 01 | Jump to subroutine long
    JMP $017901          ; 5C 01 79 01 | Jump to address long
    ORA ($B3,X)          ; 01 B3 | Logical OR with accumulator ((zero page,X))
    ORA ($D0,X)          ; 01 D0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0ED
; Address: $C4B78B
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0ED:
    ORA ($ED,X)          ; 01 ED | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ADC ($02,X)          ; 61 02 | Add with carry ((zero page,X))
    ROR $9B02,X          ; 7E 02 9B | Rotate right (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    BIT $4903            ; 2C 03 49 | Test bits in accumulator (absolute)
    ROR $03              ; 66 03 | Rotate right (zero page)
    LDY #$03             ; A0 03 | Load immediate value into Y register
    LDA $DA03,X          ; BD 03 DA | Read graphics status
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    LSR $6B04            ; 4E 04 6B | Logical shift right (absolute)
    DEY                  ; 88 | Decrement Y register
    LDA $04              ; A5 04 | Read graphics status
    REP #$04             ; C2 04 | Reset processor status bits
    ORA $3605,Y          ; 19 05 36 | Logical OR with accumulator (absolute,Y)
    ORA $53              ; 05 53 | Logical OR with accumulator (zero page)
    ORA $70              ; 05 70 | Logical OR with accumulator (zero page)
    ORA $8D              ; 05 8D | Logical OR with accumulator (zero page)
    ORA $AA              ; 05 AA | Logical OR with accumulator (zero page)
    ORA $C7              ; 05 C7 | Logical OR with accumulator (zero page)
    ORA $E4              ; 05 E4 | Logical OR with accumulator (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ASL $3B              ; 06 3B | Arithmetic shift left (zero page)
    ASL $58              ; 06 58 | Arithmetic shift left (zero page)
    ASL $75              ; 06 75 | Arithmetic shift left (zero page)
    ASL $92              ; 06 92 | Arithmetic shift left (zero page)
    ASL $AF              ; 06 AF | Arithmetic shift left (zero page)
    ASL $CC              ; 06 CC | Arithmetic shift left (zero page)
    ASL $E9              ; 06 E9 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    EOR $7A07,X          ; 5D 07 7A | Exclusive OR with accumulator (absolute,X)
    CMP ($07),Y          ; D1 07 | Compare accumulator ((zero page),Y)
    INC $0B07            ; EE 07 0B | Increment (absolute)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    EOR $08              ; 45 08 | Exclusive OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STZ $B908            ; 9C 08 B9 | Store zero to absolute
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $09              ; 10 09 | Branch if positive
    AND $4A09            ; 2D 09 4A | Logical AND with accumulator (absolute)
    ORA #$67             ; 09 67 | Logical OR with accumulator (immediate)
    ORA #$84             ; 09 84 | Logical OR with accumulator (immediate)
    ORA #$A1             ; 09 A1 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0EE
; Address: $C4B815
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0EE:
    ORA #$BE             ; 09 BE | Logical OR with accumulator (immediate)
    ORA #$DB             ; 09 DB | Logical OR with accumulator (immediate)
    ORA #$F8             ; 09 F8 | Logical OR with accumulator (immediate)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP ($890A)          ; 6C 0A 89 | Jump to address (absolute indirect)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX $0A              ; A6 0A | Load from zero page into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX #$0A             ; E0 0A | Compare X register (immediate)
    SBC $1A0A,X          ; FD 0A 1A | Subtract with carry (absolute,X)
    ADC ($0B),Y          ; 71 0B | Add with carry ((zero page),Y)
    STX $AB0B            ; 8E 0B AB | Store X register to absolute address
    INY                  ; C8 | Increment Y register
    SBC $0B              ; E5 0B | Subtract with carry (zero page)
    EOR $760C,Y          ; 59 0C 76 | Exclusive OR with accumulator (absolute,Y)
    BCS $0C              ; B0 0C | Branch if carry set
    CMP $EA0C            ; CD 0C EA | Compare accumulator (absolute)
    ORA $0D24            ; 0D 24 0D | Logical OR with accumulator (absolute)
    EOR ($0D,X)          ; 41 0D | Exclusive OR with accumulator ((zero page,X))
    LSR $7B0D,X          ; 5E 0D 7B | Logical shift right (absolute,X)
    ORA $0D98            ; 0D 98 0D | Logical OR with accumulator (absolute)
    ORA $0DD2            ; 0D D2 0D | Logical OR with accumulator (absolute)
    ORA $0E0C            ; 0D 0C 0E | Logical OR with accumulator (absolute)
    AND #$0E             ; 29 0E | Logical AND with accumulator (immediate)
    LSR $0E              ; 46 0E | Logical shift right (zero page)
    ASL $0E80            ; 0E 80 0E | Arithmetic shift left (absolute)
    STA $BA0E,X          ; 9D 0E BA | Update graphics data
    ASL $0ED7            ; 0E D7 0E | Arithmetic shift left (absolute)
    PEA #$110E           ; F4 0E 11 | Push effective address to stack
    ROL $4B0F            ; 2E 0F 4B | Rotate left (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    STA $0F              ; 85 0F | Update graphics data
    LDX #$0F             ; A2 0F | Load immediate value into X register
    LDA                  ; BF 0F DC 0F | Read graphics status
    SBC $160F,Y          ; F9 0F 16 | Subtract with carry (absolute,Y)
    BPL $33              ; 10 33 | Branch if positive
    BPL $50              ; 10 50 | Branch if positive
    BPL $6D              ; 10 6D | Branch if positive
    BPL $8A              ; 10 8A | Branch if positive
    BPL $A7              ; 10 A7 | Branch if positive
    BPL $C4              ; 10 C4 | Branch if positive
    BPL $E1              ; 10 E1 | Branch if positive
    BPL $FE              ; 10 FE | Branch if positive
    BPL $1B              ; 10 1B | Branch if positive
    ORA ($38),Y          ; 11 38 | Logical OR with accumulator ((zero page),Y)
    ORA ($55),Y          ; 11 55 | Logical OR with accumulator ((zero page),Y)
    ORA ($72),Y          ; 11 72 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0EF
; Address: $C4B89F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0EF:
    ORA ($8F),Y          ; 11 8F | Logical OR with accumulator ((zero page),Y)
    ORA ($AC),Y          ; 11 AC | Logical OR with accumulator ((zero page),Y)
    ORA ($C9),Y          ; 11 C9 | Logical OR with accumulator ((zero page),Y)
    ORA ($E6),Y          ; 11 E6 | Logical OR with accumulator ((zero page),Y)
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0F0
; Address: $C4B8AA
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0F0:
    JSR $3D12            ; 20 12 3D | Jump to subroutine
    PHY                  ; 5A | Push Y register to stack
    LDA ($12),Y          ; B1 12 | Read graphics status
    DEC $EB12            ; CE 12 EB | Decrement (absolute)
    PHP                  ; 08 | Push processor status to stack
    AND $13              ; 25 13 | Logical AND with accumulator (zero page)
    WDM #$13             ; 42 13 | Reserved instruction
    STA $B613,Y          ; 99 13 B6 | Update graphics data
    BEQ $13              ; F0 13 | Branch if equal
    ORA $2A14            ; 0D 14 2A | Logical OR with accumulator (absolute)
    STZ $14              ; 64 14 | Store zero to zero page
    STA ($14,X)          ; 81 14 | Update graphics data
    STZ $BB14,X          ; 9E 14 BB | Store zero to absolute,X
    CLD                  ; D8 | Clear decimal mode flag
    JMP $6915            ; 4C 15 69 | Jump to address
    STX $15              ; 86 15 | Store X register to zero page
    CPY #$15             ; C0 15 | Compare Y register (immediate)
    CMP $FA15,X          ; DD 15 FA | Compare accumulator (absolute,X)
    EOR ($16),Y          ; 51 16 | Exclusive OR with accumulator ((zero page),Y)
    ROR $8B16            ; 6E 16 8B | Rotate right (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP $16              ; C5 16 | Compare accumulator (zero page)
    SEP #$16             ; E2 16 | Set processor status bits
    AND $5617,Y          ; 39 17 56 | Logical AND with accumulator (absolute,Y)
    BCC $17              ; 90 17 | Branch if carry clear
    LDA $CA17            ; AD 17 CA | Read graphics status
    CLC                  ; 18 | Clear carry flag
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    ROL $5B18,X          ; 3E 18 5B | Rotate left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPX $0918            ; EC 18 09 | Compare X register (absolute)
    ORA $1926,Y          ; 19 26 19 | Logical OR with accumulator (absolute,Y)
    ORA $1960,Y          ; 19 60 19 | Logical OR with accumulator (absolute,Y)
    ADC $9A19,X          ; 7D 19 9A | Add with carry (absolute,X)
    ORA $19B7,Y          ; 19 B7 19 | Logical OR with accumulator (absolute,Y)
    ORA $19F1,Y          ; 19 F1 19 | Logical OR with accumulator (absolute,Y)
    ASL $2B1A            ; 0E 1A 2B | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    PHA                  ; 48 | Push accumulator to stack
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0F1
; Address: $C4B93C
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0F1:
    ADC $1A              ; 65 1A | Add with carry (zero page)
    INC                  ; 1A | Increment accumulator
    STA                  ; 9F 1A BC 1A | Update graphics data
    CMP $F61A,Y          ; D9 1A F6 | Compare accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    BMI $1B              ; 30 1B | Branch if negative
    EOR $6A1B            ; 4D 1B 6A | Exclusive OR with accumulator (absolute)
    LDY $1B              ; A4 1B | Load from zero page into Y register
    CMP ($1B,X)          ; C1 1B | Compare accumulator ((zero page,X))
    DEC $FB1B,X          ; DE 1B FB | Decrement (absolute,X)
    CLC                  ; 18 | Clear carry flag
    STY $A91C            ; 8C 1C A9 | Store Y register to absolute address
    DEC $1C              ; C6 1C | Decrement (zero page)
    ORA $1D1D,X          ; 1D 1D 1D | Logical OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ORA $1D57,X          ; 1D 57 1D | Logical OR with accumulator (absolute,X)
    ORA $1D91,X          ; 1D 91 1D | Logical OR with accumulator (absolute,X)
    LDX $CB1D            ; AE 1D CB | Load from absolute address into X register
    ORA $1DE8,X          ; 1D E8 1D | Logical OR with accumulator (absolute,X)
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0F2
; Address: $C4B97E
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0F2:
    JSL $1E3F1E          ; 22 1E 3F 1E | Jump to subroutine long
    JMP $1E791E          ; 5C 1E 79 1E | Jump to address long
    ASL $1EB3,X          ; 1E B3 1E | Arithmetic shift left (absolute,X)
    BNE $1E              ; D0 1E | Branch if not equal
    SBC $231E            ; ED 1E 23 | Subtract with carry (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $5602,Y          ; 59 02 56 | Exclusive OR with accumulator (absolute,Y)
    PHY                  ; 5A | Push Y register to stack
    JMP $025A02          ; 5C 02 5A 02 | Jump to address long
    PHY                  ; 5A | Push Y register to stack
    LSR $5D02,X          ; 5E 02 5D | Logical shift right (absolute,X)
    ADC ($02,X)          ; 61 02 | Add with carry ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    ADC #$02             ; 69 02 | Add with carry (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0F3
; Address: $C4B9DA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0F3:
    JMP ($7202)          ; 6C 02 72 | Jump to address (absolute indirect)
    STZ $02              ; 64 02 | Store zero to zero page
    PHY                  ; 5A | Push Y register to stack
    STZ $02              ; 64 02 | Store zero to zero page
    ADC $02              ; 65 02 | Add with carry (zero page)
    STZ $02              ; 64 02 | Store zero to zero page
    PHY                  ; 5A | Push Y register to stack
    ROR $02              ; 66 02 | Rotate right (zero page)
    ADC $2302            ; 6D 02 23 | Add with carry (absolute)
    ADC $02              ; 65 02 | Add with carry (zero page)
    ADC #$02             ; 69 02 | Add with carry (immediate)
    ADC $6302            ; 6D 02 63 | Add with carry (absolute)
    ROR $2302            ; 6E 02 23 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0F4
; Address: $C4BA06
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0F4:
    PHY                  ; 5A | Push Y register to stack
    ROR $2302            ; 6E 02 23 | Rotate right (absolute)
    ADC ($02),Y          ; 71 02 | Add with carry ((zero page),Y)
    BVS $02              ; 70 02 | Branch if overflow set
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    SEI                  ; 78 | Set interrupt disable flag
    ADC $2302,Y          ; 79 02 23 | Add with carry (absolute,Y)
    ADC $7E02,X          ; 7D 02 7E | Add with carry (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    ADC $7E02,X          ; 7D 02 7E | Add with carry (absolute,X)
    STA ($02,X)          ; 81 02 | Update graphics data
    ROR $8202,X          ; 7E 02 82 | Rotate right (absolute,X)
    ROR $8202,X          ; 7E 02 82 | Rotate right (absolute,X)
    STY $02              ; 84 02 | Store Y register to zero page
    STA $02              ; 85 02 | Update graphics data
    STX $02              ; 86 02 | Store X register to zero page
    STA ($02,X)          ; 81 02 | Update graphics data
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    PHB                  ; 8B | Push data bank register to stack
    DEY                  ; 88 | Decrement Y register
    STA ($02,X)          ; 81 02 | Update graphics data
    DEY                  ; 88 | Decrement Y register
    BIT #$02             ; 89 02 | Test bits in accumulator (immediate)
    STA ($02,X)          ; 81 02 | Update graphics data
    STA $8C02            ; 8D 02 8C | Update graphics data
    STA ($02,X)          ; 81 02 | Update graphics data
    STA $8E02            ; 8D 02 8E | Update graphics data
    STA ($02,X)          ; 81 02 | Update graphics data
    STA $8F02            ; 8D 02 8F | Update graphics data
    STA $8E02            ; 8D 02 8E | Update graphics data
    STA $8F02            ; 8D 02 8F | Update graphics data
    STA ($02,X)          ; 81 02 | Update graphics data
    STA ($02,X)          ; 81 02 | Update graphics data
    PLY                  ; 7A | Pull Y register from stack
    STA ($02),Y          ; 91 02 | Update graphics data
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0F5
; Address: $C4BAC0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0F5:
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $9A02,Y          ; 99 02 9A | Update graphics data
    LDY #$02             ; A0 02 | Load immediate value into Y register
    LDA ($02,X)          ; A1 02 | Read graphics status
    LDX #$02             ; A2 02 | Load immediate value into X register
    LDY $02              ; A4 02 | Load from zero page into Y register
    LDA $02              ; A5 02 | Read graphics status
    LDX $02              ; A6 02 | Load from zero page into X register
    STZ $9D02            ; 9C 02 9D | Store zero to absolute
    STZ $9F02,X          ; 9E 02 9F | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0F6
; Address: $C4BAE4
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0F6:
    DEC $02              ; C6 02 | Decrement (zero page)
    INY                  ; C8 | Increment Y register
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    DEX                  ; CA | Decrement X register
    CPY $2302            ; CC 02 23 | Compare Y register (absolute)
    LDA #$02             ; A9 02 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    PLB                  ; AB | Pull data bank register from stack
    LDY $AD02            ; AC 02 AD | Load from absolute address into Y register
    LDX $B002            ; AE 02 B0 | Load from absolute address into X register
    LDA $02AE02          ; AF 02 AE 02 | Read graphics status
    BCS $02              ; B0 02 | Branch if carry set
    LDA ($02),Y          ; B1 02 | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    LDA $BA02,Y          ; B9 02 BA | Read graphics status
    LDY $2302,X          ; BC 02 23 | Load from absolute,X into Y register
    LDA $C102,X          ; BD 02 C1 | Read graphics status
    LDA $7C02,X          ; BD 02 7C | Read graphics status
    LDA $C202,X          ; BD 02 C2 | Read graphics status
    LDA                  ; BF 02 23 00 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    BNE $C0              ; D0 C0 | Branch if not equal
    LSR $D0              ; 46 D0 | Logical shift right (zero page)
    LDY #$85             ; A0 85 | Load immediate value into Y register
    LDY #$70             ; A0 70 | Load immediate value into Y register
    STA ($0C,X)          ; 81 0C | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0F7
; Address: $C4BB57
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0F7:
    JSR $2810            ; 20 10 28 | Jump to subroutine
    BRA $81              ; 80 81 | Branch always
    ASL $A058,X          ; 1E 58 A0 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0F8
; Address: $C4BB64
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0F8:
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BPL $40              ; 10 40 | Branch if positive
    BRA $01              ; 80 01 | Branch always
    ASL $34              ; 06 34 | Arithmetic shift left (zero page)
    BNE $40              ; D0 40 | Branch if not equal
    ORA ($78),Y          ; 11 78 | Logical OR with accumulator ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $3040,Y          ; 19 40 30 | Logical OR with accumulator (absolute,Y)
    ASL $2A              ; 06 2A | Arithmetic shift left (zero page)
    BRA $A0              ; 80 A0 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BEQ $00              ; F0 00 | Branch if equal
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $08              ; 10 08 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BRA $81              ; 80 81 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0F9
; Address: $C4BB8F
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0F9:
    ORA $7038,Y          ; 19 38 70 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    BRA $87              ; 80 87 | Branch always
    LSR $18              ; 46 18 | Logical shift right (zero page)
    LDA ($85,X)          ; A1 85 | Read graphics status
    LDA $4E12BC          ; AF BC 12 4E | Read graphics status
    SEC                  ; 38 | Set carry flag
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    ASL $7078,X          ; 1E 78 70 | Arithmetic shift left (absolute,X)
    REP #$09             ; C2 09 | Reset processor status bits
    BIT $85E1            ; 2C E1 85 | Test bits in accumulator (absolute)
    BIT $85E1            ; 2C E1 85 | Test bits in accumulator (absolute)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    ASL $8078,X          ; 1E 78 80 | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $40              ; 50 40 | Branch if overflow clear
    EOR ($06,X)          ; 41 06 | Exclusive OR with accumulator ((zero page,X))
    ORA $2409,Y          ; 19 09 24 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    ASL $9064            ; 0E 64 90 | Arithmetic shift left (absolute)
    LDA ($C8),Y          ; B1 C8 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0FA
; Address: $C4BBDE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0FA:
    JSL $A01405          ; 22 05 14 A0 | Jump to subroutine long
    BRA $02              ; 80 02 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0FB
; Address: $C4BBE6
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0FB:
    JSR $0882            ; 20 82 08 | Jump to subroutine
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BMI $C0              ; 30 C0 | Branch if negative
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BMI $C0              ; 30 C0 | Branch if negative
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BMI $C0              ; 30 C0 | Branch if negative
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BMI $C0              ; 30 C0 | Branch if negative
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BMI $C0              ; 30 C0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BVC $40              ; 50 40 | Branch if overflow clear
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BMI $C0              ; 30 C0 | Branch if negative
    BPL $42              ; 10 42 | Hardware register operation
    PHP                  ; 08 | Push processor status to stack
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0FC
; Address: $C4BC13
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0FC:
    RTI                  ; 40 | Return from interrupt
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    BNE $42              ; D0 42 | Hardware register operation
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY $13              ; C4 13 | Compare Y register (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BEQ $C0              ; F0 C0 | Branch if equal
    TAX                  ; AA | Transfer accumulator to X register
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0FD
; Address: $C4BC33
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0FD:
    PHP                  ; 08 | Push processor status to stack
    STY $A230            ; 8C 30 A2 | Store Y register to absolute address
    TXA                  ; 8A | Transfer X register to accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    WDM #$0B             ; 42 0B | Reserved instruction
    AND $0000            ; 2D 00 00 | Logical AND with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1E00,Y          ; 19 00 1E | Logical OR with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    AND $3200            ; 2D 00 32 | Logical AND with accumulator (absolute)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LSR $00              ; 46 00 | Logical shift right (zero page)
    BVC $00              ; 50 00 | Branch if overflow clear
    PHY                  ; 5A | Push Y register to stack
    STZ $00              ; 64 00 | Store zero to zero page
    ADC #$00             ; 69 00 | Add with carry (immediate)
    ROR $7300            ; 6E 00 73 | Rotate right (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ADC $8200,X          ; 7D 00 82 | Add with carry (absolute,X)
    STY $9100            ; 8C 00 91 | Store Y register to absolute address
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $00              ; A5 00 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    LDA $00B400          ; AF 00 B4 00 | Read graphics status
    LDA $BE00,Y          ; B9 00 BE | Read graphics status
    INY                  ; C8 | Increment Y register
    CMP $D200            ; CD 00 D2 | Compare accumulator (absolute)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    INC $00              ; E6 00 | Increment (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BEQ $00              ; F0 00 | Branch if equal
    EOR $6300,X          ; 5D 00 63 | Exclusive OR with accumulator (absolute,X)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0FE
; Address: $C4BCB4
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0FE:
    ORA ($45,X)          ; 01 45 | Logical OR with accumulator ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    EOR #$AB             ; 49 AB | Exclusive OR with accumulator (immediate)
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($4B,X)          ; 01 4B | Logical OR with accumulator ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    BRA $28              ; 80 28 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    ASL $84              ; 06 84 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    EOR $01C0,Y          ; 59 C0 01 | Exclusive OR with accumulator (absolute,Y)
    PHY                  ; 5A | Push Y register to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    ASL $5E              ; 06 5E | Arithmetic shift left (zero page)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    ADC $01C0            ; 6D C0 01 | Add with carry (absolute)
    ROR $06C0            ; 6E C0 06 | Rotate right (absolute)
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7F7F           ; F4 7F 7F | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$80             ; A9 80 | Read graphics status
    STA $E5C0            ; 8D C0 E5 | Update graphics data
    STZ $18              ; 64 18 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_0FF
; Address: $C4BCF3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_0FF:
    JSR $3F0E            ; 20 0E 3F | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_100
; Address: $C4BCFE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_100:
    LDX #$08             ; A2 08 | Load immediate value into X register
    STX $18              ; 86 18 | Store X register to zero page
    LDA $E2D2,X          ; BD D2 E2 | Read graphics status
    BEQ $0E              ; F0 0E | Branch if equal
    LDA $E39E,X          ; BD 9E E3 | Read graphics status
    ORA $E3A8,X          ; 1D A8 E3 | Logical OR with accumulator (absolute,X)
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_103
; Address: $C4BD16
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_103:
    LDX $18              ; A6 18 | Load from zero page into X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $E5              ; 10 E5 | Branch if positive
    LDA $E2D2            ; AD D2 E2 | Read graphics status
    BEQ $2B              ; F0 2B | Branch if equal
    LDA $E31E            ; AD 1E E3 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $7E7F9C          ; 8F 9C 7F 7E | Update graphics data
    CLC                  ; 18 | Clear carry flag
    ADC #$80             ; 69 80 | Add with carry (immediate)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $7E7FB6          ; 8F B6 7F 7E | Update graphics data
    LDA $E328            ; AD 28 E3 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    STA $7E7FA4          ; 8F A4 7F 7E | Update graphics data
    CLC                  ; 18 | Clear carry flag
    ADC #$80             ; 69 80 | Add with carry (immediate)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $7E7FB8          ; 8F B8 7F 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_105
; Address: $C4BD51
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_105:
    LDA $E39E,X          ; BD 9E E3 | Read graphics status
    BEQ $3B              ; F0 3B | Branch if equal
    BMI $18              ; 30 18 | Branch if negative
    LDA $E332,X          ; BD 32 E3 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $E39E,X          ; 7D 9E E3 | Add with carry (absolute,X)
    STA $E332,X          ; 9D 32 E3 | Update graphics data
    XBA                  ; EB | Exchange accumulator bytes
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $26              ; F0 26 | Branch if equal
    STA $1C              ; 85 1C | Update graphics data
    JMP $3E59            ; 4C 59 3E | Jump to address
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    STA $1C              ; 85 1C | Update graphics data
    LDA $E332,X          ; BD 32 E3 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    STA $E332,X          ; 9D 32 E3 | Update graphics data
    XBA                  ; EB | Exchange accumulator bytes
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    STA $1C              ; 85 1C | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_107
; Address: $C4BD92
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_107:
    LDA $E3A8,X          ; BD A8 E3 | Read graphics status
    BEQ $3B              ; F0 3B | Branch if equal
    BMI $18              ; 30 18 | Branch if negative
    LDA $E332,X          ; BD 32 E3 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $E3A8,X          ; 7D A8 E3 | Add with carry (absolute,X)
    STA $E332,X          ; 9D 32 E3 | Update graphics data
    XBA                  ; EB | Exchange accumulator bytes
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $26              ; F0 26 | Branch if equal
    STA $1C              ; 85 1C | Update graphics data
    JMP $3E16            ; 4C 16 3E | Jump to address
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    STA $1C              ; 85 1C | Update graphics data
    LDA $E332,X          ; BD 32 E3 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    STA $E332,X          ; 9D 32 E3 | Update graphics data
    XBA                  ; EB | Exchange accumulator bytes
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    STA $1C              ; 85 1C | Update graphics data
    JMP $3DD3            ; 4C D3 3D | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_108
; Address: $C4BDD3
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_108:
    LDA $E33C            ; AD 3C E3 | Read graphics status
    BNE $3D              ; D0 3D | Branch if not equal
    LDA $E376,X          ; BD 76 E3 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    SEC                  ; 38 | Set carry flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $E376,X          ; 9D 76 E3 | Update graphics data
    SEC                  ; 38 | Set carry flag
    SBC #$80             ; E9 80 | Subtract with carry (immediate)
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_109
; Address: $C4BDFC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_109:
    PHP                  ; 08 | Push processor status to stack
    STA $16              ; 85 16 | Update graphics data
    LDA $E328,X          ; BD 28 E3 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    STA $E328,X          ; 9D 28 E3 | Update graphics data
    SEC                  ; 38 | Set carry flag
    SBC #$80             ; E9 80 | Subtract with carry (immediate)
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_10C
; Address: $C4BE16
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_10C:
    LDA $E340            ; AD 40 E3 | Read graphics status
    BNE $3D              ; D0 3D | Branch if not equal
    LDA $E376,X          ; BD 76 E3 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $1C              ; 65 1C | Add with carry (zero page)
    SEC                  ; 38 | Set carry flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $E376,X          ; 9D 76 E3 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    ADC $E3B8            ; 6D B8 E3 | Add with carry (absolute)
    SEC                  ; 38 | Set carry flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $16              ; 85 16 | Update graphics data
    LDA $E328,X          ; BD 28 E3 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $1C              ; 65 1C | Add with carry (zero page)
    STA $E328,X          ; 9D 28 E3 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    ADC $E3B8            ; 6D B8 E3 | Add with carry (absolute)
    STA $E362,X          ; 9D 62 E3 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_10F
; Address: $C4BE59
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_10F:
    LDA $E33E            ; AD 3E E3 | Read graphics status
    BNE $3D              ; D0 3D | Branch if not equal
    LDA $E36C,X          ; BD 6C E3 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $1C              ; 65 1C | Add with carry (zero page)
    SEC                  ; 38 | Set carry flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_110
; Address: $C4BE67
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_110:
    PHP                  ; 08 | Push processor status to stack
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $E36C,X          ; 9D 6C E3 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    ADC $E3B6            ; 6D B6 E3 | Add with carry (absolute)
    SEC                  ; 38 | Set carry flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $14              ; 85 14 | Update graphics data
    LDA $E31E,X          ; BD 1E E3 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $1C              ; 65 1C | Add with carry (zero page)
    STA $E31E,X          ; 9D 1E E3 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    ADC $E3B6            ; 6D B6 E3 | Add with carry (absolute)
    STA $E358,X          ; 9D 58 E3 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_113
; Address: $C4BE9C
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_113:
    LDA $E342            ; AD 42 E3 | Read graphics status
    BNE $3F              ; D0 3F | Branch if not equal
    LDX $18              ; A6 18 | Load from zero page into X register
    LDA $E36C,X          ; BD 6C E3 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    SEC                  ; 38 | Set carry flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $E36C,X          ; 9D 6C E3 | Update graphics data
    SEC                  ; 38 | Set carry flag
    SBC #$80             ; E9 80 | Subtract with carry (immediate)
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDY #$96             ; A0 96 | Load immediate value into Y register
    ROR $6918,X          ; 7E 18 69 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $14              ; 85 14 | Update graphics data
    LDA $E31E,X          ; BD 1E E3 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    STA $E31E,X          ; 9D 1E E3 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_114
; Address: $C4BED3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_114:
    SEC                  ; 38 | Set carry flag
    SBC #$80             ; E9 80 | Subtract with carry (immediate)
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_117
; Address: $C4BEE1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_117:
    LDX $18              ; A6 18 | Load from zero page into X register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $01              ; F0 01 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_118
; Address: $C4BEE9
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_118:
    INC $E344,X          ; FE 44 E3 | Increment (absolute,X)
    LDA $16              ; A5 16 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $E3C6            ; 8D C6 E3 | Update graphics data
    LDA $E36C,X          ; BD 6C E3 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC #$80             ; E9 80 | Subtract with carry (immediate)
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $E3C4            ; 8D C4 E3 | Update graphics data
    LDA #$CA             ; A9 CA | Read graphics status
    CPX #$8D             ; E0 8D | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    LDA $E3B2            ; AD B2 E3 | Read graphics status
    INC                  ; 1A | Increment accumulator
    STA $E5C0            ; 8D C0 E5 | Update graphics data
    LDX $18              ; A6 18 | Load from zero page into X register
    LDA $E3E2            ; AD E2 E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E472            ; CD 72 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B2            ; AD B2 E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    JMP $3FD1            ; 4C D1 3F | Jump to address
    LDA $E3E4            ; AD E4 E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E474            ; CD 74 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B4            ; AD B4 E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$02             ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_119
; Address: $C4BF3D
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_119:
    JMP $3FD1            ; 4C D1 3F | Jump to address
    LDA $E3E6            ; AD E6 E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E476            ; CD 76 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B6            ; AD B6 E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$04             ; A0 04 | Load immediate value into Y register
    JMP $3FD1            ; 4C D1 3F | Jump to address
    LDA $E3E8            ; AD E8 E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E478            ; CD 78 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B8            ; AD B8 E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$06             ; A0 06 | Load immediate value into Y register
    JMP $3FD1            ; 4C D1 3F | Jump to address
    LDA $E3EA            ; AD EA E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E47A            ; CD 7A E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4BA            ; AD BA E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$08             ; A0 08 | Load immediate value into Y register
    JMP $3FD1            ; 4C D1 3F | Jump to address
    LDA $E3EC            ; AD EC E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E47C            ; CD 7C E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4BC            ; AD BC E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$0A             ; A0 0A | Load immediate value into Y register
    JMP $3FD1            ; 4C D1 3F | Jump to address
    LDA $E3EE            ; AD EE E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E47E            ; CD 7E E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4BE            ; AD BE E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$0C             ; A0 0C | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_11A
; Address: $C4BFB5
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_11A:
    JMP $3FD1            ; 4C D1 3F | Jump to address
    LDA $E3F0            ; AD F0 E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E480            ; CD 80 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4C0            ; AD C0 E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$0E             ; A0 0E | Load immediate value into Y register
    JMP $3FD1            ; 4C D1 3F | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_11B
; Address: $C4BFD1
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_11B:
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC #$62             ; 69 62 | Add with carry (immediate)
    STA $08              ; 85 08 | Update graphics data
    LDA $E3C4            ; AD C4 E3 | Read graphics status
    STA $0A              ; 85 0A | Update graphics data
    LDA $E3C6            ; AD C6 E3 | Read graphics status
    STA $0C              ; 85 0C | Update graphics data
    LDA $E3C8            ; AD C8 E3 | Read graphics status
    STA $04              ; 85 04 | Update graphics data
    LDA $E412,Y          ; B9 12 E4 | Read graphics status
    STA $00              ; 85 00 | Update graphics data
    LDA $E422,Y          ; B9 22 E4 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $02              ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_11C
; Address: $C4BFF8
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_11C:
    JSR $593A            ; 20 3A 59 | Jump to subroutine
    LDA $E5B8            ; AD B8 E5 | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    STA $26              ; 85 26 | Update graphics data
    LDA $E5BA            ; AD BA E5 | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    STA $28              ; 85 28 | Update graphics data
    LDA $0C              ; A5 0C | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $E452,Y          ; 79 52 E4 | Add with carry (absolute,Y)
    STA $0C              ; 85 0C | Update graphics data
    LDA $0A              ; A5 0A | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E432,Y          ; F9 32 E4 | Subtract with carry (absolute,Y)
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    STA $E3D0            ; 8D D0 E3 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_11D
; Address: $C4C020
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_11D:
    LDA $E5C0            ; AD C0 E5 | Read graphics status
    STA $24              ; 85 24 | Update graphics data
    LDA $E3F2,Y          ; B9 F2 E3 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    PHY                  ; 5A | Push Y register to stack
    EOR $607A,Y          ; 59 7A 60 | Exclusive OR with accumulator (absolute,Y)
    LDA $E4C2,Y          ; B9 C2 E4 | Read graphics status
    STA $2A              ; 85 2A | Update graphics data
    LDA $0C              ; A5 0C | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $E5B4            ; AD B4 E5 | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    REP #$20             ; C2 20 | Reset processor status bits
    LDA $004216          ; AF 16 42 00 | Read graphics status
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Update graphics data
    BCC $02              ; 90 02 | Branch if carry clear
    INC $02              ; E6 02 | Increment (zero page)
    LDA $26              ; A5 26 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $26              ; 85 26 | Update graphics data
    LDA $0C              ; A5 0C | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_11E
; Address: $C4C074
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_11E:
    STY $40              ; 84 40 | Store Y register to zero page
    EOR ($2A,X)          ; 41 2A | Exclusive OR with accumulator ((zero page,X))
    ADC $D044,X          ; 7D 44 D0 | Add with carry (absolute,X)
    EOR $23              ; 45 23 | Exclusive OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    CMP #$49             ; C9 49 | Compare accumulator (immediate)
    LDA $E3D0            ; AD D0 E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_11F
; Address: $C4C087
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_11F:
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 9C A4 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF D9 AE ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 16 B9 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 53 C3 ED | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    CMP $DE40,Y          ; D9 40 DE | Compare accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    XBA                  ; EB | Exchange accumulator bytes
    RTI                  ; 40 | Return from interrupt
    BEQ $40              ; F0 40 | Branch if equal
    SBC $0240,X          ; FD 40 02 | Subtract with carry (absolute,X)
    EOR ($0F,X)          ; 41 0F | Exclusive OR with accumulator ((zero page,X))
    EOR ($14,X)          ; 41 14 | Exclusive OR with accumulator ((zero page,X))
    EOR ($A6,X)          ; 41 A6 | Exclusive OR with accumulator ((zero page,X))
    JMP $4157            ; 4C 57 41 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $416A            ; 4C 6A 41 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4175            ; 4C 75 41 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_120
; Address: $C4C0F6
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_120:
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4188            ; 4C 88 41 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4193            ; 4C 93 41 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $41A6            ; 4C A6 41 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $41B1            ; 4C B1 41 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $41C4            ; 4C C4 41 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 9C A4 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF D9 AE ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 16 B9 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 53 C3 ED | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_121
; Address: $C4C166
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_121:
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_122
; Address: $C4C1CB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_122:
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $4121            ; 4C 21 41 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_123
; Address: $C4C1D7
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_123:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 9C A4 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF D9 AE ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 16 B9 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 53 C3 ED | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    WDM #$2C             ; 42 2C | Reserved instruction
    WDM #$31             ; 42 31 | Reserved instruction
    WDM #$3E             ; 42 3E | Reserved instruction
    WDM #$43             ; 42 43 | Reserved instruction
    WDM #$50             ; 42 50 | Reserved instruction
    WDM #$55             ; 42 55 | Reserved instruction
    WDM #$62             ; 42 62 | Reserved instruction
    WDM #$67             ; 42 67 | Reserved instruction
    WDM #$A6             ; 42 A6 | Reserved instruction
    JMP $42AA            ; 4C AA 42 | Hardware register operation
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_124
; Address: $C4C23B
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_124:
    JMP $42BD            ; 4C BD 42 | Hardware register operation
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $42C8            ; 4C C8 42 | Hardware register operation
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $42DB            ; 4C DB 42 | Hardware register operation
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $42E6            ; 4C E6 42 | Hardware register operation
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $42F9            ; 4C F9 42 | Hardware register operation
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4304            ; 4C 04 43 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4317            ; 4C 17 43 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 9C A4 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF D9 AE ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 16 B9 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 53 C3 ED | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_125
; Address: $C4C2AE
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_125:
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_126
; Address: $C4C312
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_126:
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $4274            ; 4C 74 42 | Hardware register operation
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_127
; Address: $C4C32A
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_127:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 90 CD ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF CD D7 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 0A E2 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 47 EC ED | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    STY $43              ; 84 43 | Store Y register to zero page
    STA ($43),Y          ; 91 43 | Update graphics data
    TAY                  ; A8 | Transfer accumulator to Y register
    TSX                  ; BA | Transfer stack pointer to X register
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $43FD            ; 4C FD 43 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_128
; Address: $C4C38C
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_128:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4410            ; 4C 10 44 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $441B            ; 4C 1B 44 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $442E            ; 4C 2E 44 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4439            ; 4C 39 44 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $444C            ; 4C 4C 44 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4457            ; 4C 57 44 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $446A            ; 4C 6A 44 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 90 CD ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF CD D7 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 0A E2 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 47 EC ED | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_129
; Address: $C4C3FD
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_129:
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_12A
; Address: $C4C45F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_12A:
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $43C7            ; 4C C7 43 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_12B
; Address: $C4C47D
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_12B:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 90 CD ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF CD D7 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 0A E2 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 47 EC ED | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    REP #$44             ; C2 44 | Reset processor status bits
    CPX $44              ; E4 44 | Compare X register (zero page)
    SBC #$44             ; E9 44 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    EOR $0D              ; 45 0D | Exclusive OR with accumulator (zero page)
    EOR $A6              ; 45 A6 | Exclusive OR with accumulator (zero page)
    JMP $4550            ; 4C 50 45 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_12C
; Address: $C4C4D9
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_12C:
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4563            ; 4C 63 45 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $456E            ; 4C 6E 45 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4581            ; 4C 81 45 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $458C            ; 4C 8C 45 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $459F            ; 4C 9F 45 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $45AA            ; 4C AA 45 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $45BD            ; 4C BD 45 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 90 CD ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF CD D7 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 0A E2 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 47 EC ED | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_12D
; Address: $C4C54A
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_12D:
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_12E
; Address: $C4C5AE
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_12E:
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $451A            ; 4C 1A 45 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_12F
; Address: $C4C5D0
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_12F:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 84 F6 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF C1 00 EE | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF FE 0A EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 3B 15 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LSR $25              ; 46 25 | Logical shift right (zero page)
    LSR $2A              ; 46 2A | Logical shift right (zero page)
    LSR $37              ; 46 37 | Logical shift right (zero page)
    LSR $3C              ; 46 3C | Logical shift right (zero page)
    LSR $49              ; 46 49 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_130
; Address: $C4C61E
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_130:
    LSR $4E              ; 46 4E | Logical shift right (zero page)
    LSR $5B              ; 46 5B | Logical shift right (zero page)
    LSR $60              ; 46 60 | Logical shift right (zero page)
    LSR $A6              ; 46 A6 | Logical shift right (zero page)
    JMP $46A3            ; 4C A3 46 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $46B6            ; 4C B6 46 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $46C1            ; 4C C1 46 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $46D4            ; 4C D4 46 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $46DF            ; 4C DF 46 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $46F2            ; 4C F2 46 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $46FD            ; 4C FD 46 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4710            ; 4C 10 47 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 84 F6 ED | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_131
; Address: $C4C688
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_131:
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF C1 00 EE | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF FE 0A EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 3B 15 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_132
; Address: $C4C6F5
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_132:
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $466D            ; 4C 6D 46 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_133
; Address: $C4C723
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_133:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 84 F6 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF C1 00 EE | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF FE 0A EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 3B 15 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_134
; Address: $C4C764
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_134:
    TAX                  ; AA | Transfer accumulator to X register
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    ADC $8A47,X          ; 7D 47 8A | Add with carry (absolute,X)
    STA $479C47          ; 8F 47 9C 47 | Update graphics data
    LDA ($47,X)          ; A1 47 | Read graphics status
    LDX $B347            ; AE 47 B3 | Load from absolute address into X register
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $47F6            ; 4C F6 47 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4809            ; 4C 09 48 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4814            ; 4C 14 48 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4827            ; 4C 27 48 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4832            ; 4C 32 48 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4845            ; 4C 45 48 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4850            ; 4C 50 48 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4863            ; 4C 63 48 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_135
; Address: $C4C7CE
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_135:
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 84 F6 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF C1 00 EE | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF FE 0A EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 3B 15 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_136
; Address: $C4C840
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_136:
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $47C0            ; 4C C0 47 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_137
; Address: $C4C876
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_137:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 78 1F EE | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF B5 29 EE | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF F2 33 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 2F 3E EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_138
; Address: $C4C8B0
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_138:
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BNE $48              ; D0 48 | Branch if not equal
    CMP $E248,X          ; DD 48 E2 | Compare accumulator (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PEA #$0148           ; F4 48 01 | Push effective address to stack
    EOR #$06             ; 49 06 | Exclusive OR with accumulator (immediate)
    EOR #$A6             ; 49 A6 | Exclusive OR with accumulator (immediate)
    JMP $4949            ; 4C 49 49 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $495C            ; 4C 5C 49 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4967            ; 4C 67 49 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $497A            ; 4C 7A 49 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4985            ; 4C 85 49 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4998            ; 4C 98 49 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $49A3            ; 4C A3 49 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $49B6            ; 4C B6 49 | Jump to address
    LDA $10              ; A5 10 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_139
; Address: $C4C915
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_139:
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 78 1F EE | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF B5 29 EE | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF F2 33 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 2F 3E EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_13A
; Address: $C4C988
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_13A:
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $4913            ; 4C 13 49 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_13B
; Address: $C4C9C9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_13B:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 78 1F EE | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_13C
; Address: $C4C9EE
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_13C:
    LDA                  ; BF B5 29 EE | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF F2 33 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 2F 3E EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    ASL $1E4A            ; 0E 4A 1E | Arithmetic shift left (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    BMI $4A              ; 30 4A | Branch if negative
    LSR                  ; 4A | Logical shift right (accumulator)
    WDM #$4A             ; 42 4A | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $A64A,Y          ; 59 4A A6 | Exclusive OR with accumulator (absolute,Y)
    JMP $4A9C            ; 4C 9C 4A | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4AAF            ; 4C AF 4A | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4ABA            ; 4C BA 4A | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4ACD            ; 4C CD 4A | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4AD8            ; 4C D8 4A | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4AEB            ; 4C EB 4A | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4AF6            ; 4C F6 4A | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_13D
; Address: $C4CA5E
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_13D:
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4B09            ; 4C 09 4B | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 78 1F EE | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF B5 29 EE | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF F2 33 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 2F 3E EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_13E
; Address: $C4CACD
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_13E:
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $4A66            ; 4C 66 4A | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_13F
; Address: $C4CB1C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_13F:
    LDX $18              ; A6 18 | Load from zero page into X register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $01              ; F0 01 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_140
; Address: $C4CB24
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_140:
    INC $E34E,X          ; FE 4E E3 | Increment (absolute,X)
    LDA $14              ; A5 14 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $E3C4            ; 8D C4 E3 | Update graphics data
    LDA $E376,X          ; BD 76 E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_141
; Address: $C4CB32
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_141:
    SEC                  ; 38 | Set carry flag
    SBC #$80             ; E9 80 | Subtract with carry (immediate)
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $E3C6            ; 8D C6 E3 | Update graphics data
    LDA #$D2             ; A9 D2 | Read graphics status
    SBC ($8D,X)          ; E1 8D | Subtract with carry ((zero page,X))
    INY                  ; C8 | Increment Y register
    LDA $E3B4            ; AD B4 E3 | Read graphics status
    STA $E5C0            ; 8D C0 E5 | Update graphics data
    LDX $18              ; A6 18 | Load from zero page into X register
    LDA $E3E2            ; AD E2 E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E472            ; CD 72 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B2            ; AD B2 E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    JMP $4C0B            ; 4C 0B 4C | Jump to address
    LDA $E3E4            ; AD E4 E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E474            ; CD 74 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B4            ; AD B4 E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$02             ; A0 02 | Load immediate value into Y register
    JMP $4C0B            ; 4C 0B 4C | Jump to address
    LDA $E3E6            ; AD E6 E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E476            ; CD 76 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B6            ; AD B6 E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$04             ; A0 04 | Load immediate value into Y register
    JMP $4C0B            ; 4C 0B 4C | Jump to address
    LDA $E3E8            ; AD E8 E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E478            ; CD 78 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4B8            ; AD B8 E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_142
; Address: $C4CBA4
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_142:
    LDY #$06             ; A0 06 | Load immediate value into Y register
    JMP $4C0B            ; 4C 0B 4C | Jump to address
    LDA $E3EA            ; AD EA E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E47A            ; CD 7A E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4BA            ; AD BA E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$08             ; A0 08 | Load immediate value into Y register
    JMP $4C0B            ; 4C 0B 4C | Jump to address
    LDA $E3EC            ; AD EC E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E47C            ; CD 7C E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4BC            ; AD BC E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$0A             ; A0 0A | Load immediate value into Y register
    JMP $4C0B            ; 4C 0B 4C | Jump to address
    LDA $E3EE            ; AD EE E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E47E            ; CD 7E E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4BE            ; AD BE E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    JMP $4C0B            ; 4C 0B 4C | Jump to address
    LDA $E3F0            ; AD F0 E3 | Read graphics status
    BPL $13              ; 10 13 | Branch if positive
    LDA $18              ; A5 18 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $E480            ; CD 80 E4 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $E4C0            ; AD C0 E4 | Read graphics status
    BEQ $06              ; F0 06 | Branch if equal
    LDY #$0E             ; A0 0E | Load immediate value into Y register
    JMP $4C0B            ; 4C 0B 4C | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_143
; Address: $C4CC0B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_143:
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC #$62             ; 69 62 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_144
; Address: $C4CC14
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_144:
    STA $08              ; 85 08 | Update graphics data
    LDA $E3C4            ; AD C4 E3 | Read graphics status
    STA $0A              ; 85 0A | Update graphics data
    LDA $E3C6            ; AD C6 E3 | Read graphics status
    STA $0C              ; 85 0C | Update graphics data
    LDA $E3C8            ; AD C8 E3 | Read graphics status
    STA $04              ; 85 04 | Update graphics data
    LDA $E412,Y          ; B9 12 E4 | Read graphics status
    STA $00              ; 85 00 | Update graphics data
    LDA $E422,Y          ; B9 22 E4 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $02              ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_145
; Address: $C4CC32
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_145:
    JSR $593A            ; 20 3A 59 | Jump to subroutine
    LDA $E5B8            ; AD B8 E5 | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    STA $26              ; 85 26 | Update graphics data
    LDA $E5BA            ; AD BA E5 | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    STA $28              ; 85 28 | Update graphics data
    LDA $0A              ; A5 0A | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E432,Y          ; F9 32 E4 | Subtract with carry (absolute,Y)
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $E432,Y          ; 79 32 E4 | Add with carry (absolute,Y)
    STA $0A              ; 85 0A | Update graphics data
    LDA $0C              ; A5 0C | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    STA $E3D0            ; 8D D0 E3 | Update graphics data
    LDA $E5C0            ; AD C0 E5 | Read graphics status
    STA $24              ; 85 24 | Update graphics data
    LDA $E3F2,Y          ; B9 F2 E3 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    PHY                  ; 5A | Push Y register to stack
    LDA $7A59,Y          ; B9 59 7A | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_146
; Address: $C4CC69
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_146:
    LDA $E4C2,Y          ; B9 C2 E4 | Read graphics status
    STA $2A              ; 85 2A | Update graphics data
    LDA $0A              ; A5 0A | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E432,Y          ; F9 32 E4 | Subtract with carry (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Update graphics data
    BCC $02              ; 90 02 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_147
; Address: $C4CC7E
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_147:
    INC $02              ; E6 02 | Increment (zero page)
    LDA $E5B4            ; AD B4 E5 | Read graphics status
    STA $0E              ; 85 0E | Update graphics data
    LDA $28              ; A5 28 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $28              ; 85 28 | Update graphics data
    LDA $0A              ; A5 0A | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E432,Y          ; F9 32 E4 | Subtract with carry (absolute,Y)
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    STZ $604C            ; 9C 4C 60 | Store zero to absolute
    LDY $294C            ; AC 4C 29 | Load from absolute address into Y register
    LSR $4FA6            ; 4E A6 4F | Logical shift right (absolute)
    EOR ($A0),Y          ; 51 A0 | Exclusive OR with accumulator ((zero page),Y)
    ORA $9A54,X          ; 1D 54 9A | Logical OR with accumulator (absolute,X)
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 9C A4 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 90 CD ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 84 F6 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_148
; Address: $C4CCF4
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_148:
    LDA                  ; BF 78 1F EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    ASL $4D              ; 06 4D | Arithmetic shift left (zero page)
    EOR $4D1B            ; 4D 1B 4D | Exclusive OR with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    EOR $4D2D            ; 4D 2D 4D | Exclusive OR with accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator
    EOR $4D3F            ; 4D 3F 4D | Exclusive OR with accumulator (absolute)
    JMP $514D            ; 4C 4D 51 | Jump to address
    EOR $04A6            ; 4D A6 04 | Exclusive OR with accumulator (absolute)
    JMP $4DA9            ; 4C A9 4D | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4DBC            ; 4C BC 4D | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4DC7            ; 4C C7 4D | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4DDA            ; 4C DA 4D | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4DE5            ; 4C E5 4D | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4DF8            ; 4C F8 4D | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4E03            ; 4C 03 4E | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4E16            ; 4C 16 4E | Jump to address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_149
; Address: $C4CD5E
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_149:
    LDA $10              ; A5 10 | Read graphics status
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 9C A4 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 90 CD ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 84 F6 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 78 1F EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_14A
; Address: $C4CDD2
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_14A:
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $4D5E            ; 4C 5E 4D | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_14B
; Address: $C4CE29
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_14B:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_14C
; Address: $C4CE33
; Size: 119 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_14C:
    STA $10              ; 85 10 | Update graphics data
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 9C A4 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 90 CD ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 84 F6 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 78 1F EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LSR $4E93            ; 4E 93 4E | Logical shift right (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    LSR $4EA5            ; 4E A5 4E | Logical shift right (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    LSR $4EB7            ; 4E B7 4E | Logical shift right (absolute)
    LDY $C94E,X          ; BC 4E C9 | Load from absolute,X into Y register
    LSR $4ECE            ; 4E CE 4E | Logical shift right (absolute)
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4F26            ; 4C 26 4F | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4F39            ; 4C 39 4F | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4F44            ; 4C 44 4F | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_14D
; Address: $C4CEAF
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_14D:
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4F57            ; 4C 57 4F | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4F62            ; 4C 62 4F | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4F75            ; 4C 75 4F | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $4F80            ; 4C 80 4F | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4F93            ; 4C 93 4F | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 9C A4 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 90 CD ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 84 F6 ED | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 78 1F EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_14E
; Address: $C4CF23
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_14E:
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_14F
; Address: $C4CF86
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_14F:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $4EDB            ; 4C DB 4E | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_150
; Address: $C4CFA6
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_150:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF D9 AE ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF CD D7 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF C1 00 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF B5 29 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_151
; Address: $C4CFF8
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_151:
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    BVC $10              ; 50 10 | Branch if overflow clear
    BVC $15              ; 50 15 | Branch if overflow clear
    BVC $22              ; 50 22 | Branch if overflow clear
    BVC $27              ; 50 27 | Branch if overflow clear
    BVC $34              ; 50 34 | Branch if overflow clear
    BVC $39              ; 50 39 | Branch if overflow clear
    BVC $46              ; 50 46 | Branch if overflow clear
    BVC $4B              ; 50 4B | Branch if overflow clear
    BVC $A6              ; 50 A6 | Branch if overflow clear
    JMP $50A3            ; 4C A3 50 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $50B6            ; 4C B6 50 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $50C1            ; 4C C1 50 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $50D4            ; 4C D4 50 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $50DF            ; 4C DF 50 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $50F2            ; 4C F2 50 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $50FD            ; 4C FD 50 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $5110            ; 4C 10 51 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    SEP #$20             ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_152
; Address: $C4D05E
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_152:
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF D9 AE ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF CD D7 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF C1 00 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF B5 29 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_153
; Address: $C4D0D2
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_153:
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $5058            ; 4C 58 50 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_154
; Address: $C4D123
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_154:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_155
; Address: $C4D135
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_155:
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF D9 AE ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF CD D7 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF C1 00 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF B5 29 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    ADC $8D51,X          ; 7D 51 8D | Add with carry (absolute,X)
    EOR ($92),Y          ; 51 92 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($9F),Y          ; 51 9F | Exclusive OR with accumulator ((zero page),Y)
    EOR ($A4),Y          ; 51 A4 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($B1),Y          ; 51 B1 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($B6),Y          ; 51 B6 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($C3),Y          ; 51 C3 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($C8),Y          ; 51 C8 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($A6),Y          ; 51 A6 | Exclusive OR with accumulator ((zero page),Y)
    JMP $5220            ; 4C 20 52 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $5233            ; 4C 33 52 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $523E            ; 4C 3E 52 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_156
; Address: $C4D1AC
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_156:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $5251            ; 4C 51 52 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $525C            ; 4C 5C 52 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $526F            ; 4C 6F 52 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $527A            ; 4C 7A 52 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $528D            ; 4C 8D 52 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF D9 AE ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF CD D7 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF C1 00 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF B5 29 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_157
; Address: $C4D220
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_157:
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_158
; Address: $C4D282
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_158:
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $51D5            ; 4C D5 51 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_159
; Address: $C4D2A0
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_159:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 16 B9 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 0A E2 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF FE 0A EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF F2 33 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_15A
; Address: $C4D2F6
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_15A:
    TAX                  ; AA | Transfer accumulator to X register
    PLX                  ; FA | Pull X register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($53,X)          ; 21 53 | Logical AND with accumulator ((zero page,X))
    ROL $3353            ; 2E 53 33 | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    EOR $53              ; 45 53 | Exclusive OR with accumulator (zero page)
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $539D            ; 4C 9D 53 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $53B0            ; 4C B0 53 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $53BB            ; 4C BB 53 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $53CE            ; 4C CE 53 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $53D9            ; 4C D9 53 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $53EC            ; 4C EC 53 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $53F7            ; 4C F7 53 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $540A            ; 4C 0A 54 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_15B
; Address: $C4D364
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_15B:
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 16 B9 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 0A E2 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF FE 0A EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF F2 33 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_15C
; Address: $C4D3D5
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_15C:
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $5352            ; 4C 52 53 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_15D
; Address: $C4D41D
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_15D:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_15E
; Address: $C4D438
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_15E:
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 16 B9 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 0A E2 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF FE 0A EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF F2 33 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    STY $9954            ; 8C 54 99 | Store Y register to absolute address
    STZ $AB54,X          ; 9E 54 AB | Store zero to absolute,X
    BCS $54              ; B0 54 | Branch if carry set
    LDA $C254,X          ; BD 54 C2 | Read graphics status
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $551A            ; 4C 1A 55 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $552D            ; 4C 2D 55 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $5538            ; 4C 38 55 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $554B            ; 4C 4B 55 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $5556            ; 4C 56 55 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_15F
; Address: $C4D4B6
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_15F:
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $5569            ; 4C 69 55 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $5574            ; 4C 74 55 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $5587            ; 4C 87 55 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 16 B9 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 0A E2 ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF FE 0A EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF F2 33 EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_160
; Address: $C4D529
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_160:
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_161
; Address: $C4D58E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_161:
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $54CF            ; 4C CF 54 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_162
; Address: $C4D59A
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_162:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 53 C3 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 47 EC ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 3B 15 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 2F 3E EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    PEA #$0455           ; F4 55 04 | Push effective address to stack
    ORA #$56             ; 09 56 | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    AND $3A56            ; 2D 56 3A | Logical AND with accumulator (absolute)
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $5697            ; 4C 97 56 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_163
; Address: $C4D60B
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_163:
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $56AA            ; 4C AA 56 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $56B5            ; 4C B5 56 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $56C8            ; 4C C8 56 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $56D3            ; 4C D3 56 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $56E6            ; 4C E6 56 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $56F1            ; 4C F1 56 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $5704            ; 4C 04 57 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_164
; Address: $C4D672
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_164:
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 53 C3 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 47 EC ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 3B 15 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 2F 3E EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_165
; Address: $C4D6E2
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_165:
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C086,Y          ; B9 86 C0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $D086,Y          ; B9 86 D0 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $564C            ; 4C 4C 56 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_166
; Address: $C4D717
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_166:
    LDA $E3D0            ; AD D0 E3 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    STA $10              ; 85 10 | Update graphics data
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_167
; Address: $C4D74A
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_167:
    LDA                  ; BF 53 C3 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 47 EC ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 3B 15 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 2F 3E EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    ADC ($57),Y          ; 71 57 | Add with carry ((zero page),Y)
    STA ($57,X)          ; 81 57 | Update graphics data
    STX $57              ; 86 57 | Store X register to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA $57              ; A5 57 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    LDY $A657,X          ; BC 57 A6 | Load from absolute,X into Y register
    JMP $5814            ; 4C 14 58 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $5827            ; 4C 27 58 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $5832            ; 4C 32 58 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC50            ; AD 50 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $5845            ; 4C 45 58 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $5850            ; 4C 50 58 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $5863            ; 4C 63 58 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    JMP $586E            ; 4C 6E 58 | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register
    LDA $FC54            ; AD 54 FC | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_168
; Address: $C4D7C1
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_168:
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $5881            ; 4C 81 58 | Jump to address
    LDA $10              ; A5 10 | Read graphics status
    AND $28              ; 25 28 | Logical AND with accumulator (zero page)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Update graphics data
    LDA $0E              ; A5 0E | Read graphics status
    STA $004203          ; 8F 03 42 00 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDA $004216          ; AF 16 42 00 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $FC4F            ; 9C 4F FC | Store zero to absolute
    STZ $FC51            ; 9C 51 FC | Store zero to absolute
    STZ $FC53            ; 9C 53 FC | Store zero to absolute
    STZ $FC55            ; 9C 55 FC | Store zero to absolute
    LDA                  ; BF 53 C3 ED | Read graphics status
    STA $FC4E            ; 8D 4E FC | Update graphics data
    LDA                  ; BF 47 EC ED | Read graphics status
    STA $FC50            ; 8D 50 FC | Update graphics data
    LDA                  ; BF 3B 15 EE | Read graphics status
    STA $FC52            ; 8D 52 FC | Update graphics data
    LDA                  ; BF 2F 3E EE | Read graphics status
    STA $FC54            ; 8D 54 FC | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA $FC4E            ; AD 4E FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $6C              ; F0 6C | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $61              ; F0 61 | Branch if equal
    LDA $FC50            ; AD 50 FC | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_169
; Address: $C4D835
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_169:
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $43              ; F0 43 | Branch if equal
    LDA $FC52            ; AD 52 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $FC54            ; AD 54 FC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ADC $2A              ; 65 2A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $B886,Y          ; B9 86 B8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $C886,Y          ; B9 86 C8 | Read graphics status
    STA $0000,X          ; 9D 00 00 | Update graphics data
    INX                  ; E8 | Increment X register
    DEC $24              ; C6 24 | Decrement (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    INC $10              ; E6 10 | Increment (zero page)
    INC $10              ; E6 10 | Increment (zero page)
    JMP $57C9            ; 4C C9 57 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_16B
; Address: $C4D899
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_16B:
    BEQ $3F              ; F0 3F | Branch if equal
    LDA $E31E,X          ; BD 1E E3 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC #$80             ; E9 80 | Subtract with carry (immediate)
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    STA $E574,X          ; 9D 74 E5 | Update graphics data
    EOR #$7F             ; 49 7F | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    STA $E55C,X          ; 9D 5C E5 | Update graphics data
    LDA #$CA             ; A9 CA | Read graphics status
    CPX #$9D             ; E0 9D | Compare X register (immediate)
    STZ $E5              ; 64 E5 | Store zero to zero page
    CLC                  ; 18 | Clear carry flag
    ADC $E55C,X          ; 7D 5C E5 | Add with carry (absolute,X)
    STA $E57C,X          ; 9D 7C E5 | Update graphics data
    LDA $E362,X          ; BD 62 E3 | Read graphics status
    AND #$F8             ; 29 F8 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $E56C,X          ; 9D 6C E5 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    ADC $E574,X          ; 7D 74 E5 | Add with carry (absolute,X)
    STA $E554,X          ; 9D 54 E5 | Update graphics data
    LDA #$01             ; A9 01 | Read graphics status
    STA $7E7FE2          ; 8F E2 7F 7E | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_16C
; Address: $C4D8DB
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_16C:
    LDX $18              ; A6 18 | Load from zero page into X register
    LDA $E34E,X          ; BD 4E E3 | Read graphics status
    BEQ $41              ; F0 41 | Branch if equal
    LDA $E328,X          ; BD 28 E3 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC #$80             ; E9 80 | Subtract with carry (immediate)
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    STA $E5A4,X          ; 9D A4 E5 | Update graphics data
    EOR #$7F             ; 49 7F | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    STA $E58C,X          ; 9D 8C E5 | Update graphics data
    LDA #$D2             ; A9 D2 | Read graphics status
    SBC ($9D,X)          ; E1 9D | Subtract with carry ((zero page,X))
    SBC $18              ; E5 18 | Subtract with carry (zero page)
    ADC $E58C,X          ; 7D 8C E5 | Add with carry (absolute,X)
    STA $E5AC,X          ; 9D AC E5 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_16D
; Address: $C4D906
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_16D:
    LDA $E328,X          ; BD 28 E3 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC #$80             ; E9 80 | Subtract with carry (immediate)
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BIT $59              ; 24 59 | Test bits in accumulator (zero page)
    STA $E584,X          ; 9D 84 E5 | Update graphics data
    LDA #$00             ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_16E
; Address: $C4D916
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_16E:
    JSR $5924            ; 20 24 59 | Jump to subroutine
    STA $E59C,X          ; 9D 9C E5 | Update graphics data
    LDA #$01             ; A9 01 | Read graphics status
    STA $7E7FE2          ; 8F E2 7F 7E | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_16F
; Address: $C4D924
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_16F:
    AND #$F8             ; 29 F8 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $0E              ; 85 0E | Update graphics data
    LDA $E358,X          ; BD 58 E3 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_170
; Address: $C4D93A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_170:
    LDA $E442,Y          ; B9 42 E4 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E432,Y          ; F9 32 E4 | Subtract with carry (absolute,Y)
    INC                  ; 1A | Increment accumulator
    STA $E5B4            ; 8D B4 E5 | Update graphics data
    STA $E5B8            ; 8D B8 E5 | Update graphics data
    LDA $E462,Y          ; B9 62 E4 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    INC                  ; 1A | Increment accumulator
    STA $E5B6            ; 8D B6 E5 | Update graphics data
    STA $E5BA            ; 8D BA E5 | Update graphics data
    LDA $0A              ; A5 0A | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E432,Y          ; F9 32 E4 | Subtract with carry (absolute,Y)
    STA $E5BC            ; 8D BC E5 | Update graphics data
    LDA $0C              ; A5 0C | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Subtract with carry (absolute,Y)
    STA $E5BE            ; 8D BE E5 | Update graphics data
    LDA $E3F2,Y          ; B9 F2 E3 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    BVS $59              ; 70 59 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_171
; Address: $C4D970
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_171:
    LDX $59              ; A6 59 | Load from zero page into X register
    LDX $59              ; A6 59 | Load from zero page into X register
    LDX $59              ; A6 59 | Load from zero page into X register
    TXS                  ; 9A | Transfer X register to stack pointer
    EOR $599A,Y          ; 59 9A 59 | Exclusive OR with accumulator (absolute,Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    EOR $5982,Y          ; 59 82 59 | Exclusive OR with accumulator (absolute,Y)
    EOR $5982,Y          ; 59 82 59 | Exclusive OR with accumulator (absolute,Y)
    LSR $E5B4            ; 4E B4 E5 | Logical shift right (absolute)
    LSR $E5B4            ; 4E B4 E5 | Logical shift right (absolute)
    LSR $E5B6            ; 4E B6 E5 | Logical shift right (absolute)
    LSR $E5B6            ; 4E B6 E5 | Logical shift right (absolute)
    LSR $E5BC            ; 4E BC E5 | Logical shift right (absolute)
    LSR $E5BC            ; 4E BC E5 | Logical shift right (absolute)
    LSR $E5BE            ; 4E BE E5 | Logical shift right (absolute)
    LSR $E5BE            ; 4E BE E5 | Logical shift right (absolute)
    LSR $E5B4            ; 4E B4 E5 | Logical shift right (absolute)
    LSR $E5B6            ; 4E B6 E5 | Logical shift right (absolute)
    LSR $E5BC            ; 4E BC E5 | Logical shift right (absolute)
    LSR $E5BE            ; 4E BE E5 | Logical shift right (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_172
; Address: $C4D9A7
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_172:
    ROL $2E40            ; 2E 40 2E | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    ROL $2E40            ; 2E 40 2E | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    ROL $2E40            ; 2E 40 2E | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ROL $2E40            ; 2E 40 2E | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    ROL $2E40            ; 2E 40 2E | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    ROL $2E40            ; 2E 40 2E | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    ADC #$4C             ; 69 4C | Add with carry (immediate)
    ADC #$4C             ; 69 4C | Add with carry (immediate)
    ADC #$4C             ; 69 4C | Add with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_173
; Address: $C4D9D6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_173:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    LDX #$01             ; A2 01 | Load immediate value into X register
    BCC $0E              ; 90 0E | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_174
; Address: $C4D9E1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_174:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    LDX #$00             ; A2 00 | Load immediate value into X register
    TXA                  ; 8A | Transfer X register to accumulator
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_175
; Address: $C4D9F5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_175:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_184
; Address: $C4DA41
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_184:
    JSL $C2A4E6          ; 22 E6 A4 C2 | Jump to subroutine long
    BCS $BE              ; B0 BE | Branch if carry set
    INC $2012            ; EE 12 20 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_185
; Address: $C4DA4A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_185:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_187
; Address: $C4DA58
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_187:
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX #$CE             ; A2 CE | Load immediate value into X register
    STZ $2030,X          ; 9E 30 20 | Store zero to absolute,X
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F9              ; 10 F9 | Branch if positive
    LDA #$FF             ; A9 FF | Read graphics status
    STA $2462            ; 8D 62 24 | Update graphics data
    STA $2464            ; 8D 64 24 | Update graphics data
    STA $2465            ; 8D 65 24 | Update graphics data
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_188
; Address: $C4DA78
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_188:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_18A
; Address: $C4DA90
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_18A:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDY #$00             ; A0 00 | Load immediate value into Y register
    DEX                  ; CA | Decrement X register
    BMI $28              ; 30 28 | Branch if negative

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_18B
; Address: $C4DA9C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_18B:
    JSL $C429DA          ; 22 DA 29 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    STA $2420            ; 8D 20 24 | Update graphics data
    STA $2424            ; 8D 24 24 | Update graphics data
    LDA #$01             ; A9 01 | Read graphics status
    STA $241E            ; 8D 1E 24 | Update graphics data
    STA $2422            ; 8D 22 24 | Update graphics data
    LDA #$05             ; A9 05 | Read graphics status
    STA $2426            ; 8D 26 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_18C
; Address: $C4DAB8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_18C:
    JSL $C2AB00          ; 22 00 AB C2 | Jump to subroutine long
    LDA $2428            ; AD 28 24 | Read graphics status
    BMI $FE              ; 30 FE | Branch if negative
    INY                  ; C8 | Increment Y register
    BRA $D5              ; 80 D5 | Branch always
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_18E
; Address: $C4DAC8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_18E:
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$01             ; A9 01 | Read graphics status
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0080           ; F4 80 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_18F
; Address: $C4DADC
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_18F:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    LDA $4EE0            ; AD E0 4E | Read graphics status
    STA $2456            ; 8D 56 24 | Update graphics data
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY $2008,X          ; BC 08 20 | Load from absolute,X into Y register
    BEQ $3E              ; F0 3E | Branch if equal
    LDA $2000,X          ; BD 00 20 | Read graphics status
    BEQ $39              ; F0 39 | Branch if equal
    STA $2420            ; 8D 20 24 | Update graphics data
    STA $2424            ; 8D 24 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_190
; Address: $C4DAF9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_190:
    JSR $5B46            ; 20 46 5B | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $2426            ; 8D 26 24 | Update graphics data
    LDA #$00             ; A9 00 | Read graphics status
    STA $241E            ; 8D 1E 24 | Update graphics data
    STA $2422            ; 8D 22 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_191
; Address: $C4DB0A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_191:
    JSL $C2AB00          ; 22 00 AB C2 | Jump to subroutine long
    LDA $2428            ; AD 28 24 | Read graphics status
    BMI $FE              ; 30 FE | Branch if negative
    PHX                  ; DA | Push X register to stack
    LDX $2428            ; AE 28 24 | Load from absolute address into X register
    LDA $2456            ; AD 56 24 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_193
; Address: $C4DB1F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_193:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    INC $2456            ; EE 56 24 | Increment (absolute)
    INC $2456            ; EE 56 24 | Increment (absolute)
    PLX                  ; FA | Pull X register from stack
    DEY                  ; 88 | Decrement Y register
    BNE $DE              ; D0 DE | Branch if not equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $B6              ; 90 B6 | Branch if carry clear
    LDA #$00             ; A9 00 | Read graphics status
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0080           ; F4 80 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_196
; Address: $C4DB46
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_196:
    LDA $2420            ; AD 20 24 | Read graphics status
    CMP #$19             ; C9 19 | Compare accumulator (immediate)
    BNE $3C              ; D0 3C | Branch if not equal
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    SEP #$30             ; E2 30 | Set processor status bits
    LDA #$00             ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_197
; Address: $C4DB54
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_197:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX #$83             ; A2 83 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_198
; Address: $C4DB61
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_198:
    JSL $C2CC8B          ; 22 8B CC C2 | Jump to subroutine long
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    ORA $8A              ; 05 8A | Logical OR with accumulator (zero page)
    STA $2484,Y          ; 99 84 24 | Update graphics data
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    BNE $EC              ; D0 EC | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_199
; Address: $C4DB78
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_199:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2484,Y          ; B9 84 24 | Read graphics status
    STA $2424            ; 8D 24 24 | Update graphics data
    STZ $2425            ; 9C 25 24 | Store zero to absolute
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_19A
; Address: $C4DB8B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_19A:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_19F
; Address: $C4DBA0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_19F:
    JSR $5BA6            ; 20 A6 5B | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1A3
; Address: $C4DBB7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1A3:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    LDA ($B0),Y          ; B1 B0 | Read graphics status
    SBC $149D,Y          ; F9 9D 14 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1A5
; Address: $C4DBC3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1A5:
    JSL $E8B1C3          ; 22 C3 B1 E8 | Jump to subroutine long
    INX                  ; E8 | Increment X register
    CPX #$0A             ; E0 0A | Compare X register (immediate)
    BCC $DC              ; 90 DC | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1A6
; Address: $C4DBCE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1A6:
    LDA $240E            ; AD 0E 24 | Read graphics status
    ORA $2410            ; 0D 10 24 | Logical OR with accumulator (absolute)
    ORA $2412            ; 0D 12 24 | Logical OR with accumulator (absolute)
    ORA $2414            ; 0D 14 24 | Logical OR with accumulator (absolute)
    BEQ $25              ; F0 25 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1A7
; Address: $C4DBDC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1A7:
    JSL $C1AE9F          ; 22 9F AE C1 | Jump to subroutine long
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $240E,X          ; BD 0E 24 | Read graphics status
    BEQ $0C              ; F0 0C | Branch if equal
    LDA $23FE,X          ; BD FE 23 | Read graphics status
    STA $BE71            ; 8D 71 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1A8
; Address: $C4DBEE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1A8:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E8              ; 90 E8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1A9
; Address: $C4DBFB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1A9:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1AA
; Address: $C4DC02
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1AA:
    LDA #$00             ; A9 00 | Read graphics status
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$0030           ; F4 30 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1AB
; Address: $C4DC0E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1AB:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0020           ; F4 20 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1AC
; Address: $C4DC1B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1AC:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BNE $1A              ; D0 1A | Branch if not equal
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0003           ; F4 03 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1AD
; Address: $C4DC2A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1AD:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$0030           ; F4 30 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1B0
; Address: $C4DC3C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1B0:
    LDA #$41             ; A9 41 | Read graphics status
    STA $23E4            ; 8D E4 23 | Update graphics data
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$0030           ; F4 30 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1B1
; Address: $C4DC4B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1B1:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $0B              ; F0 0B | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 5D 5C C2 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1B3
; Address: $C4DC5D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1B3:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1B4
; Address: $C4DC6A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1B4:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $4F              ; F0 4F | Branch if equal
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$000C           ; F4 0C 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1B5
; Address: $C4DC79
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1B5:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    STA $2426            ; 8D 26 24 | Update graphics data
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDY #$08             ; A0 08 | Load immediate value into Y register
    LDA $23FE,X          ; BD FE 23 | Read graphics status
    STZ $23FE,X          ; 9E FE 23 | Store zero to absolute,X
    STA $23FE,Y          ; 99 FE 23 | Update graphics data
    LDA $240E,X          ; BD 0E 24 | Read graphics status
    STZ $240E,X          ; 9E 0E 24 | Store zero to absolute,X
    STA $240E,Y          ; 99 0E 24 | Update graphics data
    LDX #$17             ; A2 17 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1B6
; Address: $C4DC9A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1B6:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $18              ; F0 18 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1B8
; Address: $C4DCA9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1B8:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP $2426            ; CD 26 24 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA #$04             ; A9 04 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1BA
; Address: $C4DCB9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1BA:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    BPL $DB              ; 10 DB | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1BC
; Address: $C4DCC1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1BC:
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1BE
; Address: $C4DCD1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1BE:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $1F              ; F0 1F | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1C0
; Address: $C4DCE2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1C0:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1C2
; Address: $C4DCF0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1C2:
    JSR $2200            ; 20 00 22 | Jump to subroutine
    BVS $CB              ; 70 CB | Branch if overflow set
    REP #$52             ; C2 52 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1C3
; Address: $C4DCF7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1C3:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    BPL $D4              ; 10 D4 | Branch if positive
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0018           ; F4 18 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1C4
; Address: $C4DD06
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1C4:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    BMI $1D              ; 30 1D | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0018           ; F4 18 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1C5
; Address: $C4DD17
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1C5:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BNE $0C              ; D0 0C | Branch if not equal
    LDA #$42             ; A9 42 | Hardware register operation
    STA $23E4            ; 8D E4 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1C6
; Address: $C4DD24
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1C6:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0007           ; F4 07 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1C7
; Address: $C4DD33
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1C7:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    BMI $0D              ; 30 0D | Branch if negative
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0007           ; F4 07 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1C9
; Address: $C4DD4A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1C9:
    STZ $23B2            ; 9C B2 23 | Store zero to absolute
    STZ $23B4            ; 9C B4 23 | Store zero to absolute
    STZ $23B6            ; 9C B6 23 | Store zero to absolute
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1CA
; Address: $C4DD56
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1CA:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX #$17             ; A2 17 | Load immediate value into X register
    LDY #$2E             ; A0 2E | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1CB
; Address: $C4DD65
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1CB:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $29              ; F0 29 | Branch if equal
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1CC
; Address: $C4DD72
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1CC:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    LDA #$00             ; A9 00 | Read graphics status
    BCS $1C              ; B0 1C | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1CF
; Address: $C4DD88
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1CF:
    JSL $C01457          ; 22 57 14 C0 | Jump to subroutine long
    PHX                  ; DA | Push X register to stack
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1D0
; Address: $C4DD90
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1D0:
    JSL $C010D6          ; 22 D6 10 C0 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    LDA $01              ; A5 01 | Read graphics status
    INC                  ; 1A | Increment accumulator
    STA $2484,Y          ; 99 84 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1D1
; Address: $C4DD9B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1D1:
    JSL $C2CA98          ; 22 98 CA C2 | Jump to subroutine long
    EOR $20              ; 45 20 | Exclusive OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEX                  ; CA | Decrement X register
    BPL $BF              ; 10 BF | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1D2
; Address: $C4DDA6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1D2:
    JSR $5DAC            ; 20 AC 5D | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1D3
; Address: $C4DDAC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1D3:
    LDX #$16             ; A2 16 | Load immediate value into X register
    LDA #$FF             ; A9 FF | Read graphics status
    STA $23B8,X          ; 9D B8 23 | Update graphics data
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F9              ; 10 F9 | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA #$FF             ; A9 FF | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1D4
; Address: $C4DDBF
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1D4:
    STA $00              ; 85 00 | Update graphics data
    INC                  ; 1A | Increment accumulator
    TAX                  ; AA | Transfer accumulator to X register
    CMP $2484,X          ; DD 84 24 | Compare accumulator (absolute,X)
    BCS $05              ; B0 05 | Branch if carry set
    LDA $2484,X          ; BD 84 24 | Read graphics status
    STX $00              ; 86 00 | Store X register to zero page
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BCC $EF              ; 90 EF | Branch if carry clear
    LDX $00              ; A6 00 | Load from zero page into X register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $12              ; F0 12 | Branch if equal
    STZ $2484,X          ; 9E 84 24 | Store zero to absolute,X
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    SEP #$20             ; E2 20 | Set processor status bits
    STA $23B8,Y          ; 99 B8 23 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    INY                  ; C8 | Increment Y register
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    BCC $CF              ; 90 CF | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1D5
; Address: $C4DDEE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1D5:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$0030           ; F4 30 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1D6
; Address: $C4DE03
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1D6:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCS $44              ; B0 44 | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1D7
; Address: $C4DE0C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1D7:
    JSL $C2B9A6          ; 22 A6 B9 C2 | Jump to subroutine long
    TAX                  ; AA | Transfer accumulator to X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    DEX                  ; CA | Decrement X register
    BMI $39              ; 30 39 | Branch if negative

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1D9
; Address: $C4DE1C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1D9:
    JSL $C2B931          ; 22 31 B9 C2 | Jump to subroutine long
    PHX                  ; DA | Push X register to stack
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1DC
; Address: $C4DE2C
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1DC:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BIT $25B0            ; 2C B0 25 | Test bits in accumulator (absolute)
    PHX                  ; DA | Push X register to stack
    LDX #$0A             ; A2 0A | Load immediate value into X register
    PLB                  ; AB | Pull data bank register from stack
    LSR $F0C2,X          ; 5E C2 F0 | Logical shift right (absolute,X)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F6              ; 10 F6 | Branch if positive
    LDX #$00             ; A2 00 | Load immediate value into X register
    LSR $B0FA,X          ; 5E FA B0 | Logical shift right (absolute,X)
    INY                  ; C8 | Increment Y register
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    BCC $C4              ; 90 C4 | Branch if carry clear
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1DD
; Address: $C4DE58
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1DD:
    DEY                  ; 88 | Decrement Y register
    BMI $B1              ; 30 B1 | Branch if negative
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1DE
; Address: $C4DE5C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1DE:
    JSR $5E63            ; 20 63 5E | Jump to subroutine
    BCS $F7              ; B0 F7 | Branch if carry set
    BRA $B9              ; 80 B9 | Branch always
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1E9
; Address: $C4DE9A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1E9:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ROL $B0              ; 26 B0 | Rotate left (zero page)
    PLX                  ; FA | Pull X register from stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1EB
; Address: $C4DEA4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1EB:
    JSL $C2B4F1          ; 22 F1 B4 C2 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1EC
; Address: $C4DEAD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1EC:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $C300,Y          ; 19 00 C3 | Logical OR with accumulator (absolute,Y)
    LSR $5F97,X          ; 5E 97 5F | Logical shift right (absolute,X)
    INX                  ; E8 | Increment X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1EE
; Address: $C4DEC3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1EE:
    JSR $5F39            ; 20 39 5F | Jump to subroutine
    BCC $02              ; 90 02 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1EF
; Address: $C4DECA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1EF:
    JSL $C3233B          ; 22 3B 23 C3 | Jump to subroutine long
    BMI $22              ; 30 22 | Branch if negative
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)
    AND $55B0            ; 2D B0 55 | Logical AND with accumulator (absolute)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BNE $51              ; D0 51 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1F0
; Address: $C4DEDB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1F0:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BMI $B0              ; 30 B0 | Branch if negative
    EOR #$C9             ; 49 C9 | Exclusive OR with accumulator (immediate)
    BEQ $E3              ; F0 E3 | Branch if equal
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1F1
; Address: $C4DEEA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1F1:
    JSL $C2AF66          ; 22 66 AF C2 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1F3
; Address: $C4DEF6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1F3:
    JSR $00FE            ; 20 FE 00 | Jump to subroutine
    PHY                  ; 5A | Push Y register to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2428            ; AD 28 24 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    STY $2428            ; 8C 28 24 | Store Y register to absolute address
    LDA #$01             ; A9 01 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1F6
; Address: $C4DF10
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1F6:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$02             ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1F9
; Address: $C4DF22
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1F9:
    JSR $0003            ; 20 03 00 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Update graphics data
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1FC
; Address: $C4DF34
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1FC:
    JSR $00FE            ; 20 FE 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_1FE
; Address: $C4DF3C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_1FE:
    JSL $C2B8AA          ; 22 AA B8 C2 | Jump to subroutine long
    LDA $242C            ; AD 2C 24 | Read graphics status
    LDX #$12             ; A2 12 | Load immediate value into X register
    REP #$F0             ; C2 F0 | Reset processor status bits
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F6              ; 10 F6 | Branch if positive
    LDA #$01             ; A9 01 | Read graphics status
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_200
; Address: $C4DF5B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_200:
    JSR $01FF            ; 20 FF 01 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_201
; Address: $C4DF60
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_201:
    LDA #$AC             ; A9 AC | Read graphics status
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    BCC $EB              ; 90 EB | Branch if carry clear
    LDX $2428            ; AE 28 24 | Load from absolute address into X register
    LDA #$AD             ; A9 AD | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_205
; Address: $C4DF7E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_205:
    JSR $00FE            ; 20 FE 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_206
; Address: $C4DF85
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_206:
    JSL $003C00          ; 22 00 3C 00 | Jump to subroutine long
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_208
; Address: $C4DF9F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_208:
    JSR $1222            ; 20 22 12 | Jump to subroutine
    ROL                  ; 2A | Rotate left (accumulator)
    CPY $FF              ; C4 FF | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_20A
; Address: $C4DFA7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_20A:
    JSL $C456E7          ; 22 E7 56 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDA $4197            ; AD 97 41 | Read graphics status
    BEQ $1C              ; F0 1C | Branch if equal
    STX $33B8            ; 8E B8 33 | Store X register to absolute address
    STY $33BA            ; 8C BA 33 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_20B
; Address: $C4DFB8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_20B:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $15              ; B0 15 | Branch if carry set
    STA $242A            ; 8D 2A 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_20D
; Address: $C4DFC8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_20D:
    JSR $5FDE            ; 20 DE 5F | Jump to subroutine
    BCS $E5              ; B0 E5 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_20E
; Address: $C4DFCE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_20E:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_20F
; Address: $C4DFD6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_20F:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDX $2428            ; AE 28 24 | Load from absolute address into X register
    LDA $242A            ; AD 2A 24 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_212
; Address: $C4DFEF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_212:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_213
; Address: $C4DFFA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_213:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_216
; Address: $C4E015
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_216:
    JSR $00FE            ; 20 FE 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_21E
; Address: $C4E02E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_21E:
    BVC $60              ; 50 60 | Branch if overflow clear
    STY $9160            ; 8C 60 91 | Store Y register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_226
; Address: $C4E044
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_226:
    BRA $FE              ; 80 FE | Branch always
    LDA #$40             ; A9 40 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_227
; Address: $C4E04B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_227:
    LDA $2428            ; AD 28 24 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_229
; Address: $C4E057
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_229:
    JSL $B031C3          ; 22 C3 31 B0 | Jump to subroutine long
    AND $C9              ; 25 C9 | Logical AND with accumulator (zero page)
    BNE $21              ; D0 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_22A
; Address: $C4E061
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_22A:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    ROL $19B0            ; 2E B0 19 | Rotate left (absolute)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $E3              ; F0 E3 | Branch if equal
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    LDX $2428            ; AE 28 24 | Load from absolute address into X register
    LDA #$02             ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_22C
; Address: $C4E07C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_22C:
    JSR $0003            ; 20 03 00 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_22E
; Address: $C4E084
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_22E:
    JSL $C2AF66          ; 22 66 AF C2 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_231
; Address: $C4E091
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_231:
    LDA #$42             ; A9 42 | Hardware register operation
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_232
; Address: $C4E096
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_232:
    JSL $C3233B          ; 22 3B 23 C3 | Jump to subroutine long
    AND ($22),Y          ; 31 22 | Logical AND with accumulator ((zero page),Y)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)
    ROL $28B0            ; 2E B0 28 | Rotate left (absolute)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BNE $24              ; D0 24 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_233
; Address: $C4E0A7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_233:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    AND ($B0),Y          ; 31 B0 | Logical AND with accumulator ((zero page),Y)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $E3              ; F0 E3 | Branch if equal
    PHY                  ; 5A | Push Y register to stack
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_234
; Address: $C4E0B5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_234:
    JSL $C2AF66          ; 22 66 AF C2 | Jump to subroutine long
    LDY $2428            ; AC 28 24 | Load from absolute address into Y register
    LDA #$02             ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_236
; Address: $C4E0C4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_236:
    JSR $0003            ; 20 03 00 | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_237
; Address: $C4E0CB
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_237:
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_238
; Address: $C4E0D0
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_238:
    LDA #$41             ; A9 41 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_23A
; Address: $C4E0DD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_23A:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_23B
; Address: $C4E0E3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_23B:
    LDA #$43             ; A9 43 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_23C
; Address: $C4E0E8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_23C:
    LDA $C2D13F          ; AF 3F D1 C2 | Read graphics status
    BNE $1B              ; D0 1B | Branch if not equal
    LDX $2428            ; AE 28 24 | Load from absolute address into X register
    LDA #$68             ; A9 68 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_242
; Address: $C4E109
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_242:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    LDA ($B0),Y          ; B1 B0 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    STA $242A            ; 8D 2A 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_243
; Address: $C4E113
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_243:
    JSR $5FDE            ; 20 DE 5F | Jump to subroutine
    BCS $F1              ; B0 F1 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_244
; Address: $C4E119
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_244:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $39              ; F0 39 | Branch if equal
    STY $33B8            ; 8C B8 33 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_245
; Address: $C4E128
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_245:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $3B              ; B0 3B | Branch if carry set
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_246
; Address: $C4E132
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_246:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    ROL $FF20,X          ; 3E 20 FF | Rotate left (absolute,X)
    LDA #$01             ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_249
; Address: $C4E148
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_249:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    AND $FF20,X          ; 3D 20 FF | Logical AND with accumulator (absolute,X)
    STA $242C            ; 8D 2C 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_24B
; Address: $C4E158
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_24B:
    JSR $5FDE            ; 20 DE 5F | Jump to subroutine
    BCS $C8              ; B0 C8 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_24D
; Address: $C4E164
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_24D:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_24E
; Address: $C4E16C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_24E:
    LDA $2428            ; AD 28 24 | Read graphics status
    STA $23E4            ; 8D E4 23 | Update graphics data
    LDA $242C            ; AD 2C 24 | Read graphics status
    STA $BE79            ; 8D 79 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_250
; Address: $C4E180
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_250:
    JSL $C451E2          ; 22 E2 51 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    BCS $5A              ; B0 5A | Branch if carry set
    STA $242A            ; 8D 2A 24 | Update graphics data
    CMP #$76             ; C9 76 | Compare accumulator (immediate)
    BNE $0C              ; D0 0C | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_251
; Address: $C4E192
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_251:
    JSL $C42E19          ; 22 19 2E C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    CMP #$01             ; C9 01 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_252
; Address: $C4E19C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_252:
    BNE $46              ; D0 46 | Branch if not equal
    LDA $242A            ; AD 2A 24 | Read graphics status
    CMP #$E2             ; C9 E2 | Compare accumulator (immediate)
    BEQ $14              ; F0 14 | Branch if equal
    CMP #$E3             ; C9 E3 | Compare accumulator (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    CMP #$E4             ; C9 E4 | Compare accumulator (immediate)
    BEQ $0A              ; F0 0A | Branch if equal
    CMP #$E9             ; C9 E9 | Compare accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    CMP #$EA             ; C9 EA | Compare accumulator (immediate)
    BNE $0C              ; D0 0C | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_253
; Address: $C4E1BA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_253:
    JSL $C42E19          ; 22 19 2E C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $16              ; F0 16 | Branch if equal
    LDA $242A            ; AD 2A 24 | Read graphics status
    CMP #$E5             ; C9 E5 | Compare accumulator (immediate)
    BNE $0C              ; D0 0C | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_254
; Address: $C4E1CE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_254:
    JSL $C46951          ; 22 51 69 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $02              ; D0 02 | Branch if not equal
    BRA $06              ; 80 06 | Branch always
    LDA #$6B             ; A9 6B | Read graphics status
    STA $242A            ; 8D 2A 24 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_256
; Address: $C4E1E6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_256:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $35              ; F0 35 | Branch if equal
    STY $33B8            ; 8C B8 33 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_258
; Address: $C4E1FC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_258:
    JSR $6235            ; 20 35 62 | Jump to subroutine
    BCS $F1              ; B0 F1 | Branch if carry set
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_25B
; Address: $C4E20E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_25B:
    JSR $4022            ; 20 22 40 | Jump to subroutine
    REP #$C2             ; C2 C2 | Reset processor status bits
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    DEX                  ; CA | Decrement X register
    REP #$41             ; C2 41 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_25F
; Address: $C4E224
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_25F:
    JSR $6038            ; 20 38 60 | Jump to subroutine
    LDA $2428            ; AD 28 24 | Read graphics status
    STA $23E4            ; 8D E4 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_260
; Address: $C4E22D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_260:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_261
; Address: $C4E235
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_261:
    LDA $2428            ; AD 28 24 | Read graphics status
    STA $23E4            ; 8D E4 23 | Update graphics data
    LDA $33BC            ; AD BC 33 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_262
; Address: $C4E23E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_262:
    JSL $C44C1B          ; 22 1B 4C C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BCC $4C              ; 90 4C | Branch if carry clear
    BVS $18              ; 70 18 | Branch if overflow set
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $33BE            ; AD BE 33 | Read graphics status
    STA $BE79            ; 8D 79 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_263
; Address: $C4E253
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_263:
    JSL $C44FE2          ; 22 E2 4F C4 | Jump to subroutine long
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BEQ $2D              ; F0 2D | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BRA $29              ; 80 29 | Branch always
    LDX #$04             ; A2 04 | Load immediate value into X register
    LDA $33BE            ; AD BE 33 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_265
; Address: $C4E26E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_265:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    STA $BE79            ; 8D 79 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_266
; Address: $C4E279
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_266:
    JSL $C446D6          ; 22 D6 46 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    LDA $33BC            ; AD BC 33 | Read graphics status
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BCC $02              ; 90 02 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA                  ; BF 95 62 C2 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_267
; Address: $C4E28F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_267:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_268
; Address: $C4E295
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_268:
    PHY                  ; 5A | Push Y register to stack
    ORA ($58,X)          ; 01 58 | Logical OR with accumulator ((zero page,X))
    ORA ($59,X)          ; 01 59 | Logical OR with accumulator ((zero page,X))
    ORA ($5B,X)          ; 01 5B | Logical OR with accumulator ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROL $C1E3            ; 2E E3 C1 | Rotate left (absolute)
    LDA #$42             ; A9 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_269
; Address: $C4E2A6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_269:
    STA $23E4            ; 8D E4 23 | Update graphics data
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0010           ; F4 10 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_26C
; Address: $C4E2BD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_26C:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$03             ; 29 03 | Logical AND with accumulator (immediate)
    STA $00              ; 85 00 | Update graphics data
    PEA #$23AF           ; F4 AF 23 | Push effective address to stack
    PEA #$0003           ; F4 03 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_26D
; Address: $C4E2CF
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_26D:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 6B 63 C2 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    BCC $21              ; 90 21 | PPU graphics register access
    LDA #$03             ; A9 03 | Read graphics status
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_270
; Address: $C4E2F5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_270:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LDY #$04             ; A0 04 | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_271
; Address: $C4E300
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_271:
    PEA #$23AF           ; F4 AF 23 | Push effective address to stack
    PEA #$0003           ; F4 03 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_272
; Address: $C4E309
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_272:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    LDA #$04             ; A9 04 | Read graphics status
    PEA #$23AF           ; F4 AF 23 | Push effective address to stack
    PEA #$0003           ; F4 03 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_273
; Address: $C4E31F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_273:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    LDA #$02             ; A9 02 | Read graphics status
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$0030           ; F4 30 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_278
; Address: $C4E345
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_278:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $04              ; 90 04 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_279
; Address: $C4E34D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_279:
    JSL $C2B52D          ; 22 2D B5 C2 | Jump to subroutine long
    DEX                  ; CA | Decrement X register
    BPL $E2              ; 10 E2 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_27C
; Address: $C4E360
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_27C:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDY #$04             ; A0 04 | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_27D
; Address: $C4E36C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_27D:
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$0030           ; F4 30 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_27E
; Address: $C4E378
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_27E:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $1F              ; F0 1F | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_27F
; Address: $C4E381
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_27F:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    DEC $C2B9            ; CE B9 C2 | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    ADC #$0A             ; 69 0A | Add with carry (immediate)
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_280
; Address: $C4E392
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_280:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BCS $02              ; B0 02 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_282
; Address: $C4E3A2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_282:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_283
; Address: $C4E3AF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_283:
    JSR $63C0            ; 20 C0 63 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    CPX #$18             ; E0 18 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_285
; Address: $C4E3BA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_285:
    JSR $5DAC            ; 20 AC 5D | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_287
; Address: $C4E3C6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_287:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $65              ; F0 65 | Branch if equal
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_28E
; Address: $C4E3F3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_28E:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR $20              ; 45 20 | Exclusive OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    INC                  ; 1A | Increment accumulator
    STA $2484,Y          ; 99 84 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_297
; Address: $C4E427
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_297:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    AND $FE20,Y          ; 39 20 FE | Logical AND with accumulator (absolute,Y)
    STA $2430            ; 8D 30 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_299
; Address: $C4E436
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_299:
    STZ $00              ; 64 00 | Store zero to zero page
    LDA $242A            ; AD 2A 24 | Read graphics status
    CMP #$42             ; C9 42 | Hardware register operation
    BNE $05              ; D0 05 | Branch if not equal
    LDA #$00             ; A9 00 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    STA $00              ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_29C
; Address: $C4E449
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_29C:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCS $13              ; B0 13 | Branch if carry set
    LDA $242A            ; AD 2A 24 | Read graphics status
    CMP #$68             ; C9 68 | Compare accumulator (immediate)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA #$01             ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_29D
; Address: $C4E45B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_29D:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_29E
; Address: $C4E464
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_29E:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $23B8,Y          ; B9 B8 23 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $07              ; B0 07 | Branch if carry set
    STA $2428            ; 8D 28 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_29F
; Address: $C4E47E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_29F:
    JSL $C2648B          ; 22 8B 64 C2 | Jump to subroutine long
    INY                  ; C8 | Increment Y register
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    BCC $E8              ; 90 E8 | Branch if carry clear
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2A0
; Address: $C4E48B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2A0:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2A1
; Address: $C4E49A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2A1:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $4E              ; F0 4E | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2AE
; Address: $C4E4DF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2AE:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    ASL $02C9            ; 0E C9 02 | Arithmetic shift left (absolute)
    BEQ $05              ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2B0
; Address: $C4E4EE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2B0:
    JSL $C2B4F1          ; 22 F1 B4 C2 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2B1
; Address: $C4E4FA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2B1:
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$0030           ; F4 30 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2B2
; Address: $C4E503
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2B2:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $1E              ; F0 1E | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    BEQ $1D              ; F0 1D | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    BEQ $29              ; F0 29 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2B4
; Address: $C4E514
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2B4:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $09              ; B0 09 | Branch if carry set
    LDA #$02             ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2B5
; Address: $C4E51F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2B5:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    BNE $02              ; D0 02 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2B8
; Address: $C4E52E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2B8:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $EF              ; 90 EF | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2BB
; Address: $C4E53D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2BB:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $E0              ; B0 E0 | Game work RAM access
    LDA #$03             ; A9 03 | Read graphics status
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$0030           ; F4 30 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2BC
; Address: $C4E551
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2BC:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    BRA $D0              ; 80 D0 | Branch always
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2C4
; Address: $C4E581
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2C4:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR $FF20            ; 4D 20 FF | Exclusive OR with accumulator (absolute)
    DEY                  ; 88 | Decrement Y register
    BEQ $4D              ; F0 4D | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2CA
; Address: $C4E5A9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2CA:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    LSR $FF20            ; 4E 20 FF | Logical shift right (absolute)
    DEY                  ; 88 | Decrement Y register
    BEQ $25              ; F0 25 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2CE
; Address: $C4E5C6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2CE:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    AND $FE20,Y          ; 39 20 FE | Logical AND with accumulator (absolute,Y)
    LDA $2470            ; AD 70 24 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2D2
; Address: $C4E5DA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2D2:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2D5
; Address: $C4E5EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2D5:
    JSR $66AB            ; 20 AB 66 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2D8
; Address: $C4E5FF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2D8:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $17              ; B0 17 | Branch if carry set
    LDY $242A            ; AC 2A 24 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2D9
; Address: $C4E60A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2D9:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2DF
; Address: $C4E62C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2DF:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    BEQ $25              ; F0 25 | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    CLI                  ; 58 | Clear interrupt disable flag
    ROR $A0              ; 66 A0 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2E0
; Address: $C4E63C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2E0:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $05              ; D0 05 | Branch if not equal
    CPX $00              ; E4 00 | Compare X register (zero page)
    BEQ $04              ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2E1
; Address: $C4E64C
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2E1:
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    BRA $EC              ; 80 EC | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2E2
; Address: $C4E650
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2E2:
    JSL $C2AF66          ; 22 66 AF C2 | Jump to subroutine long
    STX $2430            ; 8E 30 24 | Store X register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2E4
; Address: $C4E659
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2E4:
    ROR $63              ; 66 63 | Rotate right (zero page)
    ROR $74              ; 66 74 | Rotate right (zero page)
    ROR $8C              ; 66 8C | Rotate right (zero page)
    ROR $64              ; 66 64 | Rotate right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2E6
; Address: $C4E668
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2E6:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $02              ; 90 02 | Branch if carry clear
    INC $00              ; E6 00 | Increment (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2E8
; Address: $C4E679
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2E8:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $09              ; 90 09 | Branch if carry clear
    INC $00              ; E6 00 | Increment (zero page)
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BCC $02              ; 90 02 | Branch if carry clear
    INC $00              ; E6 00 | Increment (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2EA
; Address: $C4E691
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2EA:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $10              ; 90 10 | Branch if carry clear
    INC $00              ; E6 00 | Increment (zero page)
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BCC $09              ; 90 09 | Branch if carry clear
    INC $00              ; E6 00 | Increment (zero page)
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BCC $02              ; 90 02 | Branch if carry clear
    INC $00              ; E6 00 | Increment (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2EC
; Address: $C4E6AE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2EC:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    ADC $8018,Y          ; 79 18 80 | Add with carry (absolute,Y)
    BEQ $11              ; F0 11 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2F2
; Address: $C4E6D2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2F2:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $31              ; B0 31 | Branch if carry set
    TAX                  ; AA | Transfer accumulator to X register
    LDA $2462,X          ; BD 62 24 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2430            ; 8D 30 24 | Update graphics data
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2F5
; Address: $C4E6F1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2F5:
    JSL $C2C766          ; 22 66 C7 C2 | Jump to subroutine long
    PHX                  ; DA | Push X register to stack
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2F6
; Address: $C4E6FA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2F6:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    BCC $0A              ; 90 0A | Branch if carry clear
    STA $2430            ; 8D 30 24 | Update graphics data
    SEP #$20             ; E2 20 | Set processor status bits
    STA $2462,X          ; 9D 62 24 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2F7
; Address: $C4E70C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2F7:
    LDA $2428            ; AD 28 24 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    LDX $2430            ; AE 30 24 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2F8
; Address: $C4E717
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2F8:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    BEQ $05              ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2F9
; Address: $C4E722
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2F9:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2FB
; Address: $C4E730
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2FB:
    JSL $C2CAE0          ; 22 E0 CA C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BEQ $12              ; F0 12 | Branch if equal
    LDA #$AA             ; A9 AA | Read graphics status
    STA $242A            ; 8D 2A 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2FD
; Address: $C4E745
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2FD:
    LDA #$08             ; A9 08 | Read graphics status
    STA $2470            ; 8D 70 24 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_2FF
; Address: $C4E751
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_2FF:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    LDA $23B0,X          ; BD B0 23 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $246C            ; 8D 6C 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_300
; Address: $C4E75E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_300:
    JSL $C2C573          ; 22 73 C5 C2 | Jump to subroutine long
    STA $246E            ; 8D 6E 24 | Update graphics data
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $2472            ; 8D 72 24 | Update graphics data
    LDA $246E            ; AD 6E 24 | Read graphics status
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $B067            ; AD 67 B0 | Read graphics status
    LDA $2470            ; AD 70 24 | Read graphics status
    STA $00              ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_303
; Address: $C4E787
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_303:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    LDA $2470            ; AD 70 24 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_304
; Address: $C4E78E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_304:
    JSL $C014F2          ; 22 F2 14 C0 | Jump to subroutine long
    SEP #$20             ; E2 20 | Set processor status bits
    ORA $23B0,X          ; 1D B0 23 | Logical OR with accumulator (absolute,X)
    STA $23B0,X          ; 9D B0 23 | Update graphics data
    REP #$20             ; C2 20 | Reset processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_306
; Address: $C4E7A3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_306:
    JSR $6A07            ; 20 07 6A | Jump to subroutine
    LDA #$08             ; A9 08 | Read graphics status
    STA $2470            ; 8D 70 24 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_308
; Address: $C4E7B5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_308:
    JSR $67DC            ; 20 DC 67 | Jump to subroutine
    BCS $12              ; B0 12 | Branch if carry set
    LDA $2470            ; AD 70 24 | Read graphics status
    STA $00              ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_30A
; Address: $C4E7C7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_30A:
    JSR $68ED            ; 20 ED 68 | Jump to subroutine
    BCS $01              ; B0 01 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_30C
; Address: $C4E7D0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_30C:
    JSL $C014F2          ; 22 F2 14 C0 | Jump to subroutine long
    ORA $246C            ; 0D 6C 24 | Logical OR with accumulator (absolute)
    STA $246C            ; 8D 6C 24 | Update graphics data
    BRA $D9              ; 80 D9 | Branch always
    LDA $246C            ; AD 6C 24 | Read graphics status
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BCC $0A              ; 90 0A | Branch if carry clear
    BNE $02              ; D0 02 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_30D
; Address: $C4E7E8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_30D:
    STA $C2D13F          ; 8F 3F D1 C2 | Update graphics data
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_30E
; Address: $C4E7EE
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_30E:
    STA $00              ; 85 00 | Update graphics data
    PHY                  ; 5A | Push Y register to stack
    SEP #$20             ; E2 20 | Set processor status bits
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDX $2472            ; AE 72 24 | Load from absolute address into X register
    LDA #$00             ; A9 00 | Read graphics status
    LSR $00              ; 46 00 | Logical shift right (zero page)
    BCS $05              ; B0 05 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    CMP $C268            ; CD 68 C2 | Compare accumulator (absolute)
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BCC $F0              ; 90 F0 | Branch if carry clear
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_30F
; Address: $C4E80C
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_30F:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDX $2472            ; AE 72 24 | Load from absolute address into X register
    LDA $246C            ; AD 6C 24 | Read graphics status
    STA $00              ; 85 00 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    LSR $00              ; 46 00 | Logical shift right (zero page)
    BCS $07              ; B0 07 | Branch if carry set
    SEC                  ; 38 | Set carry flag
    CMP $C268            ; CD 68 C2 | Compare accumulator (absolute)
    BCC $07              ; 90 07 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    BCC $EE              ; 90 EE | Branch if carry clear
    STY $2470            ; 8C 70 24 | Store Y register to absolute address
    STZ $2471            ; 9C 71 24 | Store zero to absolute
    REP #$20             ; C2 20 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_311
; Address: $C4E83A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_311:
    JSR $6881            ; 20 81 68 | Jump to subroutine
    BCS $17              ; B0 17 | Branch if carry set
    LDA $2470            ; AD 70 24 | Read graphics status
    STA $00              ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_314
; Address: $C4E851
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_314:
    JSR $68B3            ; 20 B3 68 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_315
; Address: $C4E856
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_315:
    JSR $68B3            ; 20 B3 68 | Jump to subroutine
    LDA $246C            ; AD 6C 24 | Read graphics status
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BCC $D9              ; 90 D9 | Branch if carry clear
    BNE $02              ; D0 02 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_316
; Address: $C4E865
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_316:
    STA $C2D13F          ; 8F 3F D1 C2 | Update graphics data
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_318
; Address: $C4E86E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_318:
    JSL $C014F2          ; 22 F2 14 C0 | Jump to subroutine long
    ORA $246C            ; 0D 6C 24 | Logical OR with accumulator (absolute)
    STA $246C            ; 8D 6C 24 | Update graphics data
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BCC $BD              ; 90 BD | Branch if carry clear
    BNE $E6              ; D0 E6 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_31A
; Address: $C4E886
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_31A:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $2472            ; 6D 72 24 | Add with carry (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF CD 68 C2 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $00              ; 85 00 | Update graphics data
    LDA $246C            ; AD 6C 24 | Read graphics status
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    STA $00              ; 85 00 | Update graphics data
    STZ $02              ; 64 02 | Store zero to zero page
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_31B
; Address: $C4E8A6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_31B:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $05              ; 90 05 | Branch if carry clear
    STA $2470            ; 8D 70 24 | Update graphics data
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_31F
; Address: $C4E8B8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_31F:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    LDA #$00             ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_324
; Address: $C4E8D3
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_324:
    JSR $1220            ; 20 20 12 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    ASL $2622,X          ; 1E 22 26 | Arithmetic shift left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $0402            ; 2E 02 04 | Rotate left (absolute)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $01C8            ; 0E C8 01 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $DA              ; 80 DA | Branch always
    PHY                  ; 5A | Push Y register to stack
    LDX $242A            ; AE 2A 24 | Load from absolute address into X register
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_326
; Address: $C4E901
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_326:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BEQ $45              ; F0 45 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_327
; Address: $C4E90B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_327:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    ASL $13F0            ; 0E F0 13 | Arithmetic shift left (absolute)
    DEC                  ; 3A | Decrement accumulator
    BEQ $1A              ; F0 1A | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_329
; Address: $C4E91B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_329:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    STZ $18              ; 64 18 | Store zero to zero page
    BRA $25              ; 80 25 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_32A
; Address: $C4E925
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_32A:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BRA $1B              ; 80 1B | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_330
; Address: $C4E94A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_330:
    JSR $695A            ; 20 5A 69 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_331
; Address: $C4E950
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_331:
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    LDA #$40             ; A9 40 | Read graphics status
    STA $2430            ; 8D 30 24 | Update graphics data
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_332
; Address: $C4E95A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_332:
    CMP #$47             ; C9 47 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDY $2428            ; AC 28 24 | Load from absolute address into Y register
    ADC ($69),Y          ; 71 69 | Add with carry ((zero page),Y)
    BCC $07              ; 90 07 | Branch if carry clear
    LDA #$40             ; A9 40 | Read graphics status
    STA $2430            ; 8D 30 24 | Update graphics data
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_333
; Address: $C4E972
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_333:
    ADC #$07             ; 69 07 | Add with carry (immediate)
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    STZ $6A              ; 64 6A | Store zero to zero page
    LDX #$6A             ; A2 6A | Load immediate value into X register
    LDX $BE6A            ; AE 6A BE | Load from absolute address into X register
    ROR                  ; 6A | Rotate right (accumulator)
    SBC $0F6A            ; ED 6A 0F | Subtract with carry (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_339
; Address: $C4E993
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_339:
    BCC $6B              ; 90 6B | Branch if carry clear
    CMP $6B              ; C5 6B | Compare accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_33B
; Address: $C4E99B
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_33B:
    PHP                  ; 08 | Push processor status to stack
    JMP ($6C29)          ; 6C 29 6C | Jump to address (absolute indirect)
    DEC                  ; 3A | Decrement accumulator
    JMP ($6C49)          ; 6C 49 6C | Jump to address (absolute indirect)
    LSR $6D6C,X          ; 5E 6C 6D | Logical shift right (absolute,X)
    JMP ($6C7E)          ; 6C 7E 6C | Jump to address (absolute indirect)
    STA $9E6C            ; 8D 6C 9E | Update graphics data
    JMP ($6CAD)          ; 6C AD 6C | Jump to address (absolute indirect)
    JMP ($6CE1)          ; 6C E1 6C | Jump to address (absolute indirect)
    JMP ($6D01)          ; 6C 01 6D | Jump to address (absolute indirect)
    ORA $1C6D            ; 0D 6D 1C | Logical OR with accumulator (absolute)
    ADC $6D2D            ; 6D 2D 6D | Add with carry (absolute)
    ADC $6D4D            ; 6D 4D 6D | Add with carry (absolute)
    ROR $7F6D            ; 6E 6D 7F | Rotate right (absolute)
    ADC $6DA0            ; 6D A0 6D | Add with carry (absolute)
    LDA ($6D),Y          ; B1 6D | Read graphics status
    ADC $6DE3            ; 6D E3 6D | Add with carry (absolute)
    ROR $6E13            ; 6E 13 6E | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_33C
; Address: $C4E9D1
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_33C:
    JSL $6E316E          ; 22 6E 31 6E | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    ROR $6E4F            ; 6E 4F 6E | Rotate right (absolute)
    LSR $6D6E,X          ; 5E 6E 6D | Logical shift right (absolute,X)
    ROR $6E8E            ; 6E 8E 6E | Rotate right (absolute)
    STA $AC6E,X          ; 9D 6E AC | Update graphics data
    ROR $6EC4            ; 6E C4 6E | Rotate right (absolute)
    ROR $6F28            ; 6E 28 6F | Rotate right (absolute)
    AND $446F,X          ; 3D 6F 44 | Logical AND with accumulator (absolute,X)
    ROR $7F6F            ; 6E 6F 7F | Rotate right (absolute)
    ORA $9C6F            ; 0D 6F 9C | Logical OR with accumulator (absolute)
    LDA $D46F,Y          ; B9 6F D4 | Read graphics status
    BVS $A9              ; 70 A9 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    STA $2430            ; 8D 30 24 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_341
; Address: $C4EA16
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_341:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $05              ; 90 05 | Branch if carry clear
    STA $2430            ; 8D 30 24 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_347
; Address: $C4EA32
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_347:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $11              ; 90 11 | Branch if carry clear
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_349
; Address: $C4EA3E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_349:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    STA $2430            ; 8D 30 24 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_34B
; Address: $C4EA4B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_34B:
    LDA #$44             ; A9 44 | Read graphics status
    STA $2430            ; 8D 30 24 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_34F
; Address: $C4EA5F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_34F:
    STY $2430            ; 8C 30 24 | Store Y register to absolute address
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_353
; Address: $C4EA70
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_353:
    JSR $6A13            ; 20 13 6A | Jump to subroutine
    BCS $2C              ; B0 2C | Branch if carry set
    LDA $2430            ; AD 30 24 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_355
; Address: $C4EA7E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_355:
    JSR $6A13            ; 20 13 6A | Jump to subroutine
    BCS $17              ; B0 17 | Branch if carry set
    LDA $2430            ; AD 30 24 | Read graphics status
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CPX #$CA             ; E0 CA | Compare X register (immediate)
    REP #$3C             ; C2 3C | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_358
; Address: $C4EA95
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_358:
    JSR $6A13            ; 20 13 6A | Jump to subroutine
    BCC $05              ; 90 05 | Branch if carry clear
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    BMI $24              ; 30 24 | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_35D
; Address: $C4EAB3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_35D:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    STA $2430            ; 8D 30 24 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_361
; Address: $C4EACA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_361:
    JSR $6A2F            ; 20 2F 6A | Jump to subroutine
    BCS $1D              ; B0 1D | Branch if carry set
    LDA $2430            ; AD 30 24 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_365
; Address: $C4EAE0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_365:
    JSR $6A2F            ; 20 2F 6A | Jump to subroutine
    BCC $05              ; 90 05 | Branch if carry clear
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    BMI $24              ; 30 24 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_366
; Address: $C4EAED
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_366:
    JSR $7019            ; 20 19 70 | Jump to subroutine
    LDA $00              ; A5 00 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LDA $02              ; A5 02 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_367
; Address: $C4EAF6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_367:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    LDA $00              ; A5 00 | Read graphics status
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BNE $08              ; D0 08 | Branch if not equal
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    STA $00              ; 85 00 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_369
; Address: $C4EB0F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_369:
    LDA #$48             ; A9 48 | Read graphics status
    STA $2430            ; 8D 30 24 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_36A
; Address: $C4EB17
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_36A:
    LDA #$43             ; A9 43 | Read graphics status
    STA $2430            ; 8D 30 24 | Update graphics data
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_36C
; Address: $C4EB1F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_36C:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $10              ; D0 10 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_36F
; Address: $C4EB32
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_36F:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    ASL $1320            ; 0E 20 13 | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_370
; Address: $C4EB3B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_370:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $10              ; D0 10 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_373
; Address: $C4EB4E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_373:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    ASL $2F20            ; 0E 20 2F | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_374
; Address: $C4EB57
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_374:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $17              ; D0 17 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_377
; Address: $C4EB6A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_377:
    JSL $C2C766          ; 22 66 C7 C2 | Jump to subroutine long
    ASL $00A5            ; 0E A5 00 | Arithmetic shift left (absolute)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_379
; Address: $C4EB7A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_379:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_37A
; Address: $C4EB82
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_37A:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BCS $03              ; B0 03 | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_37C
; Address: $C4EB90
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_37C:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $29              ; D0 29 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_37D
; Address: $C4EB9B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_37D:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_37F
; Address: $C4EBA3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_37F:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BCS $17              ; B0 17 | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_382
; Address: $C4EBB5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_382:
    JSL $C2C766          ; 22 66 C7 C2 | Jump to subroutine long
    ASL $00A5            ; 0E A5 00 | Arithmetic shift left (absolute)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_388
; Address: $C4EBD6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_388:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $15              ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_38C
; Address: $C4EBEE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_38C:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    ASL $1320            ; 0E 20 13 | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_38F
; Address: $C4EBFF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_38F:
    JSL $C2C766          ; 22 66 C7 C2 | Jump to subroutine long
    BPL $20              ; 10 20 | Branch if positive
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_390
; Address: $C4EC08
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_390:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $15              ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_393
; Address: $C4EC1B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_393:
    JSL $C2C766          ; 22 66 C7 C2 | Jump to subroutine long
    BPL $22              ; 10 22 | Branch if positive
    DEC $C7              ; C6 C7 | Decrement (zero page)
    REP #$0E             ; C2 0E | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_397
; Address: $C4EC31
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_397:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_398
; Address: $C4EC3A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_398:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_39A
; Address: $C4EC49
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_39A:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_39B
; Address: $C4EC50
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_39B:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BCS $03              ; B0 03 | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_39D
; Address: $C4EC5E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_39D:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3A1
; Address: $C4EC75
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3A1:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    BVS $6A              ; 70 6A | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3A2
; Address: $C4EC7E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3A2:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3A6
; Address: $C4EC95
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3A6:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3A7
; Address: $C4EC9E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3A7:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3AB
; Address: $C4ECB5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3AB:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    CPX #$CA             ; E0 CA | Compare X register (immediate)
    REP #$3C             ; C2 3C | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3AD
; Address: $C4ECC2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3AD:
    JSL $C2C766          ; 22 66 C7 C2 | Jump to subroutine long
    LDA $00              ; A5 00 | Read graphics status
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BEQ $03              ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3AF
; Address: $C4ECD2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3AF:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3B3
; Address: $C4ECE9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3B3:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    DEX                  ; CA | Decrement X register
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3B4
; Address: $C4ECF2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3B4:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3B9
; Address: $C4ED0D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3B9:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3C6
; Address: $C4ED4D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3C6:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $15              ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3CA
; Address: $C4ED65
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3CA:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    ASL $2F20            ; 0E 20 2F | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3CF
; Address: $C4ED7F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3CF:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $15              ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3D3
; Address: $C4ED97
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3D3:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    ASL $2F20            ; 0E 20 2F | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3D8
; Address: $C4EDB1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3D8:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $15              ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3DC
; Address: $C4EDC9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3DC:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    ASL $1320            ; 0E 20 13 | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3E1
; Address: $C4EDE3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3E1:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $15              ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3E5
; Address: $C4EDFB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3E5:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    ASL $2F20            ; 0E 20 2F | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3E6
; Address: $C4EE04
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3E6:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3E8
; Address: $C4EE13
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3E8:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3EA
; Address: $C4EE22
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3EA:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3EC
; Address: $C4EE31
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3EC:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3EE
; Address: $C4EE40
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3EE:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3F0
; Address: $C4EE4F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3F0:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3F2
; Address: $C4EE5E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3F2:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3F4
; Address: $C4EE6D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3F4:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $15              ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3F8
; Address: $C4EE85
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3F8:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    ASL $1320            ; 0E 20 13 | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3F9
; Address: $C4EE8E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3F9:
    JSL $C2CAE0          ; 22 E0 CA C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3FB
; Address: $C4EE9D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3FB:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_3FF
; Address: $C4EEB4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_3FF:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    ROL $A5              ; 26 A5 | Rotate left (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BEQ $03              ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_403
; Address: $C4EECC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_403:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    LDA $00              ; A5 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_404
; Address: $C4EED3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_404:
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BEQ $03              ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_407
; Address: $C4EEE0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_407:
    JSL $C2CA62          ; 22 62 CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    STA $2420            ; 8D 20 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_408
; Address: $C4EEE9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_408:
    JSL $C2CAE0          ; 22 E0 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $241E            ; 8D 1E 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_40C
; Address: $C4EF05
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_40C:
    JSR $69FF            ; 20 FF 69 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_40D
; Address: $C4EF0D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_40D:
    JSL $C2CAE0          ; 22 E0 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $0D              ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_40E
; Address: $C4EF17
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_40E:
    JSL $C2CA62          ; 22 62 CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    CMP #$19             ; C9 19 | Compare accumulator (immediate)
    BNE $02              ; D0 02 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_41A
; Address: $C4EF4B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_41A:
    STA $2420            ; 8D 20 24 | Update graphics data
    STZ $241E            ; 9C 1E 24 | Store zero to absolute
    LDA $2428            ; AD 28 24 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_41E
; Address: $C4EF66
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_41E:
    JSR $69FF            ; 20 FF 69 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_424
; Address: $C4EF82
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_424:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_425
; Address: $C4EF8A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_425:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC #$05             ; 69 05 | Add with carry (immediate)
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BCS $03              ; B0 03 | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_42A
; Address: $C4EFAB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_42A:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_430
; Address: $C4EFC6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_430:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_436
; Address: $C4EFE1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_436:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_437
; Address: $C4EFE9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_437:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    STA $2430            ; 8D 30 24 | Update graphics data
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_439
; Address: $C4EFF8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_439:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    STA $2430            ; 8D 30 24 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_43F
; Address: $C4F019
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_43F:
    LDA $2011            ; AD 11 20 | Read graphics status
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $19              ; D0 19 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_441
; Address: $C4F026
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_441:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $06              ; B0 06 | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_443
; Address: $C4F034
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_443:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_446
; Address: $C4F040
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_446:
    LDA $2011            ; AD 11 20 | Read graphics status
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $0F              ; D0 0F | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_448
; Address: $C4F04D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_448:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $D9              ; B0 D9 | Branch if carry set
    BRA $DD              ; 80 DD | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_44B
; Address: $C4F062
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_44B:
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $00              ; A5 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_44D
; Address: $C4F06E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_44D:
    JSR $7075            ; 20 75 70 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_44E
; Address: $C4F075
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_44E:
    LDX #$10             ; A2 10 | Load immediate value into X register
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $01              ; 90 01 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    BNE $F9              ; D0 F9 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_44F
; Address: $C4F080
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_44F:
    PHA                  ; 48 | Push accumulator to stack
    LDA $00              ; A5 00 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LDA $02              ; A5 02 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LDX #$05             ; A2 05 | Load immediate value into X register
    STZ $0A              ; 64 0A | Store zero to zero page
    STZ $0C              ; 64 0C | Store zero to zero page
    STA $00              ; 85 00 | Update graphics data
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_450
; Address: $C4F097
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_450:
    JSL $C2C766          ; 22 66 C7 C2 | Jump to subroutine long
    LDA $00              ; A5 00 | Read graphics status
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BEQ $14              ; F0 14 | Branch if equal
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    BVS $A5              ; 70 A5 | Branch if overflow set
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BNE $09              ; D0 09 | Branch if not equal
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_451
; Address: $C4F0AE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_451:
    JSL $C014F2          ; 22 F2 14 C0 | Jump to subroutine long
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    STA $0A              ; 85 0A | Update graphics data
    DEX                  ; CA | Decrement X register
    BPL $D5              ; 10 D5 | Branch if positive
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_453
; Address: $C4F0C2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_453:
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    STA $2430            ; 8D 30 24 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_454
; Address: $C4F0CD
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_454:
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_455
; Address: $C4F0D2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_455:
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    CMP $FA70,Y          ; D9 70 FA | Compare accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_456
; Address: $C4F0DA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_456:
    BVS $22              ; 70 22 | Branch if overflow set
    ROR $C7              ; 66 C7 | Rotate right (zero page)
    REP #$0E             ; C2 0E | Reset processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_457
; Address: $C4F0E1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_457:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_458
; Address: $C4F0EA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_458:
    JSR $7062            ; 20 62 70 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_459
; Address: $C4F0F2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_459:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHA                  ; 48 | Push accumulator to stack
    LDX $242A            ; AE 2A 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_45B
; Address: $C4F10A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_45B:
    JSR $695A            ; 20 5A 69 | Jump to subroutine
    BCC $07              ; 90 07 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_45C
; Address: $C4F116
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_45C:
    PLA                  ; 68 | Pull accumulator from stack
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_45D
; Address: $C4F11C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_45D:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX $242A            ; AE 2A 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_45E
; Address: $C4F128
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_45E:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_45F
; Address: $C4F133
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_45F:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    PLA                  ; 68 | Pull accumulator from stack
    LDY $2428            ; AC 28 24 | Load from absolute address into Y register
    BVC $71              ; 50 71 | Branch if overflow clear
    BCC $04              ; 90 04 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_460
; Address: $C4F149
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_460:
    JSL $C270F2          ; 22 F2 70 C2 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_461
; Address: $C4F151
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_461:
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    ADC #$78             ; 69 78 | Add with carry (immediate)
    ADC ($C4),Y          ; 71 C4 | Add with carry ((zero page),Y)
    ADC ($4B),Y          ; 71 4B | Add with carry ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    ADC #$98             ; 69 98 | Add with carry (immediate)
    ADC ($C4),Y          ; 71 C4 | Add with carry ((zero page),Y)
    ADC ($4B),Y          ; 71 4B | Add with carry ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    ADC #$CE             ; 69 CE | Add with carry (immediate)
    ADC ($E3),Y          ; 71 E3 | Add with carry ((zero page),Y)
    ADC ($F8),Y          ; 71 F8 | Add with carry ((zero page),Y)
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    ADC #$0D             ; 69 0D | Add with carry (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_462
; Address: $C4F178
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_462:
    LDX #$06             ; A2 06 | Load immediate value into X register
    LDA $242A            ; AD 2A 24 | Read graphics status
    BCC $71              ; 90 71 | Branch if carry clear
    REP #$F0             ; C2 F0 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F6              ; 10 F6 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_465
; Address: $C4F190
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_465:
    JSR $2300            ; 20 00 23 | Jump to subroutine
    ROL $00              ; 26 00 | Rotate left (zero page)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_46A
; Address: $C4F1A5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_46A:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $06              ; F0 06 | Branch if equal
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $07              ; F0 07 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_472
; Address: $C4F1D4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_472:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCC $04              ; 90 04 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_477
; Address: $C4F1E9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_477:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCC $04              ; 90 04 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_47C
; Address: $C4F1FE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_47C:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCC $04              ; 90 04 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_482
; Address: $C4F219
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_482:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $00              ; A5 00 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LDA $02              ; A5 02 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LDY $23E4            ; AC E4 23 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_483
; Address: $C4F22E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_483:
    JSR $7040            ; 20 40 70 | Jump to subroutine
    LDA $00              ; A5 00 | Read graphics status
    STA $00              ; 85 00 | Update graphics data
    LDA $02              ; A5 02 | Read graphics status
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_484
; Address: $C4F247
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_484:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_485
; Address: $C4F24D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_485:
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $00              ; A5 00 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LDA $02              ; A5 02 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LDY $23E4            ; AC E4 23 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_486
; Address: $C4F25C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_486:
    JSR $7019            ; 20 19 70 | Jump to subroutine
    LDA $00              ; A5 00 | Read graphics status
    STA $00              ; 85 00 | Update graphics data
    LDA $02              ; A5 02 | Read graphics status
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_487
; Address: $C4F275
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_487:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_488
; Address: $C4F27F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_488:
    JSL $C2B954          ; 22 54 B9 C2 | Jump to subroutine long
    LDA #$00             ; A9 00 | Read graphics status
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0020           ; F4 20 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_48A
; Address: $C4F296
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_48A:
    JSR $73A1            ; 20 A1 73 | Jump to subroutine
    BCS $46              ; B0 46 | Branch if carry set
    STZ $23D4            ; 9C D4 23 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_48B
; Address: $C4F29E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_48B:
    JSR $7329            ; 20 29 73 | Jump to subroutine
    BCS $65              ; B0 65 | Branch if carry set
    LDA #$00             ; A9 00 | Read graphics status
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_48D
; Address: $C4F2B3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_48D:
    JSR $73B3            ; 20 B3 73 | Jump to subroutine
    BVS $1E              ; 70 1E | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_48E
; Address: $C4F2B9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_48E:
    JSR $7312            ; 20 12 73 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    BCS $17              ; B0 17 | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_490
; Address: $C4F2C2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_490:
    JSR $758C            ; 20 8C 75 | Jump to subroutine
    LDA $23EE            ; AD EE 23 | Read graphics status
    CMP #$A4             ; C9 A4 | Compare accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_492
; Address: $C4F2D0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_492:
    JSL $C2B32F          ; 22 2F B3 C2 | Jump to subroutine long
    BCS $32              ; B0 32 | Branch if carry set
    INC $23D4            ; EE D4 23 | Increment (absolute)
    LDA $23D4            ; AD D4 23 | Read graphics status
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BCC $C2              ; 90 C2 | Branch if carry clear
    INC $23D2            ; EE D2 23 | Increment (absolute)
    LDA $23D2            ; AD D2 23 | Read graphics status
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCC $AA              ; 90 AA | Branch if carry clear
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0020           ; F4 20 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_493
; Address: $C4F2F5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_493:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BNE $14              ; D0 14 | Branch if not equal
    DEC $23D2            ; CE D2 23 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_495
; Address: $C4F302
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_495:
    JSL $C2B32F          ; 22 2F B3 C2 | Jump to subroutine long
    BCC $D9              ; 90 D9 | Branch if carry clear
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_498
; Address: $C4F31A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_498:
    JSR $000C            ; 20 0C 00 | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    BMI $08              ; 30 08 | Branch if negative

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_49B
; Address: $C4F329
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_49B:
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_49D
; Address: $C4F338
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_49D:
    JSL $C0240A          ; 22 0A 24 C0 | Jump to subroutine long
    LDA $7F70            ; AD 70 7F | Read graphics status
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $28              ; F0 28 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_49F
; Address: $C4F348
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_49F:
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4A0
; Address: $C4F351
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4A0:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BEQ $19              ; F0 19 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4A1
; Address: $C4F35A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4A1:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)
    BCS $05              ; B0 05 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $0C              ; F0 0C | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4A2
; Address: $C4F36C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4A2:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4A3
; Address: $C4F373
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4A3:
    LDA #$65             ; A9 65 | Read graphics status
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    LDA #$64             ; A9 64 | Read graphics status
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP ($A9,X)          ; C1 A9 | Compare accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0080           ; F4 80 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4A4
; Address: $C4F38B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4A4:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    LDA #$06             ; A9 06 | Read graphics status
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4A5
; Address: $C4F39B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4A5:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4A6
; Address: $C4F3A1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4A6:
    LDX $23D2            ; AE D2 23 | Load from absolute address into X register
    LDA $23B8,X          ; BD B8 23 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    STA $23E4            ; 8D E4 23 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4A7
; Address: $C4F3B3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4A7:
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address
    STX $23E8            ; 8E E8 23 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4A8
; Address: $C4F3BC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4A8:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $2A              ; F0 2A | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4B1
; Address: $C4F3E9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4B1:
    JSR $7556            ; 20 56 75 | Jump to subroutine
    BCS $05              ; B0 05 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4B3
; Address: $C4F3F3
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4B3:
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4B7
; Address: $C4F406
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4B7:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    AND $FF20,X          ; 3D 20 FF | Logical AND with accumulator (absolute,X)
    STA $23F4            ; 8D F4 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4BA
; Address: $C4F41C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4BA:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    ROL $FF20,X          ; 3E 20 FF | Rotate left (absolute,X)
    STA $23F8            ; 8D F8 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4BB
; Address: $C4F427
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4BB:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    EOR $FF20            ; 4D 20 FF | Exclusive OR with accumulator (absolute)
    STA $23F0            ; 8D F0 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4BF
; Address: $C4F442
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4BF:
    JSR $01FF            ; 20 FF 01 | Jump to subroutine
    BRA $65              ; 80 65 | Branch always
    DEY                  ; 88 | Decrement Y register
    BNE $2F              ; D0 2F | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4C1
; Address: $C4F44F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4C1:
    JSR $00FE            ; 20 FE 00 | Jump to subroutine
    STA $23E6            ; 8D E6 23 | Update graphics data
    LDA #$00             ; A9 00 | Read graphics status
    STA $23F4            ; 8D F4 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4C3
; Address: $C4F461
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4C3:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    LSR $FF20            ; 4E 20 FF | Logical shift right (absolute)
    STA $23F0            ; 8D F0 23 | Update graphics data
    STZ $23F2            ; 9C F2 23 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4C6
; Address: $C4F479
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4C6:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    AND $FE20,Y          ; 39 20 FE | Logical AND with accumulator (absolute,Y)
    STA $23E6            ; 8D E6 23 | Update graphics data
    LDA #$00             ; A9 00 | Read graphics status
    STA $23F4            ; 8D F4 23 | Update graphics data
    STZ $23F6            ; 9C F6 23 | Store zero to absolute
    STZ $23F8            ; 9C F8 23 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4C8
; Address: $C4F495
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4C8:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    STA $23F0            ; 8D F0 23 | Update graphics data
    STZ $23F2            ; 9C F2 23 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4CA
; Address: $C4F4A3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4CA:
    JSR $01FF            ; 20 FF 01 | Jump to subroutine
    CMP #$69             ; C9 69 | Compare accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    BEQ $0A              ; F0 0A | Branch if equal
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    BEQ $04              ; F0 04 | Branch if equal
    STA $23EE            ; 8D EE 23 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4CE
; Address: $C4F4C8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4CE:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BNE $02              ; D0 02 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4CF
; Address: $C4F4CF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4CF:
    DEC                  ; 3A | Decrement accumulator
    STA $00              ; 85 00 | Update graphics data
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 06 75 C2 | Read graphics status
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4D4
; Address: $C4F4EE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4D4:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4D7
; Address: $C4F4FE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4D7:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4DA
; Address: $C4F511
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4DA:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4DC
; Address: $C4F51E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4DC:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BEQ $2B              ; F0 2B | Branch if equal
    LDA #$00             ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4E2
; Address: $C4F53F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4E2:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF A2 BB C2 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4E3
; Address: $C4F549
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4E3:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4E6
; Address: $C4F55C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4E6:
    JSR $1800            ; 20 00 18 | Jump to subroutine
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4EB
; Address: $C4F573
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4EB:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    BRA $05              ; 80 05 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4EC
; Address: $C4F57A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4EC:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    ROR $C7              ; 66 C7 | Rotate right (zero page)
    REP #$00             ; C2 00 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4ED
; Address: $C4F584
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4ED:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    STA $243C            ; 8D 3C 24 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4F4
; Address: $C4F5A5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4F4:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    ASL $02C9            ; 0E C9 02 | Arithmetic shift left (absolute)
    BNE $16              ; D0 16 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4F6
; Address: $C4F5B6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4F6:
    JSR $75C6            ; 20 C6 75 | Jump to subroutine
    LDA $2430            ; AD 30 24 | Read graphics status
    STA $23E6            ; 8D E6 23 | Update graphics data
    LDA $2470            ; AD 70 24 | Read graphics status
    STA $23F0            ; 8D F0 23 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4F7
; Address: $C4F5C6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4F7:
    STA $23EE            ; 8D EE 23 | Update graphics data
    STZ $23F2            ; 9C F2 23 | Store zero to absolute
    STZ $23F6            ; 9C F6 23 | Store zero to absolute
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4F8
; Address: $C4F5D4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4F8:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $06              ; D0 06 | Branch if not equal
    LDA #$08             ; A9 08 | Read graphics status
    STA $23F0            ; 8D F0 23 | Update graphics data
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4FB
; Address: $C4F5F1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4FB:
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BNE $19              ; D0 19 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4FC
; Address: $C4F5F7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4FC:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    BIT $B0              ; 24 B0 | Test bits in accumulator (zero page)
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $0D              ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_4FD
; Address: $C4F603
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_4FD:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    CMP $C276,Y          ; D9 76 C2 | Compare accumulator (absolute,Y)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_500
; Address: $C4F614
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_500:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $C276,X          ; DD 76 C2 | Compare accumulator (absolute,X)
    BCS $09              ; B0 09 | Branch if carry set
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F4              ; 10 F4 | Branch if positive
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA                  ; BF DF 76 C2 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_502
; Address: $C4F632
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_502:
    JSL $C01396          ; 22 96 13 C0 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    LDA $00              ; A5 00 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LDA $02              ; A5 02 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LDA $04              ; A5 04 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LDA $06              ; A5 06 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $C276DB          ; AF DB 76 C2 | Read graphics status
    BNE $04              ; D0 04 | Branch if not equal
    LDA                  ; BF 49 77 C2 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_504
; Address: $C4F654
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_504:
    JSR $75C6            ; 20 C6 75 | Jump to subroutine
    STA $242A            ; 8D 2A 24 | Update graphics data
    LDA $23E4            ; AD E4 23 | Read graphics status
    STA $2428            ; 8D 28 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_505
; Address: $C4F660
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_505:
    JSL $C270F2          ; 22 F2 70 C2 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    STA $06              ; 85 06 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_506
; Address: $C4F668
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_506:
    STA $04              ; 85 04 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    STA $02              ; 85 02 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    STA $00              ; 85 00 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    BCC $05              ; 90 05 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_507
; Address: $C4F673
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_507:
    JSR $76CE            ; 20 CE 76 | Jump to subroutine
    BRA $B7              ; 80 B7 | Branch always
    LDA $2430            ; AD 30 24 | Read graphics status
    STA $23E6            ; 8D E6 23 | Update graphics data
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register
    LDA #$00             ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_508
; Address: $C4F684
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_508:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_509
; Address: $C4F68D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_509:
    STZ $00              ; 64 00 | Store zero to zero page
    STZ $02              ; 64 02 | Store zero to zero page
    STZ $04              ; 64 04 | Store zero to zero page
    STZ $06              ; 64 06 | Store zero to zero page
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_50A
; Address: $C4F696
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_50A:
    JSR $76B9            ; 20 B9 76 | Jump to subroutine
    LDA $00              ; A5 00 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $00              ; 85 00 | Update graphics data
    LDA $02              ; A5 02 | Read graphics status
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    STA $02              ; 85 02 | Update graphics data
    LDA $04              ; A5 04 | Read graphics status
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    STA $04              ; 85 04 | Update graphics data
    LDA $06              ; A5 06 | Read graphics status
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    STA $06              ; 85 06 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_50B
; Address: $C4F6B9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_50B:
    LDX #$00             ; A2 00 | Load immediate value into X register
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $08              ; 90 08 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    SBC #$10             ; E9 10 | Subtract with carry (immediate)
    BRA $F3              ; 80 F3 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_50D
; Address: $C4F6CE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_50D:
    JSR $76B9            ; 20 B9 76 | Jump to subroutine
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_50E
; Address: $C4F6DD
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_50E:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0B00            ; 0D 00 0B | Logical OR with accumulator (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $1300            ; 0E 00 13 | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA $1400,Y          ; 19 00 14 | Logical OR with accumulator (absolute,Y)
    ORA $1700,X          ; 1D 00 17 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA $2300,Y          ; 19 00 23 | Logical OR with accumulator (absolute,Y)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ASL $2900,X          ; 1E 00 29 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_510
; Address: $C4F73F
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_510:
    JSL $003100          ; 22 00 31 00 | Jump to subroutine long
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag
    LDA $BA00,Y          ; B9 00 BA | Read graphics status
    LDA $BE00,X          ; BD 00 BE | Read graphics status
    LDA                  ; BF 00 C1 00 | Read graphics status
    REP #$00             ; C2 00 | Reset processor status bits
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    DEX                  ; CA | Decrement X register
    CPY $CD00            ; CC 00 CD | Compare Y register (absolute)
    DEC $D000            ; CE 00 D0 | Decrement (absolute)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    PHX                  ; DA | Push X register to stack
    CMP $4800,X          ; DD 00 48 | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_511
; Address: $C4F794
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_511:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ROL $1990            ; 2E 90 19 | Rotate left (absolute)
    LDX #$0C             ; A2 0C | Load immediate value into X register
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    REP #$F0             ; C2 F0 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F4              ; 10 F4 | Branch if positive

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_512
; Address: $C4F7AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_512:
    BRA $06              ; 80 06 | Branch always
    LDA                  ; BF B8 77 C2 | Read graphics status
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_513
; Address: $C4F7B8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_513:
    LDY $BF00,X          ; BC 00 BF | Load from absolute,X into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEC $CF00            ; CE 00 CF | Decrement (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CMP $AD00,Y          ; D9 00 AD | Compare accumulator (absolute,Y)
    CPX $23              ; E4 23 | Compare X register (zero page)
    STA $2428            ; 8D 28 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_514
; Address: $C4F7CC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_514:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCC $24              ; 90 24 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_517
; Address: $C4F7DE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_517:
    JSR $780D            ; 20 0D 78 | Jump to subroutine
    LDA $23E4            ; AD E4 23 | Read graphics status
    STA $2428            ; 8D 28 24 | Update graphics data
    LDA $23EE            ; AD EE 23 | Read graphics status
    STA $242A            ; 8D 2A 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_518
; Address: $C4F7ED
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_518:
    JSL $C2711C          ; 22 1C 71 C2 | Jump to subroutine long
    LDA $2430            ; AD 30 24 | Read graphics status
    STA $23E6            ; 8D E6 23 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_51C
; Address: $C4F805
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_51C:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_51F
; Address: $C4F817
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_51F:
    JSL $225CB0          ; 22 B0 5C 22 | Jump to subroutine long
    CPY $06              ; C4 06 | Compare Y register (zero page)
    LDA #$34             ; A9 34 | Read graphics status
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $40F7,X          ; BD F7 40 | Read graphics status
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $21              ; F0 21 | PPU graphics register access
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_520
; Address: $C4F82E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_520:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $0A              ; D0 0A | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_522
; Address: $C4F840
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_522:
    CLC                  ; 18 | Clear carry flag
    BNE $09              ; D0 09 | Branch if not equal
    DEC $4197            ; CE 97 41 | Decrement (absolute)
    LDA #$00             ; A9 00 | Read graphics status
    STA $40F7,X          ; 9D F7 40 | Update graphics data
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $D3              ; 10 D3 | Branch if positive
    LDA $4197            ; AD 97 41 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_523
; Address: $C4F855
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_523:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    BEQ $15              ; F0 15 | Branch if equal
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$34             ; A9 34 | Read graphics status
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $40F7,Y          ; B9 F7 40 | Read graphics status
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    DEX                  ; CA | Decrement X register
    BEQ $07              ; F0 07 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BPL $F1              ; 10 F1 | Branch if positive
    LDA #$01             ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_525
; Address: $C4F879
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_525:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    BEQ $06              ; F0 06 | Branch if equal
    LDA #$01             ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_527
; Address: $C4F88A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_527:
    LDA $23F2            ; AD F2 23 | Read graphics status
    BNE $2A              ; D0 2A | Branch if not equal
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address
    LDY $23EE            ; AC EE 23 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_528
; Address: $C4F898
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_528:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCS $1A              ; B0 1A | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_52A
; Address: $C4F8A4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_52A:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $0D              ; 90 0D | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_52B
; Address: $C4F8AC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_52B:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $03              ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_52D
; Address: $C4F8BA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_52D:
    LDA $23E6            ; AD E6 23 | Read graphics status
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCS $76              ; B0 76 | Branch if carry set
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BCS $19              ; B0 19 | Branch if carry set
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_52E
; Address: $C4F8C8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_52E:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $1C              ; F0 1C | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_530
; Address: $C4F8D7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_530:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    STA $23E6            ; 8D E6 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_532
; Address: $C4F8E3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_532:
    JSL $C2C766          ; 22 66 C7 C2 | Jump to subroutine long
    LDA $00              ; A5 00 | Read graphics status
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BNE $0A              ; D0 0A | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_534
; Address: $C4F8F3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_534:
    JSL $C2C766          ; 22 66 C7 C2 | Jump to subroutine long
    ASL $A5              ; 06 A5 | Arithmetic shift left (zero page)
    STA $04              ; 85 04 | Update graphics data
    LDA $02              ; A5 02 | Read graphics status
    STA $06              ; 85 06 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_535
; Address: $C4F900
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_535:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    LDA $00              ; A5 00 | Read graphics status
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BEQ $1B              ; F0 1B | Branch if equal
    LDA $00              ; A5 00 | Read graphics status
    STA $04              ; 85 04 | Update graphics data
    LDA $02              ; A5 02 | Read graphics status
    STA $06              ; 85 06 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_536
; Address: $C4F913
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_536:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    LDA $00              ; A5 00 | Read graphics status
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BEQ $08              ; F0 08 | Branch if equal
    LDA $00              ; A5 00 | Read graphics status
    STA $04              ; 85 04 | Update graphics data
    LDA $02              ; A5 02 | Read graphics status
    STA $06              ; 85 06 | Update graphics data
    LDA $04              ; A5 04 | Read graphics status
    STA $00              ; 85 00 | Update graphics data
    LDA $06              ; A5 06 | Read graphics status
    STA $02              ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_537
; Address: $C4F92E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_537:
    JSL $C2BD3B          ; 22 3B BD C2 | Jump to subroutine long
    LDA $2428            ; AD 28 24 | Read graphics status
    STA $23E6            ; 8D E6 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_540
; Address: $C4F955
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_540:
    JSR $7D53            ; 20 53 7D | Jump to subroutine
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_541
; Address: $C4F95E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_541:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $17              ; F0 17 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_543
; Address: $C4F96F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_543:
    JSR $7A9F            ; 20 9F 7A | Jump to subroutine
    BCC $0B              ; 90 0B | Branch if carry clear
    INC $23D8            ; EE D8 23 | Increment (absolute)
    LDA $23D8            ; AD D8 23 | Read graphics status
    CMP $23D6            ; CD D6 23 | Compare accumulator (absolute)
    BCC $D6              ; 90 D6 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_547
; Address: $C4F98E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_547:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA $4250            ; AD 50 42 | Hardware register operation
    BNE $39              ; D0 39 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_548
; Address: $C4F99B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_548:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    ADC $18              ; 65 18 | Add with carry (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_54A
; Address: $C4F9A9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_54A:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $0E              ; B0 0E | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_54B
; Address: $C4F9B1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_54B:
    JSL $C903E2          ; 22 E2 03 C9 | Jump to subroutine long
    LDX #$3C             ; A2 3C | Load immediate value into X register
    REP #$02             ; C2 02 | Reset processor status bits
    BRA $0C              ; 80 0C | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_54C
; Address: $C4F9BF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_54C:
    JSL $C903E2          ; 22 E2 03 C9 | Jump to subroutine long
    LDX #$3C             ; A2 3C | Load immediate value into X register
    REP #$00             ; C2 00 | Reset processor status bits
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $04              ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_54F
; Address: $C4F9D8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_54F:
    JSR $7A9F            ; 20 9F 7A | Jump to subroutine
    BCS $6D              ; B0 6D | Branch if carry set
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_551
; Address: $C4F9EC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_551:
    JSR $7A4B            ; 20 4B 7A | Jump to subroutine
    BCS $56              ; B0 56 | Branch if carry set
    LDA $23F2            ; AD F2 23 | Read graphics status
    BNE $54              ; D0 54 | Branch if not equal
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address
    LDY $23EE            ; AC EE 23 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_553
; Address: $C4FA06
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_553:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    ADC $8018,Y          ; 79 18 80 | Add with carry (absolute,Y)
    BNE $3A              ; D0 3A | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_555
; Address: $C4FA15
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_555:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $16              ; B0 16 | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_556
; Address: $C4FA1D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_556:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    BNE $23              ; D0 23 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_557
; Address: $C4FA27
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_557:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $19              ; F0 19 | Branch if equal
    BRA $14              ; 80 14 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_558
; Address: $C4FA33
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_558:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $0D              ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_55C
; Address: $C4FA4B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_55C:
    LDX #$08             ; A2 08 | Load immediate value into X register
    LDA $23EE            ; AD EE 23 | Read graphics status
    LSR $C27A,X          ; 5E 7A C2 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    BEQ $05              ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_55D
; Address: $C4FA58
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_55D:
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F5              ; 10 F5 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_55E
; Address: $C4FA60
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_55E:
    PLX                  ; FA | Pull X register from stack
    ASL $0F01            ; 0E 01 0F | Arithmetic shift left (absolute)
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))
    INC $23              ; E6 23 | Increment (zero page)
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BCC $2E              ; 90 2E | Branch if carry clear
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_55F
; Address: $C4FA73
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_55F:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $1E              ; D0 1E | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_561
; Address: $C4FA86
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_561:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $12              ; 90 12 | Branch if carry clear
    STA $23E6            ; 8D E6 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_563
; Address: $C4FA95
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_563:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    STA $23E6            ; 8D E6 23 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_564
; Address: $C4FA9F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_564:
    LDA $23E6            ; AD E6 23 | Read graphics status
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCS $0E              ; B0 0E | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_566
; Address: $C4FAAA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_566:
    JSR $7B93            ; 20 93 7B | Jump to subroutine
    LDA $00              ; A5 00 | Read graphics status
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BNE $01              ; D0 01 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_567
; Address: $C4FAB6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_567:
    JSR $7A4B            ; 20 4B 7A | Jump to subroutine
    BCS $4C              ; B0 4C | Branch if carry set
    LDX $23E6            ; AE E6 23 | Load from absolute address into X register
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BCS $2B              ; B0 2B | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_568
; Address: $C4FAC3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_568:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $21              ; F0 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_56A
; Address: $C4FAD2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_56A:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    STA $23E6            ; 8D E6 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_56D
; Address: $C4FAE4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_56D:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $04              ; 90 04 | Branch if carry clear
    STA $23E6            ; 8D E6 23 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_56E
; Address: $C4FAEE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_56E:
    LDA $23E4            ; AD E4 23 | Read graphics status
    STA $2428            ; 8D 28 24 | Update graphics data
    LDA $23EE            ; AD EE 23 | Read graphics status
    STA $242A            ; 8D 2A 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_56F
; Address: $C4FAFA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_56F:
    JSL $C270F2          ; 22 F2 70 C2 | Jump to subroutine long
    BCS $06              ; B0 06 | Branch if carry set
    LDA $2430            ; AD 30 24 | Read graphics status
    STA $23E6            ; 8D E6 23 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_570
; Address: $C4FB07
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_570:
    LDX $23E6            ; AE E6 23 | Load from absolute address into X register
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BCC $07              ; 90 07 | Branch if carry clear
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCC $0D              ; 90 0D | Branch if carry clear
    BRA $D8              ; 80 D8 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_571
; Address: $C4FB16
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_571:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $CE              ; F0 CE | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_572
; Address: $C4FB21
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_572:
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $07              ; B0 07 | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_573
; Address: $C4FB2A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_573:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    AND $C2C7,Y          ; 39 C7 C2 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_574
; Address: $C4FB39
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_574:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $AF              ; 90 AF | Branch if carry clear
    STA $23E6            ; 8D E6 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_576
; Address: $C4FB48
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_576:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    STA $23E6            ; 8D E6 23 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_577
; Address: $C4FB52
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_577:
    LDA $23E6            ; AD E6 23 | Read graphics status
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCS $0A              ; B0 0A | Branch if carry set
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BCS $28              ; B0 28 | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_579
; Address: $C4FB64
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_579:
    STZ $00              ; 64 00 | Store zero to zero page
    STZ $02              ; 64 02 | Store zero to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $05              ; 90 05 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_57A
; Address: $C4FB6B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_57A:
    JSL $C2C791          ; 22 91 C7 C2 | Jump to subroutine long
    ASL $4A              ; 06 4A | Arithmetic shift left (zero page)
    BCC $05              ; 90 05 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_57B
; Address: $C4FB73
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_57B:
    JSL $C2C791          ; 22 91 C7 C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $04              ; 90 04 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_57C
; Address: $C4FB7B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_57C:
    JSL $C27219          ; 22 19 72 C2 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $04              ; 90 04 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_581
; Address: $C4FB96
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_581:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $0B              ; F0 0B | Branch if equal
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $0C              ; F0 0C | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_586
; Address: $C4FBBF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_586:
    LDA #$01             ; A9 01 | Read graphics status
    STA $23D6            ; 8D D6 23 | Update graphics data
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_587
; Address: $C4FBC8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_587:
    JSL $C2CC47          ; 22 47 CC C2 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    BEQ $15              ; F0 15 | Branch if equal
    LDA $23E4            ; AD E4 23 | Read graphics status
    STA $2428            ; 8D 28 24 | Update graphics data
    LDA #$19             ; A9 19 | Read graphics status
    STA $242C            ; 8D 2C 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_589
; Address: $C4FBE2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_589:
    BVC $03              ; 50 03 | Branch if overflow clear
    ASL $23D6            ; 0E D6 23 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_58B
; Address: $C4FBEB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_58B:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BNE $0D              ; D0 0D | Branch if not equal
    LDA $23E6            ; AD E6 23 | Read graphics status
    STA $23E8            ; 8D E8 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_58F
; Address: $C4FC08
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_58F:
    CLC                  ; 18 | Clear carry flag
    STA $BE77            ; 8D 77 BE | Update graphics data
    LDA $23F4            ; AD F4 23 | Read graphics status
    STA $BE79            ; 8D 79 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_590
; Address: $C4FC12
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_590:
    JSL $C2CC03          ; 22 03 CC C2 | Jump to subroutine long
    ADC #$18             ; 69 18 | Add with carry (immediate)
    PHA                  ; 48 | Push accumulator to stack
    LDA $23F2            ; AD F2 23 | Read graphics status
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $05              ; D0 05 | Branch if not equal
    LDA #$08             ; A9 08 | Read graphics status
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    CMP #$CA             ; C9 CA | Compare accumulator (immediate)
    BNE $12              ; D0 12 | Branch if not equal
    LDA $23E4            ; AD E4 23 | Read graphics status
    STA $2428            ; 8D 28 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_591
; Address: $C4FC33
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_591:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ROL $0590            ; 2E 90 05 | Rotate left (absolute)
    LDA #$CE             ; A9 CE | Read graphics status
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_592
; Address: $C4FC41
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_592:
    JSR $7C68            ; 20 68 7C | Jump to subroutine
    BCS $12              ; B0 12 | Branch if carry set
    LDA #$01             ; A9 01 | Read graphics status
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0001           ; F4 01 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_593
; Address: $C4FC52
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_593:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_598
; Address: $C4FC68
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_598:
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register
    STX $242A            ; 8E 2A 24 | Store X register to absolute address
    LDY $23E4            ; AC E4 23 | Load from absolute address into Y register
    STY $2428            ; 8C 28 24 | Store Y register to absolute address
    LDA #$52             ; A9 52 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_599
; Address: $C4FC78
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_599:
    JSL $C2B466          ; 22 66 B4 C2 | Jump to subroutine long
    BCC $45              ; 90 45 | Branch if carry clear
    STA $23FC            ; 8D FC 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_59A
; Address: $C4FC81
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_59A:
    JSR $7D30            ; 20 30 7D | Jump to subroutine
    LDA $23FC            ; AD FC 23 | Read graphics status
    STA $00              ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_59B
; Address: $C4FC89
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_59B:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ASL $7722            ; 0E 22 77 | Arithmetic shift left (absolute)
    LDA $22C2,Y          ; B9 C2 22 | Read graphics status
    CPY $78C2            ; CC C2 78 | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    BEQ $1A              ; F0 1A | Branch if equal
    LDA #$54             ; A9 54 | Read graphics status
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_59C
; Address: $C4FCA6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_59C:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    BNE $23              ; D0 23 | Branch if not equal
    LDA #$53             ; A9 53 | Read graphics status
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    REP #$B0             ; C2 B0 | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    LDA #$50             ; A9 50 | Read graphics status
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BCS $0E              ; B0 0E | Branch if carry set
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5A0
; Address: $C4FCCF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5A0:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5A1
; Address: $C4FCD5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5A1:
    LDA $23F2            ; AD F2 23 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    BNE $16              ; D0 16 | Branch if not equal
    LDY $23EE            ; AC EE 23 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5A2
; Address: $C4FCDE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5A2:
    JSL $C2CC4E          ; 22 4E CC C2 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5A6
; Address: $C4FCF2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5A6:
    LDA $23E4            ; AD E4 23 | Read graphics status
    STA $2428            ; 8D 28 24 | Update graphics data
    LDA #$14             ; A9 14 | Read graphics status
    STA $242C            ; 8D 2C 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5A7
; Address: $C4FCFE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5A7:
    JSL $C2B87A          ; 22 7A B8 C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BVC $0B              ; 50 0B | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5A8
; Address: $C4FD05
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5A8:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$03             ; 29 03 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BNE $01              ; D0 01 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5A9
; Address: $C4FD11
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5A9:
    LDA $23E4            ; AD E4 23 | Read graphics status
    STA $2428            ; 8D 28 24 | Update graphics data
    LDA #$4A             ; A9 4A | Read graphics status
    STA $242C            ; 8D 2C 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5AA
; Address: $C4FD1D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5AA:
    JSL $C2B87A          ; 22 7A B8 C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BVC $0B              ; 50 0B | Branch if overflow clear
    LDA #$02             ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5AB
; Address: $C4FD27
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5AB:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BNE $01              ; D0 01 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5AC
; Address: $C4FD30
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5AC:
    LDA $23F2            ; AD F2 23 | Read graphics status
    BNE $1D              ; D0 1D | Branch if not equal
    LDA $23EE            ; AD EE 23 | Read graphics status
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $15              ; D0 15 | Branch if not equal
    LDA #$00             ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5AD
; Address: $C4FD40
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5AD:
    JSL $C2B8AA          ; 22 AA B8 C2 | Jump to subroutine long
    LDA $242C            ; AD 2C 24 | Read graphics status
    CMP #$16             ; C9 16 | Compare accumulator (immediate)
    BNE $06              ; D0 06 | Branch if not equal
    LDA #$03             ; A9 03 | Read graphics status
    STA $23FC            ; 8D FC 23 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5AE
; Address: $C4FD53
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5AE:
    STZ $23DA            ; 9C DA 23 | Store zero to absolute
    STZ $2458            ; 9C 58 24 | Store zero to absolute
    STZ $245A            ; 9C 5A 24 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5B1
; Address: $C4FD62
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5B1:
    JSR $7B52            ; 20 52 7B | Jump to subroutine
    LDA $00              ; A5 00 | Read graphics status
    STA $23EA            ; 8D EA 23 | Update graphics data
    LDA $02              ; A5 02 | Read graphics status
    STA $23EC            ; 8D EC 23 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5B4
; Address: $C4FD76
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5B4:
    JSL $C28375          ; 22 75 83 C2 | Jump to subroutine long
    LDY #$00             ; A0 00 | Load immediate value into Y register
    STZ $23FA            ; 9C FA 23 | Store zero to absolute
    LDA #$00             ; A9 00 | Read graphics status
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$007F           ; F4 7F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5C1
; Address: $C4FDB7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5C1:
    JSR $8A2C            ; 20 2C 8A | Jump to subroutine
    INY                  ; C8 | Increment Y register
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    BCC $BD              ; 90 BD | Branch if carry clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5C3
; Address: $C4FDC4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5C3:
    LDA $23EE            ; AD EE 23 | Read graphics status
    CMP #$DC             ; C9 DC | Compare accumulator (immediate)
    BNE $04              ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5C5
; Address: $C4FDD1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5C5:
    LDA $23EE            ; AD EE 23 | Read graphics status
    CMP #$1A             ; C9 1A | Compare accumulator (immediate)
    BNE $27              ; D0 27 | Branch if not equal
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5C7
; Address: $C4FDE1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5C7:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $17              ; B0 17 | Branch if carry set

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5C9
; Address: $C4FDEE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5C9:
    BCS $10              ; B0 10 | Branch if carry set
    LDA #$01             ; A9 01 | Read graphics status
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5CB
; Address: $C4FE01
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5CB:
    PHY                  ; 5A | Push Y register to stack
    LDA $23F2            ; AD F2 23 | Read graphics status
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $45              ; D0 45 | Branch if not equal
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5CC
; Address: $C4FE0D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5CC:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    ADC $0418,Y          ; 79 18 04 | Add with carry (absolute,Y)
    BEQ $38              ; F0 38 | Branch if equal
    LDY $23E8            ; AC E8 23 | Load from absolute address into Y register
    STY $2428            ; 8C 28 24 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5CD
; Address: $C4FE1D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5CD:
    JSL $C2CAE0          ; 22 E0 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $28              ; F0 28 | Branch if equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5D2
; Address: $C4FE3D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5D2:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    BNE $30              ; D0 30 | Branch if not equal
    LDA $23E8            ; AD E8 23 | Read graphics status
    STA $2428            ; 8D 28 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5D3
; Address: $C4FE48
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5D3:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCS $2B              ; B0 2B | Branch if carry set
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5D4
; Address: $C4FE51
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5D4:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    BNE $08              ; D0 08 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5D5
; Address: $C4FE5A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5D5:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ROL $7A00,X          ; 3E 00 7A | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5D8
; Address: $C4FE6A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5D8:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    AND $7A00,X          ; 3D 00 7A | Logical AND with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5D9
; Address: $C4FE72
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5D9:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5DC
; Address: $C4FE83
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5DC:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5DF
; Address: $C4FE95
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5DF:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5E0
; Address: $C4FE9D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5E0:
    LDA $23EE            ; AD EE 23 | Read graphics status
    CMP #$48             ; C9 48 | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5E3
; Address: $C4FEAD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5E3:
    LDA #$FF             ; A9 FF | Read graphics status
    STA $00              ; 85 00 | Update graphics data
    STZ $02              ; 64 02 | Store zero to zero page
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0020           ; F4 20 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5E4
; Address: $C4FEBD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5E4:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $07              ; F0 07 | Branch if equal
    LDA $00              ; A5 00 | Read graphics status
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    SBC $85              ; E5 85 | Subtract with carry (zero page)
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5E5
; Address: $C4FECD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5E5:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $FE              ; 90 FE | Branch if carry clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF F0 7E C2 | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5E6
; Address: $C4FED9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5E6:
    JSR $75C6            ; 20 C6 75 | Jump to subroutine
    STA $242A            ; 8D 2A 24 | Update graphics data
    LDA $23E4            ; AD E4 23 | Read graphics status
    STA $2428            ; 8D 28 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5E7
; Address: $C4FEE5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5E7:
    JSL $C270F2          ; 22 F2 70 C2 | Jump to subroutine long
    LDA $2430            ; AD 30 24 | Read graphics status
    STA $23E6            ; 8D E6 23 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5E9
; Address: $C4FEF4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5E9:
    JSL $004B00          ; 22 00 4B 00 | Jump to subroutine long
    JMP $4D00            ; 4C 00 4D | Jump to address
    LSR $4F00            ; 4E 00 4F | Logical shift right (absolute)
    PLP                  ; 28 | Pull processor status from stack
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5EA
; Address: $C4FF04
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5EA:
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    LDX #$50             ; A2 50 | Load immediate value into X register
    LDA $23EE            ; AD EE 23 | Read graphics status
    AND $7F              ; 25 7F | Logical AND with accumulator (zero page)
    REP #$F0             ; C2 F0 | Reset processor status bits
    ORA $CA              ; 05 CA | Logical OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    BPL $F6              ; 10 F6 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5EC
; Address: $C4FF25
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5EC:
    JMP $5500            ; 4C 00 55 | Jump to address
    JMP ($6D00)          ; 6C 00 6D | Jump to address (absolute indirect)
    ROR $6F00            ; 6E 00 6F | Rotate right (absolute)
    BVS $00              ; 70 00 | Branch if overflow set
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    LDA $BE00,Y          ; B9 00 BE | Read graphics status
    REP #$00             ; C2 00 | Reset processor status bits
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    CMP $DA00,Y          ; D9 00 DA | Compare accumulator (absolute,Y)
    PHB                  ; 8B | Push data bank register to stack
    CMP $AE00,X          ; DD 00 AE | Compare accumulator (absolute,X)
    LDA $00B000          ; AF 00 B0 00 | Read graphics status
    LDA ($00),Y          ; B1 00 | Read graphics status
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND ($83,X)          ; 21 83 | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    AND $4483,X          ; 3D 83 44 | Logical AND with accumulator (absolute,X)
    EOR $6083,Y          ; 59 83 60 | Exclusive OR with accumulator (absolute,Y)
    ROR $F283            ; 6E 83 F2 | Rotate right (absolute)
    CMP $82              ; C5 82 | Compare accumulator (zero page)
    LSR $4982,X          ; 5E 82 49 | Logical shift right (absolute,X)
    BIT $1182            ; 2C 82 11 | Test bits in accumulator (absolute)
    CMP ($7F),Y          ; D1 7F | Compare accumulator ((zero page),Y)
    INC $D381            ; EE 81 D3 | Increment (absolute)
    STA ($84,X)          ; 81 84 | Update graphics data
    STA ($14,X)          ; 81 14 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($B5,X)          ; 81 B5 | Update graphics data
    BRA $A1              ; 80 A1 | Branch always
    BRA $AE              ; 80 AE | Branch always
    BRA $46              ; 80 46 | Branch always
    BRA $C9              ; 80 C9 | Branch always

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5ED
; Address: $C4FFB9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5ED:
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    ORA $1480            ; 0D 80 14 | Logical OR with accumulator (absolute)
    BRA $1B              ; 80 1B | Branch always
    BRA $22              ; 80 22 | Branch always
    BRA $D9              ; 80 D9 | Branch always
    CMP $D97F,Y          ; D9 7F D9 | Compare accumulator (absolute,Y)
    LDA #$3C             ; A9 3C | Read graphics status

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5F1
; Address: $C4FFD9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5F1:
    LDA #$18             ; A9 18 | Read graphics status
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    LDA $23E4            ; AD E4 23 | Read graphics status
    STA $2428            ; 8D 28 24 | Update graphics data

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5F2
; Address: $C4FFE3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5F2:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    BIT $B0              ; 24 B0 | Test bits in accumulator (zero page)
    ORA $04C9,Y          ; 19 C9 04 | Logical OR with accumulator (absolute,Y)
    BNE $14              ; D0 14 | Branch if not equal

;------------------------------------------------------------------------------
; Bank08_GraphicsFunction_5F3
; Address: $C4FFEF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank08_GraphicsFunction_5F3:
    JSL $C45AB0          ; 22 B0 5A C4 | Jump to subroutine long
    LDA $00              ; A5 00 | Read graphics status
    STA $BE81            ; 8D 81 BE | Update graphics data
    LDA $02              ; A5 02 | Read graphics status
    STA $BE83            ; 8D 83 BE | Update graphics data
    LDA #$19             ; A9 19 | Read graphics status
