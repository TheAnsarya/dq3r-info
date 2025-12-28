;==============================================================================
; Dragon Quest III - Bank $70
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $F80000-$F87FFF
; Instructions: 8635
; Bytes: 32769
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_70"

;------------------------------------------------------------------------------
; Bank70_DmaFunction_000
; Address: $F88003
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_000:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $24              ; 25 24 | Logical AND with accumulator (zero page)
    CMP $5B1A,Y          ; D9 1A 5B | Compare accumulator (absolute,Y)
    CPY $A7              ; C4 A7 | Compare Y register (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    CMP $5B26,Y          ; D9 26 5B | Compare accumulator (absolute,Y)
    LDY $A7              ; A4 A7 | Load from zero page into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_004
; Address: $F8807B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_004:
    JSR $C33C            ; 20 3C C3 | Jump to subroutine
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    AND ($21,X)          ; 21 21 | PPU graphics register access
    SEP #$5C             ; E2 5C | Set processor status bits
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($5C,X)          ; 21 5C | Logical AND with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_005
; Address: $F880EF
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_005:
    SEP #$00             ; E2 00 | Set processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEP #$01             ; E2 01 | Set processor status bits
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $B4              ; 80 B4 | Branch always
    LDY $FC64,X          ; BC 64 FC | Load from absolute,X into Y register
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL $60EC            ; 0E EC 60 | Arithmetic shift left (absolute)
    CPX $F25E            ; EC 5E F2 | Compare X register (absolute)
    PLX                  ; FA | Pull X register from stack
    ORA $4FBF            ; 0D BF 4F | Logical OR with accumulator (absolute)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    STA                  ; 9F 80 B3 F0 | Store accumulator to absolute long,X
    SBC $4EFC,X          ; FD FC 4E | Subtract with carry (absolute,X)
    LSR $E6C4            ; 4E C4 E6 | Logical shift right (absolute)
    CMP #$AF             ; C9 AF | Compare accumulator (immediate)
    CPX $D8              ; E4 D8 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_007
; Address: $F8814E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_007:
    JSL $E2F9E6          ; 22 E6 F9 E2 | Jump to subroutine long
    BEQ $E4              ; F0 E4 | Branch if equal
    INY                  ; C8 | Increment Y register
    BPL $2C              ; 10 2C | Branch if positive
    BMI $08              ; 30 08 | Branch if negative
    DEC $1901            ; CE 01 19 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_008
; Address: $F88160
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_008:
    JSR $E0E0            ; 20 E0 E0 | Game work RAM access
    BVC $50              ; 50 50 | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    BCC $C8              ; 90 C8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank70_DmaFunction_009
; Address: $F88168
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_009:
    JSR $A0E8            ; 20 E8 A0 | Jump to subroutine
    CPX $10              ; E4 10 | Compare X register (zero page)
    BVC $74              ; 50 74 | Branch if overflow clear
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BPL $B0              ; 10 B0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BMI $08              ; 30 08 | Branch if negative
    BPL $08              ; 10 08 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    STY $88              ; 84 88 | Store Y register to zero page
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_00B
; Address: $F8818D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_00B:
    JSR $E020            ; 20 20 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $FCB4,X          ; BC B4 FC | Load from absolute,X into Y register
    PHB                  ; 8B | Push data bank register to stack
    TSX                  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_00C
; Address: $F881AB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_00C:
    JSL $F8004F          ; 22 4F 00 F8 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    LDA                  ; BF 4F FF 0F | Load from absolute long,X into accumulator
    CMP $FF00,X          ; DD 00 FF | Compare accumulator (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_00E
; Address: $F881CD
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_00E:
    JSR $E080            ; 20 80 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDA                  ; BF CB AF 14 | Load from absolute long,X into accumulator
    LDY $FFB7,X          ; BC B7 FF | Load from absolute,X into Y register
    STY $536B            ; 8C 6B 53 | Store Y register to absolute address
    LDY $43BF            ; AC BF 43 | Load from absolute address into Y register
    LDY $1F57            ; AC 57 1F | Load from absolute address into Y register
    LDA                  ; BF 4F FF 0F | Load from absolute long,X into accumulator
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_00F
; Address: $F8820F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_00F:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CMP ($51),Y          ; D1 51 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_010
; Address: $F88229
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_010:
    LDY $ACC4,X          ; BC C4 AC | Load from absolute,X into Y register
    LDA                  ; BF 51 AE 13 | Load from absolute long,X into accumulator
    CPX $E31F            ; EC 1F E3 | Compare X register (absolute)
    JMP $4FBFA7          ; 5C A7 BF 4F | Jump to address long
    LDA $EF1F5F          ; AF 5F 1F EF | Load from absolute long address into accumulator
    LDA                  ; BF 47 00 80 | Load from absolute long,X into accumulator
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_011
; Address: $F88250
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_011:
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDX #$5C             ; A2 5C | Load immediate value into X register
    CMP ($59),Y          ; D1 59 | Compare accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    ORA #$1D             ; 09 1D | Logical OR with accumulator (immediate)
    BIT $FB2F            ; 2C 2F FB | Test bits in accumulator (absolute)
    LDY $A35C,X          ; BC 5C A3 | Load from absolute,X into Y register
    EOR $09A6,Y          ; 59 A6 09 | Exclusive OR with accumulator (absolute,Y)
    CPX #$2F             ; E0 2F | Compare X register (immediate)
    LDA                  ; BF 4F 00 80 | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDY $F0EC,X          ; BC EC F0 | Load from absolute,X into Y register
    BCS $D9              ; B0 D9 | Branch if carry set
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    ROL $27              ; 26 27 | Rotate left (zero page)
    LDY $F3AC            ; AC AC F3 | Load from absolute address into Y register
    BEQ $CF              ; F0 CF | Branch if equal
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    EOR ($F8,X)          ; 41 F8 | Exclusive OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_012
; Address: $F882C8
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_012:
    BIT #$D8             ; 89 D8 | Test bits in accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    AND $077E,Y          ; 39 7E 07 | Logical AND with accumulator (absolute,Y)
    DEY                  ; 88 | Decrement Y register
    STA $038C00          ; 8F 00 8C 03 | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ROR $8C00,X          ; 7E 00 8C | Rotate right (absolute,X)
    ASL $09C2,X          ; 1E C2 09 | Arithmetic shift left (absolute,X)
    BEQ $F6              ; F0 F6 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    STY $AC1E            ; 8C 1E AC | Store Y register to absolute address
    LSR $87B6            ; 4E B6 87 | Logical shift right (absolute)
    CPX #$02             ; E0 02 | Compare X register (immediate)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    BRA $1E              ; 80 1E | Branch always
    CPX #$4E             ; E0 4E | Compare X register (immediate)
    BCS $87              ; B0 87 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    CPX #$80             ; E0 80 | Compare X register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_013
; Address: $F88307
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_013:
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PLX                  ; FA | Pull X register from stack
    SBC $7E              ; E5 7E | Subtract with carry (zero page)
    CMP ($FD),Y          ; D1 FD | Compare accumulator ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    ROL $BC              ; 26 BC | Rotate left (zero page)
    CPX $B0F0            ; EC F0 B0 | Compare X register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    LDX $D0FE,Y          ; BE FE D0 | Load from absolute,Y into X register
    CMP ($6E),Y          ; D1 6E | Compare accumulator ((zero page),Y)
    ROR $ACAD            ; 6E AD AC | Rotate right (absolute)
    BEQ $CF              ; F0 CF | Branch if equal
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_014
; Address: $F88347
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_014:
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_016
; Address: $F88361
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_016:
    JSR $054A            ; 20 4A 05 | Jump to subroutine
    SBC $EAFB,X          ; FD FB EA | Subtract with carry (absolute,X)
    DEC $E65A,X          ; DE 5A E6 | Decrement (absolute,X)
    LDY $F1EC,X          ; BC EC F1 | Load from absolute,X into Y register
    LDA ($DA),Y          ; B1 DA | Load from (zero page),Y into accumulator
    INC $0007,X          ; FE 07 00 | Increment (absolute,X)
    SBC $E9FC,X          ; FD FC E9 | Subtract with carry (absolute,X)
    CPX $F0F3            ; EC F3 F0 | Compare X register (absolute)
    DEC $3CC0            ; CE C0 3C | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CLV                  ; B8 | Clear overflow flag
    ROR                  ; 6A | Rotate right (accumulator)
    STY $B064            ; 8C 64 B0 | Store Y register to absolute address
    AND ($69,X)          ; 21 69 | Logical AND with accumulator ((zero page,X))
    REP #$FE             ; C2 FE | Reset processor status bits
    TAY                  ; A8 | Transfer accumulator to Y register
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $FBE1            ; ED E1 FB | Subtract with carry (absolute)
    SBC $FB04,Y          ; F9 04 FB | Subtract with carry (absolute,Y)
    DEC $F001,X          ; DE 01 F0 | Decrement (absolute,X)
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    BEQ $1E              ; F0 1E | Branch if equal
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    STA                  ; 9F F3 FF B8 | Store accumulator to absolute long,X
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    SBC #$B0             ; E9 B0 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_017
; Address: $F883EC
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_017:
    BIT #$0F             ; 89 0F | Test bits in accumulator (immediate)
    ADC $3D              ; 65 3D | Add with carry (zero page)
    STA                  ; 9F 6F F7 0F | Store accumulator to absolute long,X
    INC $DC00,X          ; FE 00 DC | Increment (absolute,X)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    REP #$18             ; C2 18 | Reset processor status bits
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ROL $64              ; 26 64 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    JMP $5800            ; 4C 00 58 | Jump to address

;------------------------------------------------------------------------------
; Bank70_DmaFunction_018
; Address: $F88446
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_018:
    JSR $1068            ; 20 68 10 | Jump to subroutine
    ORA $0201,Y          ; 19 01 02 | Logical OR with accumulator (absolute,Y)
    ORA ($64,X)          ; 01 64 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    JMP $5830            ; 4C 30 58 | Jump to address

;------------------------------------------------------------------------------
; Bank70_DmaFunction_019
; Address: $F88455
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_019:
    JSR $1068            ; 20 68 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA $0200,Y          ; 19 00 02 | Logical OR with accumulator (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    CPY $7806            ; CC 06 78 | Compare Y register (absolute)
    CPY $38E0            ; CC E0 38 | Compare Y register (absolute)
    CPX #$77             ; E0 77 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    STZ $72              ; 64 72 | Store zero to zero page
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    CPY $3830            ; CC 30 38 | Compare Y register (absolute)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PEA #$0006           ; F4 06 00 | Push effective address to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $FCF0,X          ; 1E F0 FC | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_01A
; Address: $F884E7
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_01A:
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDY $F0EC,X          ; BC EC F0 | Load from absolute,X into Y register
    BCC $F9              ; 90 F9 | Branch if carry clear
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    BVS $5C              ; 70 5C | Branch if overflow set
    ROL $27              ; 26 27 | Rotate left (zero page)
    LDY $F3AC            ; AC AC F3 | Load from absolute address into Y register
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $6E              ; F0 6E | Branch if equal
    BVS $AC              ; 70 AC | Branch if overflow set
    BVS $B0              ; 70 B0 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BPL $70              ; 10 70 | Branch if positive
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $50              ; 50 50 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVS $70              ; 70 70 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_01B
; Address: $F88533
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_01B:
    BVS $20              ; 70 20 | Branch if overflow set
    BVS $30              ; 70 30 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $50              ; 70 50 | Branch if overflow set
    BVC $40              ; 50 40 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PLB                  ; AB | Pull data bank register from stack
    PHB                  ; 8B | Push data bank register to stack
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    RTI                  ; 40 | Return from interrupt
    PLB                  ; AB | Pull data bank register from stack
    RTI                  ; 40 | Return from interrupt
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_01D
; Address: $F88567
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_01D:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_01E
; Address: $F88576
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_01E:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank70_DmaFunction_01F
; Address: $F8857D
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_01F:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$F6             ; C0 F6 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STA $00C1            ; 8D C1 00 | Store accumulator to absolute address
    LDY #$80             ; A0 80 | Load immediate value into Y register
    BNE $C0              ; D0 C0 | Branch if not equal
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    LDY #$80             ; A0 80 | Load immediate value into Y register
    BNE $E0              ; D0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCC $80              ; 90 80 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($5A),Y          ; F1 5A | Subtract with carry ((zero page),Y)
    INX                  ; E8 | Increment X register
    BCC $90              ; 90 90 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($8E,X)          ; 01 8E | Logical OR with accumulator ((zero page,X))
    CPY #$F7             ; C0 F7 | Compare Y register (immediate)
    BEQ $5D              ; F0 5D | Branch if equal
    JMP $000000          ; 5C 00 00 00 | Jump to address long
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    LDY #$48             ; A0 48 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_022
; Address: $F885FF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_022:
    BEQ $00              ; F0 00 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ORA $3032            ; 0D 32 30 | Logical OR with accumulator (absolute)
    CPY $42              ; C4 42 | Hardware register operation
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_023
; Address: $F8862A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_023:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_024
; Address: $F8863A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_024:
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$4E             ; 09 4E | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA $1810            ; 0D 10 18 | Logical OR with accumulator (absolute)
    AND ($44),Y          ; 31 44 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_025
; Address: $F8867D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_025:
    JSR $9060            ; 20 60 90 | Jump to subroutine
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $09              ; 26 09 | Rotate left (zero page)
    JMP $007824          ; 5C 24 78 00 | Jump to address long
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA $1910            ; 0D 10 19 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_026
; Address: $F88699
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_026:
    JSL $232410          ; 22 10 24 23 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    BVC $00              ; 50 00 | Branch if overflow clear
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_027
; Address: $F886A8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_027:
    JSR $E0E0            ; 20 E0 E0 | Game work RAM access
    BVC $50              ; 50 50 | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    BCC $C8              ; 90 C8 | Branch if carry clear
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BPL $B0              ; 10 B0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BMI $08              ; 30 08 | Branch if negative
    BVS $D0              ; 70 D0 | Branch if overflow set
    BVC $40              ; 50 40 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVS $70              ; 70 70 | Branch if overflow set
    BVC $50              ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank70_DmaFunction_028
; Address: $F886D4
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_028:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $F4              ; F0 F4 | Branch if equal
    PHY                  ; 5A | Push Y register to stack
    XBA                  ; EB | Exchange accumulator bytes
    SBC $FF19,X          ; FD 19 FF | Subtract with carry (absolute,X)
    INC $FA0A,X          ; FE 0A FA | Increment (absolute,X)
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA $F1F5C7          ; 8F C7 F5 F1 | Store accumulator to absolute long address
    BVC $0B              ; 50 0B | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    ORA $060C            ; 0D 0C 06 | Logical OR with accumulator (absolute)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_029
; Address: $F8870C
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_029:
    JSR $40A0            ; 20 A0 40 | Jump to subroutine
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $59              ; 80 59 | Branch always
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    ASL $00FE            ; 0E FE 00 | Arithmetic shift left (absolute)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BEQ $5B              ; F0 5B | Branch if equal
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $030C            ; 0D 0C 03 | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    BRA $60              ; 80 60 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_02B
; Address: $F88751
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_02B:
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $FE              ; 80 FE | Branch always
    PHP                  ; 08 | Push processor status to stack
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BMI $E0              ; 30 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank70_DmaFunction_02D
; Address: $F88786
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_02D:
    BRA $A0              ; 80 A0 | Branch always
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BCS $40              ; B0 40 | Branch if carry set
    BEQ $40              ; F0 40 | Branch if equal
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_02E
; Address: $F8879D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_02E:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    EOR ($30,X)          ; 41 30 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BMI $A0              ; 30 A0 | Branch if negative
    BCC $40              ; 90 40 | Branch if carry clear
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_02F
; Address: $F887C6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_02F:
    JSR $0C64            ; 20 64 0C | Jump to subroutine
    ROL $1102,X          ; 3E 02 11 | Rotate left (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_030
; Address: $F887D3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_030:
    BPL $30              ; 10 30 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BVC $C8              ; 50 C8 | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_032
; Address: $F8880D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_032:
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BMI $08              ; 30 08 | Branch if negative
    BMI $08              ; 30 08 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_033
; Address: $F88820
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_033:
    JSR $1873            ; 20 73 18 | Jump to subroutine
    ROR $3800,X          ; 7E 00 38 | Rotate right (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank70_DmaFunction_034
; Address: $F88840
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_034:
    JSR $20E8            ; 20 E8 20 | Jump to subroutine
    STZ $10              ; 64 10 | Store zero to zero page
    BPL $34              ; 10 34 | Branch if positive
    ASL $1102,X          ; 1E 02 11 | Arithmetic shift left (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BPL $08              ; 10 08 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    BCC $80              ; 90 80 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $0C              ; F0 0C | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    REP #$F6             ; C2 F6 | Reset processor status bits
    SBC ($5A),Y          ; F1 5A | Subtract with carry ((zero page),Y)
    INX                  ; E8 | Increment X register
    INC $0008,X          ; FE 08 00 | Increment (absolute,X)
    BCC $90              ; 90 90 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $0C              ; F0 0C | Branch if equal
    STX $F7C1            ; 8E C1 F7 | Store X register to absolute address
    BEQ $5D              ; F0 5D | Branch if equal
    JMP $000A0B          ; 5C 0B 0A 00 | Jump to address long
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FD01,X          ; FE 01 FD | Increment (absolute,X)
    INC $F802,X          ; FE 02 F8 | Increment (absolute,X)
    BIT $B8              ; 24 B8 | Test bits in accumulator (zero page)
    INX                  ; E8 | Increment X register
    SBC $00B1,Y          ; F9 B1 00 | Subtract with carry (absolute,Y)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    BIT $A8AB            ; 2C AB A8 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_035
; Address: $F888BD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_035:
    BEQ $CE              ; F0 CE | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_036
; Address: $F888C7
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_036:
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $FD01,X          ; FE 01 FD | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ASL $24FC            ; 0E FC 24 | Arithmetic shift left (absolute)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $2D              ; 06 2D | Arithmetic shift left (zero page)
    BIT $A8AB            ; 2C AB A8 | Test bits in accumulator (absolute)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    LDY #$80             ; A0 80 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_038
; Address: $F8890B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_038:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FD01,X          ; FE 01 FD | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ASL $0101            ; 0E 01 01 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $2D              ; 06 2D | Arithmetic shift left (zero page)
    BIT $A000            ; 2C 00 A0 | Test bits in accumulator (absolute)
    BRA $A0              ; 80 A0 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_03B
; Address: $F8894D
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_03B:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA $11              ; 05 11 | Logical OR with accumulator (zero page)
    JMP $0E7109          ; 5C 09 71 0E | Jump to address long
    BMI $7E              ; 30 7E | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ASL $1810            ; 0E 10 18 | Arithmetic shift left (absolute)
    JMP $700E            ; 4C 0E 70 | Jump to address
    BMI $40              ; 30 40 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_03C
; Address: $F88987
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_03C:
    JSR $5060            ; 20 60 50 | Jump to subroutine
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    BPL $C8              ; 10 C8 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_03F
; Address: $F8899A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_03F:
    JSR $3010            ; 20 10 30 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    BPL $08              ; 10 08 | Branch if positive
    BVS $03              ; 70 03 | Branch if overflow set
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_040
; Address: $F889B9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_040:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $40              ; 30 40 | Branch if negative
    BVC $A0              ; 50 A0 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    BPL $C8              ; 10 C8 | Branch if positive
    BMI $E8              ; 30 E8 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $A0              ; 30 A0 | Branch if negative
    BPL $30              ; 10 30 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BMI $48              ; 30 48 | Branch if negative
    BPL $48              ; 10 48 | Branch if positive
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_041
; Address: $F889E1
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_041:
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    SEC                  ; 38 | Set carry flag
    ASL $7E              ; 06 7E | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $40              ; 30 40 | Branch if negative
    BVC $A0              ; 50 A0 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    BPL $C8              ; 10 C8 | Branch if positive
    BMI $E8              ; 30 E8 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $A0              ; 30 A0 | Branch if negative
    BPL $30              ; 10 30 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BMI $48              ; 30 48 | Branch if negative
    BPL $48              ; 10 48 | Branch if positive
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $60              ; 10 60 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    BCS $A0              ; B0 A0 | Branch if carry set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BCS $40              ; B0 40 | Branch if carry set
    BEQ $40              ; F0 40 | Branch if equal
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_043
; Address: $F88A56
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_043:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_044
; Address: $F88A5D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_044:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    CPX $06              ; E4 06 | Compare X register (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank70_DmaFunction_045
; Address: $F88A80
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_045:
    LDY $F9E8,X          ; BC E8 F9 | Load from absolute,X into Y register
    LDA ($F2),Y          ; B1 F2 | Load from (zero page),Y into accumulator
    CPX $06              ; E4 06 | Compare X register (zero page)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_046
; Address: $F88A8A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_046:
    JSR $0038            ; 20 38 00 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $CE              ; F0 CE | Branch if equal
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BIT $BC              ; 24 BC | Test bits in accumulator (zero page)
    INX                  ; E8 | Increment X register
    SBC $F2B1,Y          ; F9 B1 F2 | Subtract with carry (absolute,Y)
    CPX $06              ; E4 06 | Compare X register (zero page)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_047
; Address: $F88ACC
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_047:
    JSR $0038            ; 20 38 00 | Jump to subroutine
    CPX #$AB             ; E0 AB | Compare X register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $CE              ; F0 CE | Branch if equal
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_048
; Address: $F88B20
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_048:
    JSR $10E4            ; 20 E4 10 | Jump to subroutine
    PEA #$F450           ; F4 50 F4 | Push effective address to stack
    ASL $1102,X          ; 1E 02 11 | Arithmetic shift left (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    CPX $50              ; E4 50 | Compare X register (zero page)
    PEA #$F420           ; F4 20 F4 | Push effective address to stack
    ASL $1102,X          ; 1E 02 11 | Arithmetic shift left (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_049
; Address: $F88B5A
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_049:
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    CPX $40              ; E4 40 | Compare X register (zero page)
    CPX $50              ; E4 50 | Compare X register (zero page)
    PEA #$F420           ; F4 20 F4 | Push effective address to stack
    ASL $1102,X          ; 1E 02 11 | Arithmetic shift left (absolute,X)
    ASL $0418            ; 0E 18 04 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    ORA #$17             ; 09 17 | Logical OR with accumulator (immediate)
    ASL $0901            ; 0E 01 09 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_04A
; Address: $F88BBB
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_04A:
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $0001,X          ; 1E 01 00 | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BVS $90              ; 70 90 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    CPX $2C08            ; EC 08 2C | Compare X register (absolute)
    STX $00              ; 86 00 | Store X register to zero page
    BRA $80              ; 80 80 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BIT $86D0            ; 2C D0 86 | Test bits in accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $1B0A            ; 0E 0A 1B | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_04B
; Address: $F88C11
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_04B:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($07),Y          ; 11 07 | Logical OR with accumulator ((zero page),Y)
    BPL $0E              ; 10 0E | Branch if positive
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_04C
; Address: $F88C2A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_04C:
    BRA $10              ; 80 10 | Branch always
    BRA $10              ; 80 10 | Branch always
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BNE $20              ; D0 20 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    CPX $50              ; E4 50 | Compare X register (zero page)
    PEA #$7200           ; F4 00 72 | Push effective address to stack
    ROL                  ; 2A | Rotate left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_04D
; Address: $F88C54
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_04D:
    JSR $1010            ; 20 10 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_04E
; Address: $F88C5D
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_04E:
    JSL $001104          ; 22 04 11 00 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ASL $DCFF,X          ; 1E FF DC | Arithmetic shift left (absolute,X)
    INX                  ; E8 | Increment X register
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $30              ; F0 30 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_04F
; Address: $F88CBE
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_04F:
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    AND $077E,Y          ; 39 7E 07 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ROR $8000,X          ; 7E 00 80 | Rotate right (absolute,X)
    BPL $C0              ; 10 C0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BEQ $F4              ; F0 F4 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    STY $AC1E            ; 8C 1E AC | Store Y register to absolute address
    LSR $87B6            ; 4E B6 87 | Logical shift right (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $1E              ; 80 1E | Branch always
    CPX #$4E             ; E0 4E | Compare X register (immediate)
    BCS $87              ; B0 87 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    ASL $27              ; 06 27 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0019            ; 0E 19 00 | Arithmetic shift left (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $0F06,Y          ; 19 06 0F | Logical OR with accumulator (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    REP #$D3             ; C2 D3 | Reset processor status bits
    SEC                  ; 38 | Set carry flag
    SBC $1590,Y          ; F9 90 15 | Subtract with carry (absolute,Y)
    STZ $F1              ; 64 F1 | Store zero to zero page
    INC                  ; 1A | Increment accumulator
    CPX $700E            ; EC 0E 70 | Compare X register (absolute)
    BVS $D3              ; 70 D3 | Branch if overflow set
    BIT $06F9            ; 2C F9 06 | Test bits in accumulator (absolute)
    NOP                  ; EA | No operation
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    ASL $FCF0            ; 0E F0 FC | Arithmetic shift left (absolute)
    BVS $00              ; 70 00 | Branch if overflow set
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    AND $267E,Y          ; 39 7E 26 | Logical AND with accumulator (absolute,Y)
    STZ $0F              ; 64 0F | Store zero to zero page
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_050
; Address: $F88D58
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_050:
    CLC                  ; 18 | Clear carry flag
    ROR $6400,X          ; 7E 00 64 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BEQ $F4              ; F0 F4 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    STY $CC0E            ; 8C 0E CC | Store Y register to absolute address
    ASL $4EAC,X          ; 1E AC 4E | Arithmetic shift left (absolute,X)
    REP #$D3             ; C2 D3 | Reset processor status bits
    NOP                  ; EA | No operation
    SED                  ; F8 | Set decimal mode flag
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    BEQ $1E              ; F0 1E | Branch if equal
    CPX #$4E             ; E0 4E | Compare X register (immediate)
    BCS $87              ; B0 87 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    BIT $1867            ; 2C 67 18 | Test bits in accumulator (absolute)
    AND $3D16,Y          ; 39 16 3D | Logical AND with accumulator (absolute,Y)
    BIT $2C01            ; 2C 01 2C | Test bits in accumulator (absolute)
    ROL $2A00            ; 2E 00 2A | Rotate left (absolute)
    BPL $3A              ; 10 3A | Branch if positive
    ORA ($3B),Y          ; 11 3B | Logical OR with accumulator ((zero page),Y)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA #$13             ; 09 13 | Logical OR with accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    AND $3F3F,Y          ; 39 3F 3F | Logical AND with accumulator (absolute,Y)
    STX $FF              ; 86 FF | Store X register to zero page
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $F900,X          ; FE 00 F9 | Increment (absolute,X)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    INC $F8FE,X          ; FE FE F8 | Increment (absolute,X)
    BEQ $F8              ; F0 F8 | Branch if equal
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    INC $FE8C,X          ; FE 8C FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_051
; Address: $F88E0B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_051:
    STY $FE              ; 84 FE | Store Y register to zero page
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    ROL $64              ; 26 64 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    JMP $5800            ; 4C 00 58 | Jump to address

;------------------------------------------------------------------------------
; Bank70_DmaFunction_052
; Address: $F88E26
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_052:
    JSR $1068            ; 20 68 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    STZ $18              ; 64 18 | Store zero to zero page
    JMP $5830            ; 4C 30 58 | Jump to address

;------------------------------------------------------------------------------
; Bank70_DmaFunction_053
; Address: $F88E35
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_053:
    JSR $1068            ; 20 68 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($BA,X)          ; 01 BA | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    WDM #$DC             ; 42 DC | Reserved instruction
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    STY $38E0            ; 8C E0 38 | Store Y register to absolute address
    STZ $72              ; 64 72 | Store zero to zero page
    WDM #$3C             ; 42 3C | Reserved instruction
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    STY $3870            ; 8C 70 38 | Store Y register to absolute address
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    AND $2900,Y          ; 39 00 29 | Logical AND with accumulator (absolute,Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_055
; Address: $F88E90
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_055:
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_056
; Address: $F88E99
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_056:
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA $0000FF          ; 8F FF 00 00 | Store accumulator to absolute long address
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_057
; Address: $F88EEC
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_057:
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    BPL $31              ; 10 31 | Branch if positive
    ORA $1B08,Y          ; 19 08 1B | Logical OR with accumulator (absolute,Y)
    BPL $07              ; 10 07 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_058
; Address: $F88F13
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_058:
    JSL $06210E          ; 22 0E 21 06 | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_059
; Address: $F88F2D
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_059:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BMI $C0              ; 30 C0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_05A
; Address: $F88FA7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_05A:
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $20              ; F0 20 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BVS $F8              ; 70 F8 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_05B
; Address: $F88FCE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_05B:
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BVS $70              ; 70 70 | Branch if overflow set
    BPL $07              ; 10 07 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_05C
; Address: $F88FE3
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_05C:
    JSR $2707            ; 20 07 27 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BMI $17              ; 30 17 | Branch if negative
    BMI $17              ; 30 17 | Branch if negative
    BMI $2F              ; 30 2F | Branch if negative
    BPL $1F              ; 10 1F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BMI $0F              ; 30 0F | Branch if negative
    BRA $10              ; 80 10 | Branch always
    BRA $10              ; 80 10 | Branch always
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    BMI $38              ; 30 38 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    STZ $4C3E            ; 9C 3E 4C | Store zero to absolute
    STX $0766            ; 8E 66 07 | Store X register to absolute address
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SEC                  ; 38 | Set carry flag
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    CPY #$8E             ; C0 8E | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_05D
; Address: $F8901D
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_05D:
    BVS $07              ; 70 07 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BMI $17              ; 30 17 | Branch if negative
    BMI $17              ; 30 17 | Branch if negative
    BMI $2F              ; 30 2F | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BMI $0F              ; 30 0F | Branch if negative
    CPX #$04             ; E0 04 | Compare X register (immediate)
    CPX #$04             ; E0 04 | Compare X register (immediate)
    CPX #$E2             ; E0 E2 | Compare X register (immediate)
    BMI $32              ; 30 32 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    STZ $4C3E            ; 9C 3E 4C | Store zero to absolute
    STX $0766            ; 8E 66 07 | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    CPY #$8E             ; C0 8E | Compare Y register (immediate)
    BVS $07              ; 70 07 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BCS $80              ; B0 80 | Branch if carry set
    BCC $40              ; 90 40 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    BVS $90              ; 70 90 | Branch if overflow set
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BPL $60              ; 10 60 | Branch if positive
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $80              ; 10 80 | Branch if positive
    BVS $60              ; 70 60 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank70_DmaFunction_05E
; Address: $F8909E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_05E:
    BEQ $00              ; F0 00 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_060
; Address: $F890FF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_060:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    SBC $C84D,X          ; FD 4D C8 | Subtract with carry (absolute,X)
    EOR $30C8            ; 4D C8 30 | Exclusive OR with accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA ($40),Y          ; B1 40 | Load from (zero page),Y into accumulator
    BNE $50              ; D0 50 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_061
; Address: $F8912E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_061:
    JSR $FD68            ; 20 68 FD | Jump to subroutine
    INY                  ; C8 | Increment Y register
    BMI $C8              ; 30 C8 | Branch if negative
    BMI $98              ; 30 98 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_062
; Address: $F89138
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_062:
    LDA ($40),Y          ; B1 40 | Load from (zero page),Y into accumulator
    BNE $20              ; D0 20 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_063
; Address: $F8913D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_063:
    JSR $1068            ; 20 68 10 | Jump to subroutine
    STX $A7              ; 86 A7 | Store X register to zero page
    LDX #$63             ; A2 63 | Load immediate value into X register
    TAX                  ; AA | Transfer accumulator to X register
    PLP                  ; 28 | Pull processor status from stack
    SEP #$14             ; E2 14 | Set processor status bits
    STX $10              ; 86 10 | Store X register to zero page
    STY $A7              ; 84 A7 | Store Y register to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    CPY $1CE2            ; CC E2 1C | Compare Y register (absolute)
    STX $78              ; 86 78 | Store X register to zero page
    STY $78              ; 84 78 | Store Y register to zero page
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BMI $07              ; 30 07 | Branch if negative

;------------------------------------------------------------------------------
; Bank70_DmaFunction_064
; Address: $F8916B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_064:
    JSR $3017            ; 20 17 30 | Jump to subroutine
    ROL $037E            ; 2E 7E 03 | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    BMI $0F              ; 30 0F | Branch if negative
    ROR $E001,X          ; 7E 01 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank70_DmaFunction_065
; Address: $F89182
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_065:
    CPX #$04             ; E0 04 | Compare X register (immediate)
    CPX #$E2             ; E0 E2 | Compare X register (immediate)
    BMI $32              ; 30 32 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    STY $4C2E            ; 8C 2E 4C | Store Y register to absolute address
    STX $0766            ; 8E 66 07 | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    CPX #$2E             ; E0 2E | Compare X register (immediate)
    BNE $8E              ; D0 8E | Branch if not equal
    BVS $07              ; 70 07 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BPL $28              ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_066
; Address: $F891A2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_066:
    JSR $4068            ; 20 68 40 | Jump to subroutine
    BNE $30              ; D0 30 | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $9C              ; 10 9C | Branch if positive
    JMP $71C2            ; 4C C2 71 | Jump to address
    BEQ $38              ; F0 38 | Branch if equal
    ADC $1028,Y          ; 79 28 10 | Add with carry (absolute,Y)
    PLA                  ; 68 | Pull accumulator from stack
    BPL $D0              ; 10 D0 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_067
; Address: $F891B5
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_067:
    JSR $6098            ; 20 98 60 | Jump to subroutine
    STZ $C260            ; 9C 60 C2 | Store zero to absolute
    BEQ $0E              ; F0 0E | Branch if equal
    ADC $0006,Y          ; 79 06 00 | Add with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($EF,X)          ; 01 EF | Logical OR with accumulator ((zero page,X))
    LDY #$30             ; A0 30 | Load immediate value into Y register
    BCS $B8              ; B0 B8 | Branch if carry set
    BPL $18              ; 10 18 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $9C58            ; 9C 58 9C | Store zero to absolute
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $1CD8            ; 9C D8 1C | Store zero to absolute
    SEC                  ; 38 | Set carry flag
    BMI $C0              ; 30 C0 | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CPX #$9C             ; E0 9C | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_06A
; Address: $F891FD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_06A:
    CPX #$3C             ; E0 3C | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BVS $7F              ; 70 7F | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_06B
; Address: $F89229
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_06B:
    SED                  ; F8 | Set decimal mode flag
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    STA $FF87FF          ; 8F FF 87 FF | Store accumulator to absolute long address
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BVS $F8              ; 70 F8 | Branch if overflow set
    BMI $F8              ; 30 F8 | Branch if negative

;------------------------------------------------------------------------------
; Bank70_DmaFunction_06C
; Address: $F8924B
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_06C:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA ($28),Y          ; 11 28 | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    BPL $13              ; 10 13 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    BVS $18              ; 70 18 | Branch if overflow set
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $18              ; F0 18 | Branch if equal
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CMP $45              ; C5 45 | Compare accumulator (zero page)
    DEC $28              ; C6 28 | Decrement (zero page)
    STA $9A05            ; 8D 05 9A | Store accumulator to absolute address
    CMP $4B05,Y          ; D9 05 4B | Compare accumulator (absolute,Y)
    ROL $6A              ; 26 6A | Rotate left (zero page)
    CMP $38              ; C5 38 | Compare accumulator (zero page)
    DEC $38              ; C6 38 | Decrement (zero page)
    STA $9A70            ; 8D 70 9A | Store accumulator to absolute address
    ADC ($D9,X)          ; 61 D9 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_06D
; Address: $F892BB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_06D:
    JSR $304B            ; 20 4B 30 | Jump to subroutine
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($96),Y          ; 11 96 | Logical OR with accumulator ((zero page),Y)
    DEC $04              ; C6 04 | Decrement (zero page)
    ROL $A8              ; 26 A8 | Rotate left (zero page)
    STY $0C68            ; 8C 68 0C | Store Y register to absolute address
    BVC $98              ; 50 98 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    DEC $38              ; C6 38 | Decrement (zero page)
    ROL $D8              ; 26 D8 | Rotate left (zero page)
    STY $0C70            ; 8C 70 0C | Store Y register to absolute address
    BEQ $98              ; F0 98 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_06E
; Address: $F892E0
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_06E:
    AND $0A7F,X          ; 3D 7F 0A | Logical AND with accumulator (absolute,X)
    ROL $0C04,X          ; 3E 04 0C | Rotate left (absolute,X)
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ROL $0C01,X          ; 3E 01 0C | Rotate left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    LDA $A688,Y          ; B9 88 A6 | Load from absolute,Y into accumulator
    EOR ($F0,X)          ; 41 F0 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    ROR $02F0,X          ; 7E F0 02 | Rotate right (absolute,X)
    DEY                  ; 88 | Decrement Y register
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    BCS $38              ; B0 38 | Branch if carry set
    BVS $78              ; 70 78 | Branch if overflow set
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    CPY #$78             ; C0 78 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_06F
; Address: $F89343
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_06F:
    JSL $7F007F          ; 22 7F 00 7F | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $0CFF,X          ; 1D FF 0C | Logical OR with accumulator (absolute,X)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_070
; Address: $F89381
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_070:
    BEQ $F8              ; F0 F8 | Branch if equal
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    DEC $FF              ; C6 FF | Decrement (zero page)
    ASL $04FF            ; 0E FF 04 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ASL $1C0F            ; 0E 0F 1C | Arithmetic shift left (absolute)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $F0              ; 30 F0 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BIT $0C              ; 24 0C | Test bits in accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BIT $13              ; 24 13 | Test bits in accumulator (zero page)
    BPL $0F              ; 10 0F | Branch if positive
    BRA $30              ; 80 30 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $C0              ; 30 C0 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CPX #$04             ; E0 04 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_072
; Address: $F89449
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_072:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_073
; Address: $F89456
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_073:
    BRA $70              ; 80 70 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $1F              ; 80 1F | Branch always
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_074
; Address: $F89474
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_074:
    SEC                  ; 38 | Set carry flag
    ROR $7D7F,X          ; 7E 7F 7D | Rotate right (absolute,X)
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $3EFF,X          ; FE FF 3E | Increment (absolute,X)
    STA $FFFFFF          ; 8F FF FF FF | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $F8              ; 10 F8 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX $FCFC            ; EC FC FC | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BCC $F0              ; 90 F0 | Branch if carry clear
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_075
; Address: $F894F7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_075:
    CPX #$78             ; E0 78 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    ASL $1EFF,X          ; 1E FF 1E | Arithmetic shift left (absolute,X)
    ORA $23FF,Y          ; 19 FF 23 | Logical OR with accumulator (absolute,Y)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_076
; Address: $F8952D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_076:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    INC $F8FE,X          ; FE FE F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BVS $F8              ; 70 F8 | Branch if overflow set
    BMI $FE              ; 30 FE | Branch if negative
    SEC                  ; 38 | Set carry flag
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_077
; Address: $F89555
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_077:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ASL $FF0F            ; 0E 0F FF | Arithmetic shift left (absolute)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BCS $F0              ; B0 F0 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX $0FFC            ; EC FC 0F | Compare X register (absolute)
    ASL $180F            ; 0E 0F 18 | Arithmetic shift left (absolute)
    ORA $111F,Y          ; 19 1F 11 | Logical OR with accumulator (absolute,Y)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FE1C,X          ; FE 1C FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_078
; Address: $F89673
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_078:
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    ASL $347F,X          ; 1E 7F 34 | Arithmetic shift left (absolute,X)
    ROR $7C30,X          ; 7E 30 7C | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_07A
; Address: $F89698
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_07A:
    ROR $7C7E,X          ; 7E 7E 7C | Rotate right (absolute,X)
    BEQ $20              ; F0 20 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    ASL $0E0C,X          ; 1E 0C 0E | Arithmetic shift left (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    INC $1EFE,X          ; FE FE 1E | Increment (absolute,X)
    ASL $0E0E,X          ; 1E 0E 0E | Arithmetic shift left (absolute,X)
    AND $7818,X          ; 3D 18 78 | Logical AND with accumulator (absolute,X)
    BMI $70              ; 30 70 | Branch if negative

;------------------------------------------------------------------------------
; Bank70_DmaFunction_07C
; Address: $F896CA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_07C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    AND $7878,X          ; 3D 78 78 | Logical AND with accumulator (absolute,X)
    BVS $70              ; 70 70 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_07E
; Address: $F896DA
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_07E:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    BPL $18              ; 10 18 | Branch if positive
    STX $04              ; 86 04 | Store X register to zero page
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STX $86              ; 86 86 | Store X register to zero page
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROL $783F,X          ; 3E 3F 78 | Rotate left (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    INC $1EFF,X          ; FE FF 1E | Increment (absolute,X)
    STA $FF07FF          ; 8F FF 07 FF | Store accumulator to absolute long address
    DEC $FE              ; C6 FE | Decrement (zero page)
    INC $FE0C,X          ; FE 0C FE | Increment (absolute,X)
    INC $1C00,X          ; FE 00 1C | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ASL $0EFF            ; 0E FF 0E | Arithmetic shift left (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_080
; Address: $F897A2
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_080:
    SED                  ; F8 | Set decimal mode flag
    BMI $FC              ; 30 FC | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $3F              ; 10 3F | Branch if positive
    ASL $F000            ; 0E 00 F0 | Arithmetic shift left (absolute)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$FB             ; C0 FB | Compare Y register (immediate)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_081
; Address: $F8980D
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_081:
    SED                  ; F8 | Set decimal mode flag
    INC $001C,X          ; FE 1C 00 | Increment (absolute,X)
    BVS $70              ; 70 70 | Branch if overflow set
    PLX                  ; FA | Pull X register from stack
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC $0000,Y          ; F9 00 00 | Subtract with carry (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SBC $00F9,Y          ; F9 F9 00 | Subtract with carry (absolute,Y)
    CPX $0E40            ; EC 40 0E | Compare X register (absolute)
    CPX $0EEC            ; EC EC 0E | Compare X register (absolute)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    AND ($7F),Y          ; 31 7F | Logical AND with accumulator ((zero page),Y)
    SBC $FEF8,X          ; FD F8 FE | Subtract with carry (absolute,X)
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    INC $3EFF,X          ; FE FF 3E | Increment (absolute,X)
    ASL $1CFE,X          ; 1E FE 1C | Arithmetic shift left (absolute,X)
    CMP $CEFD,X          ; DD FD CE | Compare accumulator (absolute,X)
    INC $FEC6,X          ; FE C6 FE | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    ASL $0EFE            ; 0E FE 0E | Arithmetic shift left (absolute)
    ASL $0E06,X          ; 1E 06 0E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_082
; Address: $F8990A
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_082:
    SEC                  ; 38 | Set carry flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $1E1E,X          ; FE 1E 1E | Increment (absolute,X)
    ASL $0C0E            ; 0E 0E 0C | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($47,X)          ; 01 47 | Logical OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    WDM #$42             ; 42 42 | Hardware register operation
    INC $FF7C,X          ; FE 7C FF | Increment (absolute,X)
    INC $1EFF,X          ; FE FF 1E | Increment (absolute,X)
    INC $F3FE,X          ; FE FE F3 | Increment (absolute,X)
    SBC $3FFF,X          ; FD FF 3F | Subtract with carry (absolute,X)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    STA $068F03          ; 8F 03 8F 06 | Store accumulator to absolute long address
    STX $9E04            ; 8E 04 9E | Store X register to absolute address
    DEY                  ; 88 | Decrement Y register
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    STA $8F8F8F          ; 8F 8F 8F 8F | Store accumulator to absolute long address
    STX $9E8E            ; 8E 8E 9E | Store X register to absolute address
    STZ $8888,X          ; 9E 88 88 | Store zero to absolute,X
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDX $3F0C,Y          ; BE 0C 3F | Load from absolute,Y into X register
    ASL $075F            ; 0E 5F 07 | Arithmetic shift left (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDX $3FBE,Y          ; BE BE 3F | Load from absolute,Y into X register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    STZ $0E04,X          ; 9E 04 0E | Store zero to absolute,X
    BRA $80              ; 80 80 | Branch always
    STZ $0E9E,X          ; 9E 9E 0E | Store zero to absolute,X
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $FC18,X          ; FE 18 FC | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BPL $79              ; 10 79 | Branch if positive
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    BEQ $C0              ; F0 C0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_083
; Address: $F89A0D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_083:
    BVS $F8              ; 70 F8 | Branch if overflow set
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    ADC $F179,Y          ; 79 79 F1 | Add with carry (absolute,Y)
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_084
; Address: $F89A23
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_084:
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_085
; Address: $F89A2D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_085:
    JSR $0030            ; 20 30 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_087
; Address: $F89A34
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_087:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BMI $30              ; 30 30 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $8C00,X          ; 1E 00 8C | Arithmetic shift left (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BRA $E0              ; 80 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $8C1E,X          ; 1E 1E 8C | Arithmetic shift left (absolute,X)
    STY $8181            ; 8C 81 81 | Store Y register to absolute address
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_088
; Address: $F89A98
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_088:
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BCC $80              ; 90 80 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $0C              ; F0 0C | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    REP #$F6             ; C2 F6 | Reset processor status bits
    SBC ($5A),Y          ; F1 5A | Subtract with carry ((zero page),Y)
    INX                  ; E8 | Increment X register
    INC $0008,X          ; FE 08 00 | Increment (absolute,X)
    BCC $90              ; 90 90 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $0C              ; F0 0C | Branch if equal
    STX $F7C1            ; 8E C1 F7 | Store X register to absolute address
    BEQ $5D              ; F0 5D | Branch if equal
    JMP $00AAAB          ; 5C AB AA 00 | Jump to address long
    BCC $80              ; 90 80 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $0C              ; F0 0C | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    REP #$F6             ; C2 F6 | Reset processor status bits
    SBC ($5A),Y          ; F1 5A | Subtract with carry ((zero page),Y)
    INX                  ; E8 | Increment X register
    INC $00A8,X          ; FE A8 00 | Increment (absolute,X)
    BCC $90              ; 90 90 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $0C              ; F0 0C | Branch if equal
    STX $F7C1            ; 8E C1 F7 | Store X register to absolute address
    BEQ $FD              ; F0 FD | Branch if equal
    XBA                  ; EB | Exchange accumulator bytes
    NOP                  ; EA | No operation
    EOR $FFE9,Y          ; 59 E9 FF | Exclusive OR with accumulator (absolute,Y)
    ASL $00FE            ; 0E FE 00 | Arithmetic shift left (absolute)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_089
; Address: $F89B51
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_089:
    BEQ $5B              ; F0 5B | Branch if equal
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $030C            ; 0D 0C 03 | Logical OR with accumulator (absolute)
    LDY $A4              ; A4 A4 | Load from zero page into Y register
    INC $40EF            ; EE EF 40 | Increment (absolute)
    BRA $60              ; 80 60 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_08A
; Address: $F89B6C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_08A:
    JSR $C0B0            ; 20 B0 C0 | Jump to subroutine
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    INC $FE08,X          ; FE 08 FE | Increment (absolute,X)
    LDX $FEE1,Y          ; BE E1 FE | Load from absolute,Y into X register
    LDA ($FB,X)          ; A1 FB | Load from (zero page,X) into accumulator
    PEA #$0EFD           ; F4 FD 0E | Push effective address to stack
    DEX                  ; CA | Decrement X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX #$A3             ; A2 A3 | Load immediate value into X register
    SEP #$E2             ; E2 E2 | Set processor status bits
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BMI $E0              ; 30 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank70_DmaFunction_08C
; Address: $F89BA6
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_08C:
    BRA $A0              ; 80 A0 | Branch always
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BCS $60              ; B0 60 | Branch if carry set
    BEQ $40              ; F0 40 | Branch if equal
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $BE              ; 80 BE | Branch always
    XBA                  ; EB | Exchange accumulator bytes
    INC $FEA1,X          ; FE A1 FE | Increment (absolute,X)
    SBC ($FB,X)          ; E1 FB | Subtract with carry ((zero page,X))
    CMP $0206,X          ; DD 06 02 | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_08D
; Address: $F89BCD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_08D:
    CPX #$24             ; E0 24 | Compare X register (immediate)
    NOP                  ; EA | No operation
    XBA                  ; EB | Exchange accumulator bytes
    SEP #$E2             ; E2 E2 | Set processor status bits
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SBC $05              ; E5 05 | Subtract with carry (zero page)
    SBC $FC01,Y          ; F9 01 FC | Subtract with carry (absolute,Y)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_08E
; Address: $F89BE2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_08E:
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    BCS $A0              ; B0 A0 | Branch if carry set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BCS $60              ; B0 60 | Branch if carry set
    BEQ $40              ; F0 40 | Branch if equal
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_090
; Address: $F89BF6
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_090:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $FE              ; 80 FE | Branch always
    PLX                  ; FA | Pull X register from stack
    ORA $05DE,X          ; 1D DE 05 | Logical OR with accumulator (absolute,X)
    SBC ($24,X)          ; E1 24 | Subtract with carry ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL $E7E5,X          ; 1E E5 E7 | Arithmetic shift left (absolute,X)
    INC                  ; 1A | Increment accumulator
    INC $06              ; E6 06 | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    SBC $1E01,X          ; FD 01 1E | Subtract with carry (absolute,X)
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    CPY #$19             ; C0 19 | Compare Y register (immediate)
    CPX #$E4             ; E0 E4 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $60              ; 10 60 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    BCS $A0              ; B0 A0 | Branch if carry set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BCS $60              ; B0 60 | Branch if carry set
    BEQ $40              ; F0 40 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_093
; Address: $F89C36
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_093:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    LDA $F8F0F0          ; AF F0 F0 F8 | Load from absolute long address into accumulator
    REP #$03             ; C2 03 | Reset processor status bits
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    INC $F8FE,X          ; FE FE F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ASL $F800            ; 0E 00 F8 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_094
; Address: $F89C61
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_094:
    JSR $6040            ; 20 40 60 | Jump to subroutine
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CMP ($DF),Y          ; D1 DF | Compare accumulator ((zero page),Y)
    ROL $0FFF,X          ; 3E FF 0F | Rotate left (absolute,X)
    STZ $F8F8,X          ; 9E F8 F8 | Store zero to absolute,X
    BNE $20              ; D0 20 | Branch if not equal
    ROL $0F00,X          ; 3E 00 0F | Rotate left (absolute,X)
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    BMI $36              ; 30 36 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_097
; Address: $F89CA5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_097:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP #$CF             ; C9 CF | Compare accumulator (immediate)
    INC $F82E,X          ; FE 2E F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BMI $36              ; 30 36 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    BMI $33              ; 30 33 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    DEC $2800,X          ; DE 00 28 | Decrement (absolute,X)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank70_DmaFunction_098
; Address: $F89CEB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_098:
    INC $F8EE,X          ; FE EE F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    DEC                  ; 3A | Decrement accumulator
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    BMI $33              ; 30 33 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ASL $E800            ; 0E 00 E8 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_099
; Address: $F89D02
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_099:
    RTI                  ; 40 | Return from interrupt
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $1D              ; 05 1D | Logical OR with accumulator (zero page)
    ORA $3839,Y          ; 19 39 38 | Logical OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC $00FF            ; EE FF 00 | Increment (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BVC $C0              ; 50 C0 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    BMI $34              ; 30 34 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    TXA                  ; 8A | Transfer X register to accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    XBA                  ; EB | Exchange accumulator bytes
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $00              ; 10 00 | Branch if positive
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    BPL $2C              ; 10 2C | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BRA $00              ; 80 00 | Branch always
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    BPL $30              ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_09A
; Address: $F89DAD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_09A:
    JSR $E323            ; 20 23 E3 | Jump to subroutine
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BCS $70              ; B0 70 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_09B
; Address: $F89DCB
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_09B:
    ROR                  ; 6A | Rotate right (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_09C
; Address: $F89DCE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_09C:
    SEC                  ; 38 | Set carry flag
    AND $0000,Y          ; 39 00 00 | Logical AND with accumulator (absolute,Y)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    PEA #$F650           ; F4 50 F6 | Push effective address to stack
    BMI $00              ; 30 00 | Branch if negative
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_09D
; Address: $F89E1C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_09D:
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    DEC                  ; 3A | Decrement accumulator
    PLY                  ; 7A | Pull Y register from stack
    EOR $00D9,Y          ; 59 D9 00 | Exclusive OR with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $0018,X          ; 3E 18 00 | Rotate left (absolute,X)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BVC $D0              ; 50 D0 | Branch if overflow clear
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $5450            ; 9C 50 54 | Store zero to absolute
    STZ $66              ; 64 66 | Store zero to zero page
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$80             ; A0 80 | Load immediate value into Y register
    CPX #$80             ; E0 80 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_09E
; Address: $F89E60
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_09E:
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ASL $070D            ; 0E 0D 07 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR $7E77,X          ; 5E 77 7E | Logical shift right (absolute,X)
    ASL $5F              ; 06 5F | Arithmetic shift left (zero page)
    ROR $0DF7            ; 6E F7 0D | Rotate right (absolute)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $C1              ; F0 C1 | Branch if equal

;------------------------------------------------------------------------------
; Bank70_DmaFunction_09F
; Address: $F89E94
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_09F:
    SBC ($43,X)          ; E1 43 | Subtract with carry ((zero page,X))
    CMP ($43,X)          ; C1 43 | Compare accumulator ((zero page,X))
    BRA $01              ; 80 01 | Branch always
    LDY #$01             ; A0 01 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    AND #$D2             ; 29 D2 | Logical AND with accumulator (immediate)
    SBC $62F8,Y          ; F9 F8 62 | Subtract with carry (absolute,Y)
    BCS $1C              ; B0 1C | Branch if carry set
    DEX                  ; CA | Decrement X register
    DEC $60              ; C6 60 | Decrement (zero page)
    BCS $30              ; B0 30 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    BMI $06              ; 30 06 | Branch if negative
    STA                  ; 9F 9F FF CF | Store accumulator to absolute long,X
    STA                  ; 9F FF 4F FF | Store accumulator to absolute long,X
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0A0
; Address: $F89ECD
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0A0:
    JSR $2020            ; 20 20 20 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$03             ; E0 03 | Compare X register (immediate)
    ROR $19EE            ; 6E EE 19 | Rotate right (absolute)
    STA $B6B6,Y          ; 99 B6 B6 | Store accumulator to absolute,Y
    ADC $65              ; 65 65 | Add with carry (zero page)
    ROL $6E              ; 26 6E | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    EOR $9A10,Y          ; 59 10 9A | Exclusive OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0A1
; Address: $F89F01
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0A1:
    JMP ($B7B4)          ; 6C B4 B7 | Jump to address (absolute indirect)
    TXS                  ; 9A | Transfer X register to stack pointer
    LDA                  ; BF 87 FF 09 | Load from absolute long,X into accumulator
    CPY $C6BC            ; CC BC C6 | Compare Y register (absolute)
    LDY $0090,X          ; BC 90 00 | Load from absolute,X into Y register
    CMP #$81             ; C9 81 | Compare accumulator (immediate)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ASL $1F0E            ; 0E 0E 1F | Arithmetic shift left (absolute)
    LDA ($CC),Y          ; B1 CC | Load from (zero page),Y into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    CMP $86CE            ; CD CE 86 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0A2
; Address: $F89F2A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0A2:
    CMP $C903            ; CD 03 C9 | Compare accumulator (absolute)
    ORA ($C3),Y          ; 11 C3 | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BCS $70              ; B0 70 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    STY $B4              ; 84 B4 | Store Y register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    ADC $FEFE,Y          ; 79 FE FE | Add with carry (absolute,Y)
    INC $D6FF,X          ; FE FF D6 | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0A3
; Address: $F89F4A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0A3:
    JSR $A030            ; 20 30 A0 | Jump to subroutine
    BCS $50              ; B0 50 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0A4
; Address: $F89F5E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0A4:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    LDA                  ; BF 40 7F 00 | Load from absolute long,X into accumulator
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX $E0              ; E4 E0 | Game work RAM access
    BNE $FE              ; D0 FE | Branch if not equal
    PLX                  ; FA | Pull X register from stack
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    INC $FF03,X          ; FE 03 FF | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0A5
; Address: $F89FB1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0A5:
    JSR $002C            ; 20 2C 00 | Jump to subroutine
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA $67A5,X          ; 1D A5 67 | Logical OR with accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ROL $0E6C,X          ; 3E 6C 0E | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0A6
; Address: $F89FCC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0A6:
    ROL $41              ; 26 41 | Rotate left (zero page)
    LSR $04              ; 46 04 | Logical shift right (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $030F            ; 0D 0F 03 | Logical OR with accumulator (absolute)
    ORA $703F,X          ; 1D 3F 70 | Logical OR with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    CPY $CCBE            ; CC BE CC | Compare Y register (absolute)
    LDX $7CD8,Y          ; BE D8 7C | Load from absolute,Y into X register
    SED                  ; F8 | Set decimal mode flag
    JMP ($0CE0)          ; 6C E0 0C | Jump to address (absolute indirect)
    INY                  ; C8 | Increment Y register
    BVC $88              ; 50 88 | Branch if overflow clear
    CPY $40              ; C4 40 | Compare Y register (zero page)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0A7
; Address: $F89FF5
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0A7:
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BVS $F8              ; 70 F8 | Branch if overflow set
    ASL $0C07            ; 0E 07 0C | Arithmetic shift left (absolute)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STA $BAE7,X          ; 9D E7 BA | Store accumulator to absolute,X
    PLY                  ; 7A | Pull Y register from stack
    BCS $4F              ; B0 4F | Branch if carry set
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    PLX                  ; FA | Pull X register from stack
    ORA $F3              ; 05 F3 | Logical OR with accumulator (zero page)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    ORA $BD58            ; 0D 58 BD | Logical OR with accumulator (absolute)
    BIT $B6DE            ; 2C DE B6 | Test bits in accumulator (absolute)
    AND $5EC3,X          ; 3D C3 5E | Logical AND with accumulator (absolute,X)
    LDA ($BC,X)          ; A1 BC | Load from (zero page,X) into accumulator
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    BPL $03              ; 10 03 | Branch if positive
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $30              ; 10 30 | Branch if positive
    BVC $10              ; 50 10 | Branch if overflow clear
    BCS $10              ; B0 10 | Branch if carry set
    BVS $08              ; 70 08 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0A8
; Address: $F8A06C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0A8:
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    BPL $10              ; 10 10 | Branch if positive
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BVS $F8              ; 70 F8 | Branch if overflow set
    BMI $F8              ; 30 F8 | Branch if negative
    BPL $F8              ; 10 F8 | Branch if positive
    BPL $78              ; 10 78 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    EOR $D64F            ; 4D 4F D6 | Exclusive OR with accumulator (absolute)
    CMP $F4BF,X          ; DD BF F4 | Compare accumulator (absolute,X)
    LDA $E13AF0          ; AF F0 3A E1 | Load from absolute long address into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0A9
; Address: $F8A0AD
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0A9:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BCS $00              ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0AA
; Address: $F8A0B2
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0AA:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 72 35 FB | Load from absolute long,X into accumulator
    SBC $798E,Y          ; F9 8E 79 | Subtract with carry (absolute,Y)
    JMP ($36C9)          ; 6C C9 36 | Jump to address (absolute indirect)
    ASL $0701            ; 0E 01 07 | Arithmetic shift left (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    STA $32              ; 85 32 | Store accumulator to zero page
    STA $32              ; 85 32 | Store accumulator to zero page
    CMP $B2              ; C5 B2 | Compare accumulator (zero page)
    JMP $E896            ; 4C 96 E8 | Jump to address
    INX                  ; E8 | Increment X register
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    INC $FE78,X          ; FE 78 FE | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    BPL $3C              ; 10 3C | Branch if positive
    LDY #$68             ; A0 68 | Load immediate value into Y register
    BNE $38              ; D0 38 | Branch if not equal
    CPX #$14             ; E0 14 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    CLV                  ; B8 | Clear overflow flag
    JMP $2CD8            ; 4C D8 2C | Jump to address
    BVC $2C              ; 50 2C | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0AB
; Address: $F8A110
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0AB:
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0AC
; Address: $F8A140
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0AC:
    JSR $30FF            ; 20 FF 30 | Jump to subroutine
    BMI $FF              ; 30 FF | Branch if negative
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    BCC $6F              ; 90 6F | Branch if carry clear
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA $31FE,Y          ; 19 FE 31 | Logical OR with accumulator (absolute,Y)
    INC $FD22,X          ; FE 22 FD | Increment (absolute,X)
    CPX $D827            ; EC 27 D8 | Compare X register (absolute)
    LDY $0060,X          ; BC 60 00 | Load from absolute,X into Y register
    BRA $60              ; 80 60 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    AND ($08),Y          ; 31 08 | Logical AND with accumulator ((zero page),Y)
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BCC $18              ; 90 18 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0AD
; Address: $F8A1C2
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0AD:
    JSR $2010            ; 20 10 20 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    ASL $1B03            ; 0E 03 1B | Arithmetic shift left (absolute)
    BIT $7A35            ; 2C 35 7A | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0AE
; Address: $F8A1E8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0AE:
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $321D,X          ; 1D 1D 32 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    STA                  ; 9F DD 3D E7 | Store accumulator to absolute long,X
    ROL $EF49            ; 2E 49 EF | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0AF
; Address: $F8A20F
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0AF:
    JSR $1F0D            ; 20 0D 1F | Jump to subroutine
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ADC $0002,X          ; 7D 02 00 | Add with carry (absolute,X)
    BCC $6F              ; 90 6F | Branch if carry clear
    BCC $6F              ; 90 6F | Branch if carry clear
    BCC $88              ; 90 88 | Branch if carry clear
    CLI                  ; 58 | Clear interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    NOP                  ; EA | No operation
    DEY                  ; 88 | Decrement Y register
    INC                  ; 1A | Increment accumulator
    ASL $8A              ; 06 8A | Arithmetic shift left (zero page)
    STZ $21              ; 64 21 | PPU graphics register access
    LDA ($11),Y          ; B1 11 | Load from (zero page),Y into accumulator
    BCS $78              ; B0 78 | Branch if carry set
    PEA #$1C1E           ; F4 1E 1C | Push effective address to stack
    INC $06              ; E6 06 | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $1A06            ; 0D 06 1A | Logical OR with accumulator (absolute)
    ORA $0A1D            ; 0D 1D 0A | Logical OR with accumulator (absolute)
    ASL $152A,X          ; 1E 2A 15 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $05F4            ; 9C F4 05 | Store zero to absolute
    ADC $9F              ; 65 9F | Add with carry (zero page)
    CMP $673D,X          ; DD 3D 67 | Compare accumulator (absolute,X)
    BRA $2E              ; 80 2E | Branch always
    EOR #$EF             ; 49 EF | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0B1
; Address: $F8A2B6
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0B1:
    ADC $0002,X          ; 7D 02 00 | Add with carry (absolute,X)
    BCC $6F              ; 90 6F | Branch if carry clear
    BCC $6F              ; 90 6F | Branch if carry clear
    BCC $A8              ; 90 A8 | Branch if carry clear
    JMP ($F2D8)          ; 6C D8 F2 | Jump to address (absolute indirect)
    DEY                  ; 88 | Decrement Y register
    INC                  ; 1A | Increment accumulator
    ASL $8A              ; 06 8A | Arithmetic shift left (zero page)
    STZ $21              ; 64 21 | PPU graphics register access
    LDA ($11),Y          ; B1 11 | Load from (zero page),Y into accumulator
    BCC $7C              ; 90 7C | Branch if carry clear
    CPX $16              ; E4 16 | Compare X register (zero page)
    INC $06              ; E6 06 | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y
    BIT $0408            ; 2C 08 04 | Test bits in accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $0E06            ; 0D 06 0E | Logical OR with accumulator (absolute)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA $484C,Y          ; B9 4C 48 | Load from absolute,Y into accumulator
    PLB                  ; AB | Pull data bank register from stack
    BIT #$6D             ; 89 6D | Test bits in accumulator (immediate)
    EOR $E7BD,X          ; 5D BD E7 | Exclusive OR with accumulator (absolute,X)
    ROL $EF49            ; 2E 49 EF | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0B2
; Address: $F8A32F
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0B2:
    JSR $0E07            ; 20 07 0E | Jump to subroutine
    ORA $7D32,X          ; 1D 32 7D | Logical OR with accumulator (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BCC $6F              ; 90 6F | Branch if carry clear
    BCC $6F              ; 90 6F | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROL $150D            ; 2E 0D 15 | Rotate left (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0B3
; Address: $F8A373
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0B3:
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    BPL $15              ; 10 15 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    STA ($6C),Y          ; 91 6C | Store accumulator to (zero page),Y
    JMP ($B7A6)          ; 6C A6 B7 | Jump to address (absolute indirect)
    SBC $9253,X          ; FD 53 92 | Subtract with carry (absolute,X)
    EOR ($E1,X)          ; 41 E1 | Exclusive OR with accumulator ((zero page,X))
    BCS $27              ; B0 27 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    JMP ($B793)          ; 6C 93 B7 | Jump to address (absolute indirect)
    PHA                  ; 48 | Push accumulator to stack
    LDY #$53             ; A0 53 | Load immediate value into Y register
    LDY #$E1             ; A0 E1 | Load immediate value into Y register
    DEY                  ; 88 | Decrement Y register
    ROR                  ; 6A | Rotate right (accumulator)
    EOR $2E7E,Y          ; 59 7E 2E | Exclusive OR with accumulator (absolute,Y)
    BEQ $30              ; F0 30 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    STA                  ; 9F 60 3F C0 | Store accumulator to absolute long,X
    BRA $FE              ; 80 FE | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ROR $007E,X          ; 7E 7E 00 | Rotate right (absolute,X)
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0B4
; Address: $F8A44A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0B4:
    JSR $D0E0            ; 20 E0 D0 | Jump to subroutine
    BNE $A0              ; D0 A0 | Branch if not equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0B6
; Address: $F8A46C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0B6:
    STZ $27              ; 64 27 | Store zero to zero page
    AND ($09),Y          ; 31 09 | Logical AND with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVS $73              ; 70 73 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0B7
; Address: $F8A4AE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0B7:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    BMI $60              ; 30 60 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0B8
; Address: $F8A4C4
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0B8:
    JSR $3404            ; 20 04 34 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BCS $F0              ; B0 F0 | Branch if carry set
    INC $3F3E,X          ; FE 3E 3F | Increment (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $003E,X          ; FE 3E 00 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    BIT $516E            ; 2C 6E 51 | Test bits in accumulator (absolute)
    CMP $9E25,X          ; DD 25 9E | Compare accumulator (absolute,X)
    LSR $9898            ; 4E 98 98 | Logical shift right (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0B9
; Address: $F8A538
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0B9:
    JSL $004000          ; 22 00 40 00 | Jump to subroutine long
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $590F            ; 0D 0F 59 | Logical OR with accumulator (absolute)
    EOR $BF24,X          ; 5D 24 BF | Exclusive OR with accumulator (absolute,X)
    CMP $A2E2,X          ; DD E2 A2 | Compare accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0BA
; Address: $F8A553
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0BA:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0BB
; Address: $F8A566
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0BB:
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ADC ($E1,X)          ; 61 E1 | Add with carry ((zero page,X))
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $66              ; 66 66 | Rotate right (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP ($317F)          ; 6C 7F 31 | Jump to address (absolute indirect)
    DEC $F3F3            ; CE F3 F3 | Decrement (absolute)
    ROR $DF              ; 66 DF | Rotate right (zero page)
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BPL $D8              ; 10 D8 | Branch if positive
    INX                  ; E8 | Increment X register
    BEQ $30              ; F0 30 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0BC
; Address: $F8A5D4
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0BC:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL $0E1E            ; 0E 1E 0E | Arithmetic shift left (absolute)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $37378F          ; 8F 8F 37 37 | Store accumulator to absolute long address
    ADC ($F1),Y          ; 71 F1 | Add with carry ((zero page),Y)
    STY $038C            ; 8C 8C 03 | Store Y register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($73,X)          ; 01 73 | Logical OR with accumulator ((zero page,X))
    BNE $D0              ; D0 D0 | Branch if not equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVC $50              ; 50 50 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BPL $D8              ; 10 D8 | Branch if positive
    INX                  ; E8 | Increment X register
    BEQ $70              ; F0 70 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0BF
; Address: $F8A665
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0BF:
    CPX #$DC             ; E0 DC | Compare X register (immediate)
    AND $1607,Y          ; 39 07 16 | Logical AND with accumulator (absolute,Y)
    ASL $010E            ; 0E 0E 01 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BVC $50              ; 50 50 | Branch if overflow clear
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    BNE $E0              ; D0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    BNE $80              ; D0 80 | Branch if not equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0C0
; Address: $F8A6C0
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0C0:
    JSR $30FF            ; 20 FF 30 | Jump to subroutine
    BMI $FF              ; 30 FF | Branch if negative
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    BCC $6F              ; 90 6F | Branch if carry clear
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$09             ; C0 09 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA $31FE,Y          ; 19 FE 31 | Logical OR with accumulator (absolute,Y)
    INC $FD22,X          ; FE 22 FD | Increment (absolute,X)
    CPX $D827            ; EC 27 D8 | Compare X register (absolute)
    INC $0006,X          ; FE 06 00 | Increment (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0C1
; Address: $F8A729
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0C1:
    ORA $0F08            ; 0D 08 0F | Logical OR with accumulator (absolute)
    BPL $1B              ; 10 1B | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0C2
; Address: $F8A74A
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0C2:
    JSR $10E0            ; 20 E0 10 | Jump to subroutine
    BCS $10              ; B0 10 | Branch if carry set
    BEQ $00              ; F0 00 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA $3B10,X          ; 1D 10 3B | Logical OR with accumulator (absolute,X)
    BPL $5B              ; 10 5B | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    BIT $001F            ; 2C 1F 00 | Test bits in accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BVS $10              ; 70 10 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    BPL $B4              ; 10 B4 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $68              ; F0 68 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ROL $1D6E            ; 2E 6E 1D | Rotate left (absolute)
    ADC $27              ; 65 27 | Add with carry (zero page)
    ASL $0406            ; 0E 06 04 | Arithmetic shift left (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BVC $D0              ; 50 D0 | Branch if overflow clear
    CLD                  ; D8 | Clear decimal mode flag
    INX                  ; E8 | Increment X register
    CPX $4C70            ; EC 70 4C | Compare X register (absolute)
    INY                  ; C8 | Increment Y register
    TSX                  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0C3
; Address: $F8A7D6
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0C3:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$80             ; A0 80 | Load immediate value into Y register
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    LDY $A0              ; A4 A0 | Load from zero page into Y register
    ORA ($31),Y          ; 11 31 | Logical OR with accumulator ((zero page),Y)
    ROL $1D6E            ; 2E 6E 1D | Rotate left (absolute)
    ADC $67              ; 65 67 | Add with carry (zero page)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ASL $0406            ; 0E 06 04 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BVC $D0              ; 50 D0 | Branch if overflow clear
    CLD                  ; D8 | Clear decimal mode flag
    INX                  ; E8 | Increment X register
    CPX $4C70            ; EC 70 4C | Compare X register (absolute)
    CPY $00BE            ; CC BE 00 | Compare Y register (absolute)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$80             ; A0 80 | Load immediate value into Y register
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $335D,X          ; 1D 5D 33 | Logical OR with accumulator (absolute,X)
    STZ $E5              ; 64 E5 | Store zero to zero page
    CPY $3ACF            ; CC CF 3A | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $3E0E,X          ; 1E 0E 3E | Arithmetic shift left (absolute,X)
    BMI $7A              ; 30 7A | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0C4
; Address: $F8A83C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0C4:
    BVS $40              ; 70 40 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $25              ; 05 25 | Logical OR with accumulator (zero page)
    ORA $365D,X          ; 1D 5D 36 | Logical OR with accumulator (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0C5
; Address: $F8A84F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0C5:
    NOP                  ; EA | No operation
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $1E06            ; 0E 06 1E | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BMI $3C              ; 30 3C | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0C6
; Address: $F8A880
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0C6:
    CMP $0902            ; CD 02 09 | Compare accumulator (absolute)
    STX $09              ; 86 09 | Store X register to zero page
    ASL $13              ; 06 13 | Arithmetic shift left (zero page)
    ASL $0A1F            ; 0E 1F 0A | Arithmetic shift left (absolute)
    ASL $2E0B,X          ; 1E 0B 2E | Arithmetic shift left (absolute,X)
    AND $8016,Y          ; 39 16 80 | Logical AND with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $01              ; E6 01 | Increment (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0C8
; Address: $F8A8A5
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0C8:
    BRA $60              ; 80 60 | Branch always
    BRA $50              ; 80 50 | Branch always
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    CPX #$02             ; E0 02 | Compare X register (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    BEQ $00              ; F0 00 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $17              ; 10 17 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0CA
; Address: $F8A8E8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0CA:
    JSR $522D            ; 20 2D 52 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    ASL $0870            ; 0E 70 08 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    BPL $D0              ; 10 D0 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    BIT $D4              ; 24 D4 | Test bits in accumulator (zero page)
    CPX #$1C             ; E0 1C | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0CB
; Address: $F8A910
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0CB:
    JSR $30F0            ; 20 F0 30 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive
    BCC $F8              ; 90 F8 | Branch if carry clear
    BCC $F8              ; 90 F8 | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0CC
; Address: $F8A920
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0CC:
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    BVC $CF              ; 50 CF | Branch if overflow clear
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    BVC $BF              ; 50 BF | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    BIT $1813            ; 2C 13 18 | Test bits in accumulator (absolute)
    BPL $3F              ; 10 3F | Branch if positive
    BMI $FF              ; 30 FF | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CPY $EE2C            ; CC 2C EE | Compare Y register (absolute)
    INC $0A              ; E6 0A | Increment (zero page)
    INC $FA0A,X          ; FE 0A FA | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BMI $DC              ; 30 DC | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    BCC $30              ; 90 30 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    INC $FE04,X          ; FE 04 FE | Increment (absolute,X)
    INC $FE04,X          ; FE 04 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0CD
; Address: $F8A95C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0CD:
    JSR $60FC            ; 20 FC 60 | Jump to subroutine
    BEQ $24              ; F0 24 | Branch if equal
    LDA $AB38,Y          ; B9 38 AB | Load from absolute,Y into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0CE
; Address: $F8A966
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0CE:
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $3F3F,X          ; 1D 3F 3F | Logical OR with accumulator (absolute,X)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    TAX                  ; AA | Transfer accumulator to X register
    BIT $04CE            ; 2C CE 04 | Test bits in accumulator (absolute)
    STX $B444            ; 8E 44 B4 | Store X register to absolute address
    BCC $FC              ; 90 FC | Branch if carry clear
    BMI $D8              ; 30 D8 | Branch if negative

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0CF
; Address: $F8A98E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0CF:
    JSR $E4B0            ; 20 B0 E4 | Jump to subroutine
    CPX #$D4             ; E0 D4 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0D1
; Address: $F8A99C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0D1:
    JSR $40F8            ; 20 F8 40 | Jump to subroutine
    BEQ $27              ; F0 27 | Branch if equal
    TSX                  ; BA | Transfer stack pointer to X register
    CPY $ED4E            ; CC 4E ED | Compare Y register (absolute)
    JMP ($14C1)          ; 6C C1 14 | Jump to address (absolute indirect)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    EOR $330F            ; 4D 0F 33 | Exclusive OR with accumulator (absolute)
    ORA $0F3F,X          ; 1D 3F 0F | Logical OR with accumulator (absolute,X)
    INY                  ; C8 | Increment Y register
    TSX                  ; BA | Transfer stack pointer to X register
    BEQ $66              ; F0 66 | Branch if equal
    JMP ($5002)          ; 6C 02 50 | Jump to address (absolute indirect)
    STY $9830            ; 8C 30 98 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0D2
; Address: $F8A9CC
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0D2:
    JSR $2090            ; 20 90 20 | Jump to subroutine
    BCS $64              ; B0 64 | Branch if carry set
    CPX #$8C             ; E0 8C | Compare X register (immediate)
    CPY $FC9C            ; CC 9C FC | Compare Y register (absolute)
    BVS $F8              ; 70 F8 | Branch if overflow set
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDX $86AC            ; AE AC 86 | Load from absolute address into X register
    LDY $7C16            ; AC 16 7C | Load from absolute address into Y register
    TAX                  ; AA | Transfer accumulator to X register
    PEA #$E0B4           ; F4 B4 E0 | Game work RAM access
    BVC $E0              ; 50 E0 | Game work RAM access
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BNE $80              ; D0 80 | Branch if not equal
    BNE $80              ; D0 80 | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0D3
; Address: $F8AA40
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0D3:
    AND $56BE,X          ; 3D BE 56 | Logical AND with accumulator (absolute,X)
    LSR $D4              ; 46 D4 | Logical shift right (zero page)
    NOP                  ; EA | No operation
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    BMI $A8              ; 30 A8 | Branch if negative
    BCS $90              ; B0 90 | Branch if carry set
    LDY #$68             ; A0 68 | Load immediate value into Y register
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    DEC                  ; 3A | Decrement accumulator
    BCS $60              ; B0 60 | Branch if carry set
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $0E20            ; 0E 20 0E | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    ASL $060B,X          ; 1E 0B 06 | Arithmetic shift left (absolute,X)
    ORA $0602            ; 0D 02 06 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$08             ; E0 08 | Compare X register (immediate)
    CPX #$38             ; E0 38 | Compare X register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0D4
; Address: $F8AACB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0D4:
    BRA $C0              ; 80 C0 | Branch always
    BRA $F0              ; 80 F0 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BPL $2B              ; 10 2B | Branch if positive
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0D5
; Address: $F8AAE3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0D5:
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    ASL $0301            ; 0E 01 03 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $A8              ; 10 A8 | Branch if positive
    BMI $48              ; 30 48 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0D6
; Address: $F8AB05
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0D6:
    BCC $E0              ; 90 E0 | Game work RAM access
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA $0200            ; 0D 00 02 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0D7
; Address: $F8AB43
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0D7:
    BRA $00              ; 80 00 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ORA $0402            ; 0D 02 04 | Logical OR with accumulator (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0D8
; Address: $F8AB81
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0D8:
    JSR $6040            ; 20 40 60 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0DA
; Address: $F8ABE3
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0DA:
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $F0              ; 70 F0 | Branch if overflow set
    STZ $B900,X          ; 9E 00 B9 | Store zero to absolute,X
    BIT $BE              ; 24 BE | Test bits in accumulator (zero page)
    BRA $0F              ; 80 0F | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $0F              ; F0 0F | Branch if equal
    LDY $BE43,X          ; BC 43 BE | Load from absolute,X into Y register
    EOR ($BF,X)          ; 41 BF | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0DB
; Address: $F8AC44
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0DB:
    JSR $1030            ; 20 30 10 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    BCC $84              ; 90 84 | Branch if carry clear
    CPY $46              ; C4 46 | Compare Y register (zero page)
    JMP $804E            ; 4C 4E 80 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0DC
; Address: $F8AC53
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0DC:
    BRA $30              ; 80 30 | Branch always
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    BEQ $84              ; F0 84 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    LSR $B8              ; 46 B8 | Logical shift right (zero page)
    LSR $00B0            ; 4E B0 00 | Logical shift right (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    PHY                  ; 5A | Push Y register to stack
    ROL $66BF,X          ; 3E BF 66 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0DD
; Address: $F8AC8B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0DD:
    ROR $4B              ; 66 4B | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    ROR $FF3E,X          ; 7E 3E FF | Rotate right (absolute,X)
    ROR $F7              ; 66 F7 | Rotate right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0DE
; Address: $F8ACA5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0DE:
    JSL $BA4D0D          ; 22 0D 4D BA | Jump to subroutine long
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    EOR $BE32            ; 4D 32 BE | Exclusive OR with accumulator (absolute)
    EOR ($55,X)          ; 41 55 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0DF
; Address: $F8ACBB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0DF:
    JSL $030225          ; 22 25 02 03 | Jump to subroutine long
    ASL $8E21,X          ; 1E 21 8E | Arithmetic shift left (absolute,X)
    BPL $C9              ; 10 C9 | Branch if positive
    LDA ($B1),Y          ; B1 B1 | Load from (zero page),Y into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    PEA #$494F           ; F4 4F 49 | Push effective address to stack
    ASL $86              ; 06 86 | Arithmetic shift left (zero page)
    CPY #$9E             ; C0 9E | Compare Y register (immediate)
    ADC ($CC,X)          ; 61 CC | Add with carry ((zero page,X))
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0E0
; Address: $F8ACD9
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0E0:
    JSR $807F            ; 20 7F 80 | Jump to subroutine
    BRA $86              ; 80 86 | Branch always
    JMP $AA7C22          ; 5C 22 7C AA | Jump to address long
    STZ $F8              ; 64 F8 | Store zero to zero page
    CLV                  ; B8 | Clear overflow flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LSR $7EA0,X          ; 5E A0 7E | Logical shift right (absolute,X)
    BRA $FE              ; 80 FE | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0F06            ; 0D 06 0F | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $14              ; 06 14 | Arithmetic shift left (zero page)
    BPL $03              ; 10 03 | Branch if positive
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BVS $7F              ; 70 7F | Branch if overflow set
    ROR $C759,X          ; 7E 59 C7 | Rotate right (absolute,X)
    AND $83              ; 25 83 | Logical AND with accumulator (zero page)
    LDX #$81             ; A2 81 | Load immediate value into X register
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0E2
; Address: $F8AD34
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0E2:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0E3
; Address: $F8AD52
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0E3:
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA #$67             ; 09 67 | Logical OR with accumulator (immediate)
    BMI $36              ; 30 36 | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    EOR #$63             ; 49 63 | Exclusive OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CMP #$CF             ; C9 CF | Compare accumulator (immediate)
    AND #$2F             ; 29 2F | Logical AND with accumulator (immediate)
    STA $559F,Y          ; 99 9F 55 | Store accumulator to absolute,Y
    STZ $011F,X          ; 9E 1F 01 | Store zero to absolute,X
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    CMP $692D            ; CD 2D 69 | Compare accumulator (absolute)
    ORA $5DED,Y          ; 19 ED 5D | Logical OR with accumulator (absolute,Y)
    INC $8096            ; EE 96 80 | Increment (absolute)
    BRA $40              ; 80 40 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0E5
; Address: $F8ADE2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0E5:
    BVC $70              ; 50 70 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    INC $FC38,X          ; FE 38 FC | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0E7
; Address: $F8ADF2
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0E7:
    BVS $70              ; 70 70 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    ROR $D9DE            ; 6E DE D9 | Rotate right (absolute)
    LDY $01A6,X          ; BC A6 01 | Load from absolute,X into Y register
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ASL $010F            ; 0E 0F 01 | Arithmetic shift left (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $090D            ; 0D 0D 09 | Logical OR with accumulator (absolute)
    ORA $2D1D,Y          ; 19 1D 2D | Logical OR with accumulator (absolute,Y)
    ASL $0F16            ; 0E 16 0F | Arithmetic shift left (absolute)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($ED,X)          ; 01 ED | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    LDA ($FB),Y          ; B1 FB | Load from (zero page),Y into accumulator
    PHB                  ; 8B | Push data bank register to stack
    LSR $7F              ; 46 7F | Logical shift right (zero page)
    CMP $C7              ; C5 C7 | Compare accumulator (zero page)
    AND $9303,X          ; 3D 03 93 | Logical AND with accumulator (absolute,X)
    ROR $FB87,X          ; 7E 87 FB | Rotate right (absolute,X)
    BIT #$39             ; 89 39 | Test bits in accumulator (immediate)
    LSR $03              ; 46 03 | Logical shift right (zero page)
    DEC                  ; 3A | Decrement accumulator
    SBC $C1C6,X          ; FD C6 C1 | Subtract with carry (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    LDA                  ; BF EC 7D CF | Load from absolute long,X into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    EOR $C7              ; 45 C7 | Exclusive OR with accumulator (zero page)
    LDY #$E3             ; A0 E3 | Load immediate value into Y register
    ORA $77A8,Y          ; 19 A8 77 | Logical OR with accumulator (absolute,Y)
    JMP $7AB7B3          ; 5C B3 B7 7A | Jump to address long
    CPX $C6BB            ; EC BB C6 | Compare X register (absolute)
    ORA #$8F             ; 09 8F | Logical OR with accumulator (immediate)
    CPX $7D              ; E4 7D | Compare X register (zero page)
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    ROL $A9BF            ; 2E BF A9 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0E8
; Address: $F8AE92
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0E8:
    ORA $9B0D            ; 0D 0D 9B | Logical OR with accumulator (absolute)
    ROR $E9AF            ; 6E AF E9 | Rotate right (absolute)
    ROR $FCF6            ; 6E F6 FC | Rotate right (absolute)
    ASL $D878            ; 0E 78 D8 | Arithmetic shift left (absolute)
    PEA #$ECB6           ; F4 B6 EC | Push effective address to stack
    ROR $BCF8            ; 6E F8 BC | Rotate right (absolute)
    CPX $70              ; E4 70 | Compare X register (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    DEY                  ; 88 | Decrement Y register
    BEQ $FC              ; F0 FC | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    PEA #$EC2E           ; F4 2E EC | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    CPX $5A              ; E4 5A | Compare X register (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    LDY $7CF0            ; AC F0 7C | Load from absolute address into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ROL $37              ; 26 37 | Rotate left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $7FA5            ; 9C A5 7F | Store zero to absolute
    ORA $C7              ; 05 C7 | Logical OR with accumulator (zero page)
    BRA $C3              ; 80 C3 | Branch always
    CMP $6798,Y          ; D9 98 67 | Compare accumulator (absolute,Y)
    STZ $7F6B            ; 9C 6B 7F | Store zero to absolute
    PHX                  ; DA | Push X register to stack
    INC $DB              ; E6 DB | Increment (zero page)
    ASL $3502,X          ; 1E 02 35 | Arithmetic shift left (absolute,X)
    ORA $2B1C,Y          ; 19 1C 2B | Logical OR with accumulator (absolute,Y)
    AND ($FB),Y          ; 31 FB | Logical AND with accumulator ((zero page),Y)
    LDX $B9C5,Y          ; BE C5 B9 | Load from absolute,Y into X register
    INY                  ; C8 | Increment Y register
    BEQ $90              ; F0 90 | Branch if equal
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    STY $9B              ; 84 9B | Store Y register to zero page
    ORA $49C2            ; 0D C2 49 | Logical OR with accumulator (absolute)
    STA $50              ; 85 50 | Store accumulator to zero page
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0E9
; Address: $F8AF37
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0E9:
    BCC $00              ; 90 00 | Branch if carry clear
    ADC ($82,X)          ; 61 82 | Add with carry ((zero page,X))
    ROR $6C              ; 66 6C | Rotate right (zero page)
    ORA $D711,Y          ; 19 11 D7 | Logical OR with accumulator (absolute,Y)
    ASL $6F              ; 06 6F | Arithmetic shift left (zero page)
    ROR $ACDB,X          ; 7E DB AC | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0EA
; Address: $F8AF4C
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0EA:
    ADC #$63             ; 69 63 | Add with carry (immediate)
    EOR $C703            ; 4D 03 C7 | Exclusive OR with accumulator (absolute)
    INC $F96F,X          ; FE 6F F9 | Increment (absolute,X)
    LDA $7C              ; A5 7C | Load from zero page into accumulator
    INC $3EEE,X          ; FE EE 3E | Increment (absolute,X)
    STA $FD09,X          ; 9D 09 FD | Store accumulator to absolute,X
    EOR $FF96            ; 4D 96 FF | Exclusive OR with accumulator (absolute)
    AND ($E7),Y          ; 31 E7 | Logical AND with accumulator ((zero page),Y)
    LDY $A7FF            ; AC FF A7 | Load from absolute address into Y register
    DEC $7ACE            ; CE CE 7A | Decrement (absolute)
    BCS $70              ; B0 70 | Branch if carry set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    EOR $AEA7,Y          ; 59 A7 AE | Exclusive OR with accumulator (absolute,Y)
    LDA                  ; BF B3 8E 99 | Load from absolute long,X into accumulator
    PLY                  ; 7A | Pull Y register from stack
    ROL                  ; 2A | Rotate left (accumulator)
    BVS $4C              ; 70 4C | Branch if overflow set
    BMI $F0              ; 30 F0 | Branch if negative
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0EC
; Address: $F8AF85
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0EC:
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $78              ; 80 78 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0ED
; Address: $F8AF93
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0ED:
    BEQ $C0              ; F0 C0 | Branch if equal
    BCS $00              ; B0 00 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    STY $9B              ; 84 9B | Store Y register to zero page
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    ROR $6C              ; 66 6C | Rotate right (zero page)
    ORA $2768,Y          ; 19 68 27 | Logical OR with accumulator (absolute,Y)
    STA                  ; 9F 30 D1 A0 | Store accumulator to absolute long,X
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    BNE $90              ; D0 90 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ADC ($51),Y          ; 71 51 | Add with carry ((zero page),Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    INY                  ; C8 | Increment Y register
    CMP ($E0),Y          ; D1 E0 | Game work RAM access
    XBA                  ; EB | Exchange accumulator bytes
    BVS $F0              ; 70 F0 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0EE
; Address: $F8AFF0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0EE:
    LDX $B720            ; AE 20 B7 | Load from absolute address into X register
    CMP ($6F),Y          ; D1 6F | Compare accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0EF
; Address: $F8AFF8
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0EF:
    BMI $30              ; 30 30 | Branch if negative
    LDA #$87             ; A9 87 | Load immediate value into accumulator
    ROR $FE0F,X          ; 7E 0F FE | Rotate right (absolute,X)
    ROL $FCFC,X          ; 3E FC FC | Rotate left (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    ADC $F329,Y          ; 79 29 F3 | Add with carry (absolute,Y)
    STX $86              ; 86 86 | Store X register to zero page
    ASL $3C0E            ; 0E 0E 3C | Arithmetic shift left (absolute)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    AND #$09             ; 29 09 | Logical AND with accumulator (immediate)
    ASL $3E1C,X          ; 1E 1C 3E | Arithmetic shift left (absolute,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0F0
; Address: $F8B057
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0F0:
    JSR $1A03            ; 20 03 1A | Jump to subroutine
    ROL $774C,X          ; 3E 4C 77 | Rotate left (absolute,X)
    LDA $0000,Y          ; B9 00 00 | Load from absolute,Y into accumulator
    BEQ $30              ; F0 30 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPX $F4C4            ; EC C4 F4 | Compare X register (absolute)
    LDY $BC              ; A4 BC | Load from zero page into Y register
    LDX #$5E             ; A2 5E | Load immediate value into X register
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BVS $08              ; 70 08 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    JMP ($F418)          ; 6C 18 F4 | Jump to address (absolute indirect)
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    ORA #$67             ; 09 67 | Logical OR with accumulator (immediate)
    SBC $4F48            ; ED 48 4F | Subtract with carry (absolute)
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    BMI $36              ; 30 36 | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    EOR #$63             ; 49 63 | Exclusive OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    ROR $0087,X          ; 7E 87 00 | Rotate right (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0F1
; Address: $F8B0C4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0F1:
    JSR $9020            ; 20 20 90 | Jump to subroutine
    BCC $50              ; 90 50 | Branch if carry clear
    BPL $90              ; 10 90 | Branch if positive
    BPL $70              ; 10 70 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0F4
; Address: $F8B0D5
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0F4:
    JSR $1060            ; 20 60 10 | Jump to subroutine
    CPX #$50             ; E0 50 | Compare X register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0F5
; Address: $F8B145
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0F5:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    BMI $D0              ; 30 D0 | Branch if negative
    BMI $D0              ; 30 D0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    BRA $40              ; 80 40 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BNE $E0              ; D0 E0 | Game work RAM access
    BPL $20              ; 10 20 | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    LDA $3DCA50          ; AF 50 CA 3D | Load from absolute long address into accumulator
    ROR $2F51,X          ; 7E 51 2F | Rotate right (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    BPL $2F              ; 10 2F | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    STA $A9D6F0          ; 8F F0 D6 A9 | Store accumulator to absolute long address
    AND ($50,X)          ; 21 50 | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BPL $38              ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0F6
; Address: $F8B17E
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0F6:
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    LDY $7AAE,X          ; BC AE 7A | Load from absolute,X into Y register
    LSR $9DF2,X          ; 5E F2 9D | Logical shift right (absolute,X)
    SBC ($D9),Y          ; F1 D9 | Subtract with carry ((zero page),Y)
    LDA ($A9),Y          ; B1 A9 | Load from (zero page),Y into accumulator
    ADC #$C6             ; 69 C6 | Add with carry (immediate)
    LSR $40              ; 46 40 | Logical shift right (zero page)
    CPY #$68             ; C0 68 | Compare Y register (immediate)
    ROL $5EAC            ; 2E AC 5E | Rotate left (absolute)
    ROR $6E9D            ; 6E 9D 6E | Rotate right (absolute)
    STA $29C6,Y          ; 99 C6 29 | Store accumulator to absolute,Y
    BRA $46              ; 80 46 | Branch always
    BRA $40              ; 80 40 | Branch always
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    LSR $7F              ; 46 7F | Logical shift right (zero page)
    CMP $C7              ; C5 C7 | Compare accumulator (zero page)
    AND $FA03,X          ; 3D 03 FA | Logical AND with accumulator (absolute,X)
    DEC $BC              ; C6 BC | Decrement (zero page)
    CPY $FB              ; C4 FB | Compare Y register (zero page)
    BIT #$39             ; 89 39 | Test bits in accumulator (immediate)
    LSR $03              ; 46 03 | Logical shift right (zero page)
    DEC                  ; 3A | Decrement accumulator
    SBC $C1C6,X          ; FD C6 C1 | Subtract with carry (absolute,X)
    REP #$48             ; C2 48 | Reset processor status bits
    STY $70              ; 84 70 | Store Y register to zero page
    BNE $B0              ; D0 B0 | Branch if not equal
    CPX #$78             ; E0 78 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    BRA $44              ; 80 44 | Branch always
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    LDY #$70             ; A0 70 | Load immediate value into Y register
    BVC $B0              ; 50 B0 | Branch if overflow clear
    BCS $78              ; B0 78 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0F7
; Address: $F8B1FD
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0F7:
    CLC                  ; 18 | Clear carry flag
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $0E0B            ; 0E 0B 0E | Arithmetic shift left (absolute)
    ORA $0307            ; 0D 07 03 | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    ORA $1B07            ; 0D 07 1B | Logical OR with accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0F8
; Address: $F8B23E
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0F8:
    JSR $0130            ; 20 30 01 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $090D            ; 0D 0D 09 | Logical OR with accumulator (absolute)
    ORA #$40             ; 09 40 | Logical OR with accumulator (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    BEQ $B0              ; F0 B0 | Branch if equal
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BVS $70              ; 70 70 | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0F9
; Address: $F8B27E
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0F9:
    CPX #$30             ; E0 30 | Compare X register (immediate)
    ORA $111E,Y          ; 19 1E 11 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$0C             ; 09 0C | Logical OR with accumulator (immediate)
    ORA $0310,X          ; 1D 10 03 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $03              ; 10 03 | Branch if positive
    PEA #$340C           ; F4 0C 34 | Push effective address to stack
    CPY $C23A            ; CC 3A C2 | Compare Y register (absolute)
    ASL $1EE2,X          ; 1E E2 1E | Arithmetic shift left (absolute,X)
    SEP #$06             ; E2 06 | Set processor status bits
    PLX                  ; FA | Pull X register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BNE $0C              ; D0 0C | Branch if not equal
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    CPX $F402            ; EC 02 F4 | Compare X register (absolute)
    PEA #$FC02           ; F4 02 FC | Push effective address to stack
    BEQ $0C              ; F0 0C | Branch if equal
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    BEQ $90              ; F0 90 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0FD
; Address: $F8B306
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0FD:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $0007            ; 0E 07 00 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_0FE
; Address: $F8B33A
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_0FE:
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0E0A            ; 0E 0A 0E | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0A0E            ; 0E 0E 0A | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$06             ; C0 06 | Compare Y register (immediate)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $0F06,X          ; 1D 06 0F | Logical OR with accumulator (absolute,X)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STX $4C9E            ; 8E 9E 4C | Store X register to absolute address
    INC $EF31,X          ; FE 31 EF | Increment (absolute,X)
    AND $FE4B,Y          ; 39 4B FE | Logical AND with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9E8701          ; 8F 01 87 9E | Store accumulator to absolute long address
    INC $B26E,X          ; FE 6E B2 | Increment (absolute,X)
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    AND $FED6,Y          ; 39 D6 FE | Logical AND with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    CMP $CEB7            ; CD B7 CE | Compare accumulator (absolute)
    ASL $BF25,X          ; 1E 25 BF | Arithmetic shift left (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$FB             ; A9 FB | Load immediate value into accumulator
    ADC $A67F,Y          ; 79 7F A6 | Add with carry (absolute,Y)
    LDA $6EEB2D          ; AF 2D EB 6E | Load from absolute long address into accumulator
    CMP $F67F,Y          ; D9 7F F6 | Compare accumulator (absolute,Y)
    SBC $E0B0,Y          ; F9 B0 E0 | Game work RAM access
    BVS $E0              ; 70 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_100
; Address: $F8B3E8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_100:
    BVS $C0              ; 70 C0 | Branch if overflow set
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $40              ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_102
; Address: $F8B3EF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_102:
    CPY #$E0             ; C0 E0 | Game work RAM access
    CLI                  ; 58 | Clear interrupt disable flag
    CPX #$98             ; E0 98 | Compare X register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_103
; Address: $F8B3F7
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_103:
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    BRA $70              ; 80 70 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BCS $02              ; B0 02 | Branch if carry set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $30              ; D0 30 | Branch if not equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_104
; Address: $F8B426
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_104:
    JSR $2020            ; 20 20 20 | Jump to subroutine
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ORA #$2D             ; 09 2D | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $19              ; 26 19 | Rotate left (zero page)
    BIT $0033            ; 2C 33 00 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    BPL $33              ; 10 33 | Branch if positive
    AND $151B            ; 2D 1B 15 | Logical AND with accumulator (absolute)
    AND ($2E),Y          ; 31 2E | Logical AND with accumulator ((zero page),Y)
    BEQ $10              ; F0 10 | Branch if equal
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    STZ $74              ; 64 74 | Store zero to zero page
    STZ $669A            ; 9C 9A 66 | Store zero to absolute
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BMI $88              ; 30 88 | Branch if negative
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_105
; Address: $F8B478
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_105:
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    CLV                  ; B8 | Clear overflow flag
    STZ $FC              ; 64 FC | Store zero to zero page
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $1D              ; 05 1D | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1A15            ; 0D 15 1A | Logical OR with accumulator (absolute)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $1718            ; 0E 18 17 | Arithmetic shift left (absolute)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA $F012            ; 0D 12 F0 | Logical OR with accumulator (absolute)
    BMI $C8              ; 30 C8 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    PLX                  ; FA | Pull X register from stack
    ROL                  ; 2A | Rotate left (accumulator)
    INC $D41A            ; EE 1A D4 | Increment (absolute)
    BIT $D62A            ; 2C 2A D6 | Test bits in accumulator (absolute)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BMI $88              ; 30 88 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    INY                  ; C8 | Increment Y register
    PLX                  ; FA | Pull X register from stack
    DEC $24D8            ; CE D8 24 | Decrement (absolute)
    CPX $0E12            ; EC 12 0E | Compare X register (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0D1F,Y          ; 19 1F 0D | Logical OR with accumulator (absolute,Y)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    ASL $3E36,X          ; 1E 36 3E | Arithmetic shift left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL $1F5A            ; 2E 5A 1F | Rotate left (absolute)
    AND $370F,Y          ; 39 0F 37 | Logical AND with accumulator (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_108
; Address: $F8B4FE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_108:
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    BRA $00              ; 80 00 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_109
; Address: $F8B525
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_109:
    CPX #$60             ; E0 60 | Compare X register (immediate)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_10A
; Address: $F8B534
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_10A:
    CPX #$90             ; E0 90 | Compare X register (immediate)
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_10B
; Address: $F8B548
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_10B:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    JMP ($E968)          ; 6C 68 E9 | Jump to address (absolute indirect)
    ADC ($0F),Y          ; 71 0F | Add with carry ((zero page),Y)
    ORA $0706            ; 0D 06 07 | Logical OR with accumulator (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    SBC ($F3),Y          ; F1 F3 | Subtract with carry ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    STX $0497            ; 8E 97 04 | Store X register to absolute address
    INC $23E8            ; EE E8 23 | Increment (absolute)
    LDA $FDDE0F          ; AF 0F DE FD | Load from absolute long address into accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    STA $80F300          ; 8F 00 F3 80 | Store accumulator to absolute long address
    AND $D238,X          ; 3D 38 D2 | Logical AND with accumulator (absolute,X)
    CPY #$8F             ; C0 8F | Compare Y register (immediate)
    DEC $B7F1,X          ; DE F1 B7 | Decrement (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    PLX                  ; FA | Pull X register from stack
    LDX $FE              ; A6 FE | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_10C
; Address: $F8B599
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_10C:
    STX $731F            ; 8E 1F 73 | Store X register to absolute address
    ORA $3F              ; 05 3F | Logical OR with accumulator (zero page)
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    ASL $ED              ; 06 ED | Arithmetic shift left (zero page)
    AND ($DF),Y          ; 31 DF | Logical AND with accumulator ((zero page),Y)
    DEC $DC9C            ; CE 9C DC | Decrement (absolute)
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_10D
; Address: $F8B5AF
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_10D:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CMP $9FDB            ; CD DB 9F | Compare accumulator (absolute)
    STX $B39C            ; 8E 9C B3 | Store X register to absolute address
    ROL                  ; 2A | Rotate left (accumulator)
    CLC                  ; 18 | Clear carry flag
    BCC $B8              ; 90 B8 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    BVC $C0              ; 50 C0 | Branch if overflow clear
    BRA $80              ; 80 80 | Branch always
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BIT $26              ; 24 26 | Test bits in accumulator (zero page)
    AND $141B,Y          ; 39 1B 14 | Logical AND with accumulator (absolute,Y)
    ORA ($18),Y          ; 11 18 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BIT $2817            ; 2C 17 28 | Test bits in accumulator (absolute)
    BPL $0B              ; 10 0B | Branch if positive
    ASL $0416            ; 0E 16 04 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    STZ $F474            ; 9C 74 F4 | Store zero to absolute
    LDY $B4              ; A4 B4 | Load from zero page into Y register
    STZ $D8              ; 64 D8 | Store zero to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    BVC $A8              ; 50 A8 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank70_DmaFunction_10E
; Address: $F8B614
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_10E:
    JSR $6858            ; 20 58 68 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    BRA $58              ; 80 58 | Branch always
    BRA $40              ; 80 40 | Branch always
    ASL $0B15,X          ; 1E 15 0B | Arithmetic shift left (absolute,X)
    ASL $0E0B            ; 0E 0B 0E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_10F
; Address: $F8B626
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_10F:
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    PEA #$341C           ; F4 1C 34 | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    BNE $30              ; D0 30 | Branch if not equal
    BNE $30              ; D0 30 | Branch if not equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    BNE $C8              ; D0 C8 | Branch if not equal
    BPL $28              ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_111
; Address: $F8B65F
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_111:
    JSR $7F55            ; 20 55 7F | Jump to subroutine
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX $FE              ; A6 FE | Load from zero page into X register
    PHP                  ; 08 | Push processor status to stack
    ROR $7C8C,X          ; 7E 8C 7C | Rotate right (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    JMP $BF5B5F          ; 5C 5F 5B BF | Jump to address long
    INC $DC79,X          ; FE 79 DC | Increment (absolute,X)
    ROR $5CED,X          ; 7E ED 5C | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    INC $7E1C,X          ; FE 1C 7E | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $0E0E,X          ; 1E 0E 0E | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ADC $A430,Y          ; 79 30 A4 | Add with carry (absolute,Y)
    STA ($A6,X)          ; 81 A6 | Store accumulator to (zero page,X)
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_112
; Address: $F8B6E8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_112:
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    EOR #$7E             ; 49 7E | Exclusive OR with accumulator (immediate)
    BIT $FE              ; 24 FE | Test bits in accumulator (zero page)
    LDX $38              ; A6 38 | Load from zero page into X register
    SEC                  ; 38 | Set carry flag
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_113
; Address: $F8B701
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_113:
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROL $6D01,X          ; 3E 01 6D | Rotate left (absolute,X)
    NOP                  ; EA | No operation
    ROL $66FC,X          ; 3E FC 66 | Rotate left (absolute,X)
    LSR $0E43            ; 4E 43 0E | Logical shift right (absolute)
    ASL $1F01            ; 0E 01 1F | Arithmetic shift left (absolute)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ADC ($89,X)          ; 61 89 | Add with carry ((zero page,X))
    INY                  ; C8 | Increment Y register
    LDA $A4              ; A5 A4 | Load from zero page into accumulator
    WDM #$42             ; 42 42 | Hardware register operation
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $7D5E8F          ; AF 8F 5E 7D | Load from absolute long address into accumulator
    CLV                  ; B8 | Clear overflow flag
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_114
; Address: $F8B76D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_114:
    JSL $8FA035          ; 22 35 A0 8F | Jump to subroutine long
    DEC $F7F1,X          ; DE F1 F7 | Decrement (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    PLY                  ; 7A | Pull Y register from stack
    ROL $FE              ; 26 FE | Rotate left (zero page)
    ROL $52FB,X          ; 3E FB 52 | Rotate left (absolute,X)
    CMP $5F89,X          ; DD 89 5F | Compare accumulator (absolute,X)
    BRA $F8              ; 80 F8 | Branch always
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $C0              ; F0 C0 | Branch if equal
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    CPX #$30             ; E0 30 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_116
; Address: $F8B78E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_116:
    BMI $60              ; 30 60 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    JMP $B0C4D8          ; 5C D8 C4 B0 | Jump to address long
    CLV                  ; B8 | Clear overflow flag
    BRA $B0              ; 80 B0 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_118
; Address: $F8B79C
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_118:
    LDY #$20             ; A0 20 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    AND $0B1D,Y          ; 39 1D 0B | Logical AND with accumulator (absolute,Y)
    ORA $0F06,X          ; 1D 06 0F | Logical OR with accumulator (absolute,X)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    STX $4C9E            ; 8E 9E 4C | Store X register to absolute address
    INC $EF31,X          ; FE 31 EF | Increment (absolute,X)
    AND $FE4B,Y          ; 39 4B FE | Logical AND with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $9E0781          ; 8F 81 07 9E | Store accumulator to absolute long address
    INC $B26E,X          ; FE 6E B2 | Increment (absolute,X)
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    AND $FED6,Y          ; 39 D6 FE | Logical AND with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    CMP $CEB7            ; CD B7 CE | Compare accumulator (absolute)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank70_DmaFunction_119
; Address: $F8B80B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_119:
    JSL $E40CD4          ; 22 D4 0C E4 | Jump to subroutine long
    BEQ $30              ; F0 30 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    CPY $CC1A            ; CC 1A CC | Compare Y register (absolute)
    INX                  ; E8 | Increment X register
    BMI $CC              ; 30 CC | Branch if negative
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_11A
; Address: $F8B82B
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_11A:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    CPX $64              ; E4 64 | Compare X register (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    STY $0084            ; 8C 84 00 | Store Y register to absolute address
    BEQ $30              ; F0 30 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    STY $38              ; 84 38 | Store Y register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    EOR $AC88,X          ; 5D 88 AC | Exclusive OR with accumulator (absolute,X)
    INY                  ; C8 | Increment Y register
    STX $F1              ; 86 F1 | Store X register to zero page
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    SBC ($3F),Y          ; F1 3F | Subtract with carry ((zero page),Y)
    BRA $FE              ; 80 FE | Branch always
    LDY $8E              ; A4 8E | Load from zero page into Y register
    STX $40              ; 86 40 | Store X register to zero page
    RTI                  ; 40 | Return from interrupt
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    BRA $80              ; 80 80 | Branch always
    BMI $60              ; 30 60 | Branch if negative
    BVS $E0              ; 70 E0 | Game work RAM access
    BVS $E0              ; 70 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDY #$20             ; A0 20 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_11E
; Address: $F8B8B6
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_11E:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    ASL $0F03            ; 0E 03 0F | Arithmetic shift left (absolute)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $3D1E4F          ; AF 4F 1E 3D | Load from absolute long address into accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    AND $6A80,X          ; 3D 80 6A | Logical AND with accumulator (absolute,X)
    LDY #$37             ; A0 37 | Load immediate value into Y register
    LDX #$5D             ; A2 5D | Load immediate value into X register
    DEY                  ; 88 | Decrement Y register
    DEC $7771,X          ; DE 71 77 | Decrement (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    ROR $5F3C,X          ; 7E 3C 5F | Rotate right (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $7715,X          ; 5D 15 77 | Exclusive OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0605            ; 0E 05 06 | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $0312            ; 0D 12 03 | Logical OR with accumulator (absolute)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    CPY $FC14            ; CC 14 FC | Compare Y register (absolute)
    PEA #$281C           ; F4 1C 28 | Push effective address to stack
    CLD                  ; D8 | Clear decimal mode flag
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    BPL $30              ; 10 30 | Branch if positive
    BNE $30              ; D0 30 | Branch if not equal
    BIT $30D2            ; 2C D2 30 | Test bits in accumulator (absolute)
    CPY $D428            ; CC 28 D4 | Compare Y register (absolute)
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_11F
; Address: $F8B938
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_11F:
    BNE $08              ; D0 08 | Branch if not equal
    BPL $28              ; 10 28 | Branch if positive
    CPX #$D0             ; E0 D0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_120
; Address: $F8B93E
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_120:
    JSR $1C10            ; 20 10 1C | Jump to subroutine
    BPL $14              ; 10 14 | Branch if positive
    BPL $12              ; 10 12 | Branch if positive
    ORA #$1A             ; 09 1A | Logical OR with accumulator (immediate)
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    ORA $0410            ; 0D 10 04 | Logical OR with accumulator (absolute)
    ASL $0B04            ; 0E 04 0B | Arithmetic shift left (absolute)
    ORA $0B13            ; 0D 13 0B | Logical OR with accumulator (absolute)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ASL $3202            ; 0E 02 32 | Arithmetic shift left (absolute)
    PEA #$1624           ; F4 24 16 | Push effective address to stack
    DEX                  ; CA | Decrement X register
    ROL                  ; 2A | Rotate left (accumulator)
    CPX $1C              ; E4 1C | Compare X register (zero page)
    ASL $32FC            ; 0E FC 32 | Arithmetic shift left (absolute)
    CPX $C8C6            ; EC C6 C8 | Compare X register (absolute)
    INY                  ; C8 | Increment Y register
    PEA #$F22C           ; F4 2C F2 | Push effective address to stack
    REP #$28             ; C2 28 | Reset processor status bits
    RTI                  ; 40 | Return from interrupt
    CPY #$E0             ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank70_DmaFunction_121
; Address: $F8B98F
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_121:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0705            ; 0E 05 07 | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $070E            ; 0E 0E 07 | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $60              ; 80 60 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_122
; Address: $F8B9F8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_122:
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $C0              ; A5 C0 | Load from zero page into accumulator
    STY $F0              ; 84 F0 | Store Y register to zero page
    DEC $F9              ; C6 F9 | Decrement (zero page)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    SBC ($3F),Y          ; F1 3F | Subtract with carry ((zero page),Y)
    STA $7E60FF          ; 8F FF 60 7E | Store accumulator to absolute long address
    LDA                  ; BF A5 8F 84 | Load from absolute long,X into accumulator
    DEC $C6              ; C6 C6 | Decrement (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_124
; Address: $F8BA18
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_124:
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    STA $60608F          ; 8F 8F 60 60 | Store accumulator to absolute long address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $D0              ; F0 D0 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_126
; Address: $F8BA53
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_126:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    PLP                  ; 28 | Pull processor status from stack
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $10              ; F0 10 | Branch if equal
    BNE $30              ; D0 30 | Branch if not equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $E8              ; 10 E8 | Branch if positive
    BMI $C8              ; 30 C8 | Branch if negative
    BMI $C8              ; 30 C8 | Branch if negative
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$01             ; C0 01 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_127
; Address: $F8BAA3
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_127:
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    ORA $150A            ; 0D 0A 15 | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $0F08            ; 0D 08 0F | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0915,X          ; 1E 15 09 | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    CPX $24              ; E4 24 | Compare X register (zero page)
    PEA #$DA14           ; F4 14 DA | Push effective address to stack
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $2CFA            ; 0E FA 2C | Arithmetic shift left (absolute)
    NOP                  ; EA | No operation
    CPX #$E0             ; E0 E0 | Game work RAM access
    BNE $18              ; D0 18 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    CPX $28              ; E4 28 | Compare X register (zero page)
    NOP                  ; EA | No operation
    BIT $DE              ; 24 DE | Test bits in accumulator (zero page)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    ORA $1712,X          ; 1D 12 17 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL $0D09            ; 0E 09 0D | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0C18            ; 0E 18 0C | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    CPY $04              ; C4 04 | Compare Y register (zero page)
    PEA #$DA22           ; F4 22 DA | Push effective address to stack
    INC $FA12            ; EE 12 FA | Increment (absolute)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    ROL $000A,X          ; 3E 0A 00 | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CPX $28              ; E4 28 | Compare X register (zero page)
    CPY $1C12            ; CC 12 1C | Compare Y register (absolute)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_128
; Address: $F8BB1E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_128:
    CPY $CA              ; C4 CA | Compare Y register (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $0B0D            ; 0D 0D 0B | Logical OR with accumulator (absolute)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$50             ; E0 50 | Compare X register (immediate)
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPX #$50             ; E0 50 | Compare X register (immediate)
    BEQ $B0              ; F0 B0 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_129
; Address: $F8BB52
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_129:
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    BEQ $48              ; F0 48 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BEQ $A8              ; F0 A8 | Branch if equal
    CPX #$58             ; E0 58 | Compare X register (immediate)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    CPX $64              ; E4 64 | Compare X register (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank70_DmaFunction_12A
; Address: $F8BB8F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_12A:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    BEQ $30              ; F0 30 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    STY $38              ; 84 38 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank70_DmaFunction_12B
; Address: $F8BB9A
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_12B:
    INX                  ; E8 | Increment X register
    CPY $CC1A            ; CC 1A CC | Compare Y register (absolute)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1209            ; 0D 09 12 | Logical OR with accumulator (absolute)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ORA $0010            ; 0D 10 00 | Logical OR with accumulator (absolute)
    BEQ $F0              ; F0 F0 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    CPX $64              ; E4 64 | Compare X register (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    STY $1284            ; 8C 84 12 | Store Y register to absolute address
    BEQ $30              ; F0 30 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    STY $38              ; 84 38 | Store Y register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    CPX $1F02            ; EC 02 1F | Compare X register (absolute)
    ASL $0E09            ; 0E 09 0E | Arithmetic shift left (absolute)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $1C              ; 24 1C | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    CPY $10              ; C4 10 | Compare Y register (zero page)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_12E
; Address: $F8BC26
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_12E:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PEA #$E82C           ; F4 2C E8 | Push effective address to stack
    CLD                  ; D8 | Clear decimal mode flag
    BNE $30              ; D0 30 | Branch if not equal

;------------------------------------------------------------------------------
; Bank70_DmaFunction_130
; Address: $F8BC4B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_130:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BIT $30              ; 24 30 | Test bits in accumulator (zero page)
    INY                  ; C8 | Increment Y register
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank70_DmaFunction_131
; Address: $F8BC5D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_131:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    STA $5DCF7D          ; 8F 7D CF 5D | Store accumulator to absolute long address
    SEC                  ; 38 | Set carry flag
    JMP $7B3B            ; 4C 3B 7B | Jump to address
    PLY                  ; 7A | Pull Y register from stack
    PHB                  ; 8B | Push data bank register to stack
    CMP $F7B1            ; CD B1 F7 | Compare accumulator (absolute)
    PLB                  ; AB | Pull data bank register from stack
    ROL $BBC6,X          ; 3E C6 BB | Rotate left (absolute,X)
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_132
; Address: $F8BC80
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_132:
    JSR $50E0            ; 20 E0 50 | Jump to subroutine
    BEQ $A0              ; F0 A0 | Branch if equal
    BEQ $40              ; F0 40 | Branch if equal
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    BNE $F0              ; D0 F0 | Branch if not equal
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $58              ; F0 58 | Branch if equal
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BVS $70              ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank70_DmaFunction_134
; Address: $F8BCA3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_134:
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $8C              ; F0 8C | Branch if equal
    DEC $F75C            ; CE 5C F7 | Decrement (absolute)
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    JMP $703B            ; 4C 3B 70 | Jump to address
    BVS $70              ; 70 70 | Branch if overflow set
    BCC $88              ; 90 88 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    CPY $F6B0            ; CC B0 F6 | Compare Y register (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    ROL $BAC6,X          ; 3E C6 BA | Rotate left (absolute,X)
    INC $76FA            ; EE FA 76 | Increment (absolute)
    BVS $70              ; 70 70 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_135
; Address: $F8BCC3
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_135:
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $8C              ; F0 8C | Branch if equal
    DEC $F35C            ; CE 5C F3 | Decrement (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    JMP $703B            ; 4C 3B 70 | Jump to address
    BVS $70              ; 70 70 | Branch if overflow set
    BCC $88              ; 90 88 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    CPY $F2B0            ; CC B0 F2 | Compare Y register (absolute)
    LDX $CA36            ; AE 36 CA | Load from absolute address into X register
    LDY $FBE6,X          ; BC E6 FB | Load from absolute,X into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ORA $0A12,X          ; 1D 12 0A | Logical OR with accumulator (absolute,X)
    ORA $0B0C            ; 0D 0C 0B | Logical OR with accumulator (absolute)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    ORA $0612            ; 0D 12 06 | Logical OR with accumulator (absolute)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    SEP #$1E             ; E2 1E | Set processor status bits
    INC $D412            ; EE 12 D4 | Increment (absolute)
    BIT $F40C            ; 2C 0C F4 | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    PLP                  ; 28 | Pull processor status from stack
    CLD                  ; D8 | Clear decimal mode flag
    BNE $30              ; D0 30 | Branch if not equal
    INX                  ; E8 | Increment X register
    DEX                  ; CA | Decrement X register
    BIT $18D2            ; 2C D2 18 | Test bits in accumulator (absolute)
    CPX $10              ; E4 10 | Compare X register (zero page)
    CPX $20              ; E4 20 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_136
; Address: $F8BD1B
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_136:
    INY                  ; C8 | Increment Y register
    BPL $C8              ; 10 C8 | Branch if positive
    CPX #$10             ; E0 10 | Compare X register (immediate)
    ORA #$1A             ; 09 1A | Logical OR with accumulator (immediate)
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ORA $0A0A            ; 0D 0A 0A | Logical OR with accumulator (absolute)
    ORA $0506            ; 0D 06 05 | Logical OR with accumulator (absolute)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $0B04,X          ; 1E 04 0B | Arithmetic shift left (absolute,X)
    ORA $0B13            ; 0D 13 0B | Logical OR with accumulator (absolute)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ROL $F432,X          ; 3E 32 F4 | Rotate left (absolute,X)
    BIT $D6              ; 24 D6 | Test bits in accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    CPX $D414            ; EC 14 D4 | Compare X register (absolute)
    BIT $28D8            ; 2C D8 28 | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    CLD                  ; D8 | Clear decimal mode flag
    CPY $C81E            ; CC 1E C8 | Compare Y register (absolute)
    PEA #$32EC           ; F4 EC 32 | Push effective address to stack
    REP #$28             ; C2 28 | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    CPX $10              ; E4 10 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    BMI $C8              ; 30 C8 | Branch if negative
    LDA                  ; BF B8 37 68 | Load from absolute long,X into accumulator
    STY $A67F            ; 8C 7F A6 | Store Y register to absolute address
    PLB                  ; AB | Pull data bank register from stack
    INC $93              ; E6 93 | Increment (zero page)
    DEC $9B              ; C6 9B | Decrement (zero page)
    INC $627E            ; EE 7E 62 | Increment (absolute)
    STX $353D            ; 8E 3D 35 | Store X register to absolute address
    TXS                  ; 9A | Transfer X register to stack pointer
    TXA                  ; 8A | Transfer X register to accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    LDA                  ; BF B8 37 68 | Load from absolute long,X into accumulator
    DEC $8C16,X          ; DE 16 8C | Decrement (absolute,X)
    LDX $AB              ; A6 AB | Load from zero page into X register
    INC $93              ; E6 93 | Increment (zero page)
    DEC $9B              ; C6 9B | Decrement (zero page)
    INC $627E            ; EE 7E 62 | Increment (absolute)
    STX $343C            ; 8E 3C 34 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank70_DmaFunction_137
; Address: $F8BDBA
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_137:
    TXS                  ; 9A | Transfer X register to stack pointer
    TXA                  ; 8A | Transfer X register to accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    DEC $BCBB,X          ; DE BB BC | Decrement (absolute,X)
    EOR $1FCE,Y          ; 59 CE 1F | Exclusive OR with accumulator (absolute,Y)
    ADC $AAA3            ; 6D A3 AA | Add with carry (absolute)
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    SBC ($D6,X)          ; E1 D6 | Subtract with carry ((zero page,X))
    SBC $7B              ; E5 7B | Subtract with carry (zero page)
    ADC $F6              ; 65 F6 | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    EOR $9E4D,X          ; 5D 4D 9E | Exclusive OR with accumulator (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    DEC $DACA,X          ; DE CA DA | Decrement (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    LDY $589F,X          ; BC 9F 58 | Load from absolute,X into Y register
    ORA #$87             ; 09 87 | Logical OR with accumulator (immediate)
    BCC $5A              ; 90 5A | Branch if carry clear
    BCC $8E              ; 90 8E | Branch if carry clear
    CPY $DB              ; C4 DB | Compare Y register (zero page)
    SBC ($E2,X)          ; E1 E2 | Subtract with carry ((zero page,X))
    BVS $7E              ; 70 7E | Branch if overflow set

;------------------------------------------------------------------------------
; Bank70_DmaFunction_138
; Address: $F8BE11
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_138:
    JSL $7D1EB6          ; 22 B6 1E 7D | Jump to subroutine long
    ORA $256F            ; 0D 6F 25 | Logical OR with accumulator (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    DEC $6FDA,X          ; DE DA 6F | Decrement (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $30              ; D0 30 | Branch if not equal

;------------------------------------------------------------------------------
; Bank70_DmaFunction_13C
; Address: $F8BE73
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_13C:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $D0              ; 30 D0 | Branch if negative
    BNE $30              ; D0 30 | Branch if not equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_13E
; Address: $F8BEB5
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_13E:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank70_DmaFunction_13F
; Address: $F8BEE5
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_13F:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    BMI $D0              ; 30 D0 | Branch if negative
    BMI $D0              ; 30 D0 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    BRA $40              ; 80 40 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BNE $E0              ; D0 E0 | Game work RAM access
    BPL $30              ; 10 30 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BMI $08              ; 30 08 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_140
; Address: $F8BF18
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_140:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank70_DmaFunction_142
; Address: $F8BF2C
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_142:
    JSR $38D0            ; 20 D0 38 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    BRA $40              ; 80 40 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BNE $30              ; D0 30 | Branch if not equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    INC $D7              ; E6 D7 | Increment (zero page)
    INC $FEC7            ; EE C7 FE | Increment (absolute)
    INC $FEFC            ; EE FC FE | Increment (absolute)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    TXS                  ; 9A | Transfer X register to stack pointer
    TXA                  ; 8A | Transfer X register to accumulator
    DEC $C6              ; C6 C6 | Decrement (zero page)
    CPX $3CEC            ; EC EC 3C | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEP #$71             ; E2 71 | Set processor status bits
    SBC $F333            ; ED 33 F3 | Subtract with carry (absolute)
    ASL $1EFF,X          ; 1E FF 1E | Arithmetic shift left (absolute,X)
    INC $FC0C,X          ; FE 0C FC | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    ROR $2D62            ; 6E 62 2D | Rotate right (absolute)
    AND $3333            ; 2D 33 33 | Logical AND with accumulator (absolute)
    ASL $0C1E,X          ; 1E 1E 0C | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PEA #$F838           ; F4 38 F8 | Push effective address to stack
    SBC $FE0E,Y          ; F9 0E FE | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ASL $070E            ; 0E 0E 07 | Arithmetic shift left (absolute)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_143
; Address: $F8BFC5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_143:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_144
; Address: $F8BFD4
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_144:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ASL $090E            ; 0E 0E 09 | Arithmetic shift left (absolute)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    BPL $16              ; 10 16 | Branch if positive
    ORA $131C,Y          ; 19 1C 13 | Logical OR with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ORA $0B18            ; 0D 18 0B | Logical OR with accumulator (absolute)
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $03              ; 10 03 | Branch if positive
    BIT $14              ; 24 14 | Test bits in accumulator (zero page)
    CPY $DA              ; C4 DA | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_145
; Address: $F8C025
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_145:
    JSL $1AC23E          ; 22 3E C2 1A | Jump to subroutine long
    INC $0E              ; E6 0E | Increment (zero page)
    ASL $0CF2            ; 0E F2 0C | Arithmetic shift left (absolute)
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    CPY $22CC            ; CC CC 22 | Compare Y register (absolute)
    CPX $F406            ; EC 06 F4 | Compare X register (absolute)
    PEA #$FC02           ; F4 02 FC | Push effective address to stack
    BEQ $0C              ; F0 0C | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    BPL $17              ; 10 17 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $131C,Y          ; 19 1C 13 | Logical OR with accumulator (absolute,Y)
    ORA $0C0A            ; 0D 0A 0C | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BPL $02              ; 10 02 | Branch if positive
    ORA $100F,Y          ; 19 0F 10 | Logical OR with accumulator (absolute,Y)
    CPY $34              ; C4 34 | Compare Y register (zero page)
    NOP                  ; EA | No operation
    ROL $3A02,X          ; 3E 02 3A | Rotate left (absolute,X)
    ASL $DE              ; 06 DE | Arithmetic shift left (zero page)
    SEP #$0E             ; E2 0E | Set processor status bits
    CPY $283C            ; CC 3C 28 | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag
    CPY $CCC6            ; CC C6 CC | Compare Y register (absolute)
    REP #$14             ; C2 14 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank70_DmaFunction_146
; Address: $F8C07B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_146:
    SEP #$3C             ; E2 3C | Set processor status bits
    REP #$F0             ; C2 F0 | Reset processor status bits
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $0002            ; 0D 02 00 | Logical OR with accumulator (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$1D             ; 09 1D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_147
; Address: $F8C0AD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_147:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_149
; Address: $F8C0BC
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_149:
    BVC $70              ; 50 70 | Branch if overflow clear
    BNE $F0              ; D0 F0 | Branch if not equal
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    BMI $0C              ; 30 0C | Branch if negative
    JMP $647B53          ; 5C 53 7B 64 | Jump to address long
    ADC $5A66,Y          ; 79 66 5A | Add with carry (absolute,Y)
    SBC $0000,X          ; FD 00 00 | Subtract with carry (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_14A
; Address: $F8C0E6
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_14A:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$20             ; E0 20 | Compare X register (immediate)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    STY $9C8C            ; 8C 8C 9C | Store Y register to absolute address
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    ASL $00FC            ; 0E FC 00 | Arithmetic shift left (absolute)
    CPX #$E0             ; E0 E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $1E12            ; 0E 12 1E | Arithmetic shift left (absolute)
    ROL $3C              ; 26 3C | Rotate left (zero page)
    LSR $78              ; 46 78 | Logical shift right (zero page)
    STY $00F8            ; 8C F8 00 | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    LDX $0CFC,Y          ; BE FC 0C | Load from absolute,Y into X register
    INC                  ; 1A | Increment accumulator
    ORA $1B18,Y          ; 19 18 1B | Logical OR with accumulator (absolute,Y)
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_14B
; Address: $F8C15C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_14B:
    CLV                  ; B8 | Clear overflow flag
    LDX $C3FC,Y          ; BE FC C3 | Load from absolute,Y into X register
    BPL $F0              ; 10 F0 | Branch if positive
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_14C
; Address: $F8C166
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_14C:
    JSR $2020            ; 20 20 20 | Jump to subroutine
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1C16,Y          ; 19 16 1C | Logical OR with accumulator (absolute,Y)
    ASL $030D            ; 0E 0D 03 | Arithmetic shift left (absolute)
    BPL $10              ; 10 10 | Branch if positive
    BCC $60              ; 90 60 | Branch if carry clear
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank70_DmaFunction_14D
; Address: $F8C1A4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_14D:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    BMI $D0              ; 30 D0 | Branch if negative
    BEQ $B0              ; F0 B0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_14E
; Address: $F8C1C8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_14E:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BPL $18              ; 10 18 | Branch if positive
    LDY $131C,X          ; BC 1C 13 | Load from absolute,X into Y register
    ASL $2F19,X          ; 1E 19 2F | Arithmetic shift left (absolute,X)
    BVS $50              ; 70 50 | Branch if overflow set
    ADC #$59             ; 69 59 | Add with carry (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $C0              ; 30 C0 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    JMP ($CC3C)          ; 6C 3C CC | Jump to address (absolute indirect)
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_150
; Address: $F8C201
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_150:
    INC $FEEB,X          ; FE EB FE | Increment (absolute,X)
    STA $5DCF7D          ; 8F 7D CF 5D | Store accumulator to absolute long address
    AND $13FF,Y          ; 39 FF 13 | Logical AND with accumulator (absolute,Y)
    ORA $C63B            ; 0D 3B C6 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_151
; Address: $F8C211
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_151:
    DEC $FA              ; C6 FA | Decrement (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    STA $B3CF7F          ; 8F 7F CF B3 | Store accumulator to absolute long address
    PLB                  ; AB | Pull data bank register from stack
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $0501            ; 0E 01 05 | Arithmetic shift left (absolute)
    ORA $E71F,Y          ; 19 1F E7 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    INC $FD6F,X          ; FE 6F FD | Increment (absolute,X)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CPX $00              ; E4 00 | Compare X register (zero page)
    ORA $F71D,X          ; 1D 1D F7 | Logical OR with accumulator (absolute,X)
    INC $FDF1,X          ; FE F1 FD | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX $DA              ; E4 DA | Compare X register (zero page)
    BEQ $38              ; F0 38 | Branch if equal
    INX                  ; E8 | Increment X register
    CPY #$E0             ; C0 E0 | Game work RAM access
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $2E              ; F0 2E | Branch if equal
    INX                  ; E8 | Increment X register
    CPX #$38             ; E0 38 | Compare X register (immediate)
    BPL $E8              ; 10 E8 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    BVS $70              ; 70 70 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_152
; Address: $F8C2A3
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_152:
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $8C              ; F0 8C | Branch if equal
    DEC $F75C            ; CE 5C F7 | Decrement (absolute)
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $90              ; 70 90 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    CPY $F6B0            ; CC B0 F6 | Compare Y register (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    ROR $7AC6,X          ; 7E C6 7A | Rotate right (absolute,X)
    INC $F67A            ; EE 7A F6 | Increment (absolute)
    ASL $3801,X          ; 1E 01 38 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_153
; Address: $F8C2CF
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_153:
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    ROR $7961,X          ; 7E 61 79 | Rotate right (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    INC $1EE6,X          ; FE E6 1E | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STZ $009E,X          ; 9E 9E 00 | Store zero to absolute,X
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_155
; Address: $F8C336
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_155:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    SEI                  ; 78 | Set interrupt disable flag
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    DEC $07DA,X          ; DE DA 07 | Decrement (absolute,X)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    STZ $1D              ; 64 1D | Store zero to zero page
    INC                  ; 1A | Increment accumulator
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_156
; Address: $F8C374
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_156:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    SBC #$BF             ; E9 BF | Subtract with carry (immediate)
    ADC $0DF3            ; 6D F3 0D | Add with carry (absolute)
    ASL $DA              ; 06 DA | Arithmetic shift left (zero page)
    CPY $24              ; C4 24 | Compare Y register (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ROL $F6E2,X          ; 3E E2 F6 | Rotate left (absolute,X)
    DEC $55BD            ; CE BD 55 | Decrement (absolute)
    SBC $7C9D,X          ; FD 9D 7C | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BNE $00              ; D0 00 | Branch if not equal
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_157
; Address: $F8C3A2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_157:
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_158
; Address: $F8C3DA
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_158:
    JSR $1820            ; 20 20 18 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    LSR $46              ; 46 46 | Logical shift right (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    LDX $FCF6,Y          ; BE F6 FC | Load from absolute,Y into X register
    INC $F60B,X          ; FE 0B F6 | Increment (absolute,X)
    DEC $13              ; C6 13 | Decrement (zero page)
    INC $F6E2,X          ; FE E2 F6 | Increment (absolute,X)
    STX $D4BC            ; 8E BC D4 | Store X register to absolute address
    PEA #$F604           ; F4 04 F6 | Push effective address to stack
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank70_DmaFunction_15A
; Address: $F8C404
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_15A:
    JSL $0C321C          ; 22 1C 32 0C | Jump to subroutine long
    ORA $1106,Y          ; 19 06 11 | Logical OR with accumulator (absolute,Y)
    ASL $030C            ; 0E 0C 03 | Arithmetic shift left (absolute)
    SBC ($DF,X)          ; E1 DF | Subtract with carry ((zero page,X))
    CMP $DDE3,X          ; DD E3 DD | Compare accumulator (absolute,X)
    CMP $6679            ; CD 79 66 | Compare accumulator (absolute)
    AND ($2E),Y          ; 31 2E | Logical AND with accumulator ((zero page),Y)
    JMP $DCDF53          ; 5C 53 DF DC | Jump to address long
    CLC                  ; 18 | Clear carry flag
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $07              ; 80 07 | Branch always
    SED                  ; F8 | Set decimal mode flag
    STA $273F70          ; 8F 70 3F 27 | Store accumulator to absolute long address
    AND $4263,X          ; 3D 63 42 | Hardware register operation
    BVS $71              ; 70 71 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    STA $004070          ; 8F 70 40 00 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank70_DmaFunction_15B
; Address: $F8C446
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_15B:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    BPL $70              ; 10 70 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_15C
; Address: $F8C466
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_15C:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX $F894            ; EC 94 F8 | Compare X register (absolute)
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $D0              ; F0 D0 | Branch if equal
    BVS $50              ; 70 50 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    ASL $5F1E,X          ; 1E 1E 5F | Arithmetic shift left (absolute,X)
    EOR $0118,Y          ; 59 18 01 | Exclusive OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $3127,X          ; 3E 27 31 | Rotate left (absolute,X)
    AND ($40),Y          ; 31 40 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    BCS $B0              ; B0 B0 | Branch if carry set
    BVS $70              ; 70 70 | Branch if overflow set
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_15D
; Address: $F8C4BC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_15D:
    STZ $A4              ; 64 A4 | Store zero to zero page
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BPL $F0              ; 10 F0 | Branch if positive
    BNE $90              ; D0 90 | Branch if not equal
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_15E
; Address: $F8C4C7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_15E:
    JSR $A0A0            ; 20 A0 A0 | Jump to subroutine
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_15F
; Address: $F8C4D2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_15F:
    JSR $6030            ; 20 30 60 | Jump to subroutine
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_160
; Address: $F8C4D9
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_160:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BRA $81              ; 80 81 | Branch always
    RTI                  ; 40 | Return from interrupt
    BMI $3F              ; 30 3F | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($A1,X)          ; A1 A1 | Load from (zero page,X) into accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $071D            ; 0D 1D 07 | Logical OR with accumulator (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_161
; Address: $F8C503
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_161:
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    ADC $0000            ; 6D 00 00 | Add with carry (absolute)
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_163
; Address: $F8C51C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_163:
    ADC $00DA            ; 6D DA 00 | Add with carry (absolute)
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    BMI $E0              ; 30 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    INX                  ; E8 | Increment X register
    CPX $B4B8            ; EC B8 B4 | Compare X register (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_164
; Address: $F8C539
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_164:
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $70              ; 80 70 | Branch always
    BRA $00              ; 80 00 | Branch always
    DEC $EB              ; C6 EB | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_165
; Address: $F8C543
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_165:
    ROL $F3              ; 26 F3 | Rotate left (zero page)
    DEC $6CF7            ; CE F7 6C | Decrement (absolute)
    INC $EC              ; E6 EC | Increment (zero page)
    ROL $3A38            ; 2E 38 3A | Rotate left (absolute)
    INC                  ; 1A | Increment accumulator
    DEX                  ; CA | Decrement X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    NOP                  ; EA | No operation
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    SBC ($A1,X)          ; E1 A1 | Subtract with carry ((zero page,X))
    CPY $4D73            ; CC 73 4D | Compare Y register (absolute)
    ROR $1F72,X          ; 7E 72 1F | Rotate right (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_166
; Address: $F8C582
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_166:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 4B BC DC | Load from absolute long,X into accumulator
    CPX $80EC            ; EC EC 80 | Compare X register (absolute)
    BRA $38              ; 80 38 | Branch always
    SEC                  ; 38 | Set carry flag
    BEQ $B0              ; F0 B0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BMI $30              ; 30 30 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_167
; Address: $F8C5C8
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_167:
    JSR $3800            ; 20 00 38 | Jump to subroutine
    ROL $9999            ; 2E 99 99 | Rotate left (absolute)
    BRA $80              ; 80 80 | Branch always
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    LDA ($46),Y          ; B1 46 | Load from (zero page),Y into accumulator
    LDX $4040            ; AE 40 40 | Load from absolute address into X register
    LDA $BF4E,Y          ; B9 4E BF | Load from absolute,Y into accumulator
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    LDA                  ; BF C0 C0 01 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_169
; Address: $F8C614
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_169:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BVS $50              ; 70 50 | Branch if overflow set
    CPX #$E0             ; E0 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEI                  ; 78 | Set interrupt disable flag
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    BIT $7C              ; 24 7C | Test bits in accumulator (zero page)
    BIT $7C              ; 24 7C | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BIT $64              ; 24 64 | Test bits in accumulator (zero page)
    STZ $E4              ; 64 E4 | Store zero to zero page
    STZ $E4              ; 64 E4 | Store zero to zero page
    LDY $D898            ; AC 98 D8 | Load from absolute address into Y register
    BVC $D8              ; 50 D8 | Branch if overflow clear
    BEQ $50              ; F0 50 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_16A
; Address: $F8C648
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_16A:
    BCS $A0              ; B0 A0 | Branch if carry set
    LDY #$E0             ; A0 E0 | Game work RAM access
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_16B
; Address: $F8C64F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_16B:
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    BMI $90              ; 30 90 | Branch if negative
    BPL $10              ; 10 10 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_16C
; Address: $F8C659
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_16C:
    JSR $2020            ; 20 20 20 | Jump to subroutine
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $F0              ; F0 F0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_16E
; Address: $F8C690
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_16E:
    BRA $80              ; 80 80 | Branch always
    ASL $031E,X          ; 1E 1E 03 | Arithmetic shift left (absolute,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_16F
; Address: $F8C69C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_16F:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_170
; Address: $F8C6B4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_170:
    JSR $8020            ; 20 20 80 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BEQ $90              ; F0 90 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_172
; Address: $F8C6DA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_172:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_174
; Address: $F8C70C
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_174:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    BEQ $D0              ; F0 D0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    ASL $070D            ; 0E 0D 07 | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $0F06,X          ; 1D 06 0F | Logical OR with accumulator (absolute,X)
    ORA $1B0E            ; 0D 0E 1B | Logical OR with accumulator (absolute)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    STX $4C9E            ; 8E 9E 4C | Store X register to absolute address
    INC $EF31,X          ; FE 31 EF | Increment (absolute,X)
    AND $FE4B,Y          ; 39 4B FE | Logical AND with accumulator (absolute,Y)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP ($87,X)          ; C1 87 | Compare accumulator ((zero page,X))
    STZ $6EFE,X          ; 9E FE 6E | Store zero to absolute,X
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    AND $FED6,Y          ; 39 D6 FE | Logical AND with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    CMP $4E77            ; CD 77 4E | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_175
; Address: $F8C760
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_175:
    JSL $7E127E          ; 22 7E 12 7E | Jump to subroutine long
    ROR $7F51,X          ; 7E 51 7F | Rotate right (absolute,X)
    EOR #$5F             ; 49 5F | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_176
; Address: $F8C771
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_176:
    SEP #$72             ; E2 72 | Set processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    ADC $59B9,Y          ; 79 B9 59 | Add with carry (absolute,Y)
    LDA $7C1C,Y          ; B9 1C 7C | Load from absolute,Y into accumulator
    BIT $2E1E            ; 2C 1E 2E | Test bits in accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BMI $30              ; 30 30 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BVS $40              ; 70 40 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_177
; Address: $F8C7F6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_177:
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_179
; Address: $F8C81C
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_179:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STZ $973D,X          ; 9E 3D 97 | Store zero to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    AND $6A80,X          ; 3D 80 6A | Logical AND with accumulator (absolute,X)
    LDY #$D7             ; A0 D7 | Load immediate value into Y register
    LDA $CFC8,X          ; BD C8 CF | Load from absolute,X into accumulator
    ROR $7731,X          ; 7E 31 77 | Rotate right (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    ROR $5F3C,X          ; 7E 3C 5F | Rotate right (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    SBC $B7D5,X          ; FD D5 B7 | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0E15            ; 0D 15 0E | Logical OR with accumulator (absolute)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_17A
; Address: $F8C8A0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_17A:
    JSR $10E0            ; 20 E0 10 | Jump to subroutine
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STX $FE              ; 86 FE | Store X register to zero page
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    BCS $BF              ; B0 BF | Branch if carry set

;------------------------------------------------------------------------------
; Bank70_DmaFunction_17B
; Address: $F8C8B0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_17B:
    JSR $9020            ; 20 20 90 | Jump to subroutine
    BCC $48              ; 90 48 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    LDX $A6              ; A6 A6 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_17C
; Address: $F8C8B8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_17C:
    SBC $B7F9,Y          ; F9 F9 B7 | Subtract with carry (absolute,Y)
    LDA $00DC00          ; AF 00 DC 00 | Load from absolute long address into accumulator
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_17D
; Address: $F8C8EA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_17D:
    JSR $0800            ; 20 00 08 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_17E
; Address: $F8C8F4
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_17E:
    JSR $8220            ; 20 20 82 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BVS $50              ; 70 50 | Branch if overflow set
    ROR $0876,X          ; 7E 76 08 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ASL $717F            ; 0E 7F 71 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BVS $70              ; 70 70 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_180
; Address: $F8C95E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_180:
    BMI $30              ; 30 30 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CMP $E0              ; C5 E0 | Game work RAM access
    CPY $70              ; C4 70 | Compare Y register (zero page)
    BEQ $3F              ; F0 3F | Branch if equal
    CMP $4F              ; C5 4F | Compare accumulator (zero page)
    BMI $30              ; 30 30 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_181
; Address: $F8C9E9
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_181:
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BIT $7C              ; 24 7C | Test bits in accumulator (zero page)
    BIT $7C              ; 24 7C | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    STZ $E4              ; 64 E4 | Store zero to zero page
    STZ $E4              ; 64 E4 | Store zero to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$0D             ; 09 0D | Logical OR with accumulator (immediate)
    ROL $7D              ; 26 7D | Rotate left (zero page)
    ADC #$1F             ; 69 1F | Add with carry (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CMP ($B1,X)          ; C1 B1 | Compare accumulator ((zero page,X))
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA $2636            ; 0D 36 26 | Logical OR with accumulator (absolute)
    EOR $DA27,Y          ; 59 27 DA | Exclusive OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    ADC $0000,Y          ; 79 00 00 | Add with carry (absolute,Y)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPX #$30             ; E0 30 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    INX                  ; E8 | Increment X register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_182
; Address: $F8CA36
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_182:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    CLV                  ; B8 | Clear overflow flag
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_183
; Address: $F8CA5E
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_183:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $41              ; 80 41 | Branch always
    BRA $41              ; 80 41 | Branch always
    BRA $62              ; 80 62 | Branch always
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BIT $7C              ; 24 7C | Test bits in accumulator (zero page)
    ROR $7E12,X          ; 7E 12 7E | Rotate right (absolute,X)
    ROR $5E4A,X          ; 7E 4A 5E | Rotate right (absolute,X)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ORA $151F,Y          ; 19 1F 15 | Logical OR with accumulator (absolute,Y)
    STZ $E4              ; 64 E4 | Store zero to zero page
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLY                  ; 7A | Pull Y register from stack
    TSX                  ; BA | Transfer stack pointer to X register
    PHY                  ; 5A | Push Y register to stack
    TSX                  ; BA | Transfer stack pointer to X register
    ORA $1D7D,X          ; 1D 7D 1D | Logical OR with accumulator (absolute,X)
    AND $2F1F            ; 2D 1F 2F | Logical AND with accumulator (absolute)
    ORA $2A01,Y          ; 19 01 2A | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_185
; Address: $F8CADB
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_185:
    JSL $636058          ; 22 58 60 63 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    LDA $0042A0          ; AF A0 42 00 | Load from absolute long address into accumulator
    EOR $8985            ; 4D 85 89 | Exclusive OR with accumulator (absolute)
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_186
; Address: $F8CAFB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_186:
    WDM #$7A             ; 42 7A | Reserved instruction
    PHA                  ; 48 | Push accumulator to stack
    STA                  ; 9F 89 A0 F0 | Store accumulator to absolute long,X
    CPY $F5              ; C4 F5 | Compare Y register (zero page)
    STA ($DB,X)          ; 81 DB | Store accumulator to (zero page,X)
    ROL $0BF7,X          ; 3E F7 0B | Rotate left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_187
; Address: $F8CB0D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_187:
    AND ($AF,X)          ; 21 AF | Logical AND with accumulator ((zero page,X))
    STA ($F6,X)          ; 81 F6 | Store accumulator to (zero page,X)
    EOR $BFF1,Y          ; 59 F1 BF | Exclusive OR with accumulator (absolute,Y)
    INC $253E,X          ; FE 3E 25 | Increment (absolute,X)
    ROL $DF52,X          ; 3E 52 DF | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_188
; Address: $F8CB23
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_188:
    SED                  ; F8 | Set decimal mode flag
    BRA $F0              ; 80 F0 | Branch always
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $90              ; F0 90 | Branch if equal
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    PLX                  ; FA | Pull X register from stack
    ASL $02DE            ; 0E DE 02 | Arithmetic shift left (absolute)
    LDA                  ; BF 74 47 00 | Load from absolute long,X into accumulator
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    INC $32F6            ; EE F6 32 | Increment (absolute)
    DEC $CD13,X          ; DE 13 CD | Decrement (absolute,X)
    ORA $36BA            ; 0D BA 36 | Logical OR with accumulator (absolute)
    ORA $3F00,Y          ; 19 00 3F | Logical OR with accumulator (absolute,Y)
    ORA $3F7E,Y          ; 19 7E 3F | Logical OR with accumulator (absolute,Y)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    ORA $3E19,Y          ; 19 19 3E | Logical OR with accumulator (absolute,Y)
    ROL $7D7D,X          ; 3E 7D 7D | Rotate left (absolute,X)
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    STY $84              ; 84 84 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_18A
; Address: $F8CB86
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_18A:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    ROL $C3              ; 26 C3 | Rotate left (zero page)
    DEC                  ; 3A | Decrement accumulator
    ORA $DBEF,Y          ; 19 EF DB | Logical OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BPL $38              ; 10 38 | Branch if positive
    BPL $B0              ; 10 B0 | Branch if positive
    LDY #$02             ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_18B
; Address: $F8CBB2
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_18B:
    JSL $898922          ; 22 22 89 89 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $90              ; F0 90 | Branch if equal
    BNE $F0              ; D0 F0 | Branch if not equal
    BEQ $20              ; F0 20 | Branch if equal
    BVC $10              ; 50 10 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $120A,X          ; 1E 0A 12 | Arithmetic shift left (absolute,X)
    ORA $051D            ; 0D 1D 05 | Logical OR with accumulator (absolute)
    ORA $0602            ; 0D 02 06 | Logical OR with accumulator (absolute)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_18C
; Address: $F8CC19
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_18C:
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_18E
; Address: $F8CC20
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_18E:
    STA $60D030          ; 8F 30 D0 60 | Store accumulator to absolute long address
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    SBC $38              ; E5 38 | Subtract with carry (zero page)
    SEC                  ; 38 | Set carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND $13              ; 25 13 | Logical AND with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    INC $F0F0,X          ; FE F0 F0 | Increment (absolute,X)
    SBC $FB35,X          ; FD 35 FB | Subtract with carry (absolute,X)
    ROL $FC3E,X          ; 3E 3E FC | Rotate left (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ROR $BA1F,X          ; 7E 1F BA | Rotate right (absolute,X)
    JMP ($A897)          ; 6C 97 A8 | Jump to address (absolute indirect)
    LSR $3CF0,X          ; 5E F0 3C | Logical shift right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    ADC $ECD6,Y          ; 79 D6 EC | Add with carry (absolute,Y)
    ROR                  ; 6A | Rotate right (accumulator)
    CPY $B040            ; CC 40 B0 | Compare Y register (absolute)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $02              ; 80 02 | Branch always
    BRA $80              ; 80 80 | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_191
; Address: $F8CCE7
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_191:
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    BNE $28              ; D0 28 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_192
; Address: $F8CD0A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_192:
    JSR $C0F0            ; 20 F0 C0 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVC $50              ; 50 50 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCC $F0              ; 90 F0 | Branch if carry clear
    BPL $70              ; 10 70 | Branch if positive
    BVC $70              ; 50 70 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank70_DmaFunction_193
; Address: $F8CD26
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_193:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BNE $D0              ; D0 D0 | Branch if not equal
    BMI $B0              ; 30 B0 | Branch if negative
    BVS $70              ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank70_DmaFunction_194
; Address: $F8CD36
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_194:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $1D07            ; 0E 07 1D | Arithmetic shift left (absolute)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $C00D            ; 0D 0D C0 | Logical OR with accumulator (absolute)
    CPX #$40             ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_195
; Address: $F8CD64
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_195:
    BVS $C0              ; 70 C0 | Branch if overflow set
    BMI $A0              ; 30 A0 | Branch if negative
    ORA ($81),Y          ; 11 81 | Logical OR with accumulator ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    JMP $40401E          ; 5C 1E 40 40 | Jump to address long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_196
; Address: $F8CD72
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_196:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BMI $50              ; 30 50 | Branch if negative
    ORA ($71),Y          ; 11 71 | Logical OR with accumulator ((zero page),Y)
    LDY $2F              ; A4 2F | Load from zero page into Y register
    AND $63DE,X          ; 3D DE 63 | Logical AND with accumulator (absolute,X)
    ASL $3D00,X          ; 1E 00 3D | Arithmetic shift left (absolute,X)
    ORA $1A09,X          ; 1D 09 1A | Logical OR with accumulator (absolute,X)
    ASL $0F1D            ; 0E 1D 0F | Arithmetic shift left (absolute)
    ASL $1E1E,X          ; 1E 1E 1E | Arithmetic shift left (absolute,X)
    AND #$12             ; 29 12 | Logical AND with accumulator (immediate)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0C0C            ; 0D 0C 0C | Logical OR with accumulator (absolute)
    ORA $001C,X          ; 1D 1C 00 | Logical OR with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    JMP $00001E          ; 5C 1E 00 00 | Jump to address long
    BRA $80              ; 80 80 | Branch always
    BRA $81              ; 80 81 | Branch always
    CMP ($46,X)          ; C1 46 | Compare accumulator ((zero page,X))
    CPY $4F              ; C4 4F | Compare Y register (zero page)
    EOR $63DE,X          ; 5D DE 63 | Exclusive OR with accumulator (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$44             ; C0 44 | Compare Y register (immediate)
    CPY $4A              ; C4 4A | Compare Y register (zero page)
    CPY $3A              ; C4 3A | Compare Y register (zero page)
    CPY $FC34            ; CC 34 FC | Compare Y register (absolute)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_198
; Address: $F8CE03
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_198:
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_199
; Address: $F8CE0C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_199:
    JSL $3F1C7E          ; 22 7E 1C 3F | Jump to subroutine long
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_19B
; Address: $F8CE1A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_19B:
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    XBA                  ; EB | Exchange accumulator bytes
    CPX #$E0             ; E0 E0 | Game work RAM access
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CPY $FC              ; C4 FC | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_19C
; Address: $F8CE2A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_19C:
    JSL $BE92BE          ; 22 BE 92 BE | Jump to subroutine long
    AND #$6F             ; 29 6F | Logical AND with accumulator (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVC $50              ; 50 50 | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TSX                  ; BA | Transfer stack pointer to X register
    PLY                  ; 7A | Pull Y register from stack
    ADC $00DD            ; 6D DD 00 | Add with carry (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $80              ; B0 80 | Branch if carry set
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_19D
; Address: $F8CE6D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_19D:
    JSR $9054            ; 20 54 90 | Jump to subroutine
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $30              ; 70 30 | Branch if overflow set
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    JMP ($0044)          ; 6C 44 00 | Jump to address (absolute indirect)
    ORA #$14             ; 09 14 | Logical OR with accumulator (immediate)
    ASL $3C38            ; 0E 38 3C | Arithmetic shift left (absolute)
    BMI $1C              ; 30 1C | Branch if negative
    ORA $1E09            ; 0D 09 1E | Logical OR with accumulator (absolute)
    ASL $3D3B            ; 0E 3B 3D | Arithmetic shift left (absolute)
    LSR $1D              ; 46 1D | Logical shift right (zero page)
    ROR $0000            ; 6E 00 00 | Rotate right (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_19F
; Address: $F8CEAC
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_19F:
    JMP $3E127C          ; 5C 7C 12 3E | Jump to address long
    BVS $70              ; 70 70 | Branch if overflow set
    BCC $88              ; 90 88 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    DEX                  ; CA | Decrement X register
    LDY $BE62,X          ; BC 62 BE | Load from absolute,X into Y register
    ROR $0001            ; 6E 01 00 | Rotate right (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BVC $A5              ; 50 A5 | Branch if overflow clear
    ADC $3234            ; 6D 34 32 | Add with carry (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $1C38,Y          ; 19 38 1C | Logical OR with accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ROL $3B86            ; 2E 86 3B | Rotate left (absolute)
    AND ($2B,X)          ; 21 2B | Logical AND with accumulator ((zero page,X))
    AND #$17             ; 29 17 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    TXA                  ; 8A | Transfer X register to accumulator
    STZ $001E            ; 9C 1E 00 | Store zero to absolute
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    STX $84              ; 86 84 | Store X register to zero page
    STA $9E9D87          ; 8F 87 9D 9E | Store accumulator to absolute long address
    BMI $BC              ; 30 BC | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    DEC $1E              ; C6 1E | Decrement (zero page)
    INC                  ; 1A | Increment accumulator
    ROL $003E            ; 2E 3E 00 | Rotate left (absolute)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    CPY $3C              ; C4 3C | Compare Y register (zero page)
    INC                  ; 1A | Increment accumulator
    SBC $DE              ; E5 DE | Subtract with carry (zero page)
    AND ($68),Y          ; 31 68 | Logical AND with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    BNE $30              ; D0 30 | Branch if not equal
    LDY #$80             ; A0 80 | Load immediate value into Y register
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1A0
; Address: $F8CF50
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1A0:
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $F0              ; F0 F0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1A1
; Address: $F8CF55
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1A1:
    JSR $E080            ; 20 80 E0 | Game work RAM access
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $01              ; 80 01 | Branch always
    ROL $0D02,X          ; 3E 02 0D | Rotate left (absolute,X)
    AND ($6F,X)          ; 21 6F | Logical AND with accumulator ((zero page,X))
    BIT $240F            ; 2C 0F 24 | Test bits in accumulator (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1A2
; Address: $F8CF92
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1A2:
    ORA $2D71            ; 0D 71 2D | Logical OR with accumulator (absolute)
    EOR $2E02,Y          ; 59 02 2E | Exclusive OR with accumulator (absolute,Y)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1A4
; Address: $F8CFBC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1A4:
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($31),Y          ; 11 31 | Logical OR with accumulator ((zero page),Y)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    CPX #$E6             ; E0 E6 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    ROR $791A,X          ; 7E 1A 79 | Rotate right (absolute,X)
    ORA $1D3F,X          ; 1D 3F 1D | Logical OR with accumulator (absolute,X)
    ASL $0E3C            ; 0E 3C 0E | Arithmetic shift left (absolute)
    DEC $6AD2,X          ; DE D2 6A | Decrement (absolute,X)
    ORA $1A1C,X          ; 1D 1C 1A | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1A5
; Address: $F8CFFA
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1A5:
    ASL $0D1E,X          ; 1E 1E 0D | Arithmetic shift left (absolute,X)
    ORA $290C            ; 0D 0C 29 | Logical OR with accumulator (absolute)
    AND $3E00,X          ; 3D 00 3E | Logical AND with accumulator (absolute,X)
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    EOR $2B12,X          ; 5D 12 2B | Exclusive OR with accumulator (absolute,X)
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ROL $177F,X          ; 3E 7F 17 | Rotate left (absolute,X)
    AND $D8CF,Y          ; 39 CF D8 | Logical AND with accumulator (absolute,Y)
    BIT #$EF             ; 89 EF | Test bits in accumulator (immediate)
    LDA                  ; BF A7 18 78 | Load from absolute long,X into accumulator
    ROR $E8FE,X          ; 7E FE E8 | Rotate right (absolute,X)
    LDX $BEE0,Y          ; BE E0 BE | Load from absolute,Y into X register
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    CPY $00F8            ; CC F8 00 | Compare Y register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$78             ; E0 78 | Compare X register (immediate)
    CPX $FE              ; E4 FE | Compare X register (zero page)
    LDY $BC54,X          ; BC 54 BC | Load from absolute,X into Y register
    JMP $C810F0          ; 5C F0 10 C8 | Jump to address long
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1A7
; Address: $F8D040
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1A7:
    AND $3C1F,X          ; 3D 1F 3C | Logical AND with accumulator (absolute,X)
    ASL $3E7C,X          ; 1E 7C 3E | Arithmetic shift left (absolute,X)
    ROL $3E7D,X          ; 3E 7D 3E | Rotate left (absolute,X)
    ROL $3E7C,X          ; 3E 7C 3E | Rotate left (absolute,X)
    ADC $1C3E,X          ; 7D 3E 1C | Add with carry (absolute,X)
    ORA $3D1C,X          ; 1D 1C 3D | Logical OR with accumulator (absolute,X)
    AND $3D3C,X          ; 3D 3C 3D | Logical AND with accumulator (absolute,X)
    AND $3C3D,X          ; 3D 3D 3C | Logical AND with accumulator (absolute,X)
    AND $3D3C,X          ; 3D 3C 3D | Logical AND with accumulator (absolute,X)
    AND $0E58,X          ; 3D 58 0E | Logical AND with accumulator (absolute,X)
    ASL $1740,X          ; 1E 40 17 | Arithmetic shift left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1A8
; Address: $F8D06C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1A8:
    ROL $5701            ; 2E 01 57 | Rotate left (absolute)
    DEC $DE77            ; CE 77 DE | Decrement (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1A9
; Address: $F8D076
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1A9:
    XBA                  ; EB | Exchange accumulator bytes
    LDY $1CBF,X          ; BC BF 1C | Load from absolute,X into Y register
    LDA                  ; BF 2C FF 2F | Load from absolute long,X into accumulator
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    STY $3FBC            ; 8C BC 3F | Store Y register to absolute address
    BEQ $DF              ; F0 DF | Branch if equal
    BVS $FE              ; 70 FE | Branch if overflow set
    LDY $66              ; A4 66 | Load from zero page into Y register
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CMP ($DE,X)          ; C1 DE | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1AA
; Address: $F8D097
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1AA:
    TAX                  ; AA | Transfer accumulator to X register
    DEC $F82E,X          ; DE 2E F8 | Decrement (absolute,X)
    DEY                  ; 88 | Decrement Y register
    CPX $DC              ; E4 DC | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1AC
; Address: $F8D0A1
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1AC:
    ASL $0F1E            ; 0E 1E 0F | Arithmetic shift left (absolute)
    ASL $1F07,X          ; 1E 07 1F | Arithmetic shift left (absolute,X)
    ASL $060E            ; 0E 0E 06 | Arithmetic shift left (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($9C,X)          ; 01 9C | Logical OR with accumulator ((zero page,X))
    BVS $8F              ; 70 8F | Branch if overflow set
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FC96,X          ; FE 96 FC | Increment (absolute,X)
    STZ $7070            ; 9C 70 70 | Store zero to absolute
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1AE
; Address: $F8D0F2
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1AE:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    ROR $3E3F,X          ; 7E 3F 3E | Rotate right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $1E3E,X          ; 3E 3E 1E | Rotate left (absolute,X)
    ASL $1F1F,X          ; 1E 1F 1F | Arithmetic shift left (absolute,X)
    ORA ($9C,X)          ; 01 9C | Logical OR with accumulator ((zero page,X))
    ADC ($8F),Y          ; 71 8F | Add with carry ((zero page),Y)
    INC $78FE,X          ; FE FE 78 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FC96,X          ; FE 96 FC | Increment (absolute,X)
    STZ $7171            ; 9C 71 71 | Store zero to absolute
    INC $78FE,X          ; FE FE 78 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1AF
; Address: $F8D158
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1AF:
    BRA $80              ; 80 80 | Branch always
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $80              ; 70 80 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    WDM #$3C             ; 42 3C | Reserved instruction
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    BMI $38              ; 30 38 | Branch if negative
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $331B            ; 2C 1B 33 | Test bits in accumulator (absolute)
    BIT $3F1D            ; 2C 1D 3F | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1B0
; Address: $F8D1D8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1B0:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPX #$78             ; E0 78 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1B2
; Address: $F8D1FA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1B2:
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BPL $0C              ; 10 0C | Branch if positive
    ASL $7EDE,X          ; 1E DE 7E | Arithmetic shift left (absolute,X)
    JMP $7438            ; 4C 38 74 | Jump to address
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BPL $30              ; 10 30 | Branch if positive
    ASL $0800,X          ; 1E 00 08 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1B3
; Address: $F8D262
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1B3:
    JSR $1040            ; 20 40 10 | Jump to subroutine
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    BVS $B6              ; 70 B6 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    ROL $0C3E,X          ; 3E 3E 0C | Rotate left (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ASL $343C,X          ; 1E 3C 34 | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    STZ $38              ; 64 38 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1B4
; Address: $F8D28E
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1B4:
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ASL $001F            ; 0E 1F 00 | Arithmetic shift left (absolute)
    BMI $0F              ; 30 0F | Branch if negative
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    STA $06F870          ; 8F 70 F8 06 | Store accumulator to absolute long address
    CPX #$18             ; E0 18 | Compare X register (immediate)
    STY $78              ; 84 78 | Store Y register to zero page
    ROL $C7              ; 26 C7 | Rotate left (zero page)
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BMI $FE              ; 30 FE | Branch if negative
    ADC ($F8,X)          ; 61 F8 | Add with carry ((zero page,X))
    INC $F400,X          ; FE 00 F4 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $FC              ; 80 FC | Branch always
    INC $0300,X          ; FE 00 03 | Increment (absolute,X)
    BIT $0BFC            ; 2C FC 0B | Test bits in accumulator (absolute)
    SBC $00FC,X          ; FD FC 00 | Subtract with carry (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    JMP $FBEE1F          ; 5C 1F EE FB | Jump to address long
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1B5
; Address: $F8D30B
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1B5:
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1B6
; Address: $F8D30F
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1B6:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    AND $7F27,Y          ; 39 27 7F | Logical AND with accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    DEC $FC              ; C6 FC | Decrement (zero page)
    STZ $18              ; 64 18 | Store zero to zero page
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    LDX $4DCF            ; AE CF 4D | Load from absolute address into X register
    EOR $3377,Y          ; 59 77 33 | Exclusive OR with accumulator (absolute,Y)
    ASL $0C0E            ; 0E 0E 0C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1B7
; Address: $F8D350
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1B7:
    PLP                  ; 28 | Pull processor status from stack
    BCC $3E              ; 90 3E | Branch if carry clear
    AND ($7C),Y          ; 31 7C | Logical AND with accumulator ((zero page),Y)
    AND $7C              ; 25 7C | Logical AND with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1B8
; Address: $F8D369
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1B8:
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($31),Y          ; 11 31 | Logical OR with accumulator ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    CPY $4F              ; C4 4F | Compare Y register (zero page)
    JMP $DBDF            ; 4C DF DB | Jump to address
    DEC $DE5A,X          ; DE 5A DE | Decrement (absolute,X)
    ROR $3C37,X          ; 7E 37 3C | Rotate right (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    BVS $3C              ; 70 3C | Branch if overflow set
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1B9
; Address: $F8D398
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1B9:
    JSL $782278          ; 22 78 22 78 | Jump to subroutine long
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1BE
; Address: $F8D3B8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1BE:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BEQ $20              ; F0 20 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BVS $BE              ; 70 BE | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    ASL $001E,X          ; 1E 1E 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1BF
; Address: $F8D3D6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1BF:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    BMI $30              ; 30 30 | Branch if negative
    JMP ($7638)          ; 6C 38 76 | Jump to address (absolute indirect)
    ROL $1C              ; 26 1C | Rotate left (zero page)
    ROL $3C1C            ; 2E 1C 3C | Rotate left (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1C0
; Address: $F8D3F4
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1C0:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ORA $0B01,Y          ; 19 01 0B | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    BPL $3F              ; 10 3F | Branch if positive
    EOR ($7F),Y          ; 51 7F | Exclusive OR with accumulator ((zero page),Y)
    LDA $7CEF7F          ; AF 7F EF 7C | Load from absolute long address into accumulator
    STA $D97A,X          ; 9D 7A D9 | Store accumulator to absolute,X
    SBC $FFAB,Y          ; F9 AB FF | Subtract with carry (absolute,Y)
    BNE $00              ; D0 00 | Branch if not equal
    BPL $00              ; 10 00 | Branch if positive
    BPL $03              ; 10 03 | Branch if positive
    BNE $06              ; D0 06 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    INC $FEF9,X          ; FE F9 FE | Increment (absolute,X)
    INC $9FFB,X          ; FE FB 9F | Increment (absolute,X)
    CMP $F3B7            ; CD B7 F3 | Compare accumulator (absolute)
    SBC $02FF,X          ; FD FF 02 | Subtract with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1C1
; Address: $F8D45B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1C1:
    BMI $80              ; 30 80 | Branch if negative
    CPY $8080            ; CC 80 80 | Compare Y register (absolute)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    BRA $10              ; 80 10 | Branch always
    LDY $DE10,X          ; BC 10 DE | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    INC $ACFC            ; EE FC AC | Increment (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1C2
; Address: $F8D4A6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1C2:
    JSR $401F            ; 20 1F 40 | Jump to subroutine
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1C3
; Address: $F8D4C4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1C3:
    BVS $80              ; 70 80 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $40              ; F0 40 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1C4
; Address: $F8D4D7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1C4:
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($1C,X)          ; 21 1C | Logical AND with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BVC $A0              ; 50 A0 | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    BCS $9C              ; B0 9C | Branch if carry set
    STZ $0404            ; 9C 04 04 | Store zero to absolute
    BEQ $00              ; F0 00 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCS $9C              ; B0 9C | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1C6
; Address: $F8D542
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1C6:
    ASL $0F04            ; 0E 04 0F | Arithmetic shift left (absolute)
    ASL $76              ; 06 76 | Arithmetic shift left (zero page)
    INC $FCB6,X          ; FE B6 FC | Increment (absolute,X)
    BEQ $70              ; F0 70 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1C7
; Address: $F8D558
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1C7:
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1C8
; Address: $F8D560
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1C8:
    CLC                  ; 18 | Clear carry flag
    ORA $0B01,Y          ; 19 01 0B | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1C9
; Address: $F8D56E
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1C9:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $3F              ; 10 3F | Branch if positive
    EOR ($7F),Y          ; 51 7F | Exclusive OR with accumulator ((zero page),Y)
    LDA $7FEF7F          ; AF 7F EF 7F | Load from absolute long address into accumulator
    STA                  ; 9F 7F DF 7F | Store accumulator to absolute long,X
    LDA                  ; BF FF 2B FF | Load from absolute long,X into accumulator
    BNE $00              ; D0 00 | Branch if not equal
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BVC $00              ; 50 00 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SBC $F9FF,Y          ; F9 FF F9 | Subtract with carry (absolute,Y)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $01FF,X          ; FE FF 01 | Increment (absolute,X)
    BRA $20              ; 80 20 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1CA
; Address: $F8D5D4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1CA:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BMI $30              ; 30 30 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BVS $0C              ; 70 0C | Branch if overflow set
    PLX                  ; FA | Pull X register from stack
    JMP ($1E73)          ; 6C 73 1E | Jump to address (absolute indirect)
    ADC $3A7E            ; 6D 7E 3A | Add with carry (absolute)
    BPL $30              ; 10 30 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1CB
; Address: $F8D5FA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1CB:
    JMP $0800            ; 4C 00 08 | Jump to address
    BPL $00              ; 10 00 | Branch if positive
    ADC $2B3F,X          ; 7D 3F 2B | Add with carry (absolute,X)
    ADC $3E3F,Y          ; 79 3F 3E | Add with carry (absolute,Y)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $0A07            ; 0D 07 0A | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF F9 6D FD | Load from absolute long,X into accumulator
    LDA $03F9,X          ; BD F9 03 | Load from absolute,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1CC
; Address: $F8D637
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1CC:
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ROL $3F0F,X          ; 3E 0F 3F | Rotate left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1CD
; Address: $F8D64E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1CD:
    CMP $60CF,Y          ; D9 CF 60 | Compare accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    INY                  ; C8 | Increment Y register
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $98              ; F0 98 | Branch if equal
    BEQ $28              ; F0 28 | Branch if equal
    CPX #$88             ; E0 88 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$50             ; E0 50 | Compare X register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1CE
; Address: $F8D672
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1CE:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL $0301            ; 0E 01 03 | Arithmetic shift left (absolute)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    ORA $083F            ; 0D 3F 08 | Logical OR with accumulator (absolute)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STY $7F80            ; 8C 80 7F | Store Y register to absolute address
    ASL $9E7F            ; 0E 7F 9E | Arithmetic shift left (absolute)
    STY $FF7F            ; 8C 7F FF | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BVS $38              ; 70 38 | Branch if overflow set
    CPY #$06             ; C0 06 | Compare Y register (immediate)
    BPL $FF              ; 10 FF | Branch if positive
    BMI $FF              ; 30 FF | Branch if negative
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    INC $E000,X          ; FE 00 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1CF
; Address: $F8D6E4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1CF:
    JSR $E0C0            ; 20 C0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $60              ; F0 60 | Branch if equal

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1D0
; Address: $F8D6F4
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1D0:
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $13              ; 06 13 | Arithmetic shift left (zero page)
    ORA ($07),Y          ; 11 07 | Logical OR with accumulator ((zero page),Y)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $01              ; 10 01 | Branch if positive
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $DE              ; D0 DE | Branch if not equal
    DEC $CCCC,X          ; DE CC CC | Decrement (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1D1
; Address: $F8D730
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1D1:
    JSR $26F0            ; 20 F0 26 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BIT $F8              ; 24 F8 | Test bits in accumulator (zero page)
    BIT $F8              ; 24 F8 | Test bits in accumulator (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    BPL $FC              ; 10 FC | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    STZ $38              ; 64 38 | Store zero to zero page
    ROL $3918            ; 2E 18 39 | Rotate left (absolute)
    ASL $1F31,X          ; 1E 31 1F | Arithmetic shift left (absolute,X)
    INC                  ; 1A | Increment accumulator
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $0D07            ; 0D 07 0D | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LDA                  ; BF FF 6F FF | Load from absolute long,X into accumulator
    SBC $FEFF,X          ; FD FF FE | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1D2
; Address: $F8D7BE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1D2:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    BCS $E0              ; B0 E0 | Game work RAM access
    BVC $E0              ; 50 E0 | Game work RAM access
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $E8              ; F0 E8 | Branch if equal
    BEQ $A8              ; F0 A8 | Branch if equal
    BEQ $D8              ; F0 D8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1D3
; Address: $F8D7D2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1D3:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1D4
; Address: $F8D7E1
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1D4:
    RTI                  ; 40 | Return from interrupt
    BEQ $E0              ; F0 E0 | Game work RAM access
    BCS $E0              ; B0 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    BEQ $36              ; F0 36 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    ROL $083E,X          ; 3E 3E 08 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0707            ; 0E 07 07 | Arithmetic shift left (absolute)
    ORA $0E0F,X          ; 1D 0F 0E | Logical OR with accumulator (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    INC $FF4B,X          ; FE 4B FF | Increment (absolute,X)
    LDA $FEFF            ; AD FF FE | Load from absolute address into accumulator
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    LDA $C600            ; AD 00 C6 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1D5
; Address: $F8D83A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1D5:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    AND $FB1F,Y          ; 39 1F FB | Logical AND with accumulator (absolute,Y)
    NOP                  ; EA | No operation
    STA                  ; 9F F9 FE 07 | Store accumulator to absolute long,X
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$3A             ; C0 3A | Compare Y register (immediate)
    NOP                  ; EA | No operation
    STA $0600,Y          ; 99 00 06 | Store accumulator to absolute,Y
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $E0              ; D0 E0 | Game work RAM access
    BVS $E0              ; 70 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1D6
; Address: $F8D865
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1D6:
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    LDY #$9C             ; A0 9C | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1D7
; Address: $F8D874
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1D7:
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BCC $00              ; 90 00 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    BVS $FF              ; 70 FF | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $FFFF            ; 0D FF FF | Logical OR with accumulator (absolute)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    BEQ $E8              ; F0 E8 | Branch if equal
    BEQ $E8              ; F0 E8 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1D9
; Address: $F8D8FE
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1D9:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    INC $BD38,X          ; FE 38 BD | Increment (absolute,X)
    ROR $2C76,X          ; 7E 76 2C | Rotate right (absolute,X)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0707            ; 0E 07 07 | Arithmetic shift left (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    JMP $AFFF            ; 4C FF AF | Jump to address
    PHA                  ; 48 | Push accumulator to stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    JMP $AF00            ; 4C 00 AF | Jump to address
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STX $FF              ; 86 FF | Store X register to zero page
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1DA
; Address: $F8D968
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1DA:
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page
    SED                  ; F8 | Set decimal mode flag
    BMI $E0              ; 30 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1DC
; Address: $F8D990
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1DC:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    BPL $5E              ; 10 5E | Branch if positive
    INC $7C              ; E6 7C | Increment (zero page)
    ASL $1F3B,X          ; 1E 3B 1F | Arithmetic shift left (absolute,X)
    ASL $0C0C,X          ; 1E 0C 0C | Arithmetic shift left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1DD
; Address: $F8D9B6
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1DD:
    JSR $1800            ; 20 00 18 | Jump to subroutine
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    LDA $FFAFFF          ; AF FF AF FF | Load from absolute long address into accumulator
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $7FFF,X          ; FE FF 7F | Increment (absolute,X)
    INC $F09F,X          ; FE 9F F0 | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCC $00              ; 90 00 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $D0              ; F0 D0 | Branch if equal
    CPX #$70             ; E0 70 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1DF
; Address: $F8DA56
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1DF:
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$19             ; 09 19 | Logical OR with accumulator (immediate)
    ASL $2C              ; 06 2C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1E0
; Address: $F8DA6D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1E0:
    JSR $4073            ; 20 73 40 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $1304            ; 0E 04 13 | Arithmetic shift left (absolute)
    JMP $000C            ; 4C 0C 00 | Jump to address
    BRA $90              ; 80 90 | Branch always
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CPY #$70             ; C0 70 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1E1
; Address: $F8DA89
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1E1:
    BRA $80              ; 80 80 | Branch always
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1E3
; Address: $F8DA94
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1E3:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    ORA $193A,X          ; 1D 3A 19 | Logical OR with accumulator (absolute,X)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    BPL $06              ; 10 06 | Branch if positive
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $90              ; F0 90 | Branch if equal
    ROL $364C            ; 2E 4C 36 | Rotate left (absolute)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1E4
; Address: $F8DACB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1E4:
    JSR $7EEC            ; 20 EC 7E | Jump to subroutine
    BEQ $10              ; F0 10 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1E5
; Address: $F8DAD9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1E5:
    BMI $00              ; 30 00 | Branch if negative
    JMP ($1040)          ; 6C 40 10 | Jump to address (absolute indirect)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BPL $16              ; 10 16 | Branch if positive
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    BMI $F0              ; 30 F0 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1E6
; Address: $F8DB0C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1E6:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $30              ; 80 30 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1E7
; Address: $F8DB1C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1E7:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1E8
; Address: $F8DB40
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1E8:
    BRA $FF              ; 80 FF | Branch always
    BVS $FF              ; 70 FF | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1E9
; Address: $F8DB84
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1E9:
    JSR $401F            ; 20 1F 40 | Jump to subroutine
    STA $06F870          ; 8F 70 F8 06 | Store accumulator to absolute long address
    CPX #$18             ; E0 18 | Compare X register (immediate)
    STY $78              ; 84 78 | Store Y register to zero page
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA $73FF,Y          ; 19 FF 73 | Logical OR with accumulator (absolute,Y)
    INC $F861,X          ; FE 61 F8 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1EA
; Address: $F8DBA3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1EA:
    BRA $78              ; 80 78 | Branch always
    BRA $FC              ; 80 FC | Branch always
    INC $0F00,X          ; FE 00 0F | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1EB
; Address: $F8DBB3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1EB:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    INC $FF90,X          ; FE 90 FF | Increment (absolute,X)
    SBC ($FB,X)          ; E1 FB | Subtract with carry ((zero page,X))
    AND $1F1F,Y          ; 39 1F 1F | Logical AND with accumulator (absolute,Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BEQ $40              ; F0 40 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BCS $B0              ; B0 B0 | Branch if carry set
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1EC
; Address: $F8DC16
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1EC:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    ROL $2D6F            ; 2E 6F 2D | Rotate left (absolute)
    AND $1B3F,X          ; 3D 3F 1B | Logical AND with accumulator (absolute,X)
    ASL $080E            ; 0E 0E 08 | Arithmetic shift left (absolute)
    ASL $1E08,X          ; 1E 08 1E | Arithmetic shift left (absolute,X)
    BPL $3E              ; 10 3E | Branch if positive
    ORA ($3C),Y          ; 11 3C | Logical OR with accumulator ((zero page),Y)
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ASL $8000            ; 0E 00 80 | Arithmetic shift left (absolute)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1EE
; Address: $F8DC46
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1EE:
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1F0
; Address: $F8DC56
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1F0:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $1B0A            ; 0E 0A 1B | Arithmetic shift left (absolute)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    JMP ($7664)          ; 6C 64 76 | Jump to address (absolute indirect)
    CPX #$E2             ; E0 E2 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$E0             ; C0 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    CPX #$94             ; E0 94 | Compare X register (immediate)
    BEQ $8E              ; F0 8E | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BMI $F0              ; 30 F0 | Branch if negative
    INY                  ; C8 | Increment Y register
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA $3500,Y          ; 19 00 35 | Logical OR with accumulator (absolute,Y)
    AND $05              ; 25 05 | Logical AND with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $010E            ; 0E 0E 01 | Arithmetic shift left (absolute)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL $3A              ; 06 3A | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ASL $050E            ; 0E 0E 05 | Arithmetic shift left (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1F1
; Address: $F8DCC3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1F1:
    RTI                  ; 40 | Return from interrupt
    BVC $50              ; 50 50 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1F2
; Address: $F8DCCE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1F2:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BNE $80              ; D0 80 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1F4
; Address: $F8DCDC
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1F4:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    ORA $1B05,Y          ; 19 05 1B | Logical OR with accumulator (absolute,Y)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    BPL $3F              ; 10 3F | Branch if positive
    BPL $3F              ; 10 3F | Branch if positive
    ROL $C7              ; 26 C7 | Rotate left (zero page)
    EOR ($7F),Y          ; 51 7F | Exclusive OR with accumulator ((zero page),Y)
    STA $7F9F7F          ; 8F 7F 9F 7F | Store accumulator to absolute long address
    INC $F400,X          ; FE 00 F4 | Increment (absolute,X)
    BNE $00              ; D0 00 | Branch if not equal
    BIT $0BFC            ; 2C FC 0B | Test bits in accumulator (absolute)
    SBC $FED3,X          ; FD D3 FE | Subtract with carry (absolute,X)
    SBC $FCFE,Y          ; F9 FE FC | Subtract with carry (absolute,Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1F6
; Address: $F8DD85
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1F6:
    JSR $A080            ; 20 80 A0 | Jump to subroutine
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BCS $40              ; B0 40 | Branch if carry set
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    ROL $E001,X          ; 3E 01 E0 | Game work RAM access
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ORA $795A,X          ; 1D 5A 79 | Logical OR with accumulator (absolute,X)
    AND $131F            ; 2D 1F 13 | Logical AND with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$A0             ; E0 A0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1F7
; Address: $F8DE06
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1F7:
    BCS $50              ; B0 50 | Branch if carry set
    BNE $A0              ; D0 A0 | Branch if not equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    LDY $0024,X          ; BC 24 00 | Load from absolute,X into Y register
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1F8
; Address: $F8DE19
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1F8:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1F9
; Address: $F8DE27
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1F9:
    PLY                  ; 7A | Pull Y register from stack
    AND $3D4F,X          ; 3D 4F 3D | Logical AND with accumulator (absolute,X)
    ROL $1E12,X          ; 3E 12 1E | Rotate left (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1200            ; 0D 00 12 | Logical OR with accumulator (absolute)
    ASL $EC00,X          ; 1E 00 EC | Arithmetic shift left (absolute,X)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPX $CEB3            ; EC B3 CE | Compare X register (absolute)
    BVS $70              ; 70 70 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1FA
; Address: $F8DE52
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1FA:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    BVS $00              ; 70 00 | Branch if overflow set
    BIT $7C00            ; 2C 00 7C | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ROR $3C              ; 66 3C | Rotate right (zero page)
    ROL $1E35,X          ; 3E 35 1E | Rotate left (absolute,X)
    ASL $383E,X          ; 1E 3E 38 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ASL $0400            ; 0E 00 04 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BRA $7F              ; 80 7F | Branch always
    INX                  ; E8 | Increment X register
    STY $78              ; 84 78 | Store Y register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1FB
; Address: $F8DEBB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1FB:
    INC $FC              ; E6 FC | Increment (zero page)
    STA $0000FF          ; 8F FF 00 00 | Store accumulator to absolute long address
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $80              ; 70 80 | Branch if overflow set
    BRA $FE              ; 80 FE | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1FC
; Address: $F8DECB
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1FC:
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $40              ; F0 40 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    AND ($3B,X)          ; 21 3B | Logical AND with accumulator ((zero page,X))
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ORA $0A10            ; 0D 10 0A | Logical OR with accumulator (absolute)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ASL $3E00,X          ; 1E 00 3E | Arithmetic shift left (absolute,X)
    BRA $1F              ; 80 1F | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BRA $9F              ; 80 9F | Branch always
    ROR $FA7F            ; 6E 7F FA | Rotate right (absolute)
    STA $FBEEFF          ; 8F FF EE FB | Store accumulator to absolute long address
    STA                  ; 9F 60 FF 00 | Store accumulator to absolute long,X
    INC $F200            ; EE 00 F2 | Increment (absolute)
    PHB                  ; 8B | Push data bank register to stack
    NOP                  ; EA | No operation
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $03              ; F0 03 | Branch if equal
    CMP ($0E,X)          ; C1 0E | Compare accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1FD
; Address: $F8DF57
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1FD:
    INY                  ; C8 | Increment Y register
    LDY $B0CF,X          ; BC CF B0 | Load from absolute,X into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    BRA $0F              ; 80 0F | Branch always
    ORA $00E0            ; 0D E0 00 | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STX $FF              ; 86 FF | Store X register to zero page
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $0000,X          ; FD 00 00 | Subtract with carry (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_1FF
; Address: $F8DF89
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_1FF:
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_200
; Address: $F8DF8E
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_200:
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    ASL $1006            ; 0E 06 10 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BNE $D0              ; D0 D0 | Branch if not equal
    BVC $50              ; 50 50 | Branch if overflow clear
    STZ $64              ; 64 64 | Store zero to zero page
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BVC $F0              ; 50 F0 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    STZ $FCF8            ; 9C F8 FC | Store zero to absolute
    BEQ $FC              ; F0 FC | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    AND $0E0F,Y          ; 39 0F 0E | Logical AND with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BNE $F0              ; D0 F0 | Branch if not equal
    PEA #$3E3C           ; F4 3C 3E | Push effective address to stack
    DEC $76              ; C6 76 | Decrement (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    INC $EC76,X          ; FE 76 EC | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank70_DmaFunction_202
; Address: $F8E01C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_202:
    BPL $F8              ; 10 F8 | Branch if positive
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    LDY #$E0             ; A0 E0 | Game work RAM access
    BEQ $70              ; F0 70 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    TXS                  ; 9A | Transfer X register to stack pointer
    TXS                  ; 9A | Transfer X register to stack pointer
    STA                  ; 9F 9E 0E 0E | Store accumulator to absolute long,X
    BIT $4060            ; 2C 60 40 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_203
; Address: $F8E050
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_203:
    JSR $0800            ; 20 00 08 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    STZ $FE              ; 64 FE | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_204
; Address: $F8E059
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_204:
    INC $FCF2,X          ; FE F2 FC | Increment (absolute,X)
    CPY $80E0            ; CC E0 80 | Compare Y register (absolute)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    ORA $1B05,Y          ; 19 05 1B | Logical OR with accumulator (absolute,Y)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ROL $C7              ; 26 C7 | Rotate left (zero page)
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    INC $F400,X          ; FE 00 F4 | Increment (absolute,X)
    PEA #$4000           ; F4 00 40 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    JMP ($0BFC)          ; 6C FC 0B | Jump to address (absolute indirect)
    SBC $FE1B,X          ; FD 1B FE | Subtract with carry (absolute,X)
    SBC #$FE             ; E9 FE | Subtract with carry (immediate)
    SBC $00FE,Y          ; F9 FE 00 | Subtract with carry (absolute,Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_205
; Address: $F8E0C1
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_205:
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_206
; Address: $F8E0C5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_206:
    JSR $A080            ; 20 80 A0 | Jump to subroutine
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $40              ; F0 40 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank70_DmaFunction_207
; Address: $F8E0D6
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_207:
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $3D00,X          ; 3D 00 3D | Logical AND with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $F3F7,Y          ; F9 F7 F3 | Subtract with carry (absolute,Y)
    SBC $EDFF,Y          ; F9 FF ED | Subtract with carry (absolute,Y)
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_208
; Address: $F8E114
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_208:
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ASL $1D01            ; 0E 01 1D | Arithmetic shift left (absolute)
    ORA $1F0A,X          ; 1D 0A 1F | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BCS $07              ; B0 07 | Branch if carry set
    INC                  ; 1A | Increment accumulator
    PLP                  ; 28 | Pull processor status from stack
    LDA                  ; BF 4D 7F 17 | Load from absolute long,X into accumulator
    LDA                  ; BF BF 40 7F | Load from absolute long,X into accumulator
    BRA $FA              ; 80 FA | Branch always
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    INC $FE17,X          ; FE 17 FE | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    INC $1600,X          ; FE 00 16 | Increment (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_209
; Address: $F8E18F
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_209:
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $0101            ; 0E 01 01 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    BNE $F0              ; D0 F0 | Branch if not equal
    PEA #$3E3C           ; F4 3C 3E | Push effective address to stack
    DEC $76              ; C6 76 | Decrement (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    INC $F0F6,X          ; FE F6 F0 | Increment (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $90              ; F0 90 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $08              ; 80 08 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $90              ; 10 90 | Branch if positive
    PEA #$3434           ; F4 34 34 | Push effective address to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $7E4A,X          ; 3E 4A 7E | Rotate left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_20A
; Address: $F8E266
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_20A:
    JSR $4019            ; 20 19 40 | Jump to subroutine
    BRA $63              ; 80 63 | Branch always
    ADC $E307,Y          ; 79 07 E3 | Add with carry (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BRA $3E              ; 80 3E | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank70_DmaFunction_20B
; Address: $F8E294
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_20B:
    SED                  ; F8 | Set decimal mode flag
    INC $FF80,X          ; FE 80 FF | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    LDA                  ; BF 6F 3F 65 | Load from absolute long,X into accumulator
    INC $AE7F,X          ; FE 7F AE | Increment (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_20D
; Address: $F8E2F8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_20D:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    SBC $FCFF,X          ; FD FF FC | Subtract with carry (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP ($D6F8)          ; 6C F8 D6 | Jump to address (absolute indirect)
    LSR $86FC            ; 4E FC 86 | Logical shift right (absolute)
    LDX #$FC             ; A2 FC | Load immediate value into X register
    PLY                  ; 7A | Pull Y register from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_20E
; Address: $F8E338
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_20E:
    JSR $1400            ; 20 00 14 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    BCS $A0              ; B0 A0 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY #$60             ; A0 60 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_20F
; Address: $F8E368
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_20F:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_211
; Address: $F8E36E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_211:
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    CPX #$50             ; E0 50 | Compare X register (immediate)
    BEQ $50              ; F0 50 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    CPX #$60             ; E0 60 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_212
; Address: $F8E37B
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_212:
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $E0              ; 80 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    BMI $0F              ; 30 0F | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BRA $7F              ; 80 7F | Branch always
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    BMI $FF              ; 30 FF | Branch if negative
    RTI                  ; 40 | Return from interrupt
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    BPL $07              ; 10 07 | Branch if positive
    BPL $0B              ; 10 0B | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $1C              ; 06 1C | Arithmetic shift left (zero page)
    BRA $7F              ; 80 7F | Branch always
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $FC              ; 80 FC | Branch always
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CPY $07              ; C4 07 | Compare Y register (zero page)
    STX $FF              ; 86 FF | Store X register to zero page
    REP #$FF             ; C2 FF | Reset processor status bits
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_213
; Address: $F8E400
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_213:
    JSR $60C0            ; 20 C0 60 | Jump to subroutine
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $40              ; F0 40 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STZ $B77F,X          ; 9E 7F B7 | Store zero to absolute,X
    PLA                  ; 68 | Pull accumulator from stack
    EOR #$3F             ; 49 3F | Exclusive OR with accumulator (immediate)
    BIT $1F              ; 24 1F | Test bits in accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_214
; Address: $F8E434
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_214:
    JSR $2800            ; 20 00 28 | Jump to subroutine
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    SBC $63FF            ; ED FF 63 | Subtract with carry (absolute)
    STA                  ; 9F FF 7F FF | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank70_DmaFunction_215
; Address: $F8E44D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_215:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 00 7F 00 | Store accumulator to absolute long,X
    INY                  ; C8 | Increment Y register
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    CPX $D8F0            ; EC F0 D8 | Compare X register (absolute)
    CPX #$70             ; E0 70 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $0F              ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank70_DmaFunction_216
; Address: $F8E48A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_216:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BMI $7F              ; 30 7F | Branch if negative

;------------------------------------------------------------------------------
; Bank70_DmaFunction_217
; Address: $F8E49D
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_217:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    BRA $F2              ; 80 F2 | Branch always
    SEP #$0F             ; E2 0F | Set processor status bits
    CLD                  ; D8 | Clear decimal mode flag
    DEY                  ; 88 | Decrement Y register
    LDX #$3F             ; A2 3F | Load immediate value into X register
    INC $F200,X          ; FE 00 F2 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    SEP #$00             ; E2 00 | Set processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1E01            ; 0E 01 1E | Arithmetic shift left (absolute)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BEQ $08              ; F0 08 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_21A
; Address: $F8E524
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_21A:
    CLC                  ; 18 | Clear carry flag
    CPX #$04             ; E0 04 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_21B
; Address: $F8E52F
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_21B:
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BPL $7F              ; 10 7F | Branch if positive
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1E01            ; 0E 01 1E | Arithmetic shift left (absolute)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    DEC                  ; 3A | Decrement accumulator
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_21C
; Address: $F8E59F
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_21C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    DEC                  ; 3A | Decrement accumulator
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    STY $1070            ; 8C 70 10 | Store Y register to absolute address
    LDY $4F              ; A4 4F | Load from zero page into Y register
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    BRA $FC              ; 80 FC | Branch always
    BRA $F4              ; 80 F4 | Branch always
    PEA #$E100           ; F4 00 E1 | Push effective address to stack
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($1F,X)          ; 21 1F | Logical AND with accumulator ((zero page,X))
    ORA $1F0F,X          ; 1D 0F 1F | Logical OR with accumulator (absolute,X)
    ORA $190A,X          ; 1D 0A 19 | Logical OR with accumulator (absolute,X)
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_21D
; Address: $F8E63E
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_21D:
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0F02            ; 0D 02 0F | Logical OR with accumulator (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $BF              ; D0 BF | Branch if not equal
    LDA                  ; BF D0 BF 80 | Load from absolute long,X into accumulator
    PEA #$9000           ; F4 00 90 | Push effective address to stack
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    AND ($1E,X)          ; 21 1E | Logical AND with accumulator ((zero page,X))
    STZ $E3              ; 64 E3 | Store zero to zero page
    BIT $8AFC            ; 2C FC 8A | Test bits in accumulator (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SEC                  ; 38 | Set carry flag
    CPY #$18             ; C0 18 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_21E
; Address: $F8E6A7
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_21E:
    JSR $8098            ; 20 98 80 | Jump to subroutine
    BNE $C0              ; D0 C0 | Branch if not equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $F8              ; 80 F8 | Branch always
    BPL $FC              ; 10 FC | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $0B02            ; 0D 02 0B | Logical OR with accumulator (absolute)
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $0E00,X          ; 1E 00 0E | Arithmetic shift left (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $70              ; 80 70 | Branch always
    STX $0F              ; 86 0F | Store X register to zero page
    BCC $FF              ; 90 FF | Branch if carry clear
    STA                  ; 9F FF FB F4 | Store accumulator to absolute long,X
    BRA $FF              ; 80 FF | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_21F
; Address: $F8E709
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_21F:
    SEC                  ; 38 | Set carry flag
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    BRA $7F              ; 80 7F | Branch always
    BRA $60              ; 80 60 | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_220
; Address: $F8E731
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_220:
    JSR $80FF            ; 20 FF 80 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    BPL $0F              ; 10 0F | Branch if positive
    ROL $18              ; 26 18 | Rotate left (zero page)
    SBC $E401,Y          ; F9 01 E4 | Subtract with carry (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    BRA $FF              ; 80 FF | Branch always
    INX                  ; E8 | Increment X register
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $593A,X          ; 5D 3A 59 | Exclusive OR with accumulator (absolute,X)
    AND $7FFF,Y          ; 39 FF 7F | Logical AND with accumulator (absolute,Y)
    LDA                  ; BF 7E 9F FC | Load from absolute long,X into accumulator
    DEC $BEFC,X          ; DE FC BE | Decrement (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BPL $03              ; 10 03 | Branch if positive
    BPL $06              ; 10 06 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    ADC $2200,Y          ; 79 00 22 | Add with carry (absolute,Y)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    AND #$03             ; 29 03 | Logical AND with accumulator (immediate)
    ASL $0C1F            ; 0E 1F 0C | Arithmetic shift left (absolute)
    ROL $3E1C,X          ; 3E 1C 3E | Rotate left (absolute,X)
    INC                  ; 1A | Increment accumulator
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_221
; Address: $F8E7E9
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_221:
    DEC                  ; 3A | Decrement accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    DEC                  ; 3A | Decrement accumulator
    PHY                  ; 5A | Push Y register to stack
    DEC                  ; 3A | Decrement accumulator
    ADC ($39),Y          ; 71 39 | Add with carry ((zero page),Y)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    AND $0D07            ; 2D 07 0D | Logical AND with accumulator (absolute)
    ORA $1607,X          ; 1D 07 16 | Logical OR with accumulator (absolute,X)
    BNE $F0              ; D0 F0 | Branch if not equal
    PEA #$3E3C           ; F4 3C 3E | Push effective address to stack
    DEC $76              ; C6 76 | Decrement (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    INC $C0F6,X          ; FE F6 C0 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STZ $109C            ; 9C 9C 10 | Store zero to absolute
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $08              ; 80 08 | Branch always
    INC $071B,X          ; FE 1B 07 | Increment (absolute,X)
    ROL $771F,X          ; 3E 1F 77 | Rotate left (absolute,X)
    AND $1B27,X          ; 3D 27 1B | Logical AND with accumulator (absolute,X)
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    CMP $E7DF,X          ; DD DF E7 | Compare accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    DEC $F6              ; C6 F6 | Decrement (zero page)
    SEP #$F2             ; E2 F2 | Set processor status bits
    EOR ($07,X)          ; 41 07 | Exclusive OR with accumulator ((zero page,X))
    CMP $0D0F,Y          ; D9 0F 0D | Compare accumulator (absolute,Y)
    ORA $390F,X          ; 1D 0F 39 | Logical OR with accumulator (absolute,X)
    BIT $1F              ; 24 1F | Test bits in accumulator (zero page)
    PEA #$DD63           ; F4 63 DD | Push effective address to stack
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    STX $F6              ; 86 F6 | Store X register to zero page
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_222
; Address: $F8E894
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_222:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    SBC $1D0F,Y          ; F9 0F 1D | Subtract with carry (absolute,Y)
    INC                  ; 1A | Increment accumulator
    ADC $E717            ; 6D 17 E7 | Add with carry (absolute)
    CPY $9F7F            ; CC 7F 9F | Compare Y register (absolute)
    ADC ($1F),Y          ; 71 1F | Add with carry ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_223
; Address: $F8E8C1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_223:
    PEA #$DDE3           ; F4 E3 DD | Push effective address to stack
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    STX $F6              ; 86 F6 | Store X register to zero page
    WDM #$F2             ; 42 F2 | Reserved instruction
    CPY #$1C             ; C0 1C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_224
; Address: $F8E8D4
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_224:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    STA ($07,X)          ; 81 07 | Store accumulator to (zero page,X)
    ADC $0D0F,Y          ; 79 0F 0D | Add with carry (absolute,Y)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLY                  ; 7A | Pull Y register from stack
    SBC ($79),Y          ; F1 79 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    INC $FF93,X          ; FE 93 FF | Increment (absolute,X)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    EOR $4507,X          ; 5D 07 45 | Exclusive OR with accumulator (absolute,X)
    LSR $07              ; 46 07 | Logical shift right (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    JMP ($6EF3)          ; 6C F3 6E | Jump to address (absolute indirect)
    SBC #$3F             ; E9 3F | Subtract with carry (immediate)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    REP #$C2             ; C2 C2 | Reset processor status bits
    EOR $3DFF,X          ; 5D FF 3D | Exclusive OR with accumulator (absolute,X)
    INC $78FE,X          ; FE FE 78 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $AFF8            ; 8C F8 AF | Store Y register to absolute address
    SBC $7F9F,Y          ; F9 9F 7F | Subtract with carry (absolute,Y)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    STA $6000,Y          ; 99 00 60 | Store accumulator to absolute,Y
    BRA $00              ; 80 00 | Branch always
    AND $191F,Y          ; 39 1F 19 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_225
; Address: $F8E9EA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_225:
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    LDY $AFF8            ; AC F8 AF | Load from absolute address into Y register
    SBC $FF9F,Y          ; F9 9F FF | Subtract with carry (absolute,Y)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    STA $E000,Y          ; 99 00 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    DEC                  ; 3A | Decrement accumulator
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank70_DmaFunction_226
; Address: $F8EA30
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_226:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    INC                  ; 1A | Increment accumulator
    XBA                  ; EB | Exchange accumulator bytes
    CPX $EFF8            ; EC F8 EF | Compare X register (absolute)
    EOR $FFFF,Y          ; 59 FF FF | Exclusive OR with accumulator (absolute,Y)
    BRA $60              ; 80 60 | Branch always
    BRA $80              ; 80 80 | Branch always
    EOR $8000,Y          ; 59 00 80 | Exclusive OR with accumulator (absolute,Y)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    STA                  ; 9F 7F E0 E0 | Store accumulator to absolute long,X
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    STA                  ; 9F 00 60 00 | Store accumulator to absolute long,X
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CMP ($7F),Y          ; D1 7F | Compare accumulator ((zero page),Y)
    CMP ($7F),Y          ; D1 7F | Compare accumulator ((zero page),Y)
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    STA                  ; 9F 7F E0 E0 | Store accumulator to absolute long,X
    BRA $80              ; 80 80 | Branch always
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank70_DmaFunction_227
; Address: $F8EAD2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_227:
    BVC $00              ; 50 00 | Branch if overflow clear
    STA                  ; 9F 00 60 00 | Store accumulator to absolute long,X
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_229
; Address: $F8EB0C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_229:
    JSR $80C7            ; 20 C7 80 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    BMI $0F              ; 30 0F | Branch if negative
    INC $F00C,X          ; FE 0C F0 | Increment (absolute,X)
    EOR ($81,X)          ; 41 81 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_22A
; Address: $F8EB39
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_22A:
    JSR $C0FF            ; 20 FF C0 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($4E,X)          ; 01 4E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CPY $30CF            ; CC CF 30 | Compare Y register (absolute)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    AND $00C2,Y          ; 39 C2 00 | Logical AND with accumulator (absolute,Y)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_22B
; Address: $F8EBA2
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_22B:
    JSR $081F            ; 20 1F 08 | Jump to subroutine
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BCS $B0              ; B0 B0 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    BCS $B0              ; B0 B0 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_22C
; Address: $F8EC21
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_22C:
    BMI $4A              ; 30 4A | Branch if negative
    SBC $3F              ; E5 3F | Subtract with carry (zero page)
    JMP $DFBFFF          ; 5C FF BF DF | Jump to address long
    LDA                  ; BF E6 7F AF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank70_DmaFunction_22E
; Address: $F8EC3E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_22E:
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CMP $E77F,X          ; DD 7F E7 | Compare accumulator (absolute,X)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    STX $F6              ; 86 F6 | Store X register to zero page
    WDM #$F2             ; 42 F2 | Reserved instruction
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_22F
; Address: $F8EC54
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_22F:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    STA ($07,X)          ; 81 07 | Store accumulator to (zero page,X)
    ADC $0D0F,Y          ; 79 0F 0D | Add with carry (absolute,Y)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$07             ; E0 07 | Compare X register (immediate)
    BRA $0F              ; 80 0F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_231
; Address: $F8EC87
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_231:
    SEP #$7C             ; E2 7C | Set processor status bits
    PLX                  ; FA | Pull X register from stack
    LDA                  ; BF FB BE CE | Load from absolute long,X into accumulator
    CLV                  ; B8 | Clear overflow flag
    ROL $3F01,X          ; 3E 01 3F | Rotate left (absolute,X)
    LSR $0000            ; 4E 00 00 | Logical shift right (absolute)
    PHP                  ; 08 | Push processor status to stack
    INC $F686,X          ; FE 86 F6 | Increment (absolute,X)
    WDM #$F2             ; 42 F2 | Reserved instruction
    BMI $FF              ; 30 FF | Branch if negative
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FB              ; F0 FB | Branch if equal
    STA ($07,X)          ; 81 07 | Store accumulator to (zero page,X)
    ADC $0D0F,Y          ; 79 0F 0D | Add with carry (absolute,Y)
    LDA $7FAF7F          ; AF 7F AF 7F | Load from absolute long address into accumulator
    INC $7F              ; E6 7F | Increment (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ROL $3A1F,X          ; 3E 1F 3A | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_232
; Address: $F8ECD6
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_232:
    PLP                  ; 28 | Pull processor status from stack
    ASL $0200,X          ; 1E 00 02 | Arithmetic shift left (absolute,X)
    CPX $EFF8            ; EC F8 EF | Compare X register (absolute)
    LDA $FFFF,Y          ; B9 FF FF | Load from absolute,Y into accumulator
    BRA $60              ; 80 60 | Branch always
    BRA $80              ; 80 80 | Branch always
    LDA $8000,Y          ; B9 00 80 | Load from absolute,Y into accumulator
    INC                  ; 1A | Increment accumulator
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank70_DmaFunction_233
; Address: $F8ED22
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_233:
    CPX $EFF8            ; EC F8 EF | Compare X register (absolute)
    LDA $FFFF,Y          ; B9 FF FF | Load from absolute,Y into accumulator
    BRA $60              ; 80 60 | Branch always
    BRA $80              ; 80 80 | Branch always
    LDA $8000,Y          ; B9 00 80 | Load from absolute,Y into accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $30              ; 30 30 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $30              ; 30 30 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $860E            ; 0E 0E 86 | Arithmetic shift left (absolute)
    STX $00              ; 86 00 | Store X register to zero page
    ASL $860E            ; 0E 0E 86 | Arithmetic shift left (absolute)
    STX $00              ; 86 00 | Store X register to zero page
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $040E            ; 0E 0E 04 | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $040E            ; 0E 0E 04 | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_240
; Address: $F8EE26
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_240:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_244
; Address: $F8EE36
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_244:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_24A
; Address: $F8EEC8
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_24A:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_24C
; Address: $F8EED8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_24C:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ROL $CF3E,X          ; 3E 3E CF | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_250
; Address: $F8EF08
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_250:
    BMI $30              ; 30 30 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    STA                  ; 9F 9F 9F 9F | Store accumulator to absolute long,X
    CPY $C4CC            ; CC CC C4 | Compare Y register (absolute)
    CPY $E6              ; C4 E6 | Compare Y register (zero page)
    INC $07              ; E6 07 | Increment (zero page)
    STA                  ; 9F 9F 9F 9F | Store accumulator to absolute long,X
    CPY $C4CC            ; CC CC C4 | Compare Y register (absolute)
    CPY $E6              ; C4 E6 | Compare Y register (zero page)
    INC $F1              ; E6 F1 | Increment (zero page)
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    STZ $64              ; 64 64 | Store zero to zero page
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    STZ $64              ; 64 64 | Store zero to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_256
; Address: $F8EF8D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_256:
    JSR $2828            ; 20 28 28 | Jump to subroutine
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_25C
; Address: $F8EF9D
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_25C:
    JSR $2828            ; 20 28 28 | Jump to subroutine
    ROL $613E,X          ; 3E 3E 61 | Rotate left (absolute,X)
    ADC ($41,X)          ; 61 41 | Add with carry ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ROL $613E,X          ; 3E 3E 61 | Rotate left (absolute,X)
    ADC ($41,X)          ; 61 41 | Add with carry ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STA                  ; 9F 9F 07 07 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CMP #$C9             ; C9 C9 | Compare accumulator (immediate)
    STA                  ; 9F 9F 07 07 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CMP #$C9             ; C9 C9 | Compare accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    ASL $0C0E            ; 0E 0E 0C | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ASL $0C0E            ; 0E 0E 0C | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_25D
; Address: $F8F020
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_25D:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_261
; Address: $F8F05A
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_261:
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    SBC $73F9,Y          ; F9 F9 73 | Subtract with carry (absolute,Y)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    SBC $73F9,Y          ; F9 F9 73 | Subtract with carry (absolute,Y)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BVS $70              ; 70 70 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCC $90              ; 90 90 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank70_DmaFunction_262
; Address: $F8F0EC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_262:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BVS $70              ; 70 70 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank70_DmaFunction_263
; Address: $F8F0F4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_263:
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCC $90              ; 90 90 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank70_DmaFunction_264
; Address: $F8F0FC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_264:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0D00,X          ; 1D 00 0D | Logical OR with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $A0              ; 80 A0 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_265
; Address: $F8F14F
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_265:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BRA $10              ; 80 10 | Branch always
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    LDA $C2              ; A5 C2 | Load from zero page into accumulator
    EOR ($EA),Y          ; 51 EA | Exclusive OR with accumulator ((zero page),Y)
    AND #$F0             ; 29 F0 | Logical AND with accumulator (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    ORA $3F00            ; 0D 00 3F | Logical OR with accumulator (absolute)
    LDA $00D600          ; AF 00 D6 00 | Load from absolute long address into accumulator
    INC                  ; 1A | Increment accumulator
    ORA $2A2D            ; 0D 2D 2A | Logical OR with accumulator (absolute)
    NOP                  ; EA | No operation
    CMP $45              ; C5 45 | Compare accumulator (zero page)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX $24              ; E4 24 | Compare X register (zero page)
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    CPX #$60             ; E0 60 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_266
; Address: $F8F1CA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_266:
    JSL $45216E          ; 22 6E 21 45 | Jump to subroutine long
    STA $AF              ; 85 AF | Store accumulator to zero page
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA                  ; 9F 00 F0 00 | Store accumulator to absolute long,X
    CPY $B100            ; CC 00 B1 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_267
; Address: $F8F1DD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_267:
    JSR $0455            ; 20 55 04 | Jump to subroutine
    ORA $4703            ; 0D 03 47 | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $3510            ; 6D 10 35 | Add with carry (absolute)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank70_DmaFunction_269
; Address: $F8F205
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_269:
    BRA $80              ; 80 80 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $00              ; 10 00 | Branch if positive
    BNE $C0              ; D0 C0 | Branch if not equal
    PLP                  ; 28 | Pull processor status from stack
    BNE $28              ; D0 28 | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA $0F06,Y          ; 19 06 0F | Logical OR with accumulator (absolute,Y)
    ORA $0600            ; 0D 00 06 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP ($6C00)          ; 6C 00 6C | Jump to address (absolute indirect)
    BPL $B0              ; 10 B0 | Branch if positive
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BVS $8A              ; 70 8A | Branch if overflow set
    BEQ $0A              ; F0 0A | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    CPY $0600            ; CC 00 06 | Compare Y register (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $EE6D,X          ; FE 6D EE | Increment (absolute,X)
    EOR $8C7B,Y          ; 59 7B 8C | Exclusive OR with accumulator (absolute,Y)
    TAX                  ; AA | Transfer accumulator to X register
    STY $7B              ; 84 7B | Store Y register to zero page
    BRA $7F              ; 80 7F | Branch always
    STZ $1B              ; 64 1B | Store zero to zero page
    LDX $00              ; A6 00 | Load from zero page into X register
    LDX $00              ; A6 00 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_26A
; Address: $F8F2C0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_26A:
    TAY                  ; A8 | Transfer accumulator to Y register
    PLA                  ; 68 | Pull accumulator from stack
    TSX                  ; BA | Transfer stack pointer to X register
    STZ $0D66,X          ; 9E 66 0D | Store zero to absolute,X
    SBC $F50D,X          ; FD 0D F5 | Subtract with carry (absolute,X)
    NOP                  ; EA | No operation
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $9900            ; AD 00 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank70_DmaFunction_26B
; Address: $F8F2D6
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_26B:
    JSL $007A00          ; 22 00 7A 00 | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    LDY $37F5,X          ; BC F5 37 | Load from absolute,X into Y register
    BCS $1F              ; B0 1F | Branch if carry set
    CMP $66              ; C5 66 | Compare accumulator (zero page)
    LDY $9CE3,X          ; BC E3 9C | Load from absolute,X into Y register
    BIT $063C            ; 2C 3C 06 | Test bits in accumulator (absolute)
    JMP $6E00            ; 4C 00 6E | Jump to address
    ROL $8900,X          ; 3E 00 89 | Rotate left (absolute,X)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    JMP $01C904          ; 5C 04 C9 01 | Jump to address long
    ORA $0702            ; 0D 02 07 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $20              ; D0 20 | Branch if not equal
    LDY #$78             ; A0 78 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    LDY $6547            ; AC 47 65 | Load from absolute address into Y register
    AND ($EA),Y          ; 31 EA | Logical AND with accumulator ((zero page),Y)
    EOR #$6E             ; 49 6E | Exclusive OR with accumulator (immediate)
    STA $0010,Y          ; 99 10 00 | Store accumulator to absolute,Y
    PHP                  ; 08 | Push processor status to stack
    JMP ($BB00)          ; 6C 00 BB | Jump to address (absolute indirect)
    ROR $00              ; 66 00 | Rotate right (zero page)
    AND $4A6D            ; 2D 6D 4A | Logical AND with accumulator (absolute)
    DEX                  ; CA | Decrement X register
    SBC $25              ; E5 25 | Subtract with carry (zero page)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    PEA #$F834           ; F4 34 F8 | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    TSX                  ; BA | Transfer stack pointer to X register
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA                  ; BF 00 DF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 CB 00 | Load from absolute long,X into accumulator
    BRA $E0              ; 80 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_26C
; Address: $F8F366
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_26C:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $5F0D            ; 0D 0D 5F | Logical OR with accumulator (absolute)
    LDA                  ; BF B4 FF D0 | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_26E
; Address: $F8F376
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_26E:
    INC $F200,X          ; FE 00 F2 | Increment (absolute,X)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    STY $E8F4            ; 8C F4 E8 | Store Y register to absolute address
    ASL $6EF0,X          ; 1E F0 6E | Arithmetic shift left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    LDY $F3              ; A4 F3 | Load from zero page into Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_26F
; Address: $F8F3AF
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_26F:
    TAX                  ; AA | Transfer accumulator to X register
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    STY $7400            ; 8C 00 74 | Store Y register to absolute address
    PHY                  ; 5A | Push Y register to stack
    CPY $5500            ; CC 00 55 | Compare Y register (absolute)
    PLX                  ; FA | Pull X register from stack
    DEC                  ; 3A | Decrement accumulator
    BIT $5F00            ; 2C 00 5F | Test bits in accumulator (absolute)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    STA $010F03          ; 8F 03 0F 01 | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    ORA $2F06,Y          ; 19 06 2F | Logical OR with accumulator (absolute,Y)
    AND $5E15            ; 2D 15 5E | Logical AND with accumulator (absolute)
    ROL $04              ; 26 04 | Rotate left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $0D00            ; 0D 00 0D | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $4E00,Y          ; 19 00 4E | Logical OR with accumulator (absolute,Y)
    INC $FCD4            ; EE D4 FC | Increment (absolute)
    LDX $FC              ; A6 FC | Load from zero page into X register
    WDM #$F6             ; 42 F6 | Reserved instruction
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_270
; Address: $F8F42D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_270:
    STZ $48              ; 64 48 | Store zero to zero page
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank70_DmaFunction_271
; Address: $F8F439
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_271:
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $00              ; B0 00 | Branch if carry set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $EA15            ; AC 15 EA | Load from absolute address into Y register
    STY $7B              ; 84 7B | Store Y register to zero page
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDX $00              ; A6 00 | Load from zero page into X register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    STZ $0D64            ; 9C 64 0D | Store zero to absolute
    ORA $1FF5            ; 0D F5 1F | Logical OR with accumulator (absolute)
    ASL $F6E2,X          ; 1E E2 F6 | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $BB00,X          ; 9D 00 BB | Store accumulator to absolute,X
    ROL                  ; 2A | Rotate left (accumulator)
    PLY                  ; 7A | Pull Y register from stack
    INX                  ; E8 | Increment X register
    SBC $0500            ; ED 00 05 | Subtract with carry (absolute)
    BRA $FF              ; 80 FF | Branch always
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 02 01 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF BF 4A 1E | Load from absolute long,X into accumulator
    SBC #$1A             ; E9 1A | Subtract with carry (immediate)
    SBC $C1              ; E5 C1 | Subtract with carry (zero page)
    ROL $5FA0,X          ; 3E A0 5F | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    INC                  ; 1A | Increment accumulator
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEX                  ; CA | Decrement X register
    LSR                  ; 4A | Logical shift right (accumulator)
    PEA #$A034           ; F4 34 A0 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank70_DmaFunction_272
; Address: $F8F50D
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_272:
    ROR                  ; 6A | Rotate right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 8B 00 | Load from absolute long,X into accumulator
    ADC $3000            ; 6D 00 30 | Add with carry (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $5F0D            ; 0D 0D 5F | Logical OR with accumulator (absolute)
    LDA                  ; BF B4 FF D0 | Load from absolute long,X into accumulator
    BRA $CF              ; 80 CF | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    INC $F200,X          ; FE 00 F2 | Increment (absolute,X)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$60             ; E0 60 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $5F0D            ; 0D 0D 5F | Logical OR with accumulator (absolute)
    LDA                  ; BF B4 00 00 | Load from absolute long,X into accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA                  ; 9F 00 F0 00 | Store accumulator to absolute long,X
    INC $F200,X          ; FE 00 F2 | Increment (absolute,X)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LSR $5F26,X          ; 5E 26 5F | Logical shift right (absolute,X)
    AND $5F              ; 25 5F | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_273
; Address: $F8F585
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_273:
    JSL $FAAF52          ; 22 52 AF FA | Jump to subroutine long
    SBC $5E              ; E5 5E | Subtract with carry (zero page)
    EOR $373C,Y          ; 59 3C 37 | Exclusive OR with accumulator (absolute,Y)
    ORA $3A00,Y          ; 19 00 3A | Logical OR with accumulator (absolute,Y)
    AND $9000,X          ; 3D 00 90 | Logical AND with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    LDX $00              ; A6 00 | Load from zero page into X register
    INY                  ; C8 | Increment Y register
    BPL $E9              ; 10 E9 | Branch if positive
    SBC #$FA             ; E9 FA | Subtract with carry (immediate)
    AND $B5              ; 25 B5 | Logical AND with accumulator (zero page)
    INC $FB24            ; EE 24 FB | Increment (absolute)
    LDY $EF00            ; AC 00 EF | Load from absolute address into Y register
    EOR $DA00            ; 4D 00 DA | Exclusive OR with accumulator (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ORA #$17             ; 09 17 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    AND $2F12            ; 2D 12 2F | Logical AND with accumulator (absolute)
    AND $5E05,X          ; 3D 05 5E | Logical AND with accumulator (absolute,X)
    ROL $0E              ; 26 0E | Rotate left (zero page)
    ORA $0D00            ; 0D 00 0D | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ORA $FF00,Y          ; 19 00 FF | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_274
; Address: $F8F5E1
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_274:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BMI $6F              ; 30 6F | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    LSR $003F            ; 4E 3F 00 | Logical shift right (absolute)
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    PEA #$F50D           ; F4 0D F5 | Push effective address to stack
    LDX $5A              ; A6 5A | Load from zero page into X register
    ORA #$13             ; 09 13 | Logical OR with accumulator (immediate)
    ORA $0C13            ; 0D 13 0C | Logical OR with accumulator (absolute)
    PHX                  ; DA | Push X register to stack
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    INC $EE6D,X          ; FE 6D EE | Increment (absolute,X)
    EOR $8C7B,Y          ; 59 7B 8C | Exclusive OR with accumulator (absolute,Y)
    TAX                  ; AA | Transfer accumulator to X register
    STY $7B              ; 84 7B | Store Y register to zero page
    BRA $7F              ; 80 7F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_275
; Address: $F8F66E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_275:
    INC                  ; 1A | Increment accumulator
    ORA $92              ; 05 92 | Logical OR with accumulator (zero page)
    LDX $00              ; A6 00 | Load from zero page into X register
    LDX $00              ; A6 00 | Load from zero page into X register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BNE $FF              ; D0 FF | Branch if not equal
    BRA $FF              ; 80 FF | Branch always
    BRA $7F              ; 80 7F | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $381D,X          ; 1E 1D 38 | Arithmetic shift left (absolute,X)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    LSR $F9              ; 46 F9 | Logical shift right (zero page)
    SEP #$00             ; E2 00 | Set processor status bits
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_276
; Address: $F8F6D4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_276:
    JSR $0900            ; 20 00 09 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    LDY $5B              ; A4 5B | Load from zero page into Y register
    PLY                  ; 7A | Pull Y register from stack
    STA $2F              ; 85 2F | Store accumulator to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank70_DmaFunction_277
; Address: $F8F6F4
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_277:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    PLX                  ; FA | Pull X register from stack
    AND $B5              ; 25 B5 | Logical AND with accumulator (zero page)
    INC $FB24            ; EE 24 FB | Increment (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    CPX $1600            ; EC 00 16 | Compare X register (absolute)
    EOR $DA00            ; 4D 00 DA | Exclusive OR with accumulator (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ORA $1F02,X          ; 1D 02 1F | Logical OR with accumulator (absolute,X)
    AND $2D11            ; 2D 11 2D | Logical AND with accumulator (absolute)
    ROL $5E16            ; 2E 16 5E | Rotate left (absolute)
    ROL $5E              ; 26 5E | Rotate left (zero page)
    ROL $0D              ; 26 0D | Rotate left (zero page)
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    ASL $0A00            ; 0E 00 0A | Arithmetic shift left (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $1900,Y          ; 19 00 19 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_278
; Address: $F8F741
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_278:
    JSR $30FF            ; 20 FF 30 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ROR $4F4F            ; 6E 4F 4F | Rotate right (absolute)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    BCS $00              ; B0 00 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$27             ; 09 27 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    EOR #$36             ; 49 36 | Exclusive OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    EOR $722D,X          ; 5D 2D 72 | Exclusive OR with accumulator (absolute,X)
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    AND $7F00            ; 2D 00 7F | Logical AND with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BMI $6F              ; 30 6F | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    LSR $00BF            ; 4E BF 00 | Logical shift right (absolute)
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $1F              ; 25 1F | Logical AND with accumulator (zero page)
    SEP #$F6             ; E2 F6 | Set processor status bits

;------------------------------------------------------------------------------
; Bank70_DmaFunction_27A
; Address: $F8F7C6
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_27A:
    INC                  ; 1A | Increment accumulator
    ROL $9C39,X          ; 3E 39 9C | Rotate left (absolute,X)
    ASL $3A1D,X          ; 1E 1D 3A | Arithmetic shift left (absolute,X)
    CMP $9400,X          ; DD 00 94 | Compare accumulator (absolute,X)
    NOP                  ; EA | No operation
    DEC $00              ; C6 00 | Decrement (zero page)
    INX                  ; E8 | Increment X register
    SEP #$00             ; E2 00 | Set processor status bits
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    PLX                  ; FA | Pull X register from stack
    AND $B5              ; 25 B5 | Logical AND with accumulator (zero page)
    INC $FB24            ; EE 24 FB | Increment (absolute)
    LDY $5B              ; A4 5B | Load from zero page into Y register
    CPX $1600            ; EC 00 16 | Compare X register (absolute)
    EOR $DA00            ; 4D 00 DA | Exclusive OR with accumulator (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $0804            ; 0D 04 08 | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $2E22,X          ; 3D 22 2E | Logical AND with accumulator (absolute,X)
    AND #$1C             ; 29 1C | Logical AND with accumulator (immediate)
    ROR $FF79,X          ; 7E 79 FF | Rotate right (absolute,X)
    CPX #$28             ; E0 28 | Compare X register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    PEA #$DD00           ; F4 00 DD | Push effective address to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    PLX                  ; FA | Pull X register from stack
    LDA $B5              ; A5 B5 | Load from zero page into accumulator
    INC $FB24            ; EE 24 FB | Increment (absolute)
    STZ $9B              ; 64 9B | Store zero to zero page
    CPX $1600            ; EC 00 16 | Compare X register (absolute)
    STA $5A00            ; 8D 00 5A | Store accumulator to absolute address
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $2A3D,X          ; 1D 3D 2A | Logical OR with accumulator (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    EOR $C5              ; 45 C5 | Exclusive OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    ADC $161F,Y          ; 79 1F 16 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_27B
; Address: $F8F88A
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_27B:
    ORA $0F0D            ; 0D 0D 0F | Logical OR with accumulator (absolute)
    STZ $E900,X          ; 9E 00 E9 | Store zero to absolute,X
    BEQ $00              ; F0 00 | Branch if equal
    PLB                  ; AB | Pull data bank register from stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    BEQ $CF              ; F0 CF | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    LSR $F9              ; 46 F9 | Logical shift right (zero page)
    INY                  ; C8 | Increment Y register
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    PLY                  ; 7A | Pull Y register from stack
    STA $4F              ; 85 4F | Store accumulator to zero page
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    STA $00              ; 85 00 | Store accumulator to zero page
    BRA $00              ; 80 00 | Branch always
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEP #$9D             ; E2 9D | Set processor status bits
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ADC $FEE2,X          ; 7D E2 FE | Add with carry (absolute,X)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STA $003E00          ; 8F 00 3E 00 | Store accumulator to absolute long address
    INC                  ; 1A | Increment accumulator
    SBC $1F              ; E5 1F | Subtract with carry (zero page)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    EOR $7437,X          ; 5D 37 74 | Exclusive OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $00              ; 30 00 | Branch if negative
    LDY $A4              ; A4 A4 | Load from zero page into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_27C
; Address: $F8F984
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_27C:
    NOP                  ; EA | No operation
    ROR                  ; 6A | Rotate right (accumulator)
    NOP                  ; EA | No operation
    LSR                  ; 4A | Logical shift right (accumulator)
    ADC $1D95,X          ; 7D 95 1D | Add with carry (absolute,X)
    STA $7A8677          ; 8F 77 86 7A | Store accumulator to absolute long address
    ROR                  ; 6A | Rotate right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA                  ; BF B0 FF D0 | Load from absolute long,X into accumulator
    BRA $FF              ; 80 FF | Branch always
    BRA $4F              ; 80 4F | Branch always
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ORA $3636,Y          ; 19 36 36 | Logical OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_280
; Address: $F8F9CE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_280:
    EOR $C5              ; 45 C5 | Exclusive OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDX $0000,Y          ; BE 00 00 | Load from absolute,Y into X register
    BRA $80              ; 80 80 | Branch always
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCC $A0              ; 90 A0 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_281
; Address: $F8FA0D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_281:
    ASL $1C0C            ; 0E 0C 1C | Arithmetic shift left (absolute)
    ORA $1300            ; 0D 00 13 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    AND $3FDD,X          ; 3D DD 3F | Logical AND with accumulator (absolute,X)
    SEP #$00             ; E2 00 | Set processor status bits
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    LDA ($C0),Y          ; B1 C0 | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank70_DmaFunction_283
; Address: $F8FA6D
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_283:
    JSR $10E4            ; 20 E4 10 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$7E             ; A0 7E | Load immediate value into Y register
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    DEY                  ; 88 | Decrement Y register
    ADC $7696,Y          ; 79 96 76 | Add with carry (absolute,Y)
    XBA                  ; EB | Exchange accumulator bytes
    JMP $DF8D            ; 4C 8D DF | Jump to address
    LDX $00              ; A6 00 | Load from zero page into X register
    LDA $007F00          ; AF 00 7F 00 | Load from absolute long address into accumulator
    INC $8600,X          ; FE 00 86 | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    STA $F00F71          ; 8F 71 0F F0 | Store accumulator to absolute long address
    CPY $86D9            ; CC D9 86 | Compare Y register (absolute)
    SBC $5E95            ; ED 95 5E | Subtract with carry (absolute)
    LDX $B5              ; A6 B5 | Load from zero page into X register
    ORA $0D00            ; 0D 00 0D | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BMI $6F              ; 30 6F | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    LSR $00FF            ; 4E FF 00 | Logical shift right (absolute)
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    ASL $314E            ; 0E 4E 31 | Arithmetic shift left (absolute)
    ASL $0705,X          ; 1E 05 07 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $0C00,Y          ; 79 00 0C | Add with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BRA $98              ; 80 98 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_284
; Address: $F8FB2A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_284:
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank70_DmaFunction_285
; Address: $F8FB41
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_285:
    ROL $1F              ; 26 1F | Rotate left (zero page)
    AND $5D3F            ; 2D 3F 5D | Logical AND with accumulator (absolute)
    PLY                  ; 7A | Pull Y register from stack
    AND ($61,X)          ; 21 61 | Logical AND with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_286
; Address: $F8FB4D
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_286:
    CPX #$6A             ; E0 6A | Compare X register (immediate)
    NOP                  ; EA | No operation
    AND $3200,Y          ; 39 00 32 | Logical AND with accumulator (absolute,Y)
    EOR $5E00            ; 4D 00 5E | Exclusive OR with accumulator (absolute)
    LDA                  ; BF 00 9F 00 | Load from absolute long,X into accumulator
    LDA                  ; BF B0 FF 50 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    BRA $7F              ; 80 7F | Branch always
    BRA $BF              ; 80 BF | Branch always
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    CPY #$4F             ; C0 4F | Compare Y register (immediate)
    LDA $00BF00          ; AF 00 BF 00 | Load from absolute long address into accumulator
    ORA $0B02            ; 0D 02 0B | Logical OR with accumulator (absolute)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA $0D12            ; 0D 12 0D | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX $D418            ; EC 18 D4 | Compare X register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX #$38             ; E0 38 | Compare X register (immediate)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    JMP $14539D          ; 5C 9D 53 14 | Jump to address long
    AND $0E0A,X          ; 3D 0A 0E | Logical AND with accumulator (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    INC $7F06,X          ; FE 06 7F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_287
; Address: $F8FBE3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_287:
    ORA $AF              ; 05 AF | Logical OR with accumulator (zero page)
    ORA $EB              ; 05 EB | Logical OR with accumulator (zero page)
    BMI $2F              ; 30 2F | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ROR $1979,X          ; 7E 79 19 | Rotate right (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $BA00            ; 2D 00 BA | Logical AND with accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_288
; Address: $F8FBFA
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_288:
    BNE $00              ; D0 00 | Branch if not equal
    INX                  ; E8 | Increment X register
    BPL $E9              ; 10 E9 | Branch if positive
    SBC #$FA             ; E9 FA | Subtract with carry (immediate)
    LDA $B5              ; A5 B5 | Load from zero page into accumulator
    INC $FB24            ; EE 24 FB | Increment (absolute)
    LDY $EF00            ; AC 00 EF | Load from absolute address into Y register
    STA $5A00            ; 8D 00 5A | Store accumulator to absolute address
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    ROR                  ; 6A | Rotate right (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    PLX                  ; FA | Pull X register from stack
    PLY                  ; 7A | Pull Y register from stack
    LDX #$3E             ; A2 3E | Load immediate value into X register
    INC $9E              ; E6 9E | Increment (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    STA $8D69,X          ; 9D 69 8D | Store accumulator to absolute,X
    ADC ($97),Y          ; 71 97 | Add with carry ((zero page),Y)
    CMP $5D00            ; CD 00 5D | Compare accumulator (absolute)
    ORA $9500,Y          ; 19 00 95 | Logical OR with accumulator (absolute,Y)
    ROL $DF00            ; 2E 00 DF | Rotate left (absolute)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_289
; Address: $F8FC64
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_289:
    LDA $506F90          ; AF 90 6F 50 | Load from absolute long address into accumulator
    BMI $37              ; 30 37 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    LDA                  ; BF 00 7F 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 DF 00 | Load from absolute long,X into accumulator
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BMI $20              ; 30 20 | Branch if negative
    AND $134D            ; 2D 4D 13 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_28B
; Address: $F8FC9D
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_28B:
    JSR $000F            ; 20 0F 00 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    CPY $F004            ; CC 04 F0 | Compare Y register (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $FC              ; 10 FC | Branch if positive
    BPL $FC              ; 10 FC | Branch if positive
    BVC $FE              ; 50 FE | Branch if overflow clear
    BMI $DE              ; 30 DE | Branch if negative
    EOR $D5D7,Y          ; 59 D7 D5 | Exclusive OR with accumulator (absolute,Y)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY $A500            ; CC 00 A5 | Compare Y register (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    EOR $0000            ; 4D 00 00 | Exclusive OR with accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_28C
; Address: $F8FD1E
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_28C:
    CLD                  ; D8 | Clear decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$E2             ; E0 E2 | Compare X register (immediate)
    STA $5FA0,X          ; 9D A0 5F | Store accumulator to absolute,X
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ADC $FEE2,X          ; 7D E2 FE | Add with carry (absolute,X)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STY $3E00            ; 8C 00 3E | Store Y register to absolute address
    STZ $9B              ; 64 9B | Store zero to zero page
    INC                  ; 1A | Increment accumulator
    SBC $1F              ; E5 1F | Subtract with carry (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_28D
; Address: $F8FD86
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_28D:
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    CPY $0A75            ; CC 75 0A | Compare Y register (absolute)
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    AND #$F1             ; 29 F1 | Logical AND with accumulator (immediate)
    INC $87F8            ; EE F8 87 | Increment (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $E300            ; ED 00 E3 | Subtract with carry (absolute)
    BNE $00              ; D0 00 | Branch if not equal
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    LDA                  ; BF B3 FD C1 | Load from absolute long,X into accumulator
    DEC $5362,X          ; DE 62 53 | Decrement (absolute,X)
    LDA $BE41            ; AD 41 BE | Load from absolute address into accumulator
    BRA $7F              ; 80 7F | Branch always
    INC                  ; 1A | Increment accumulator
    SBC $48              ; E5 48 | Subtract with carry (zero page)
    DEC                  ; 3A | Decrement accumulator
    STA $5200,Y          ; 99 00 52 | Store accumulator to absolute,Y
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    AND $6500,X          ; 3D 00 65 | Logical AND with accumulator (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank70_DmaFunction_28E
; Address: $F8FDE2
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_28E:
    AND $15BC,Y          ; 39 BC 15 | Logical AND with accumulator (absolute,Y)
    STZ $D55C,X          ; 9E 5C D5 | Store zero to absolute,X
    STA                  ; 9F 34 4F 15 | Store accumulator to absolute long,X
    BIT $0036            ; 2C 36 00 | Test bits in accumulator (absolute)
    BIT $0D06            ; 2C 06 0D | Test bits in accumulator (absolute)
    ROL $00              ; 26 00 | Rotate left (zero page)
    STZ $A83D            ; 9C 3D A8 | Store zero to absolute
    ADC $AB3A,Y          ; 79 3A AB | Add with carry (absolute,Y)
    INC $EECF            ; EE CF EE | Increment (absolute)
    SBC $F22C,Y          ; F9 2C F2 | Subtract with carry (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP ($C200)          ; 6C 00 C2 | Jump to address (absolute indirect)
    LDX $3420            ; AE 20 34 | Load from absolute address into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank70_DmaFunction_28F
; Address: $F8FE18
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_28F:
    BCS $00              ; B0 00 | Branch if carry set
    TAX                  ; AA | Transfer accumulator to X register
    STZ $00              ; 64 00 | Store zero to zero page
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $05              ; E5 05 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_290
; Address: $F8FE44
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_290:
    NOP                  ; EA | No operation
    ROL                  ; 2A | Rotate left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    STY $6CB4            ; 8C B4 6C | Store Y register to absolute address
    LDX $7A              ; A6 7A | Load from zero page into X register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $1F0D            ; 0D 0D 1F | Logical OR with accumulator (absolute)
    BVC $E4              ; 50 E4 | Branch if overflow clear
    INC $F200,X          ; FE 00 F2 | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDA $030400          ; AF 00 04 03 | Load from absolute long address into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ADC $FEE2,X          ; 7D E2 FE | Add with carry (absolute,X)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STY $3E00            ; 8C 00 3E | Store Y register to absolute address
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA #$11             ; 09 11 | Logical OR with accumulator (immediate)
    ASL $0D17            ; 0E 17 0D | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCC $88              ; 90 88 | Branch if carry clear
    BVS $E8              ; 70 E8 | Branch if overflow set
    BCS $C0              ; B0 C0 | Branch if carry set
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BRA $70              ; 80 70 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank70_DmaFunction_292
; Address: $F8FF1A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_292:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDX $5A              ; A6 5A | Load from zero page into X register
    ROR $1A              ; 66 1A | Rotate right (zero page)
    ORA $0D13            ; 0D 13 0D | Logical OR with accumulator (absolute)
    ORA $2502,X          ; 1D 02 25 | Logical OR with accumulator (absolute,X)
    AND $0C00            ; 2D 00 0C | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_293
; Address: $F8FF36
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_293:
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $7F00            ; 0D 00 7F | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 3F 00 | Load from absolute long,X into accumulator
    BMI $20              ; 30 20 | Branch if negative
    ROL $46              ; 26 46 | Rotate left (zero page)
    ORA #$29             ; 09 29 | Logical OR with accumulator (immediate)
    BMI $00              ; 30 00 | Branch if negative
    AND $1720,Y          ; 39 20 17 | Logical AND with accumulator (absolute,Y)
    STZ $62              ; 64 62 | Store zero to zero page
    BCC $94              ; 90 94 | Branch if carry clear
    STZ $E804            ; 9C 04 E8 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank70_DmaFunction_294
; Address: $F8FFAA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_294:
    JSL $45256E          ; 22 6E 25 45 | Jump to subroutine long
    ORA #$2D             ; 09 2D | Logical OR with accumulator (immediate)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank70_DmaFunction_295
; Address: $F8FFBD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_295:
    JSR $0013            ; 20 13 00 | Jump to subroutine
    CPY $7644            ; CC 44 76 | Compare Y register (absolute)
    LDY $A2              ; A4 A2 | Load from zero page into Y register
    BCC $B4              ; 90 B4 | Branch if carry clear
    STY $DC00            ; 8C 00 DC | Store Y register to absolute address
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank70_DmaFunction_296
; Address: $F8FFE8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank70_DmaFunction_296:
    JSL $45216E          ; 22 6E 21 45 | Jump to subroutine long
    ORA $2F              ; 05 2F | Logical OR with accumulator (zero page)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
